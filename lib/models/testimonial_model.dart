import 'package:flutter/material.dart';

class Testimonial {
  final String? message;
  final String? occupation;
  final String? personName;
  final String? profilePhoto;

  Testimonial({
    @required this.message,
    @required this.occupation,
    @required this.personName,
    @required this.profilePhoto,
  });
}
