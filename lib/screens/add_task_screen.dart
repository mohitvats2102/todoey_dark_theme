import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/task_data.dart';
import '../modals/current_theme_provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskName;
    final ctp = Provider.of<CurrentThemeProvider>(context);
    return Container(
      color: ctp.isDark ? Color(0xFF00443D) : Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 40, right: 40),
        decoration: BoxDecoration(
          color: ctp.isDark ? Colors.black87 : Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add New Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: ctp.isDark ? Colors.white : Colors.lightBlueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              decoration: InputDecoration(),
              cursorColor: ctp.isDark ? Colors.teal : Colors.lightBlueAccent,
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (newValue) {
                taskName = newValue;
              },
            ),
            SizedBox(height: 25),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              textColor: Colors.white,
              color: ctp.isDark ? Colors.teal : Colors.lightBlueAccent,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Add in List',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addNewTask(taskName);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
