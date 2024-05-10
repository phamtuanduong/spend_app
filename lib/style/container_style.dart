import 'package:flutter/material.dart';
import 'package:spend_app/constants.dart';

const boxDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 0),
          blurRadius: 20,
          spreadRadius: 1)
    ],
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(defaultPadding * 1.2),
        topRight: Radius.circular(defaultPadding * 1.2)));
