import 'package:flutter/material.dart';

TextStyle? bodySmall(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall;

TextStyle? bodyMedium(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium;

TextStyle? bodyLarge(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge;

TextStyle? titleSmall(BuildContext context, {FontWeight? fontWeight}) =>
    Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: fontWeight);

TextStyle? titleMedium(BuildContext context, {FontWeight? fontWeight}) =>
    Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: fontWeight);

TextStyle? titleLarge(BuildContext context, {FontWeight? fontWeight}) =>
    Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: fontWeight);
