import 'package:sqlite3/sqlite3.dart';

class Subscribers {
  String name = '';
  int phone = 0;
  String pathToFile = '';
  int idRecord = 0;

  void createTableOfDb(db) {
    db.execute('''
    CREATE TABLE if not exists phonebook (
      id INTEGER NOT NULL PRIMARY KEY,
      name TEXT NOT NULL,
      phone INTEGER NOT NULL
    );
  ''');
  }

  createWriteToDB() {
    final db = sqlite3.open(pathToFile);
    createTableOfDb(db);

    final stmt =
        db.prepare('INSERT INTO phonebook (name, phone) VALUES (?, ?)');
    stmt.execute([name, phone]);
    // Dispose a statement when you don't need it anymore to clean up resources.
    stmt.dispose();
  }

  getPhones(pathToFile) {
    final db = sqlite3.open(pathToFile);
    final resultSet =
        // db.select('SELECT * FROM phonebook WHERE name LIKE ?', ['The %']);
        db.select('SELECT * FROM phonebook');

    // You can iterate on the result set in multiple ways to retrieve Row objects
    // one by one.
    resultSet.forEach((element) {
      print(element);
    });
  }

  deleteRecord (){
    final db = sqlite3.open(pathToFile);
    final resultSet =
        // db.select('SELECT * FROM phonebook WHERE name LIKE ?', ['The %']);
        db.prepare('DELETE FROM phonebook WHERE id = (?)');
    resultSet.execute([idRecord]);
  }
}
