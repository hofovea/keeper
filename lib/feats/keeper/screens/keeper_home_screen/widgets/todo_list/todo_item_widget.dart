import 'package:flutter/material.dart';
import 'package:keeper/feats/keeper/domain/entities/todo_item.dart';

class TodoItemWidget extends StatefulWidget {
  final TodoItem item;
  final VoidCallback onDelete;
  final void Function(TodoItem updatedItem) onUpdate;

  const TodoItemWidget({super.key, required this.item, required this.onDelete, required this.onUpdate});

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.item),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        widget.onDelete();
      },
      child: GestureDetector(
        onLongPress: () {
          setState(() {
            _isEditing = true;
          });
        },
        child: ListTile(
          title: _isEditing
              ? EditableText(
                  controller: TextEditingController(text: widget.item.title),
                  focusNode: FocusNode(),
                  onSubmitted: (value) {
                    widget.onUpdate(widget.item.copyWith(title: value));
                    setState(() {
                      _isEditing = false;
                    });
                  },
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.black,
                  backgroundCursorColor: Colors.white,
                )
              : Text(widget.item.title),
          // ... other ListTile properties
        ),
      ),
    );
  }
}
