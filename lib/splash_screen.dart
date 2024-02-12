import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool isInternetAvailable = true;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: isInternetAvailable
                ? Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.jpg',
                            height: 150,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("مترجم صوتی آنلاین",
                              style: TextStyle(
                                  fontFamily: "irs",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(0, 95, 186, 1))),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      const Positioned(
                        bottom: 40,
                        right: 0,
                        left: 0,
                        child: SpinKitFadingCircle(
                          color: Color.fromRGBO(0, 95, 186, 1),
                          size: 45,
                        ),
                      )
                    ],
                  )
                : Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.jpg',
                            height: 150,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("مترجم صوتی آنلاین",
                              style: TextStyle(
                                  fontFamily: "irs",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(0, 95, 186, 1))),
                          const SpinKitThreeBounce(
                            color: Color.fromRGBO(0, 0, 0, 0),
                            size: 30,
                          ),
                        ],
                      ),
                      Positioned(
                          bottom: 35,
                          right: 0,
                          left: 0,
                          child: GestureDetector(
                            onTap: () => setState(() {
                              checkInternet();
                            }),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.refresh_thick,
                                    color: Colors.red,
                                    size: 28),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "خطا در اتصال به سرور",
                                  style: TextStyle(
                                      fontFamily: "irs",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ))
                    ],
                  )),
      ),
    );
  }

  checkInternet() {
    isInternetAvailable = true;
    Future.delayed(const Duration(seconds: 4)).then((value) {
      isInternetConnected(context).then((value) {
        setState(() {
          isInternetAvailable = value;
        });
      });
    });
  }
}

Future<bool> isInternetConnected(context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ));
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
