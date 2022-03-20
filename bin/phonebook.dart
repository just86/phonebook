// import 'package:phonebook/phonebook.dart' as phonebook;
// import 'package:phonebook/phoneDB.dart' as db;
import 'dart:io';
//import 'dart:math';
import 'dart:core';
import 'dart:convert';
import 'package:sqlite3/sqlite3.dart';

void main(List<String> arguments) {
  //const pathToFileTxt = 'lib/phoneDB.dart';
  const pathToFileDB = 'lib/phonebookDB.db';

  //проверим наличие файла бд и создадим его, если его нет
  print('Using sqlite3 ${sqlite3.version}');
  final fileDB = createFileDBSync(pathToFileDB);
  //final fileTxt = createFileTxtSync(pathToFileTxt);
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
    case 1:
      // bool weHaveAFile = false;
      //
      // final isFile = File(pathToFile).exists();
      // isFile.then((value) => weHaveAFile = true);
      //
      // if (!weHaveAFile) {
      //  myFile = File(pathToFile).create();

      // } else {
      //   print(false);
      // }
      // Future<File> writeLog('String pdfData') async {
      //   final file = await _localFile;
      //   final fileExists = await file.exists();
      //
      //   if(!fileExists) await file.create(); // Create your file if it does not exists.
      //
      //   //write to file
      //   var sink = file.openWrite(mode: FileMode.append);
      //   file.writeAsString("OPERATION" + pdfData.toString());
      //   await sink.flush();
      //   await sink.close();
      // return file;

      // }
      break;
    case 2:
      createWriteToDB(fileDB);
     break;
  }
}

Future<File> createFileTxtSync(pathToFile) async {
  // final f = File(pathToFile);
  final file = await File(pathToFile);
  final fileExists = await file.exists();

  if (!fileExists)
    await file.create(); // Create your file if it does not exists.

  //write to file
  // var sink = file.openWrite(mode: FileMode.append);
  // file.writeAsString("OPERATION WRITE");
  // await sink.flush();
  // await sink.close();
  return file;
}

File createFileDBSync(pathToFile) {
  final file = File(pathToFile);
  bool fileExists = file.existsSync();

  if (!fileExists){
    final db = sqlite3.open(pathToFile);
    List listOfColumn = [];
    createTableOfDb(db);
  }

  return file;
}

void createTableOfDb(db){
  String partRequest = '';

  db.execute('''
    CREATE TABLE phonebook (
      id INTEGER NOT NULL PRIMARY KEY,
      name TEXT NOT NULL,
      phone INTEGER NOT NULL
    );
  ''');
  db.dispose();
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

void createWriteToDB(fileDB) {
  final stmt = fileDB.prepare('INSERT INTO phonebook (name, phone), VALUES (?, ?)');
  stmt
    ..execute(['The Beatles'], ['0660251525']);

  // Dispose a statement when you don't need it anymore to clean up resources.
  stmt.dispose();
}