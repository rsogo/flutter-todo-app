// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/cart.dart';
import 'package:flutter_todo_app/screens/task_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: MaterialApp(
          title: 'Startup Name Ganarator',
          initialRoute: '/tasks/',
          routes: {
            '/tasks/': (context) => const TaskList(),
          },
        ));
  }
}
