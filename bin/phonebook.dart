import 'dart:io';
// import 'dart:math';
import 'dart:core';
import 'dart:convert';
// import 'package:sqlite3/sqlite3.dart';
import 'package:phonebook/db_constructor.dart';

void main(List<String> arguments) {

  const pathToFileDB = 'lib/phonebookDB.db';
  String name = '';
  int phone = 0;

  print('''
                      Телефонная книга города Мухосранск
  Выберите действие:
    1. Просмотр телефонной книги
    2. Создать абонента
    3. Удалить абонента
    
    0. Выход
  ''');

  int numberFromConsole = parseLine(stdin.readLineSync(encoding: utf8) ?? "");
  switch (numberFromConsole) {
    case 0:
      exit(1);
    case 1:
      Subscribers Subscriber = Subscribers()
        ..getPhones(pathToFileDB);
      break;
    case 2:

      while (true) {
        print('''Введите ФИО абонента:''');
        String nameConsole = stdin.readLineSync(encoding: utf8) ?? "";
        if (nameConsole == '' || nameConsole.length < 3) {
          print(
              'Ошибка ввода: ФИО слишком короткое. ФИО должно быть не менее 3 символов');
        }else{
           name = nameConsole;
          break;
        }
      }

      while (true) {
        print('''Введите номер телефона абонента в формате 380xxyyyyyyy''');
        String phoneConsole = stdin.readLineSync(encoding: utf8) ?? "";
        if (phoneConsole == '' || phoneConsole.length < 12) {
          print(
              'Ошибка ввода: длина номера телефона слишком короткая. Телефон содержит 12 символов');
        }else{
          int answer;
          final numberfromconsole = int.tryParse(phoneConsole);

          if (numberfromconsole == null) {
            answer = -1;
          } else {
            answer = numberfromconsole;
          }

          phone = answer;
          break;
        }
      }

      Subscribers Subscriber = Subscribers()
          ..pathToFile = pathToFileDB
          ..name = name
          ..phone = phone

          ..createWriteToDB();
      break;

    case 3:
      int idRecord = 0;
      while (true) {
        print('''Введите номер записи (id) для удаления абонента или 0 для отмены''');
        String phoneConsole = stdin.readLineSync(encoding: utf8) ?? "";
          final numberFromConsole = int.tryParse(phoneConsole);

          if (numberFromConsole == null) {
            print(
                'Ошибка ввода: вы ввели не число. Для продолжения необходимо ввести число \n');
          }else if(numberFromConsole == 0) {
            exit(1);
          }else {
            idRecord = numberFromConsole;
            Subscribers Subscriber = Subscribers()
              ..pathToFile = pathToFileDB
              ..idRecord = idRecord

              ..deleteRecord();

            break;
          }
        }
      break;

  }
}

//чтение строки из терминала и возврат числа
int parseLine(String line) {
  int answer;
  final numberfromconsole = int.tryParse(line);

  if (numberfromconsole == null) {
    answer = -1;
  } else {
    answer = numberfromconsole;
  }
  return answer;
}
