import 'package:ansicolor/ansicolor.dart';
final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen redPen = AnsiPen()..red();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yellowPen = AnsiPen()..yellow();
void main() {
  print('Hello world!');
}
void printMenu() {
  print(yellowPen("Konsolnoe prilozhenie TODO"));
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
        print(redPen("Ошибка: $e"));
      }
      return false;
    }
  }





