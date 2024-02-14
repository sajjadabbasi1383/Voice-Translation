import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const tabStyle = TextStyle(
      fontSize: 15,
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
      fontFamily: 'irs');

  static const buttonStyle = TextStyle(
      fontSize: 17,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'irs');

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

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 20,
          margin: const EdgeInsets.all(6),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 1.4,
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.white)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.white)),
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
                                  selectedItemSource = value!;
                                });
                              },
                            ),
                          ),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.white)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.white)),
                                  fillColor: Colors.grey[200]),
                              value: selectedItemDest,
                              items: dest
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
                                  selectedItemDest = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 6,
                        width: MediaQuery.sizeOf(context).width / 1.1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16, right: 16, left: 16),
                          child: TextField(
                            maxLines: 2,
                            keyboardType: TextInputType.multiline,
                            autofocus: false,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                labelStyle: tabStyle,
                                hintText: "متن خود را وارد نمایید",
                                hintStyle: tabStyle,
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    borderSide: BorderSide(
                                        width: 1.5, color: Colors.blueGrey)),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    borderSide: BorderSide(
                                        width: 1.5,
                                        color: Color.fromRGBO(0, 95, 186, 1))),
                                icon: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Icon(
                                      Icons.volume_up,
                                      color: Colors.lightBlue,
                                    )
                                  ],
                                )),
                            controller: controller,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        minWidth: MediaQuery.sizeOf(context).width / 1.2,
                        height: 50,
                        color: Colors.blueAccent,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        child: const Text(
                          "ترجمه کن",
                          style: buttonStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Center(
                        child: Text(
                          "محل نمایش نتایج",
                          style: tabStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.mic,size: 28,),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
