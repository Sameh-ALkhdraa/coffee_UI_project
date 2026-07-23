import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';

Future<dynamic> alertDialog(BuildContext context){
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(context.t.login),
          ],
        ),
        content: Text(
          context.t.incorrectLoginInformation,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(context.t.ok),
          ),
        ],
      );
    },
  );
}