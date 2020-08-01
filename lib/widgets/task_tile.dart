import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function checkBoxCallBack;
  final Function deleteTask;
  TaskTile(
      {this.title, this.isChecked, this.checkBoxCallBack, this.deleteTask});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          color: Theme.of(context).textTheme.subtitle1.color,
        ),
      ),
      trailing: Checkbox(
        activeColor: Theme.of(context).toggleableActiveColor,
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
      onLongPress: deleteTask,
    );
  }
}
