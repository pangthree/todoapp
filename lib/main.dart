import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todoapp.dart';

void main() {
  debugPrint('main');
  runApp(ProviderScope(child: TodoApp()));
}
