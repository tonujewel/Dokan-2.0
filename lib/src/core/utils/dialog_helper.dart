import 'package:flutter/material.dart';

class DialogHelper {
  static void showLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 8),
                Text('Loading...'),
              ],
            ),
          ),
        );
      },
    );
  }

  static void errorDialog(BuildContext context, String msg) {
    // TODO:: need to redesign
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Error",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Divider(),
                Text(msg),
              ],
            ),
          ),
        );
      },
    );
  }
  static void successDialog(BuildContext context, String msg) {
    // TODO:: need to redesign
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Success",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Divider(),
                Text(msg),
              ],
            ),
          ),
        );
      },
    );
  }

  static hideLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }
}
