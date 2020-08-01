import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              title: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkBoxCallBack: (newValue) {
                taskData.changeTaskCompletion(taskData.tasks[index]);
              },
              deleteTask: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,

                        ///this GestureDetector is used to prevent dismiss of AlertDialog if user tap outside of the dialog.
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Text(
                            'Delete this task.',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .color),
                          ),
                          content: Text('Cofirm Delete!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                taskData.deleteTask(taskData.tasks[index]);
                                Navigator.pop(context);
                              },
                              child: Text('Yes'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No'),
                            )
                          ],
                        ),
                      );
                    });
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
