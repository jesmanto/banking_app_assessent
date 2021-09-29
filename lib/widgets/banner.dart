import 'package:banking_app_assessent/model/banner_contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  final BannerContent content;

  const AdBanner({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Stack(
      children: [
        SizedBox(
          child: Image.asset(
            content.imagePath,
            fit: BoxFit.cover,
          ),
          height: height,
          width: double.infinity,
        ),
        Positioned(
          child: Column(
            children: [
              Text(content.heading,
                  style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
              Text(
                content.desc,
                style: const TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              )
            ],
          ),
          bottom: (height/3)*2,
          left: 20.0,
        )
      ],
    );
  }
}
