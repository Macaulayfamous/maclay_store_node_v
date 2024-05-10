import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF5F5F5),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 9, top: 34, right: 137.5),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/arrow_left.png',
                  height: 24,
                  width: 24,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              const Text(
                'Order Summary',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.75,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 12.5,
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NAEFC0023564832Order ID -',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 7.5,
              ),
              Text(
                'on Thursday,14th Dec, 12:30 PM',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              )
            ],
          ),
        ),
      );
    }

    Widget invoice() {
      return Container(
        margin: const EdgeInsets.only(top: 7.5, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Invoice',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 17.5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'USD 250',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Subtotal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FREE',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Shipping Free',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 0.95,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 12.5,
            ),
            const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'USD 250',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'inc.VAT',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Order Total',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'USD 2.5',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Estimated Vat',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 0.95,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 12.5,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/amex.png',
                  height: 37.5,
                  width: 37.5,
                ),
                const Spacer(),
                const Text(
                  'Payment Method',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 0.95,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 25, left: 10, right: 10),
        child: Container(
          height: 97.5,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2.5,
                blurRadius: 2.5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/door.png',
                        height: 32.5,
                        width: 32.5,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Leave At My Door',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.5,
                  ),
                  const Text(
                    'Your delivery will be left at your door and a photo will be sent to you as confirmation.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget address() {
      return Container(
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        height: 200.5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2.5,
              blurRadius: 2.5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Delivery address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 1.25,
                  ),
                  Text(
                    '(Home)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    'Mostafa Gamal',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 2.5,
                  ),
                  Text(
                    'Recipient',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11.25,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Sheikh Zayed,Cairo, Egypt',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.35,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Text(
                    '(+20) 1064195982',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 2.5,
                  ),
                  Text(
                    'Verified',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    const Text(
                      'Payment Method',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 7.5,
                    ),
                    Image.asset(
                      'assets/amex.png',
                      height: 36,
                      width: 36,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget item() {
      return Container(
        margin: const EdgeInsets.only(top: 17.5, bottom: 100),
        height: 176,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xffFFF0F4).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/Gta.jpg',
            ),
            const SizedBox(
              width: 2.5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 37.5,
                ),
                const Text(
                  'RockStar',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'SpiderMan Newyork version \nfor PS5 2024',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.75,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const OrderDetailPage(),
                        //   ),
                        // );
                      },
                      child: const Text(
                        'View More',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.25,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            title(),
            invoice(),
            content(),
            address(),
            item(),
          ],
        ),
      ),
    );
  }
}