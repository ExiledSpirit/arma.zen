// ignore_for_file: use_build_context_synchronously

import '../components/components.dart';
import '../helpers/errors/errors.dart';

import 'package:flutter/material.dart';

mixin UIErrorManager {
  void handleMainError(BuildContext context, Stream<UIError?> stream) {
    stream.listen((error) {
      if (error != null) {
        showErrorMessage(context, error.description);
      }
    });
  }
}