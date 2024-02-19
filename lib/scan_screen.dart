import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  static const titleStyle = TextStyle(
      fontSize: 18,
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
      fontFamily: 'irs');

  static const subTitleStyle = TextStyle(
      fontSize: 14,
      color: Colors.blueGrey,
      fontWeight: FontWeight.normal,
      fontFamily: 'irs');

  static const buttonStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'irs');

  static const translatedStyle = TextStyle(
      fontSize: 14,
      color: Colors.green,
      fontWeight: FontWeight.bold,
      fontFamily: 'irs');

  bool textScanning = false;
  String scannedText = "";
  String translatedText = "";
  XFile? imageFile;
  static final Map<String, String> words = {};

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
            margin: const EdgeInsets.all(20),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 1.4,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 7,
                      ),
                      const Text("تشخیص متن (OCR)", style: titleStyle),
                      const SizedBox(
                        height: 5,
                      ),
                      imageFile == null
                          ? const Text(
                              "با استفاده از این تکنولوژی می توانید به راحتی لغات موجود درون تصاویر را با دوربین موبایل خود اسکن کرده و آن ها را ترجمه کنید و یا در نرم افزار های دیگر استفاده نمایید",
                              style: subTitleStyle,
                              textAlign: TextAlign.justify)
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: imageFile == null
                              ? Image.asset(
                                  "assets/images/scanning.gif",
                                  height: MediaQuery.sizeOf(context).height / 4,
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  File(imageFile!.path),
                                  height: MediaQuery.sizeOf(context).height / 4,
                                  fit: BoxFit.fill,
                                )),
                      const SizedBox(
                        height: 20,
                      ),

                      textScanning?
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SpinKitPouringHourGlassRefined(
                          color: Color.fromRGBO(0, 95, 186, 1),
                          size: 45,
                        ),
                      ):
                      SizedBox(
                        height: imageFile==null?
                        MediaQuery.sizeOf(context).height / 7:
                        MediaQuery.sizeOf(context).height / 6,

                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          elevation: 20,
                          margin: const EdgeInsets.all(6),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(scannedText,maxLines: 9,style: subTitleStyle,),
                                Text(scannedText,maxLines: 9,style: translatedStyle,),
                              ],
                            ),
                          ),
                        ),

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              getImage(ImageSource.gallery);
                            },
                            height: 55,
                            minWidth: 165,
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: const Row(
                              children: [
                                Text(
                                  "اسکن از گالری",
                                  style: buttonStyle,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.image,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ],
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              getImage(ImageSource.camera);
                            },
                            height: 55,
                            minWidth: 165,
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: const Row(
                              children: [
                                Text(
                                  "اسکن با دوربین",
                                  style: buttonStyle,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.camera,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickImage = await ImagePicker().pickImage(source: source);
      if (pickImage != null) {
        textScanning = true;
        imageFile = pickImage;
        setState(() {});
        getRecognisedText(pickImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error while Scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    words.clear();
    scannedText = "";
    translatedText = "";

    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        words.addAll({line.text: ''});
        scannedText = "$scannedText${line.text}\n";
      }
    }
    debugPrint(words.toString());
    textScanning = false;
    setState(() {});
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
