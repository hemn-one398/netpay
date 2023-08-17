import 'dart:io';

class PhotoModel {
  File? photo;
  String iconPath;
  String title;
  PhotoModel({
    this.photo,
    required this.iconPath,
    required this.title,
  });
}
