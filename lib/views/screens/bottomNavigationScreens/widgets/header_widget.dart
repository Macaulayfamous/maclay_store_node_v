import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String _currentLocation = 'Fetching location...';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    setState(() {
      _isLoading = true;
    });

    final permission = await Permission.location.request();
    if (permission.isGranted) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          final placemark = placemarks[0];
          setState(() {
            _currentLocation = placemark.toString();
          });
        } else {
          setState(() {
            _currentLocation = 'Address not found';
          });
        }
      } catch (e) {
        setState(() {
          _currentLocation = 'Failed to get location: $e';
        });
      }
    } else {
      setState(() {
        _currentLocation = 'Permission denied to access location';
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

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
            Container(
              height: 36.5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffF5F5F5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset(
                      'assets/location-pin.png',
                      width: 15.75,
                      height: 15.75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Text(
                        _isLoading ? 'Fetching location...' : _currentLocation,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: Color(0xFF212121),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      'assets/Arrow.png',
                      width: 18,
                      height: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      toolbarHeight: 115,
    );
  }
}

// import 'package:flutter/material.dart';

// class HeaderWidget extends StatelessWidget {
//   const HeaderWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       // height: MediaQuery.of(context).size.height * 0.20,
//       clipBehavior: Clip.antiAlias,
//       decoration: const BoxDecoration(),
//       child: Stack(
//         children: [
//           Image.asset(
//             'assets/icons/searchBanner.jpeg',
//             width: MediaQuery.of(context).size.width,
//             // height: MediaQuery.of(context).size.height * 0.20,
//             fit: BoxFit.cover,
//           ),
//           Positioned(
//             left: 48,
//             top: 68,
//             child: SizedBox(
//               width: 250,
//               height: 50,
//               child: TextField(
//                 keyboardType: TextInputType.text,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontFamily: 'Roboto',
//                 ),
//                 textAlign: TextAlign.left,
//                 textAlignVertical: TextAlignVertical.center,
//                 autocorrect: false,
//                 maxLines: null,
//                 minLines: null,
//                 expands: true,
//                 cursorHeight: 14,
//                 cursorRadius: const Radius.circular(2),
//                 cursorColor: const Color(0xFF5C69E5),
//                 decoration: InputDecoration(
//                   labelStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontFamily: 'Roboto',
//                   ),
//                   floatingLabelStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontFamily: 'Roboto',
//                   ),
//                   hintText: 'Enter text',
//                   hintStyle: const TextStyle(
//                     color: Color(0xFF7F7F7F),
//                     fontSize: 14,
//                     fontFamily: 'Roboto',
//                   ),
//                   hintMaxLines: 1,
//                   errorStyle: const TextStyle(
//                     color: Color(0xFFFF0000),
//                     fontSize: 12,
//                     fontFamily: 'Roboto',
//                   ),
//                   errorMaxLines: 1,
//                   floatingLabelBehavior: FloatingLabelBehavior.auto,
//                   isDense: true,
//                   contentPadding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                   prefixIcon: SizedBox.square(
//                     dimension: 24,
//                     child: Image.asset(
//                       'assets/icons/searc1.png',
//                       scale: 5,
//                     ),
//                   ),
//                   suffixIcon: SizedBox.square(
//                     dimension: 24,
//                     child: Image.asset(
//                       'assets/icons/cam.png',
//                     ),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey.shade200,
//                   focusColor: Colors.black,
//                   hoverColor: const Color(0x197F7F7F),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                     borderSide: const BorderSide(
//                       color: Colors.transparent,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                     borderSide: const BorderSide(
//                       color: Colors.transparent,
//                     ),
//                   ),
//                   focusedErrorBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   border: InputBorder.none,
//                   alignLabelWithHint: true,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 311,
//             top: 78,
//             child: Material(
//               type: MaterialType.transparency,
//               clipBehavior: Clip.antiAlias,
//               child: InkWell(
//                 onTap: () {},
//                 overlayColor:
//                     MaterialStateProperty.all<Color>(const Color(0x0c7f7f7f)),
//                 child: Ink(
//                   width: 31,
//                   height: 31,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(
//                         'assets/icons/bell.png',
//                       ),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 354,
//             top: 78,
//             child: Material(
//               type: MaterialType.transparency,
//               clipBehavior: Clip.antiAlias,
//               child: InkWell(
//                 onTap: () {},
//                 overlayColor:
//                     MaterialStateProperty.all<Color>(const Color(0x0c7f7f7f)),
//                 child: Ink(
//                   width: 32,
//                   height: 32,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(
//                         'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/u95VPQt7clXUFWMKgdUNoZ5RqEy2%2Fuploads%2Fimages%2Fdacb5d00_3f69_1d8d_bcd6_87304e104361_chat.png?alt=media',
//                       ),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
