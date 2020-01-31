// To parse this JSON data, do
//
//     final taskList = taskListFromJson(jsonString);

import 'dart:convert';

TaskList taskListFromJson(String str) => TaskList.fromJson(json.decode(str));

String taskListToJson(TaskList data) => json.encode(data.toJson());

class TaskList {
  int id;
  List<Task> tasks;

  TaskList({
    this.id,
    this.tasks,
  });

  factory TaskList.fromJson(Map<String, dynamic> json) => TaskList(
    id: json["id"],
    tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
  };
}

class Task {
  int id;
  String task;
  bool done;

  Task({
    this.id,
    this.task,
    this.done,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    task: json["task"],
    done: json["done"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task": task,
    "done": done,
  };
}
