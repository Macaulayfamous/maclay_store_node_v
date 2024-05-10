import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maclay_shop_node_project/models/product_model.dart';
import 'package:maclay_shop_node_project/provider/cart_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final ProductModel product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  late ValueNotifier<String> descriptionNotifier;
  bool showFullDescription = false;

  @override
  void initState() {
    super.initState();
    descriptionNotifier = ValueNotifier<String>(widget.product.description);
  }

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final cartNotifier = ref.read(cartProvider.notifier);

    final cartItem = ref.watch(cartProvider);
    final isInCart = cartItem.containsKey(widget.product.productId);
    final List<String> imageUrls = List<String>.from(widget.product.images);

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        height: 68,
        width: 380,
        decoration: BoxDecoration(
          color: const Color(0xffFFF0F4),
          borderRadius: BorderRadius.circular(12),
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
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Free shipping through Friday, January 1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Order within 15 hours 40 minutes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: Image.asset(
                  'assets/gift.png',
                  width: 43,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget des() {
      return Column(
        children: [
          SizedBox(
              width: 389,
              child: ValueListenableBuilder<String>(
                valueListenable: descriptionNotifier,
                builder: (context, description, child) {
                  return RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: GoogleFonts.getFont(
                        'Lato',
                        color: const Color(0xFF797979),
                        fontSize: 12,
                        letterSpacing: 1,
                        height: 1.7,
                      ),
                      children: [
                        TextSpan(
                          text: showFullDescription
                              ? description
                              : description.substring(
                                  0, description.length ~/ 2),
                        ),
                        if (!showFullDescription)
                          const TextSpan(
                            text: '... ',
                            style: TextStyle(
                              color: Color(0xFF3C54EE),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        if (!showFullDescription)
                          TextSpan(
                            text: 'See More',
                            style: const TextStyle(
                              color: Color(0xFF3C54EE),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  showFullDescription = true;
                                });
                              },
                          ),
                      ],
                    ),
                  );
                },
              )),
        ],
      );
    }

    Widget discounts() {
      return Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        height: 125,
        width: 380,
        decoration: BoxDecoration(
          color: const Color(0xffFFF0F4),
          borderRadius: BorderRadius.circular(12),
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
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/discounts.png',
                    width: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Get it in monthly installments \nof \$50 with 0% interest.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right,
                      size: 22,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 1,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/discount.png',
                          width: 40,
                          color: Color(0xFF102DE1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: const TextSpan(
                            text: 'Get ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\$10',
                                style: TextStyle(
                                  color: Color(0xFF102DE1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' cash back using your',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: '\nMaculay Famouss ',
                                style: TextStyle(
                                  color: Color(0xFF102DE1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' credit card.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chevron_right,
                            size: 22,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 8.50, left: 12, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      widget.product.productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.75),
                    border: Border.all(
                      color: const Color(0xffD0D0D0),
                      width: 1.25,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: Row(
                      children: [
                        const Column(
                          children: [
                            Text(
                              '(164)',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/icon_star.png',
                          width: 20,
                          color: Color(0xFF102DE1),
                        ),
                        const Text(
                          '4.4',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ), //
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$250',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '%45 OFF',
                      style: TextStyle(
                        color: Color(0xFF102DE1),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4), // Adjust the spacing
                    Text(
                      '\$300.00',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget header() {
      return SizedBox(
        height: 350,
        width: double.infinity,
        child: Stack(
          children: [
            InkWell(
              onTap: () {},
              child: CarouselSlider(
                items: imageUrls
                    .map((imageUrl) => CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 350,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 12.75,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < imageUrls.length; i++)
                    Container(
                      height: 4,
                      width: 20,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: _currentPage == i
                            ? Color(0xFF102DE1)
                            : Colors.blueGrey,
                      ),
                    ),
                ],
              ),
            ),
            Positioned(
              top: 12.5,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 313,
                    left: 9.5,
                  ),
                  height: 27.5,
                  width: 27,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.35),
                        spreadRadius: 1.2,
                        blurRadius: 1.2,
                        offset: const Offset(0, 1.2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/share1.png',
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 306, right: 9.5),
                  child: Image.asset(
                    'assets/btn_wishlist.png',
                    width: 32.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                header(),
                content(),
                des(),
                title(),
                discounts(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 250,
              child: TextButton(
                onPressed: isInCart
                    ? null
                    : () {
                        cartNotifier.addProductToCart(
                            productName: widget.product.productName,
                            productPrice: widget.product.productPrice,
                            categoryName: widget.product.category,
                            imageUrl: widget.product.images,
                            quantity: 1,
                            productId: widget.product.productId,
                            discount: widget.product.discount,
                            description: widget.product.description);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            margin: const EdgeInsets.all(15),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.grey,
                            content: Text(
                              'You added ${widget.product.productName}',
                            ),
                          ),
                        );
                      },
                style: TextButton.styleFrom(
                  backgroundColor:
                      isInCart ? Colors.grey : const Color(0xFF5C69E5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFF102DE1),
                  width: 1.5,
                ),
              ),
              child: const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'QTY',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.35,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
