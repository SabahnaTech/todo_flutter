// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/screens/todo_add_screen.dart';

class TodoItemCard extends StatelessWidget {
  final TodoItem item;

  const TodoItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: GlobalKey(),
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete),
      ),
      secondaryBackground: Container(
        color: Colors.blue,
        child: const Icon(Icons.info),
      ),
      confirmDismiss: (direction) async {
        print(direction);
        if (direction == DismissDirection.startToEnd) {
          // removeItem(id: item.id);
        }
        return true;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                child: Icon(
                  item.icon,
                  size: 30,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(item.description),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TodoAddScreen(
                      item: item,
                    ),
                  ),
                ),
                child: const SizedBox(
                  width: 80,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
