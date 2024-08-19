import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(
    {required String message, Toast? toastLength, ToastState? toastState}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength ?? Toast.LENGTH_LONG,
      backgroundColor: toastState == ToastState.success
          ? Colors.green
          : toastState == ToastState.error
          ? Colors.redAccent
          : null);
}

extension BoolExtension on bool?{
   String? get toStringBool => (this != null) ? this! ? 'True': '' : null;
}

enum ToastState { success, error, normal }