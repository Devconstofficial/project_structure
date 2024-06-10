import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartUpScreensController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKeyNewToSaejl = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailLogin = TextEditingController();
  FocusNode fnEmailLogin = FocusNode();
  RxBool isLoading1 = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
