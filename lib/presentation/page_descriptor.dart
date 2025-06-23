// lib/screens/page_descriptor.dart

import 'package:flutter/material.dart';

class PageDescriptor {
  final String label;
  final IconData icon;
  final Widget screen;

  const PageDescriptor({
    required this.label,
    required this.icon,
    required this.screen,
  });
}
