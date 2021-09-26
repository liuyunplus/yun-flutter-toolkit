import 'package:flutter/material.dart';

class IDataProvider<T> extends InheritedWidget {

  final T data;

  IDataProvider(child, this.data) : super(child: child);

  @override
  bool updateShouldNotify(IDataProvider oldWidget) {
    return this.data != oldWidget.data;
  }

  static T of<T>(BuildContext context) {
    final IDataProvider<T>? iDataProvider = context.dependOnInheritedWidgetOfExactType<IDataProvider<T>>();
    return iDataProvider!.data;
  }

}