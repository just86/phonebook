// import 'package:phonebook/phonebook.dart' as phonebook;
import 'package:phonebook/phoneDB.dart' as DB;
import 'dart:io';
import 'dart:math';
import 'dart:core';
import 'dart:convert';


void main(List<String> arguments) {

  print('Hello world: ${DB.calculate()}!');

  print('''
                      Телефонная книга города Мухосранск
  Выберите действие:
    1. Просмотр телефонной книги
    2. Создать абонента
    
    0. Выход
  ''');

  int numberFromConsole = parseline(stdin.readLineSync(encoding: utf8) ?? "");
  switch (numberFromConsole) {
    case 0:
      exit(1);
      break;
    case 1:
      main2();
      break;
    case 2:

      break;
  }
}

void main2() async {
  //var file = File(Platform.script.toFilePath());
  var file = File('');
  print(await (file.readAsString()));
}

//чтение строки из терминала и возврат числа
int parseline(String line) {
  int answer;
  final numberfromconsole = int.tryParse(line);

  if (numberfromconsole == null) {
    answer = -1;
  } else {
    answer = numberfromconsole;
  }
  return answer;
}