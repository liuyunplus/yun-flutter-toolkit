import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadWidget extends StatefulWidget {

  late int maxNum;
  late _ImageUploadWidgetState _imageUploadState;

  ImageUploadWidget([this.maxNum = 9]);

  @override
  State<StatefulWidget> createState() {
    this._imageUploadState = _ImageUploadWidgetState(this.maxNum);
    return _imageUploadState;
  }

  Future<List<MultipartFile>> getMultipartFiles() async {
    List<MultipartFile> fileList = [];
    for (String imagePath in this._imageUploadState._imageList) {
      MultipartFile file = await MultipartFile.fromFile(imagePath);
      fileList.add(file);
    }
    return fileList;
  }

}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {

  int maxNum;
  List<String> _imageList = <String>[];

  _ImageUploadWidgetState(this.maxNum);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        //横轴元素个数
        crossAxisCount: 3,
        //子组件宽高比例
        childAspectRatio: 1,
        children: builGridView());
  }

  List<Widget> builGridView() {
    List<Widget> widgetList = <Widget>[];
    for (int i = 0; i < this._imageList.length; i++) {
      String imagePath = _imageList[i];
      widgetList.add(_buildImageCard(i, imagePath));
    }
    if (this._imageList.length < this.maxNum) {
      widgetList.add(_buildButtonCard());
    }
    return widgetList;
  }

  Widget _buildButtonCard() {
    return Card(
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          showBottomSheet();
        },
      ),
    );
  }

  Widget _buildImageCard(int index, String imagePath) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: <Widget>[
          Image.file(
            File(imagePath),
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 5,
            top: 5,
            child: InkWell(
              child: Icon(
                Icons.remove_circle,
                size: 20,
                color: Colors.red,
              ),
              onTap: () {
                setState(() {
                  this._imageList.removeAt(index);
                });
              },
            ),
          ),
        ],
      ),
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
    setState(() {
      this._imageList.add(xFile!.path);
    });
  }

  Future _selectOnGallery() async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? xFileList = await _picker.pickMultiImage();
    setState(() {
      for (XFile xFile in xFileList!) {
        this._imageList.add(xFile.path);
      }
    });
  }

}
