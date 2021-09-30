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
  bool validator = true;

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
        content: TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: "Escribe la tarea",
            errorText: !validator ? 'El campo no puede estar vacío' : null,
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
              setState(
                () => validator = textController.text.isEmpty ? false : true,
              );

              if (validator) {
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
