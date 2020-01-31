import 'package:flutter/material.dart';
import 'package:flutter_lesson3/repository.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Add task'),
      ),
      body: AddPageBody(),
    );
  }
}

class AddPageBody extends StatelessWidget {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Task',
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              color: Colors.greenAccent,
              onPressed: () {
                saveTask(context);
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveTask(BuildContext context) async {
    if(_controller.text != null && _controller.text.isNotEmpty)  {
      await createTask(_controller.text);
      Navigator.pop(context, true);
    }

  }
}
