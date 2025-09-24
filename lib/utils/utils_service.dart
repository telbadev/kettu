import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class UtilsService {
  static double prefferedSize = 30;
  static double paddingSize = 30;
  static double screnHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double screnWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value;
    }
    return price;
  }

  static String cartaNumberFormat(String number) {
    if (number.length == 16) {
      var value = number;
      value = value.substring(number.length-4);
      return "**** **** **** $value";
    }
    return number;
  }

  static Future<bool?> commonDialog({context, title, content, yes, no}) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Platform.isAndroid
            ? Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          child: AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(
                  no,
                  style:
                  const TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  yes,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              )
            ],
          ),
        )
            : CupertinoAlertDialog(
          title: title,
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                no,
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                yes,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            )
          ],
        );
      },
    );
  }

  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }


  static void snackBar(context,{required String title, required String msg,bool isBoking = true}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: msg,
        contentType: isBoking?ContentType.failure:ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

}

