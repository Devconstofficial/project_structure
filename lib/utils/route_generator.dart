import 'package:get/get.dart';
import 'package:inner_journal_app/views/screens/start_up_screens/new_to_saejl_screen.dart';
import '../splash_screen.dart';
import 'app_strings.dart';
import 'screen_bindings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kSplashRoute, page: () => SplashScreen(), binding: ScreenBindings()),
      GetPage(name: kNewToSaejlRoute, page: () => NewToSaejlScreen(), binding: ScreenBindings()),
    ];
  }
}
