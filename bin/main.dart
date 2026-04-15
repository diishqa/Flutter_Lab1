void main() {
  String name = 'Диана';
  String? name2 = null;
  var count = 0;
  var title = 'Учить Rust';
  var x = 5;
  final id = 1;
  const appName = 'TodoApp';
  print('$name, $name2, $count, $title, $id, $appName, ${count + 5}');
  List<String> tags = ['институт', 'дом'];
  Map<String, dynamic> data = {'key': 'value', 'num': 13};
  Set<int> ids = {1, 2, 3};
  dynamic anything = 42;
  anything = 'now a string';
  String greet(String name) => 'Hello, $name!';
  void printTodo({required String title, bool done = false}) {
    print('${done ? '+' : '-'} $title');
  }

  printTodo(title: 'Купить молоко');
  printTodo(title: 'проверить код', done: true);

  String repeat(String s, [int times = 2]) => s * times;
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
