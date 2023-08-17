// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class GenderModel extends Equatable {
  String gender;
  int id;
  GenderModel({
    required this.gender,
    required this.id,
  });

  @override
  List<Object?> get props => [gender, id];
  @override
  String toString() {
    return gender;
  }
}
