import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../models/cart.dart';

class Task extends StatelessWidget {
  int position;
  // Item item;
  Task(this.position);

  @override
  Widget build(BuildContext context) {
    print('position={$position}');

    var item;
    if (position == -1) {
      item = Item(1, "");
    } else {
      item = context.select<CartModel, Item>(
        // Here, we are only interested in the item at [index]. We don't care
        // about any other change.
        (catalog) => catalog.getByPosition(position),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title:
              item == null ? const Text('Create New Task') : const Text('Task'),
        ),
        body: Column(children: [
          Text(item.name),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              var cart = context.read<CartModel>();
              var item = Item(1, "todo");
              cart.add(item);
              Navigator.pop(context);
            },
          )
        ]));
  }
}
