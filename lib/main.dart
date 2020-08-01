import 'package:flutter/material.dart';
import './screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import './modals/task_data.dart';
import './modals/current_theme_provider.dart';
import './screens/add_task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskData(),
        ),
        ChangeNotifierProvider(
          create: (context) => CurrentThemeProvider(),
        ),
      ],
      child: Consumer<CurrentThemeProvider>(
        builder: (context, ctp, child) => MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.black87),
            textTheme: TextTheme(
                subtitle1: TextStyle(color: Colors.white),
                headline1: TextStyle(color: Colors.white)),
            primaryColor: Colors.teal, ////for container color

            iconTheme: IconThemeData(color: Colors.orangeAccent),
            toggleableActiveColor:
                Colors.orangeAccent, //for checkbox active state
            backgroundColor:
                Colors.black87, //this defines scaffold Background color
          ),
          theme: ThemeData.light().copyWith(
            //scaffoldBackgroundColor: Colors.lightBlueAccent,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.lightBlueAccent),
            textTheme: TextTheme(
                subtitle1: TextStyle(color: Colors.black87),
                headline1: TextStyle(color: Colors.black87)),
            primaryColor: Colors.white, //for container color

            toggleableActiveColor:
                Colors.lightBlueAccent, //for checkbox active state
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor:
                Colors.lightBlueAccent, //this defines scaffold Background color
          ),
          themeMode: ctp.isDark ? ThemeMode.dark : ThemeMode.light,
          home: TasksScreen(),
        ),
      ),
    );
  }
}
