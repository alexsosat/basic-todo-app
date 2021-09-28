import 'package:flutter/material.dart';

class AddTodoItemDialog extends StatefulWidget {
  final String text;
  final Function(String value) onSave;
  const AddTodoItemDialog({
    Key? key,
    this.text = "",
    required this.onSave,
  }) : super(key: key);

  @override
  State<AddTodoItemDialog> createState() => _AddTodoItemDialogState();
}

class _AddTodoItemDialogState extends State<AddTodoItemDialog> {
  final textController = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: '_TODO_form_key');

  @override
  void initState() {
    super.initState();
    textController.text = widget.text;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

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
              Navigator.pop(context);
            },
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSave(textController.text);
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
