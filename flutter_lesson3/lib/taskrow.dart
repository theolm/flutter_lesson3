import 'package:flutter/material.dart';

import 'task_model.dart';

class TaskRow extends StatelessWidget {
  final Task task;
  final Function(Task) deleteCallback;
  final Function(Task, bool) checkCallback;

  const TaskRow({
    Key key,
    @required this.task,
    @required this.deleteCallback,
    @required this.checkCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.done,
        onChanged: (value) {
          checkCallback(task, value);
        },
      ),
      title: Text(task.task),
      trailing: IconButton(
        onPressed: (){
          deleteCallback(task);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
