import 'package:flutter/material.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';
import '../modals/task_data.dart';
import '../modals/current_theme_provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (ctx) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen(),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, bottom: 30, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BrightnessGestureDetector(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(0.95)),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.95),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BrightnessGestureDetector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctp = Provider.of<CurrentThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        ctp.changeTheme();
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ctp.isDark
                ? Colors.black.withOpacity(0.85)
                : Colors.lightBlueAccent,
            content: Text(
              '${ctp.isDark ? 'Dark' : 'Light'} Theme enabled',
              style: TextStyle(color: Colors.white),
            ),
            duration: Duration(milliseconds: 400),
          ),
        );
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white.withOpacity(0.95),
        child: Icon(
          // Icons.format_list_bulleted,
          ctp.isDark ? Icons.brightness_2 : Icons.brightness_6,
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
          size: 30,
        ),
      ),
    );
  }
}
