import 'dart:convert';
import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var images = [
    // 'http://127.0.0.1:3001/api/carousel/getPage/2',
    // 'http://127.0.0.1:3001/api/carousel/getPage/3',
  ];

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          // return Image.memory(
          //   base64Decode(images[index]),
          //   fit: BoxFit.fill,
          // );
          return Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        // pagination: SwiperPagination(),
        control: SwiperControl(),
        autoplay: true,
      ),
    );
  }

  getImages() async {
    var response = await new Dio().get(
      'http://192.168.137.1:3001/api/carousel/getCarouselImages',
    );

    setState(() {
      for (var i in response.data['data']) {
        images.add(
            'http://192.168.137.1:3001/api/carousel/getImages/' + i['image']);
      }
    });
  }
}
