import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@singleton
class DatabaseHelper {
  DatabaseHelper();

  static Database? db;

  Future<Database> getDatabase() async {
    if (db != null) {
      return db!;
    }
    db = await initialDb();
    return db!;
  }

  Future<Database> initialDb() async {
    return await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      'expenses_database.db',
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        // return db.execute('DROP TABLE IF EXISTS expenses');
        return db.execute(
          'CREATE TABLE expenses ( id TEXT PRIMARY KEY, amount REAL, date DATE, expensesMethod TEXT, description TEXT, isExpenses INTEGER)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}

/// To find db
/// `ps aux | grep 'CoreSimulator/Devices'`
/// `cd /Users/kornisaranimitr/Library/Developer/CoreSimulator/Devices/C15B237E-ADCF-48F6-B84E-FD5A81682D2C/`
/// `find ./ -type f -name 'expenses_database.db'`
