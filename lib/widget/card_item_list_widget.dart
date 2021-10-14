import 'package:flutter/material.dart';

class CardItemListWidget extends StatefulWidget {

  final String img;
  final String title;
  final String address;

  CardItemListWidget({required this.img, required this.title, required this.address});

  @override
  State<StatefulWidget> createState() => _CardItemListWidgetState();

}

class _CardItemListWidgetState extends State<CardItemListWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16.0 / 9.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image.network("${widget.img}", fit: BoxFit.cover)
                  )
                ),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${widget.title}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    )
                  )
                ),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${widget.address}",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                      )
                    )
                  )
                ),
                SizedBox(height: 10.0)
              ]
            )
          )
        )
      )
    );
  }

}