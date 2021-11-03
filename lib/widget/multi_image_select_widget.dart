import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MultiImageSelectWidget extends StatefulWidget {

  int maxNum;
  int lineItemNum;
  bool needCut;
  double ratioX;
  double ratioY;
  Color color;
  List<String> _imageList = <String>[];

  MultiImageSelectWidget({
    this.maxNum = 9,
    this.lineItemNum = 3,
    this.needCut = false,
    this.ratioX = 1,
    this.ratioY = 1,
    this.color = Colors.white
  });

  @override
  State<StatefulWidget> createState() {
    return _MultiImageSelectWidgetState();
  }

  Future<List<MultipartFile>> getMultipartFiles() async {
    List<MultipartFile> fileList = [];
    for (String imagePath in this._imageList) {
      MultipartFile file = await MultipartFile.fromFile(imagePath);
      fileList.add(file);
    }
    return fileList;
  }

}

class _MultiImageSelectWidgetState extends State<MultiImageSelectWidget> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        //横轴元素个数
        crossAxisCount: widget.lineItemNum,
        //子组件宽高比例
        childAspectRatio: 1,
        children: builGridView()
    );
  }

  List<Widget> builGridView() {
    List<Widget> widgetList = <Widget>[];
    for (int i = 0; i < widget._imageList.length; i++) {
      String imagePath = widget._imageList[i];
      widgetList.add(_buildImageCard(i, imagePath));
    }
    if (widget._imageList.length < widget.maxNum) {
      widgetList.add(_buildButtonCard());
    }
    return widgetList;
  }

  Widget _buildButtonCard() {
    return Card(
      color: widget.color,
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          showBottomSheet();
        }
      )
    );
  }

  Widget _buildImageCard(int index, String imagePath) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: <Widget>[
          Image.file(File(imagePath), fit: BoxFit.cover),
          Positioned(
            right: 2,
            top: 2,
            child: InkWell(
              child: Icon(
                Icons.remove_circle,
                size: 20,
                color: Colors.red,
              ),
              onTap: () {
                setState(() {
                  widget._imageList.removeAt(index);
                });
              }
            )
          )
        ]
      )
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(builder: (BuildContext context) {
      return buildBottomSheetWidget(context);
    }, context: context);
  }

  Widget buildBottomSheetWidget(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          //拍一张
          InkWell(
            child: Container(
              child: Text("拍一张"),
              height: 40,
              alignment: Alignment.center,
            ),
            onTap: () {
              Navigator.of(context).pop();
              _selectOnCamera();
            }
          ),
          //分割线
          Divider(),
          //相册选择
          InkWell(
            child: Container(
              child: Text("相册选择"),
              height: 40,
              alignment: Alignment.center,
            ),
            onTap: () {
              Navigator.of(context).pop();
              _selectOnGallery();
            }
          ),
          Divider(
            height: 4,
            thickness: 4,
          ),
          InkWell(
            child: Container(
                alignment: Alignment.center,
                child: Text("取消"),
                height: 40
            ),
            onTap: () {
              Navigator.of(context).pop();
            }
          )
        ],
      ),
    );
  }

  Future _selectOnCamera() async {
    final ImagePicker _picker = ImagePicker();
    XFile? xFile = await _picker.pickImage(source: ImageSource.camera);
    if (xFile == null) {
      return;
    }
    File? file = await _cropImage(xFile.path);
    String filePath = file!.path;
    setState(() {
      widget._imageList.add(filePath);
    });
  }

  Future _selectOnGallery() async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? xFileList = await _picker.pickMultiImage();
    if (xFileList == null || xFileList.length == 0) {
      return;
    }
    if (xFileList.length > widget.maxNum) {
      xFileList.removeRange(widget.maxNum, xFileList.length);
    }
    for (XFile xFile in xFileList) {
      File? file = await _cropImage(xFile.path);
      String filePath = file!.path;
      setState(() {
        widget._imageList.add(filePath);
      });
    }
  }

  Future<File?> _cropImage(String path, {title = '剪切图片'}) async {
    File? file = await ImageCropper.cropImage(
        sourcePath: path,
        aspectRatio: CropAspectRatio(ratioX: widget.ratioX, ratioY: widget.ratioY),
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: title,
          toolbarColor: Colors.black87,
          toolbarWidgetColor: Colors.white,
        ),
        iosUiSettings: IOSUiSettings(
          title: title,
          cancelButtonTitle: '取消',
          doneButtonTitle: '确定'
        )
    );
    return file;
  }

}
