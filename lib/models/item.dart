import 'package:uuid/uuid.dart';

class Item {
  String id = const Uuid().v4();
  String name;

  Item(String? id, this.name) {
    if (id != null) {
      this.id = id;
    }
  }
}
