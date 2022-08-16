import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../models/cart.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    var name = WordPair.random().asPascalCase;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Task'),
        ),
        body: Column(children: [
          Text(name),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              var cart = context.read<CartModel>();
              var item = Item(1, name);
              cart.add(item);
              Navigator.pop(context);
            },
          )
        ]));
  }
}
