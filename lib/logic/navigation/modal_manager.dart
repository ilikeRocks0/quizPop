// lib/logic/modal_manager.dart

import 'package:flutter/material.dart';

class ModalManager {
  const ModalManager(); // stateless

  Future<bool> showConfirmation({
    required BuildContext context,
    String title = 'Confirm',
    String content = 'Are you sure you want to proceed?',
    String confirmText = 'Yes',
    String cancelText = 'Cancel',
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText),
          ),
        ],
      ),
    );

    return result == true;
  }
}
