import 'package:todo_app/todo_repository.dart';
import 'dart:io';
import 'package:todo_app/todo_repository.dart';
import 'package:todo_app/todo.dart';

void main() {
  TodoRepository repo = TodoRepository();
  printMenu();
  while (true) {
    stdout.write("> ");
    String? input = stdin.readLineSync();
    if (input == null) {
      continue;
    }
    input = input.trim();
    if (input.isEmpty) {
      continue;
    }
    bool shouldExit = handleCommnd(repo, input);
    if (shouldExit) {
      break;
    }
    void printMenu() {
      print("Konsoly prilozhenie TODO");
      print("Komandi:");
      print(" add <text>        - dobavity zadachu");
      print(" list              - dobavity zadachu");
      print(" done <id>         - dobavity zadachu");
      print(" delete <id>       - dobavity zadachu");
      print(" exit              - dobavity zadachu");
      print("");
    }

    void addCommand(TodoRepository repo, String input) {
      if (input.length <= 4) {
        print("Error: vvedite text zadachi");
        return;
      }
      String title = input.substring(4).trim();
      repo.add(title);
      print("Zadacha dobavlena");
    }

    void listCommand(TodoRepository repo) {
      List<Todo> todos = repo.getAll();
      if (todos.isEmpty) {
        print("Spisok zadach pust");
        return;
      }
      for (var todo in todos) {
        print(todo);
      }
    }

    void doneCommand(TodoRepository repo, List<String> parts) {
      if (parts.length < 2) {
        print("Error: ukazhite id");
        return;
      }
      int id = int.parse(parts[1]);
      repo.complete(id);
      print("Zadacha otmechena viponlnennoy");
    }

    void deleteCommand(TodoRepository repo, List<String> parts) {
      if (parts.length < 2) {
        print("Error: ukazhite id");
        return;
      }
      int id = int.parse(parts[1]);
      repo.delete(id);
      print("Zadacha delete");
    }

    bool handleCommnd(TodoRepository repo, String input) {
      List<String> parts = input.split(" ");
      String command = parts[0].toLowerCase();
      try {
        switch (command) {
          case "add":
            addCommand(repo, input);
            break;
          case "list":
            listCommand(repo);
            break;
          case "done":
            doneCommand(repo, parts);
            break;
          case "delete":
            deleteCommand(repo, parts);
            break;
          case "exit":
            print("Exit iz program");
            return true;
          default:
            print("Neizvestnaya command");
        }
      } catch (e) {
        print("Error: $e");
      }
      return false;
    }
  }

  // String name = 'Диана';
  // String? name2 = null;
  // var count = 0;
  // var title = 'Учить Rust';
  // var x = 5;
  // final id = 1;
  // const appName = 'TodoApp';
  // print('$name, $name2, $count, $title, $id, $appName, ${count + 5}');
  // List<String> tags = ['институт', 'дом'];
  // Map<String, dynamic> data = {'key': 'value', 'num': 13};
  // Set<int> ids = {1, 2, 3};
  // dynamic anything = 42;
  // anything = 'now a string';
  // String greet(String name) => 'Hello, $name!';
  // void printTodo({required String title, bool done = false}) {
  //   print('${done ? '+' : '-'} $title');
  // }

  // printTodo(title: 'Купить молоко');
  // printTodo(title: 'проверить код', done: true);

  // String repeat(String s, [int times = 2]) => s * times;
}

class Todo {
  final int id;
  String title;
  bool isDone;
  Todo({required this.id, required this.title, this.isDone = false});
  Todo.empty() : id = 0, title = '', isDone = false;
  @override
  String toString() => '${isDone ? '+' : '-'} [$id] $title';
}
