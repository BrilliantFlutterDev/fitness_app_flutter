import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "BanglaBazar.db";
  static const _databaseVersion = 1;

  static const tableUserProductClick = 'AddUserProductClick';
  static const tableCartProducts = 'AddProductsToCart';
  static const tableCartProductsCombination = 'AddProductsToCartCombination';
  static const tableObservationImages = 'AddObservationImages';
  static const tableObservationTags = 'AddObservationTags';
  static const tableTBM = 'AddTBM';
  static const columnId = 'id';

  ///User click on Products

  static const productID = 'ProductID';
  static const uniqueNumber = 'UniqueNumber';

  ///User click on Products

  ///Cart Product variables
  static const cartProductID = 'ProductID';
  static const cartTitle = 'Title';
  static const cartProductCityID = 'ProductCityID';
  static const cartProductCountry = 'ProductCountry';
  static const cartCity = 'City';
  static const cartNative = 'Native';
  static const cartCompanyName = 'CompanyName';
  static const cartVendorID = 'VendorID';
  static const cartBasePrice = 'BasePrice';
  static const cartCurrency = 'Currency';
  static const cartUserID = 'UserID';
  static const cartTotalQuantity = 'Total_Quantity';
  static const cartSmall = 'Small';
  static const cartMedium = 'Medium';
  static const cartLarge = 'Large';
  static const cartMainImage = 'MainImage';
  static const cartREVIEWCOUNT = 'REVIEW_COUNT';
  static const cartAllowStorePickup = 'AllowStorePickup';
  static const cartAVGRating = 'AVG_Rating';
  //static const cartCalculateTotalProductPrice;
  //static const cartSelectedForCheckout;

  ///Cart Product variables

  ///Cart Product combination variables
  static const cartCombinationProductID = 'ProductID';
  static const cartCombinationProductVariantCombinationID =
      'ProductVariantCombinationID';
  static const cartCombinationProductCombinationPrice =
      'ProductCombinationPrice';
  static const cartCombinationAvailableInventory = 'AvailableInventory';
  static const cartCombinationVendorStoreID = 'VendorStoreID';
  static const cartCombinationOptionID = 'OptionID';
  static const cartCombinationOptionName = 'OptionName';
  static const cartCombinationOptionValue = 'OptionValue';
  static const cartCombinationOptionValueID = 'OptionValueID';

  ///Cart Product combination variables

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
          CREATE TABLE $tableUserProductClick (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $productID INTEGER,
            $uniqueNumber TEXT
          )
          ''');
    await db.execute('''
          CREATE TABLE $tableCartProducts (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $uniqueNumber TEXT,
            $cartProductID INTEGER,
            $cartTitle TEXT,
            $cartProductCityID INTEGER,
            $cartProductCountry INTEGER,
            $cartCity TEXT,
            $cartNative TEXT,
            $cartCompanyName TEXT,
            $cartVendorID INTEGER,
            $cartBasePrice TEXT,
            $cartCurrency TEXT,
            $cartUserID INTEGER,
            $cartTotalQuantity TEXT,
            $cartSmall TEXT,
            $cartMedium TEXT,
            $cartLarge TEXT,
            $cartMainImage TEXT,
            $cartREVIEWCOUNT INTEGER,
            $cartAllowStorePickup TEXT,
            $cartAVGRating TEXT
          )
          ''');

    await db.execute('''
          CREATE TABLE $tableCartProductsCombination (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $uniqueNumber TEXT,
            $cartCombinationProductID INTEGER,
            $cartCombinationProductVariantCombinationID INTEGER
          )
          ''');
  }

  Future<int> insertProductUserClick(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print('>>>>>>>>stored data in DB');

    return await db.insert(tableUserProductClick, row);
  }

  Future<List<Map<String, dynamic>>> queryAllUserProductClicks() async {
    Database db = await instance.database;
    return await db.query(tableUserProductClick);
  }

  Future<int> insertCartProduct(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print('>>>>>>>>stored data in DB');

    return await db.insert(tableCartProducts, row);
  }

  Future<int> insertCartProductCombination(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print('>>>>>>>>stored data in DB');

    return await db.insert(tableCartProductsCombination, row);
  }

  Future<List<Map<String, dynamic>>> queryAllCartProduct() async {
    Database db = await instance.database;
    return await db.query(tableCartProducts);
  }

  Future<List<Map<String, dynamic>>> queryAllCartProductCombination() async {
    Database db = await instance.database;
    return await db.query(tableCartProductsCombination);
  }

  Future<int> insertObservationPhotos(Map<String, dynamic> row) async {
    Database db = await instance.database;

    return await db.insert(tableObservationImages, row);
  }

  //Tags
  Future<int> insertObservationTags(Map<String, dynamic> row) async {
    Database db = await instance.database;

    return await db.insert(tableObservationTags, row);
  }

  Future<int> insertTBM(Map<String, dynamic> row) async {
    Database db = await instance.database;

    return await db.insert(tableTBM, row);
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(tableUserProductClick, row,
        where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteProductUserClicks(String number) async {
    Database db = await instance.database;
    return await db.delete(tableUserProductClick,
        where: '$uniqueNumber = ?', whereArgs: [number]);
  }

  Future<int> deleteCartProducts(String number) async {
    Database db = await instance.database;
    return await db.delete(tableCartProducts,
        where: '$uniqueNumber = ?', whereArgs: [number]);
  }

  Future<int> deleteCartProductsCombination(String number) async {
    Database db = await instance.database;
    return await db.delete(tableCartProductsCombination,
        where: '$uniqueNumber = ?', whereArgs: [number]);
  }

  Future<int> deleteAllCartProducts() async {
    Database db = await instance.database;
    return await db.delete(tableCartProducts);
  }

  Future<int> deleteAllCartProductsCombination() async {
    Database db = await instance.database;
    return await db.delete(tableCartProductsCombination);
  }
}
