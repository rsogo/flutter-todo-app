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
      item = Item(null, "");
    } else {
      item = context.select<CartModel, Item>(
        // Here, we are only interested in the item at [index]. We don't care
        // about any other change.
        (cart) => cart.getByPosition(position),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: position == -1
              ? const Text('Create New Task')
              : const Text('Task'),
        ),
        body: Column(children: [
          TextFormField(
            decoration: const InputDecoration(
              filled: true,
              hintText: 'Enter a title...',
              labelText: 'Name',
            ),
            initialValue: item.name,
            onChanged: (String? value) {
              if (value != null) {
                item.name = value;
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              var cart = context.read<CartModel>();
              if (position == -1) {
                cart.add(item);
              } else {
                cart.update(item);
              }

              Navigator.pop(context);
            },
          )
        ]));
  }
}
