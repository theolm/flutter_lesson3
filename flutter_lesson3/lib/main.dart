import 'package:flutter/material.dart';
import 'package:flutter_lesson3/repository.dart';
import 'package:flutter_lesson3/taskrow.dart';

import 'add_page.dart';
import 'task_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'TODO List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getTodoList(),
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasData) {
            var list = snapshot.data;
            if (list.isEmpty) {
              return Center(
                child: Text('Lista vazia'),
              );
            } else {
              return ListView.separated(
                itemBuilder: (context, position) {
                  return TaskRow(
                    deleteCallback: (Task task) async {
                      await deleteTask(task.id);
                      setState(() {});
                    },
                    checkCallback: (Task task, bool value) async {
                      await changeTaskStatus(task.id, value);
                      setState(() {});
                    },
                    task: list[position],
                  );
                },
                separatorBuilder: (context, pos) {
                  return Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  );
                },
                itemCount: list.length,
              );
            }
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              settings: RouteSettings(name: 'AddPage'),
              builder: (context) => AddPage(),
            ),
          );

          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
