import 'package:http/http.dart' as http;

import 'task_model.dart';

///Endpoint que pega a lista do usuário 173230
///Caso o retorno da API seja diferente de 200 ele lança uma exception.
///
///A Exception deve ser tratada na hora da chamada.
///
///Podemos lançar uma exception diferente para cada tipo de erro da API e assim dar tratamentos diferentes
///para cada um deles.
///
Future<List<Task>> getTodoList() async {
  var url = 'http://miaula.tsmotta.com/todolist/list';
  var response = await http.post(url, body: {
    'id': '173230',
    'pass': '666',
  });

  if (response.statusCode == 200) {
    print(response.body);
    return taskListFromJson(response.body).tasks;
  } else {
    throw Exception('Exception exemplo');
  }
}

///Cria task para o usuário 173230
///retorna true caso tenha criado com sucesso, false caso contrário.
///
Future<bool> createTask(String task) async {
  var url = 'http://miaula.tsmotta.com/todolist/task';
  var response = await http.post(url, body: {
    'id': '173230',
    'pass': '666',
    'task': task,
  });

  if (response.statusCode == 200) {
    print(response.body);
    return response.body == '1';
  } else {
    throw Exception('Exception exemplo');
  }
}

///Altera o status da task para o usuário 173230
///retorna true caso tenha alterado com sucesso, false caso contrário.
///
Future<bool> changeTaskStatus(int taskId, bool done) async {
  var url = 'http://miaula.tsmotta.com/todolist/done';
  var response = await http.post(url, body: {
    'id': '173230',
    'pass': '666',
    'task': taskId.toString(),
    'done': done ? '1' : '0'
  });

  if (response.statusCode == 200) {
    print(response.body);
    return response.body == '1';
  } else {
    throw Exception('Exception exemplo');
  }
}

///Deleta a task informada para o usuário 173230
///retorna true caso tenha deletado com sucesso, false caso contrário.
///
Future<bool> deleteTask(int taskId) async {
  var url = 'http://miaula.tsmotta.com/todolist/delete';
  var response = await http.post(url, body: {
    'id': '173230',
    'pass': '666',
    'task': taskId.toString(),
  });

  if (response.statusCode == 200) {
    print(response.body);
    return response.body == '1';
  } else {
    throw Exception('Exception exemplo');
  }
}
