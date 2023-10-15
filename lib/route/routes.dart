import 'package:get/get.dart';

import '../scrreens/category_screen.dart';
import '../scrreens/details_screen.dart';
import '../scrreens/home_screen.dart';
import '../scrreens/splash_screen.dart';

class Routes {
  static String homePage = '/homepage';

  static String splashScreen = '/splashScreen';

  static String categoryScree = '/category';

  static String details = '/details';

  static String buildPage = '/buildPage';

  static String iptv = '/iptv';

  static String player = '/player';

  static String player2 = '/player2';

  static String nexusAddons = '/nexusAddons';

  static String productPage = '/productPage';

  static String favPage = '/favPage';
}

appRoutes() => [
      GetPage(
        name: Routes.homePage,
        page: () => HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
      GetPage(
        name: Routes.categoryScree,
        page: () => CategoriesScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.details,
        page: () => NewsDetailsScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];
