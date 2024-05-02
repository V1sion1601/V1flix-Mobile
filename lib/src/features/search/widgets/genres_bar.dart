import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

const List<String> example = ["Action", "Adventure", "Action", "Adventure", "Action", "Adventure", "Action", "Adventure", "Action", "Adventure"];

class GenresBar extends StatelessWidget {
  const GenresBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int itemCount = (width / example.length / 10).ceil();
    print("Item count: " + itemCount.toString());
    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: (context, firstIndex, secondIndex) {
        final int first = firstIndex * itemCount;
        final int second = first + itemCount > example.length ? first + example.length - itemCount : first + itemCount;

        return Row(
          children: example.sublist(first, second)
              .map((name) => Row(
                    children: [
                      FittedBox(
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ))
              .toList(),
        );
      },
      options: CarouselOptions(
        aspectRatio: 6,
        enlargeCenterPage: false,
        viewportFraction: 1,
      ),
    );
  }
}
