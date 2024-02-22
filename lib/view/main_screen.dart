import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'scan_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "مترجم آنلاین",
            style: TextStyle(fontSize: 17),
          ),
          actions: const [Icon(Icons.more_vert)],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "ترجمه آنلاین",
                icon: Icon(Icons.g_translate_outlined),
              ),
              Tab(
                text: "تشخیص کلمات",
                icon: Icon(Icons.document_scanner_outlined),
              ),
            ],
          ),
        ),
        drawer: Drawer(
            width: MediaQuery.sizeOf(context).width / 1.7,
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                    accountName: const Text(
                      "مترجم آنلاین",
                    ),
                    accountEmail: const Text("سجاد عباسی"),
                    currentAccountPicture: Image.asset(
                      "assets/images/logo.jpg",
                    )),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    title: Text("درباره ما"),
                    leading: Icon(Icons.info_outline),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    title: Text("ارتباط با ما"),
                    leading: Icon(Icons.telegram_outlined),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    title: Text("ثبت نظر"),
                    leading: Icon(Icons.star_rate_outlined),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    title: Text("سایر برنامه ها"),
                    leading: Icon(Icons.app_shortcut_outlined),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    title: Text("اشتراک برنامه"),
                    leading: Icon(Icons.share),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    title: Text("خروج"),
                    leading: Icon(Icons.exit_to_app),
                  ),
                ),
              ],
            )),
        body:  const TabBarView(
          children: [
            HomeScreen(),
            ScanScreen(),
          ],
        ),
      ),
    ));
  }
}
