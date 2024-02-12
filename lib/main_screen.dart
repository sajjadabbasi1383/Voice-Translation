import 'package:flutter/material.dart';
import 'package:voice_translation/home_screen.dart';
import 'package:voice_translation/scan_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("مترجم آنلاین",style: TextStyle(fontSize: 17),),
          actions: const [
            Icon(Icons.more_vert)
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "ترجمه آنلاین",icon: Icon(Icons.g_translate_outlined),),
              Tab(text: "تشخیص کلمات",icon: Icon(Icons.document_scanner_outlined),),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            ScanScreen(),
          ],
        ),
        drawer: const Drawer(),
      ),
    ));
  }
}
