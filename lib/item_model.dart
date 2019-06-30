
class Item {
  final String name;
  final String description;
  final String category; // TODO: Firebase reference to category
  final String user; // TODO: Firebase reference to user

  Item(this.name, this.description, this.category, this.user);
}