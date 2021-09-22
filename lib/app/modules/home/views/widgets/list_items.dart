import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/models/item_model.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';

class ListItems extends StatefulWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
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
    return GetBuilder<HomeController>(builder: (_) {
      return SliverList(
        delegate: SliverChildListDelegate(
          _.sortedItems
              .map(
                (item) => Column(
                  children: [
                    ListTile(
                      leading: Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.grey.shade400,
                        value: item.checked,
                        onChanged: (a) {
                          item.checked = !item.checked;
                          _.updateList();
                        },
                      ),
                      title: Opacity(
                        opacity: item.checked ? 0.5 : 1,
                        child: Text(
                          item.text,
                          style: TextStyle(
                            color: item.checked
                                ? Colors.grey.shade500
                                : Colors.black,
                            decoration: item.checked
                                ? TextDecoration.lineThrough
                                : null,
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
                        _.updateList();
                      },
                    ),
                    const Divider(
                      height: 5,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
