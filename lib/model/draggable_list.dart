class DraggableList {
  final String header;
  final List<DraggableListItem> items;

  const DraggableList({
    required this.header,
    required this.items,
  });
}

class DraggableListItem {
  final String name;
  final int lives;

  const DraggableListItem({
    required this.name,
    required this.lives,
  });
}