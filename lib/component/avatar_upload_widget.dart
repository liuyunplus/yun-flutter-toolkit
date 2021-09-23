
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AvatarUploadWidget extends StatefulWidget {

  bool needCut;
  bool needCompress;
  double width;
  double height;
  String imageUrl;
  bool isCircle;

  AvatarUploadWidget({this.imageUrl = "", this.needCut = true, this.width = 100, this.height = 100, this.needCompress = true, this.isCircle = true});

  @override
  State<StatefulWidget> createState() {
    return _AvatarUploadWidgetState();
  }

}

class _AvatarUploadWidgetState extends State<AvatarUploadWidget> {

  late bool needCut;
  late bool needCompress;
  late double width;
  late double height;
  late String imageUrl;
  late bool isCircle;

  @override
  void initState() {
    this.needCut = widget.needCut;
    this.needCompress = widget.needCompress;
    this.width = widget.width;
    this.height = widget.height;
    this.imageUrl = widget.imageUrl;
    this.isCircle = widget.isCircle;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(isCircle ? 100 : 10),
              color: Colors.grey[300],
              image: _loadImage(this.imageUrl)
          )
      ),
      onTap: (){
        showBottomSheet();
      }
    );
  }

  DecorationImage _loadImage(String imageUrl) {
    if (imageUrl.startsWith("http://") || imageUrl.startsWith("https://")) {
      return DecorationImage(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover
      );
    }
    return DecorationImage(
      image: FileImage(File(imageUrl)),
      fit: BoxFit.cover
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
        this.imageUrl = filePath;
      });
    }
  }


  Future _selectOnGallery() async {
    final ImagePicker _picker = ImagePicker();
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      String filePath = "";
      if (this.needCut) {
        File? file = await _cropImage(xFile.path);
        filePath = file!.path;
      }
      if (this.needCompress) {
        ImageProperties properties = await FlutterNativeImage
            .getImageProperties(xFile.path);
        File compressedFile = await FlutterNativeImage.compressImage(xFile.path,
            quality: 80,
            targetWidth: 800,
            targetHeight: (properties.height! * 800 / properties.width!)
                .round());
        filePath = compressedFile.path;
      }
      setState(() {
        this.imageUrl = filePath;
      });
    }
  }


  Future<File?> _cropImage(String path, {title = '剪切图片'}) async {
    List<CropAspectRatioPreset> presetList = [];
    if (Platform.isAndroid) {
      presetList = [
        CropAspectRatioPreset.square,
      ];
    } else {
      presetList = [
        CropAspectRatioPreset.square,
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
            lockAspectRatio: true
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