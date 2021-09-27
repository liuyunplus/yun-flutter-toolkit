import 'package:flutter/material.dart';

class DataProvider<T> extends InheritedWidget {

  final T data;

  DataProvider(child, this.data) : super(child: child);

  @override
  bool updateShouldNotify(DataProvider oldWidget) {
    return this.data != oldWidget.data;
  }

  static T of<T>(BuildContext context) {
    final DataProvider<T>? iDataProvider = context.dependOnInheritedWidgetOfExactType<DataProvider<T>>();
    return iDataProvider!.data;
  }

}