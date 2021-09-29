import 'package:banking_app_assessent/model/banner_contents.dart';
import 'package:banking_app_assessent/widgets/banner.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class AdBannerSwiper extends StatelessWidget {
  final List<BannerContent> contents;

  const AdBannerSwiper({Key? key, required this.contents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
        itemCount: contents.length,
        itemBuilder: (BuildContext context, int index) {
          return AdBanner(content: contents[index]);
        },
        pagination: SwiperPagination(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(
                bottom: (MediaQuery.of(context).size.height / 3) * 1.9)));
  }
}
