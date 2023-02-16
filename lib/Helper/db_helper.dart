import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "FitnessApp.db";
  static const _databaseVersion = 1;

  static const tableExercises = 'AddExercise';
  static const tableExercisesDetail = 'ExerciseDetail';
  static const tableDay = 'AddDay';
  static const tableUserData = 'AddUserData';

  static const columnId = 'id';

  ///Exercises variables
  static const dayTitle = 'dayTitle';
  static const exercise_id = 'exerciseId';
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
  static const isRest = 'isRest';
  static const description = 'description';

  ///Day variables
  // static const dayTitle = 'dayTitle';
  // static const image = 'image';
  // static const kneeIssue = 'kneeIssue';
  // static const planLevel = 'planLevel';
  // static const completeStatus = 'completeStatus';
  static const completeExercisePercentage = 'completeExercisePercentage';
  static const noOfGlassWaterDrank = 'noOfGlassWaterDrank';
  static const exerciseNumInProgress = 'exerciseNumInProgress';

  ///UserData variables
  static const gender = 'gender';
  static const dateOfBirth = 'dateOfBirth';
  static const weight = 'weight';
  static const height = 'height';
  static const countDownTime = 'countDownTime';
  static const trainingRest = 'trainingRest';
  static const turnOnWaterTracker = 'turnOnWaterTracker';
  static const drinkNotification = 'drinkNotification';

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
            $exercise_id INTEGER,
            $raps INTEGER,
            $time INTEGER,
            $kneeIssue TEXT,
            $planLevel TEXT,
            $inPushUpCat TEXT,
            $inPlankCat TEXT,
            $completeStatus TEXT
          )
          ''');

    await db.execute('''
          CREATE TABLE $tableExercisesDetail (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $name TEXT,
            $exercise_id INTEGER,
            $image TEXT,
            $type TEXT,
            $description TEXT
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
            $exerciseNumInProgress INTEGER,
            $isRest INTEGER
          )
          ''');

    await db.execute('''
          CREATE TABLE $tableUserData (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $gender TEXT,
            $dateOfBirth TEXT,
            $weight TEXT,
            $height TEXT,
            $countDownTime INTEGER,
            $trainingRest INTEGER,
            $turnOnWaterTracker TEXT,
            $drinkNotification TEXT
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
    print('>>>>>>>>stored exercise data in DB');

    return await db.insert(tableExercises, row);
  }

  Future<int> insertExerciseDetail(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print('>>>>>>>>stored exercise detail data in DB');

    return await db.insert(tableExercisesDetail, row);
  }

  Future<int> insertDays(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print('>>>>>>>>stored table data in DB');

    return await db.insert(tableDay, row);
  }

  Future<int> insertUserData(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print('>>>>>>>>stored user data in DB');

    return await db.insert(tableUserData, row);
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

  Future<List<Map<String, dynamic>>> queryAllExerciseOfDay(String findDay) async {
    Database db = await instance.database;
    return await db.query(tableExercises, where: '$dayTitle = ?', whereArgs: [findDay]);
  }

  Future<List<Map<String, dynamic>>> queryAllDay() async {
    Database db = await instance.database;
    return await db.query(tableDay);
  }

  Future<List<Map<String, dynamic>>> queryASpecificDay(String findDay) async {
    Database db = await instance.database;
    return await db.query(tableDay, where: '$dayTitle = ?', whereArgs: [findDay]);
  }

  Future<List<Map<String, Object?>>> queryASpecificExercise(int exerciseId) {
    return _database!.query(tableExercisesDetail, where: '$exercise_id = ?', whereArgs: [exerciseId]);
  }

  Future<List<Map<String, dynamic>>> queryUserTrainingData(int trainRest) async {
    Database db = await instance.database;
    return await db.query(tableUserData);
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

  Future<int> resetExerciseStatus() async {
    Database db = await instance.database;
    return await db.rawUpdate('UPDATE $tableDay SET $completeExercisePercentage = 0, $exerciseNumInProgress = 0 ');
  }

  Future<int> clearExercise() async {
    Database db = await instance.database;
    return await db.delete(tableExercises);
  }

  Future<int> removeDays() async {
    Database db = await instance.database;
    return await db.delete(tableDay);
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
