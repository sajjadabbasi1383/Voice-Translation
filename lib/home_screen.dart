import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const tabStyle = TextStyle(
      fontSize: 15, color: Colors.blueGrey, fontWeight: FontWeight.bold,fontFamily: 'irs');

  List<String> source = [
    "انگلیسی",
    "فارسی",
    "اسپانیایی",
    "فرانسوی",
    "آلمانی",
    "ایتالیایی",
    "روسی",
  ];

  List<String> dest = [
    "فارسی",
    "انگلیسی",
    "اسپانیایی",
    "فرانسوی",
    "آلمانی",
    "ایتالیایی",
    "روسی",
  ];

  String selectedItemSource = "انگلیسی";
  String selectedItemDest = "فارسی";

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 20,
      margin: const EdgeInsets.all(10),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "زبان مبدا",
                  style: tabStyle,
                ),
                Text("زبان مقصد", style: tabStyle),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width / 3,
                  height: 50,
                  margin: const EdgeInsets.all(16),
                  child: DropdownButtonFormField<String>(
                    style: tabStyle,
                    decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.white)),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.white)),
                        fillColor: Colors.grey[200]),
                    value: selectedItemSource,
                    items: source
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              item,
                              style: tabStyle,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedItemSource=value!;
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
