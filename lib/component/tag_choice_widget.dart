import 'package:flutter/material.dart';

class TagChoiceWidget<T> extends StatefulWidget {

  late _TagChoiceWidgetState _choiceChipWidgetState;
  late Map<T, String>? itemMap;
  late List<T>? itemList;

  TagChoiceWidget({List<T>? itemList, Map<T, String>? itemMap}) {
    this.itemList = itemList;
    this.itemMap = itemMap;
  }

  @override
  State<StatefulWidget> createState() {
    _choiceChipWidgetState = _TagChoiceWidgetState(itemList: itemList, itemMap: itemMap);
    return _choiceChipWidgetState;
  }

  T getSelected() {
    return _choiceChipWidgetState.selected;
  }

}

class _TagChoiceWidgetState<T> extends State<TagChoiceWidget> {

  T? selected;
  late Map<T, String>? itemMap;
  late List<T>? itemList;

  _TagChoiceWidgetState({List<T>? itemList, Map<T, String>? itemMap}) {
    this.itemList = itemList;
    this.itemMap = itemMap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: Wrap(
          children: _buildChoiceChip(),
        )
    );
  }

  List<Widget> _buildChoiceChip() {
    if (itemList != null) {
      return buildFromList(this.itemList!);
    }
    return buildFromMap(this.itemMap!);
  }

  List<Widget> buildFromList(List<T> list) {
    List<Widget> widgetList = <Widget>[];
    this.selected = this.selected??list.first;
    list.forEach((value) {
      bool selected = (this.selected == value);
      ChoiceChip chip = ChoiceChip(
          label: Text(
            "$value",
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
            ),
          ),
          selected: selected,
          backgroundColor: Colors.grey[350],
          selectedColor: Colors.blue,
          onSelected: (selected) {
            setState(() {
              this.selected = value;
            });
          }
      );
      widgetList.add(chip);
      widgetList.add(SizedBox(width: 5));
    });
    widgetList.removeLast();
    return widgetList;
  }

  List<Widget> buildFromMap(Map<T, String> map) {
    List<Widget> widgetList = <Widget>[];
    this.selected = this.selected??map.keys.first;
    map.forEach((key, value) {
      bool selected = (this.selected == key);
      ChoiceChip chip = ChoiceChip(
          label: Text(
            value,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
            ),
          ),
          selected: selected,
          backgroundColor: Colors.grey[350],
          selectedColor: Colors.blue,
          onSelected: (selected) {
            setState(() {
              this.selected = key;
            });
          }
      );
      widgetList.add(chip);
      widgetList.add(SizedBox(width: 5));
    });
    widgetList.removeLast();
    return widgetList;
  }

}