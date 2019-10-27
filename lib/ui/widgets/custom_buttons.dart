import 'package:flutter/material.dart';

FlatButton froyoFlatBtn(String text, onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: Colors.white,
    color: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}

OutlineButton froyoOutlineBtn(String text, onPressed) {
  return OutlineButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: Colors.black,
    highlightedBorderColor: Colors.white,
    borderSide: BorderSide(color: Colors.black),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
