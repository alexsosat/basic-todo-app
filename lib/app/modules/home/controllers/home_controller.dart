import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_app/app/data/models/item_model.dart';

class HomeController extends GetxController {
  var items = [
    ToDoItemModel('A', order: 0),
    ToDoItemModel('B', order: 1),
    ToDoItemModel('C', order: 2),
  ];

  List<ToDoItemModel> get sortedItems {
    List<ToDoItemModel> checkeds =
        items.where((element) => element.checked).toList();
    checkeds.sort((a, b) => a.order - b.order);

    List<ToDoItemModel> uncheckeds =
        items.where((element) => !element.checked).toList();

    uncheckeds.sort((a, b) => a.order - b.order);

    return [...uncheckeds, ...checkeds];
  }

  void addItem(String item) {
    print(item);
    items.add(
        ToDoItemModel(item, order: 4)); //TODO: fix order for multiple items
    update();
  }

  void updateList() => update();
}
