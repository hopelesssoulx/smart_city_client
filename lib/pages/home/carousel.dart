import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_client/api/carousel.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var images = [];

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
          return Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        // pagination: SwiperPagination(),
        control: const SwiperControl(),
        autoplay: true,
      ),
    );
  }

  getImages() async {
    getCarouselAddress().then((r) => {
          setState(() {
            for (var i in r.data['data']) {
              images.add(getCarouselImageBaseUrl() + i['image']);
            }
          })
        });
  }
}
