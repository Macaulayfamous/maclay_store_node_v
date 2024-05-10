import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          toolbarHeight: 135,
          backgroundColor: const Color(0xffF5F5F5),
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 20,
                ),
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
                    const SizedBox(
                      width: 150,
                    ),
                    const Text(
                      'Orders',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.75,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const TabBar(
                isScrollable: true,
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text(
                      'Canceled',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
                labelPadding: EdgeInsets.symmetric(horizontal: 50),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Scaffold(
              backgroundColor: const Color(0xffF5F5F5),
              body: Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 176,
                      width: 342,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
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
                        children: [
                          Image.asset(
                            'assets/apple10.jpg',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'apple',
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
                                'apple Macbook M3 Max',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'on Sunday, 1th Dec,\n5:00 PM',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 12.5,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/reject.png',
                                    height: 38,
                                    width: 38,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Canceled',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 13.85,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Scaffold(
              backgroundColor: const Color(0xffF5F5F5),
              resizeToAvoidBottomInset: false,
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
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
                        child: Container(
                          height: 176,
                          width: 342,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
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
                            children: [
                              Image.asset(
                                'assets/ps4.jpg',
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sony',
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
                                    'PS4 Controller for PS5 Pro',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12.5,
                                  ),
                                  const Text(
                                    'Completed',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 13.85,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'on Thursday, 14th Dec, 12:30 PM',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 1.5,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Payment',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.75,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Image.asset(
                                        'assets/visa.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        height: 176,
                        width: 342,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
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
                          children: [
                            Image.asset(
                              'assets/Gta.jpg',
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  'Gta6 Vice City 2024',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12.5,
                                ),
                                const Text(
                                  'Completed',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13.85,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'on Munday, 17th Nov,2:00 AM',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/delivery-truck.png',
                                      height: 47.5,
                                      width: 47.5,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Paid on delivery',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.75,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        height: 176,
                        width: 342,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
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
                          children: [
                            Image.asset(
                              'assets/tvvv.jpg',
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Sony',
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
                                  'PS4 Controller for PS5 Pro',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12.5,
                                ),
                                const Text(
                                  'Completed',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13.85,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'on Thursday, 14th Dec, 12:30 PM',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 1.5,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Payment',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.75,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    Image.asset(
                                      'assets/amex.png',
                                      height: 39,
                                      width: 39,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}