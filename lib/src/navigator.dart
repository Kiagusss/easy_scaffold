import 'package:flutter/material.dart';


void backPage(context) => Navigator.pop(context!);

void backPageWithResult(dynamic result, context) =>
    Navigator.of(context!).pop(result);

void openPage(Widget page, context) => Navigator.push(
      context!,
      MaterialPageRoute(builder: (context) => page),
    );

Future<dynamic> openPageWithResult(Widget page, context) async {
  return await Navigator.push(
    context!,
    MaterialPageRoute(builder: (context) => page),
  );
}
