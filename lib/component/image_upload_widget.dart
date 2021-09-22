import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadWidget extends StatefulWidget {

  //最大上传图片数
  late int maxNum;
  //是否需要剪裁图片
  late bool needCut;
  //是否需要压缩图片
  late bool needCompress;

  late _ImageUploadWidgetState _imageUploadState;

  ImageUploadWidget({this.maxNum = 9, this.needCut = false, this.needCompress = false});

  @override
  State<StatefulWidget> createState() {
    this._imageUploadState = _ImageUploadWidgetState();
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

  late int maxNum;
  late bool needCut;
  late bool needCompress;
  List<String> _imageList = <String>[];

  @override
  void initState() {
    this.maxNum = widget.maxNum;
    this.needCut = widget.needCut;
    this.needCompress = widget.needCompress;
  }

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
    if (xFile != null) {
      String filePath = "";
      if (this.needCut) {
        File? file = await _cropImage(xFile.path);
        filePath = file!.path;
      }
      if (this.needCompress) {
        ImageProperties properties = await FlutterNativeImage.getImageProperties(xFile.path);
        File compressedFile = await FlutterNativeImage.compressImage(xFile.path,
            quality: 80,
            targetWidth: 800,
            targetHeight: (properties.height! * 800 / properties.width!).round());
        filePath = compressedFile.path;
      }
      setState(() {
        this._imageList.add(filePath);
      });
    }
  }

  Future _selectOnGallery() async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? xFileList = await _picker.pickMultiImage();
    for (XFile xFile in xFileList!) {
      String filePath = "";
      if (this.needCut) {
        File? file = await _cropImage(xFile.path);
        filePath = file!.path;
      }
      if (this.needCompress) {
        ImageProperties properties = await FlutterNativeImage.getImageProperties(xFile.path);
        File compressedFile = await FlutterNativeImage.compressImage(xFile.path,
            quality: 80,
            targetWidth: 800,
            targetHeight: (properties.height! * 800 / properties.width!).round());
        filePath = compressedFile.path;
      }
      setState(() {
        this._imageList.add(filePath);
      });
    }
  }


  Future<File?> _cropImage(String path, {title = '剪切图片'}) async {
    List<CropAspectRatioPreset> presetList = [];
    if (Platform.isAndroid) {
      presetList = [
        CropAspectRatioPreset.square,
        //CropAspectRatioPreset.ratio3x2,
        //CropAspectRatioPreset.original,
        //CropAspectRatioPreset.ratio4x3,
        //CropAspectRatioPreset.ratio16x9
      ];
    } else {
      presetList = [
        //CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        // CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio5x3,
        // CropAspectRatioPreset.ratio5x4,
        // CropAspectRatioPreset.ratio7x5,
        // CropAspectRatioPreset.ratio16x9
      ];
    }
    File? file = await ImageCropper.cropImage(
        sourcePath: path,
        aspectRatioPresets: presetList,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: title,
            toolbarColor: Colors.black87,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false
        ),
        iosUiSettings: IOSUiSettings(
            title: title,
            minimumAspectRatio: 1.0,
            rectX: 0.0,
            rectY: 0.0,
            rectWidth: 320.0,
            rectHeight: 320.0,
            cancelButtonTitle: '取消',
            doneButtonTitle: '确定'
        )
    );
    return file;
  }

}
