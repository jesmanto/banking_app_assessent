import 'package:banking_app_assessent/model/banner_contents.dart';
import 'package:banking_app_assessent/widgets/ad_banner_swiper.dart';
import 'package:banking_app_assessent/widgets/login_screen.dart';
import 'package:banking_app_assessent/widgets/register.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<BannerContent> contents = [
  BannerContent(
      "assets/images/mobile_bank_app.jpeg",
      "Eazy Banking",
      "Experience "
          "a whole new world of banking, simplified"),
  BannerContent("assets/images/mobile_bank_app2.jpeg", "Scheduled Payment",
      "Automate your payments"),
  BannerContent("assets/images/mobile_bank_app3.jpeg", "Scheduled Payment",
      "Automate your payments")
];

class _HomePageState extends State<HomePage> {
  Widget authWidget = const RegisterScreen();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(
                height: height,
                width: double.infinity,
                child: AdBannerSwiper(contents: contents)),
            Positioned(
              child: SizedBox(
                child: Container(
                  height: 100,
                  color: const Color(0x65E8E8E7),
                ),
              ),
              top: 50,
            ),
            Positioned(
                child: SizedBox(height: 300.0, child: authWidget),
                bottom: height / 9),
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.black38,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                    ])),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                      height: height / 6,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  authWidget = const LoginScreen();
                                });
                              },
                              child: const Text("Login",
                                  style: TextStyle(color: Colors.white))),
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                authWidget = const RegisterScreen();
                              });
                            },
                            child: const Text("Register",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      )),
                ),
              ),
              bottom: 0,
            )
          ],
        ),
      ),
    );
  }
}
