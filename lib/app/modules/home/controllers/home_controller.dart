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

  void updateList() => update();

  void addItem(String item) {
    items.add(ToDoItemModel(
      item,
      order: items
              .reduce((value, element) =>
                  element.order > value.order ? element : value)
              .order +
          1,
    ));
    update();
  }

  editItem(int order, String newText) {
    items.firstWhere((element) => element.order == order).text = newText;
    updateList();
  }

  deleteItem(int order) {
    items.removeWhere((element) => element.order == order);
    updateList();
  }
}
