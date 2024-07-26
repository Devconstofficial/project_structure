import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inner_journal_app/utils/shared_preference.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  SharedPreference sharedPreference = SharedPreference();

  Future<void> checkPermissionForStorage(BuildContext context) async {
    bool hasAskedActivityRecognitionPermission = await sharedPreference.readBool("hasAskedActivityRecognitionPermission");
    Permission perm =
    Platform.isAndroid ? Permission.activityRecognition : Permission.sensors;


    if (await perm.isPermanentlyDenied) {
      if (context.mounted) {
        showCupertinoDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext dialogContext) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: CupertinoAlertDialog(
                title: const Text(
                  "Permission Denied",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                content: const Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Permission for activity recognition is permanently denied. Please open application settings to allow perrmission.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      openAppSettings();
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    }
    else if (await perm.isRestricted) {
      if (context.mounted) {
        showCupertinoDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext dialogContext) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: CupertinoAlertDialog(
                title: const Text(
                  "Permission Restricted",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                content: const Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Permission for activity recognition is restricted. Your device does not support activity recognition feature.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await [Permission.activityRecognition].request();
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    } else if (await perm.isLimited) {
      if (context.mounted) {
        showCupertinoDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext dialogContext) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: CupertinoAlertDialog(
                title: const Text(
                  "Permission Limited",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                content: const Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Permission for activity recognition is limited. You can use activity recognition feature upto some extent.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await [Permission.activityRecognition].request();
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    }
    else if (hasAskedActivityRecognitionPermission && await perm.isDenied) {
      if (context.mounted) {
        showCupertinoDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext dialogContext) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: CupertinoAlertDialog(
                title: const Text(
                  "Permission Denied",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                content: const Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Permission for activity recognition is denied. Please open application settings to allow perrmission.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      openAppSettings();
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    } else {
      await sharedPreference.saveBool("hasAskedActivityRecognitionPermission", true);

      await perm.request();
    }
  }

}