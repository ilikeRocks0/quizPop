// The object for the 

import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/pages.dart';

class PageDescriptor {
  final String label;
  final IconData icon;
  final Pages id;

  const PageDescriptor({
    required this.label,
    required this.icon,
    required this.id,
  });
}
