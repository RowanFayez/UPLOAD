import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taskaia/core/managers/logout_bottom_sheet.dart';

class AlertManager {
  static void showLogoutConfirmation(
    BuildContext context,
    VoidCallback onConfirm,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => LogoutBottomSheet(onConfirm: onConfirm),
    );
  }

  static void showWelcomeToast() {
    Fluttertoast.showToast(
      msg: "You now have an account with us, welcome to the family!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
