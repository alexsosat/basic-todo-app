class ToDoItemModel {
  String text;
  int order;
  bool checked;

  ToDoItemModel(
    this.text, {
    required this.order,
    this.checked = false,
  });
}
