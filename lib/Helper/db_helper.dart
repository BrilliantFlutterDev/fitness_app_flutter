import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "FitnessApp.db";
  static const _databaseVersion = 1;

  static const tableExercises = 'AddExercise';
  static const tableDay = 'AddDay';

  static const columnId = 'id';

  ///Exercises variables
  static const dayTitle = 'dayTitle';
  static const image = 'image';
  static const name = 'name';
  static const raps = 'raps';
  static const time = 'time';
  static const type = 'type';
  static const kneeIssue = 'kneeIssue';
  static const planLevel = 'planLevel';
  static const inPushUpCat = 'inPushUpCat';
  static const inPlankCat = 'inPlankCat';
  static const completeStatus = 'completeStatus';

  ///Day variables
  // static const dayTitle = 'dayTitle';
  // static const image = 'image';
  // static const kneeIssue = 'kneeIssue';
  // static const planLevel = 'planLevel';
  // static const completeStatus = 'completeStatus';
  static const completeExercisePercentage = 'completeExercisePercentage';
  static const noOfGlassWaterDrank = 'noOfGlassWaterDrank';
  static const exerciseNumInProgress = 'exerciseNumInProgress';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableExercises (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $dayTitle TEXT,
            $name TEXT,
            $image TEXT,
            $raps INTEGER,
            $time TEXT,
            $type TEXT,
            $kneeIssue TEXT,
            $planLevel TEXT,
            $inPushUpCat TEXT,
            $inPlankCat TEXT,
            $completeStatus TEXT
          )
          ''');

    await db.execute('''
          CREATE TABLE $tableDay (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $dayTitle TEXT,
            $image TEXT,
            $kneeIssue TEXT,
            $planLevel TEXT,
            $completeStatus TEXT,
            $completeExercisePercentage INTEGER,
            $noOfGlassWaterDrank INTEGER,
            $exerciseNumInProgress INTEGER
          )
          ''');
  }

  // Future<int> insertProductUserClick(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   print('>>>>>>>>stored data in DB');
  //
  //   return await db.insert(tableUserProductClick, row);
  // }
  //
  // Future<List<Map<String, dynamic>>> queryAllUserProductClicks() async {
  //   Database db = await instance.database;
  //   return await db.query(tableUserProductClick);
  // }
  //
  Future<int> insertExercise(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print('>>>>>>>>stored data in DB');

    return await db.insert(tableExercises, row);
  }

  Future<int> insertDays(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print('>>>>>>>>stored data in DB');

    return await db.insert(tableDay, row);
  }
  //
  // Future<int> insertCartProductCombination(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   print('>>>>>>>>stored data in DB');
  //
  //   return await db.insert(tableCartProductsCombination, row);
  // }

  Future<List<Map<String, dynamic>>> queryAllExercise() async {
    Database db = await instance.database;
    return await db.query(tableExercises);
  }

  Future<List<Map<String, dynamic>>> queryAllExerciseOfDay(
      String findDay) async {
    Database db = await instance.database;
    return await db
        .query(tableExercises, where: '$dayTitle = ?', whereArgs: [findDay]);
  }

  Future<List<Map<String, dynamic>>> queryAllDay() async {
    Database db = await instance.database;
    return await db.query(tableDay);
  }

  Future<List<Map<String, dynamic>>> queryASpecificDay(String findDay) async {
    Database db = await instance.database;
    return await db
        .query(tableDay, where: '$dayTitle = ?', whereArgs: [findDay]);
  }

  Future<int> updateADay(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String day = row[dayTitle];
    print('>>>>>>>>>Day Updating: $day');
    return await db
        .update(tableDay, row, where: '$dayTitle = ?', whereArgs: [day]);
  }
  Future<int> updateAExercise(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    print('>>>>>>>>>>>>Column ID: $id');
    return await db
        .update(tableExercises, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Future<List<Map<String, dynamic>>> queryAllCartProductCombination() async {
  //   Database db = await instance.database;
  //   return await db.query(tableCartProductsCombination);
  // }

  // Future<int> insertObservationPhotos(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //
  //   return await db.insert(tableObservationImages, row);
  // }

  //Tags
  // Future<int> insertObservationTags(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //
  //   return await db.insert(tableObservationTags, row);
  // }

  // Future<int> insertTBM(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //
  //   return await db.insert(tableTBM, row);
  // }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  // Future<int> update(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   int id = row[columnId];
  //   return await db.update(tableUserProductClick, row,
  //       where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<int> deleteProductUserClicks(String number) async {
  //   Database db = await instance.database;
  //   return await db.delete(tableUserProductClick,
  //       where: '$uniqueNumber = ?', whereArgs: [number]);
  // }
  //
  // Future<int> deleteCartProducts(String number) async {
  //   Database db = await instance.database;
  //   return await db.delete(tableCartProducts,
  //       where: '$uniqueNumber = ?', whereArgs: [number]);
  // }

  // Future<int> deleteCartProductsCombination(String number) async {
  //   Database db = await instance.database;
  //   return await db.delete(tableCartProductsCombination,
  //       where: '$uniqueNumber = ?', whereArgs: [number]);
  // }
  //
  // Future<int> deleteAllCartProducts() async {
  //   Database db = await instance.database;
  //   return await db.delete(tableCartProducts);
  // }
  //
  // Future<int> deleteAllCartProductsCombination() async {
  //   Database db = await instance.database;
  //   return await db.delete(tableCartProductsCombination);
  // }
}
