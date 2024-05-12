import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:maclay_shop_node_project/provider/banner_provider.dart';
import 'package:maclay_shop_node_project/provider/category_provider.dart';
import 'package:maclay_shop_node_project/provider/product.dart';
import 'package:maclay_shop_node_project/provider/user_provider.dart';
import 'package:maclay_shop_node_project/services/auth_service.dart';
import 'package:maclay_shop_node_project/views/screens/main_screen.dart';
import 'package:maclay_shop_node_project/views/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CategoryProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => BannerProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      )
    ],
    child: const riverpod.ProviderScope(child: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    await _authService.getUserData(context);
    setState(() {}); // Trigger a rebuild after fetching user data
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    print("Token: ${Provider.of<UserProvider>(context).user.name}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ?  const MainScreen()
          :  SplashPage(),
    );
  }
}
