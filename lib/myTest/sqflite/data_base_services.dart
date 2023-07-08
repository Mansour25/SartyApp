import 'package:path/path.dart';import 'package:path_provider/path_provider.dart';import 'package:sqflite/sqflite.dart';class DataBaseServices {  static const dataBaseName = 'my_data_base';  static const versionDataBase = 1;  static const tableName = 'table_one';  static const columnUserId = 'id';  static const columnUserName = 'name';  static const columnAge = 'age';  Database? _db;  Future<void> init() async {    final documentsDirectory = await getApplicationDocumentsDirectory();    final path = join(documentsDirectory.path, dataBaseName);    _db = await openDatabase(      path,      version: versionDataBase,      onCreate: _onCreate,      onOpen: _onOpen,    );  }  Future<void> _onCreate(Database db, int version) async {    await db        .execute(            'CREATE TABLE $tableName ($columnUserId Integer Primary Key,$columnUserName Text,$columnAge Text) ')        .then((value) {      print('Create DataBase Is Done');    }).catchError((e) {      throw Exception('Error During Create Data Base');    });  }  Future<void> _onOpen(Database db) async {    print('Open DataBase Is Done');  }  Future<int> Insert(Map<String, dynamic> data) async {    return await _db!.insert(tableName, data);  }  Future<List<Map<String, Object?>>> queryAllRows() async {    return await _db!.query(tableName);  }}