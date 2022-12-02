import 'package:geek_garden_test/screens/add_product/add_product_screen.dart';
import 'package:geek_garden_test/screens/edit_product/edit_product_screen.dart';
import 'package:geek_garden_test/screens/home/home_screen.dart';
import 'package:geek_garden_test/screens/splash_screen.dart';

class RoutesApp {
  static var routes = {
    '/': (ctx) => const SplashScreen(),
    '/home': (ctx) => HomeScreen(),
    '/add-product': (ctx) => const AddProductScreen(),
    '/update-product': (ctx) => EditProductScreen(),
  };
}
