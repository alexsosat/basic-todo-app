import 'package:flutter/material.dart';
import 'package:todo_app/app/data/models/item_model.dart';

class ListItems extends StatefulWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  final items = [
    ToDoItemModel('A', order: 0),
    ToDoItemModel('B', order: 1),
    ToDoItemModel('C', order: 2),
  ];

  updateList(e) {
    setState(() {
      List<ToDoItemModel> checkeds =
          items.where((element) => element.checked).toList();
      checkeds.sort((a, b) => a.order - b.order);

      List<ToDoItemModel> uncheckeds =
          items.where((element) => !element.checked).toList();

      uncheckeds.sort((a, b) => a.order - b.order);

      items.clear();
      items.addAll([...uncheckeds, ...checkeds]);
    });
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ...items.map(
            (item) => Column(
              children: [
                ListTile(
                  leading: Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey.shade400,
                    value: item.checked,
                    onChanged: (a) {
                      item.checked = !item.checked;
                      updateList(item);
                    },
                  ),
                  title: Opacity(
                    opacity: item.checked ? 0.5 : 1,
                    child: Text(
                      item.text,
                      style: TextStyle(
                        color:
                            item.checked ? Colors.grey.shade500 : Colors.black,
                        decoration:
                            item.checked ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: handleClick,
                    itemBuilder: (BuildContext context) =>
                        {'editar', 'eliminar'}
                            .map((String choice) => PopupMenuItem<String>(
                                  value: choice,
                                  child: Text(choice),
                                ))
                            .toList(),
                  ),
                  onTap: () {
                    item.checked = !item.checked;
                    updateList(item);
                  },
                ),
                const Divider(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
