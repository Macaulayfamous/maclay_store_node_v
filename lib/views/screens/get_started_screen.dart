import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maclay_shop_node_project/views/screens/login_page.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  List images = [
    'assets/intro.png',
    'assets/intro2.png',
    'assets/intro3.png',
  ];

  List titles = [
    'What is Gate Pay?',
    'What is Google pay?',
    'What is Apple pay?',
  ];

  int currentIndex = 0;
  int pressCounter = 0;

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 0.75),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index
              ? const Color(0xFF336699)
              : const Color(0xffC4C4C4),
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Container(
        margin: const EdgeInsets.only(top: 55),
        child: Column(
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              items: images
                  .map(
                    (image) => Image.asset(
                      image,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 79,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((e) {
                index++;
                return indicator(index);
              }).toList(),
            )
          ],
        ),
      );
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: Text(
          titles[currentIndex],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: .1, left: 20),
        child: const Text(
          "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry.Lorem \nIpsum has been the industry's standard \ndummy text ever since the 1500s.",
          style: TextStyle(
            color: Color(0xff80848A),
            fontSize: 13.5,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInPage(),
                    ),
                  );
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Color(0xff80848A),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (currentIndex == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInPage(),
                      ),
                    );
                  } else {
                    currentIndex = (currentIndex + 1) % images.length;
                    pressCounter++;
                  }
                });

                _carouselController.nextPage();
              },
              child: Container(
                height: pressCounter == 3 ? 60 : 47.5,
                width: pressCounter == 3 ? 60 : 47.5,
                margin: const EdgeInsets.only(right: 40),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF336699),
                ),
                child: Center(
                  child: currentIndex < 2
                      ? Image.asset(
                          'assets/Right 2.png',
                          height: 17,
                          width: 17,
                          fit: BoxFit.cover,
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LogInPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 142,
                            height: 60,
                            alignment: Alignment.center,
                            child: const Text(
                              "Let's go",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          header(),
          title(),
          content(),
          footer(),
        ],
      ),
    );
  }
}