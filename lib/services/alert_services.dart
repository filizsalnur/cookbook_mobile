import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';



class AlertUtils {
  bool isDialogOpen = false;
  Future<void> successfulAlert(
      String successMessage, BuildContext context) async {
    isDialogOpen = true;
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      showConfirmBtn: false,
      title: successMessage,
      backgroundColor: Colors.white,
      autoCloseDuration: Duration(milliseconds: 1500),
      titleColor: Colors.green,
      
    );
    isDialogOpen = false;
  }

  Future<void> errorAlert(String errorMessage, BuildContext context) async {
    isDialogOpen = true;
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: errorMessage,
      backgroundColor: Colors.white,
      titleColor: Colors.red,
      showConfirmBtn: false,
      autoCloseDuration: Duration(milliseconds: 1500),
    );
    isDialogOpen = false;
  }

  Future<void> InfoAlert(String infoMessage, BuildContext context) async {
    isDialogOpen = true;
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      showConfirmBtn: false,
      title: infoMessage,
      backgroundColor:  Colors.white,
      autoCloseDuration: Duration(milliseconds: 1500),
      titleColor: Colors.yellow,
    );
    isDialogOpen = false;
  }

  Future<void> loadingAlert(BuildContext context) async {
    isDialogOpen = true;
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      showConfirmBtn: false,
      backgroundColor: Colors.white,
      title: 'Loading',
      autoCloseDuration: Duration(milliseconds: 1500),
      titleColor: Colors.yellow,
    );
    isDialogOpen = false;
  }

  

////////////////////////////////////////////////////////////////////////////////////////////////

  
}
