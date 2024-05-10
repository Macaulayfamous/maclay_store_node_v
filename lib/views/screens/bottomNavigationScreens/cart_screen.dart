import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maclay_shop_node_project/provider/cart_provider.dart';
import 'package:maclay_shop_node_project/views/screens/inner_screens/checkout_screen.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget header() {
    final cartData = ref.watch(cartProvider);
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 800),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(5),
              ),
              border: Border.all(
                color: Colors.grey,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1.75,
                  blurRadius: 1.75,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Your Cart',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${cartData.length} Items",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget content() {
    final cartData = ref.watch(cartProvider.notifier);
    final cartProviderData = ref.watch(cartProvider);
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 600),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 600),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartProviderData.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartProviderData.values.toList()[index];
                      return Card(
                        elevation: 1,
                        child: Container(
                          width: 375, // Adjust width as needed
                          height: 220, // Adjust height as needed
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                left: 22,
                                top: 49,
                                child: SizedBox(
                                  width: 331, // Adjust width as needed
                                  height: 19, // Adjust height as needed
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 19,
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            cartItem.categoryName,
                                            style: GoogleFonts.getFont(
                                              'Lato',
                                              color: const Color(0xFF444444),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 19),
                                      Container(
                                        height: 19,
                                        alignment: Alignment.bottomCenter,
                                        child: const Icon(
                                          CupertinoIcons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 48,
                                top: 97,
                                child: Container(
                                  width: 89,
                                  height: 95,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        spreadRadius: 0,
                                        offset: Offset(0, 1),
                                        blurRadius: 5,
                                      )
                                    ],
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: 3,
                                        top: 6,
                                        child: Image.network(
                                          cartItem.imageUrl[0],
                                          width: 82,
                                          height: 82,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 154,
                                top: 97,
                                child: SizedBox(
                                  width: 154,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          cartItem.productName,
                                          style: GoogleFonts.getFont(
                                            'Lato',
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        cartItem.categoryName,
                                        style: const TextStyle(
                                          color: Color(0xFFA1A1A1),
                                          fontSize: 14,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      const SizedBox(height: 22),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\$${cartItem.discount.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            color: Color(0xFFFF6464),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 254,
                                top: 164,
                                child: Container(
                                  width: 101,
                                  height: 28,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF8F8F8),
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: 46,
                                        top: 6,
                                        child: Text(
                                          cartItem.quantity.toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: SizedBox(
                                          width: 101,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 31,
                                                height: 28,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFDBDBDB),
                                                ),
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Positioned(
                                                      left: -1,
                                                      top: -12,
                                                      child: InkWell(
                                                        onTap:
                                                            cartItem.quantity ==
                                                                    1
                                                                ? null
                                                                : () {
                                                                    cartData.decrementItem(
                                                                        cartItem
                                                                            .productId);
                                                                  },
                                                        child: const Icon(
                                                          Icons.minimize,
                                                          size: 32,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 39),
                                              Container(
                                                width: 31,
                                                height: 28,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFDBDBDB),
                                                ),
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Positioned(
                                                      left: 6,
                                                      top: 4,
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            cartData.incrementItem(
                                                                cartItem
                                                                    .productId);
                                                          });
                                                          print('res');
                                                        },
                                                        child: const Icon(
                                                          CupertinoIcons.plus,
                                                          size: 21,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 9,
                                top: 130,
                                child: SizedBox.square(
                                  dimension: 32,
                                  child: Radio<String>(
                                    value: '1',
                                    groupValue: '1',
                                    onChanged: (value) {},
                                    autofocus: false,
                                    splashRadius: 20,
                                    activeColor: const Color(0xFF5C69E5),
                                    toggleable: false,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => states.contains(
                                                    MaterialState.selected)
                                                ? const Color(0xFF5C69E5)
                                                : Colors.grey),
                                    hoverColor: const Color(0x0A000000),
                                    focusColor: Colors.black12,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget suggested() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            'Suggested Products',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.75,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Column(
        children: [
          Container(
            width: 375,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/discount.png',
                      width: 35,
                      color: const Color(0xFF336699),
                    ),
                    const SizedBox(
                      width: 27.5,
                    ),
                    const Text(
                      'See available offers',
                      style: TextStyle(
                        color: Color(0xFF5C69E5),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF336699),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: TextFormField(
              keyboardType: TextInputType.number,
              cursorColor: const Color(0xFF5C69E5),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.75),
                hintText: 'Enter discount Code',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13.1,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(top: 14),
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Color(0xFF336699),
                      fontSize: 14.50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget discount() {
    final totalAmount = ref.read(cartProvider.notifier).calculateTotalAmount();
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Column(
        children: [
          Container(
            height: 120.5,
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
                        "\$" "$totalAmount",
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping fees',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                        "\$" '$totalAmount',
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

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
      height: 57.75,
      decoration: BoxDecoration(
        color: const Color(0xffFFF0F4),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFF336699),
          width: 0.9,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 12),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: const TextSpan(
                      text: 'Earn \$50 Dollars cashback',
                      style: TextStyle(
                          color: Color(0xFF336699),
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' with the Amman \nFa9ran credit card bank. ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Apply Now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: Image.asset(
                'assets/atm-card.png',
                width: 37.5,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget map() {
    return Container(
      margin: const EdgeInsets.only(top: 12.5, right: 10, left: 10),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey,
          width: .9,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.5, right: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/bank.png',
              width: 32.5,
            ),
            const Text(
              'Providing a monthly sectional plan for\norders exceeding \$250.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_right,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget creditCards() {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 100, left: 35, right: 35),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/visa.png',
              width: 39,
            ),
            Image.asset(
              'assets/paypal.png',
              width: 45,
            ),
            Image.asset(
              'assets/payment.png',
              width: 39,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = ref.read(cartProvider.notifier).calculateTotalAmount();
    ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                header(),
                content(),
                // suggested(),
                footer(),
                discount(),
                title(),
                map(),
                creditCards(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 11.75,
                left: 55,
                right: 60,
              ),
              height: 47.5,
              child: TextButton(
                onPressed: () {
                  if (totalAmount == 0.0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        margin: EdgeInsets.all(15),
                        behavior: SnackBarBehavior.floating,
                        padding: EdgeInsets.all(15),
                        backgroundColor: Colors.grey,
                        content: Text('Please add item to your cart')));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckOutPage(),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF5C69E5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: Row(
                  children: [
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        double limitedOffset = _animationController.value < 0.5
                            ? 15 * _animationController.value
                            : 15 * (1 - _animationController.value);

                        return Transform.translate(
                          offset: Offset(
                            limitedOffset,
                            0.0,
                          ),
                          child: Container(
                            height: 25,
                            width: 27.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/arrow_left.png',
                                height: 23,
                                width: 23,
                                fit: BoxFit.cover,
                                color: const Color(0xFF5C69E5),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 65,
                    ),
                    const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
