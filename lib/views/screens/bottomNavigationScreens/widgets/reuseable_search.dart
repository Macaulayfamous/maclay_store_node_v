import 'package:flutter/material.dart';


class ReusableSearchWidget extends StatefulWidget {
  const ReusableSearchWidget({Key? key}) : super(key: key);

  @override
  _ReusableSearchWidgetState createState() => _ReusableSearchWidgetState();
}

class _ReusableSearchWidgetState extends State<ReusableSearchWidget> {
 
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: 16, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextFormField(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const SearchPage(),
                        //   ),
                        // );
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 37.5),
                        hintText: 'Search here ...',
                        hintStyle: const TextStyle(
                          color: Color(0xffC8C8CB),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(
                            color: Color(0xffE41937),
                          ),
                        ),
                        prefixIcon: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const SearchPage(),
                            //   ),
                            // );
                          },
                          child: const Icon(
                            Icons.search,
                            size: 20,
                            color: Color(0xffC8C8CB),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const FavouritePage(),
                        //   ),
                        // );
                      },
                      child: Image.asset(
                        'assets/btn_wishlist.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const NotifiPage(),
                      //   ),
                      // );
                    },
                    child: Image.asset(
                      'assets/notification.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Location display
           
          ],
        ),
      ),
      toolbarHeight: 115,
    );
  }
}
