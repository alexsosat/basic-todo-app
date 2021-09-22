import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';

class AddTodoItemDialog extends StatelessWidget {
  AddTodoItemDialog({Key? key}) : super(key: key);

  final textController = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: '_TODO_form_key');

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'add-todo-dialog',
      child: AlertDialog(
        title: const Text("Añadir nueva tarea"),
        content: Form(
          key: _formKey,
          child: TextFormField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: "Escribe la tarea",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'El campo no puede estar vacío';
              }
              return null;
            },
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              textController.text = '';
              Navigator.pop(context);
            },
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Get.find<HomeController>().addItem(textController.text);
                textController.text = '';
                Navigator.pop(context);
              }
            },
            child: const Text(
              "Guardar",
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
