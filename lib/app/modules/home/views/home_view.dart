import 'package:flutter/material.dart';
import 'package:todo_app/app/modules/home/views/widgets/list_items.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  updateList(items) {}

  @override
  Widget build(BuildContext context) {
    const appBar = SliverAppBar(
      expandedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        title: Text("//TODO:"),
      ),
    );

    return Scaffold(
      body: const CustomScrollView(
        slivers: [
          appBar,
          ListItems(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add task",
        child: const Icon(Icons.add),
      ),
    );
  }
}