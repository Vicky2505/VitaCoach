import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<String> names = [
    'Get personalized health tips and plans\n\t\t\t\t\t\t\t\tevery day, tailored just for you',
    'Use voice or icons to quickly check\n\t\tsymptoms and get health advice.',
    'Complete wellness tasks and earn\n\t\t\t\trewards for staying healthy!',
  ];

  Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: ListView(
        children: [
          CarouselSlider.builder(
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                height: MediaQuery.of(context).size.width * 0.2,
                child: Column(
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      names[index],
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.2,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(microseconds: 800),
              viewportFraction: 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
