import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:netspotpay/app/model/city_model.dart';
import 'package:netspotpay/app/model/gender_model.dart';
import 'package:netspotpay/app/util/helper.dart';
import 'package:netspotpay/app/util/routes/routes.dart';
import 'package:netspotpay/app/model/photo_model.dart';
import 'package:netspotpay/app/util/constants/app_asset_const.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterController extends GetxController {
  var fullNameController = TextEditingController();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var birthDateController = TextEditingController();
  File? passportFile;
  File? personalIDCardFile;
  DateTime? selectedDate;
  List<CityModel> cities = [
    CityModel(name: "Erbil", id: 1),
    CityModel(name: "Sulaymaniyah", id: 3),
    CityModel(name: "Duhok", id: 2),
  ];
  List<GenderModel> gender = [
    GenderModel(gender: "Male", id: 1),
    GenderModel(gender: "Female", id: 2),
  ];
  CityModel? selectedCity;
  GenderModel? selectedGender;

  bool agreeToTerms = false;

  void goToSignInPage() {
    Get.back();
  }

  String? userNameValidator(String? value) {
    return null;
  }

  String? emailValidator(String? value) {
    if (!emailRegExp.hasMatch(value!)) {
      return "Invalid email";
    }
    return null;
  }

  String? confirmPassValidator(String? value) {
    if (passwordController.text != value) return "Password does not match";
    if (value!.isEmpty) return "Password is required";
    return null;
  }

  void onCitySelected(city) {
    selectedCity = city;
  }

  void onGenderSelected(gender) {
    selectedGender = gender;
  }

  void setDate(DateTime picked) {
    selectedDate = picked;
    birthDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);

    update(["dateOfBirthBuilder"]);
  }

  void onAgreeChanged(bool? value) {
    agreeToTerms = value!;
    update(["agreeToTermsBuilder"]);
  }

  void goToIdentificationPage() {
    if (agreeToTerms) {
      Get.toNamed(AppRoutes.IDENTIFICATION_PAGE);
    } else {
      Get.snackbar("You can't proceed", "Please agree to terms and conditions");
    }
  }

  void goToTermsPage() {}

  List<PhotoModel> photoList = [
    PhotoModel(
      iconPath: AppAssets.FRONT,
      title: "Front",
      //photo is null by default
    ),
    PhotoModel(
      iconPath: AppAssets.RIGHT_SIDE,
      title: "Right Side",
    ),
    PhotoModel(
      iconPath: AppAssets.LEFT_SIDE,
      title: "Left Side",
    ),
  ];

  void goToOtpPage() {
    // if everything is valid then go to the otp page
    Get.toNamed(AppRoutes.OTP_PAGE);
  }

  void takePhoto(PhotoModel photoModel) async {
    photoModel.photo = await pickImage(imageSource: ImageSource.camera);
    update();
  }

  Future<void> captureAndSavePhoto() async {}

  void uploadPassport() async {
    passportFile = await pickImage(imageSource: ImageSource.gallery);
    update();
  }

  void uploadPersonalID() async {
    personalIDCardFile = await pickImage(imageSource: ImageSource.gallery);
    update();
  }
}
