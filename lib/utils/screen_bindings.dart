import 'package:get/get.dart';
import 'package:inner_journal_app/views/screens/start_up_screens/controller/start_up_screen_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartUpScreensController());
  }
}
