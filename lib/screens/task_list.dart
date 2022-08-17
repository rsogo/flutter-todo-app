import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/task.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../models/cart.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('task list'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Task(-1),
                  ));
            },
          )
        ],
      ),
      body: Consumer<CartModel>(builder: (context, cart, child) {
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _TaskListItem(index);
              }, childCount: cart.items.length),
            ),
          ],
        );
      }),
    );
  }
}

class _TaskListItem extends StatelessWidget {
  final int index;
  const _TaskListItem(this.index);

  @override
  Widget build(BuildContext context) {
    var item = context.select<CartModel, Item>(
      // Here, we are only interested in the item at [index]. We don't care
      // about any other change.
      (catalog) => catalog.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Task(index),
                ));
          },
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    // color: item.color,
                    ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Text(item.name, style: textTheme),
              ),
              const SizedBox(width: 24),
            ],
          ),
        ),
      ),
    );
  }
}
