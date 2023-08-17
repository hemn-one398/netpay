import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

SizedBox keyboardBottomSpace(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).viewInsets.bottom,
  );
}

final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

Future<File?> pickImage({
  required ImageSource imageSource,
}) async {
  File? file;
  final picker = ImagePicker();

  final image = await picker.pickImage(source: imageSource);

  if (image == null) {
    return null;
  }

  final Directory appDir = await getTemporaryDirectory();

  file = File('${appDir.path}/image+${DateTime.now().toString()}.jpg');
  await image.saveTo(file.path);
  return file;
}

String formatMoney(int amount) {
  // Create a NumberFormat instance with desired formatting
  NumberFormat formatter = NumberFormat(',###', 'en_US');
  return formatter.format(amount);
}
