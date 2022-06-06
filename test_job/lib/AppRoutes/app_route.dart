
import 'package:get/get.dart';
import 'package:test_job/ui/home/home_binding.dart';
import 'package:test_job/ui/home/home_screen.dart';


class AppRoutes {

  static String homeScreen = '/home_Screen';



  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

  ];
}
