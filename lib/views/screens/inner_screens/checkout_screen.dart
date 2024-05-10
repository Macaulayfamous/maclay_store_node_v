import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:google_fonts/google_fonts.dart';
import 'package:maclay_shop_node_project/provider/cart_provider.dart';
import 'package:maclay_shop_node_project/provider/user_provider.dart';
import 'package:maclay_shop_node_project/services/order_service.dart';
import 'package:maclay_shop_node_project/views/screens/main_screen.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends riverpod.ConsumerStatefulWidget {
  const CheckOutPage({super.key});

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends riverpod.ConsumerState<CheckOutPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final OrderService _orderService = OrderService();
    final cartData = ref.watch(cartProvider);
    final cartProviderData = ref.read(cartProvider);

    final totalAmount = ref.read(cartProvider.notifier).calculateTotalAmount();

    Widget header() {
      return Container(
        height: 85,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 7.5, top: 13),
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
                width: 125,
              ),
              const Text(
                'Checkout',
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

    Widget personalDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 17.5, left: 15, right: 15),
        child: Container(
          height: 95,
          width: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.5, right: 12.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chevron_left,
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Shipping to default address',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: const BoxDecoration(
                              color: Color(0xFF336699),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/check.png',
                                height: 11.75,
                                width: 11.75,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            Provider.of<UserProvider>(context).user.email,
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/location.png',
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget offer() {
      return Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            Container(
              height: 70,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color(0xffFFF0F4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 1.5,
                    blurRadius: 1.5,
                    offset: const Offset(0, 1.5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.5, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Learn More',
                      style: TextStyle(
                        // color: Color(0xFF336699),
                        fontSize: 14.25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Shipping is Free. It will be\ndelivered by Sun, Nov5.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ]),
                    ),
                    Image.asset(
                      'assets/gift1.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12.5,
            ),
            const Divider(
              thickness: 0.85,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 2.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Leave at my door',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.5),
                      color: Color(0xFF336699),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/check.png',
                        height: 11.75,
                        width: 11.75,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 17.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffFFF0F4),
              ),
            )
          ],
        ),
      );
    }

    Widget item() {
      final cartData = ref.watch(cartProvider);

      return ListView.builder(
          itemCount: cartData.length,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            final cartItem = cartData.values.toList()[index];
            return Container(
              margin: const EdgeInsets.only(top: 12.5, left: 15, right: 15),
              height: 200,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 1.75,
                    blurRadius: 1.75,
                    offset: const Offset(0, 1.5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Shipment 1 of1',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 2.5,
                        ),
                        Text(
                          cartData.length.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.network(
                          cartItem.imageUrl[0],
                          height: 100,
                          width: 127.5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Provider.of<UserProvider>(context).user.name,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                cartItem.productName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cartItem.productPrice.toStringAsFixed(2),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'non-returnable',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Image.asset(
                                  'assets/return (1).png',
                                  height: 17.5,
                                  width: 17.5,
                                  color: Color(0xFF336699),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12.5,
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Get It By ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'Sun, Dec 31 ',
                                  style: TextStyle(
                                    color: Color(0xFF336699),
                                    fontSize: 13.25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }));
    }

    // Widget paymentGates() {
    //   return Container(
    //     margin: const EdgeInsets.only(top: 12.5, left: 15, right: 15),
    //     height: 150,
    //     width: 375,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(7),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey.withOpacity(0.15),
    //           spreadRadius: 1.75,
    //           blurRadius: 1.75,
    //           offset: const Offset(0, 1.5),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget receipt() {
      final totalAmount =
          ref.read(cartProvider.notifier).calculateTotalAmount();
      return Container(
        margin:
            const EdgeInsets.only(top: 15, bottom: 150, left: 15, right: 15),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 377.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Subtotal',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '\$${totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Shipping fees',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Free',
                          style: TextStyle(
                            color: Color(0xFF336699),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 1,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            '(With VAT)',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Color(0xFF336699),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                header(),
                personalDetails(),
                offer(),
                item(),
                // paymentGates(),
                receipt(),
              ],
            ),
          ),
          Positioned(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 112.5,
              width: 425,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(3.75),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2.75,
                    blurRadius: 2.75,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "${cartData.length} item",
                          style: GoogleFonts.lato(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 56.5,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          await Future.forEach(cartProviderData.entries,
                              (entry) {
                            var item = entry.value;
                            _orderService.sendOrder(
                                context: context,
                                name: Provider.of<UserProvider>(context,
                                        listen: false)
                                    .user
                                    .name,
                                productName: item.productName,
                                productPrice: item.productPrice,
                                discount: item.discount,
                                quantity: item.quantity,
                                category: item.categoryName,
                                image: item.imageUrl[0]);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.grey,
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.all(15),
                            content: Text(
                              'You Have Successfully Place Your  order',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                letterSpacing: 2,
                              ),
                            ),
                          ));

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                            (route) => false, // Disable back navigation
                          );
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF336699),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            )),
                        child: Center(
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.75,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
