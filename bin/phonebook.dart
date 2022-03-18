// import 'package:phonebook/phonebook.dart' as phonebook;
// import 'package:phonebook/phoneDB.dart' as db;
import 'dart:io';
import 'dart:math';
import 'dart:core';
import 'dart:convert';


void main(List<String> arguments) {
  const pathToFile = 'lib/phoneDB.dart';

  final fileDB = createFileDBSync(pathToFile);
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
     fileDB.writeAsStringSync('hi');
     break;
  }
}

Future<File> createFileDB(pathToFile) async {
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

  if (!fileExists)
    file.createSync(); // Create your file if it does not exists.

  return file;
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
