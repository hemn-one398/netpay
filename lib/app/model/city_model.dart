// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  String name;
  int id;
  CityModel({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [name, id];
  @override
  String toString() {
    return name;
  }
}
