import 'dart:async';
import 'dart:io';
import 'package:appointment/databsae/models/clientmodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static const _dbname = 'mydatabase.db';
  static const _version = 1;

  static const _tablename = 'appointment';
  static const _texttype = 'TEXT NOT NULL';

  static const _columnid = '_id';
  static const _columnfirstname = 'firstname';
  static const _columnlastname = 'lastname';
  static const _columnemail = 'email';
  static const _columnlocation = 'location';
  static const _columnwhatsappno = 'whatsapp_no';
  static const _columnprojectname = 'project';

  Databasehelper._privateConstonructor();
  static final Databasehelper instance = Databasehelper._privateConstonructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initiateDatabase();
    return _database;
  }

  initiateDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, _dbname);
    await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.query('''
    CREATE TABLE $_tablename ($_columnid INTERGER PRIMARY KEY AUTOINCREMENT,
    $_columnfirstname $_texttype,$_columnlastname $_texttype, $_columnwhatsappno $_texttype, $_columnemail $_texttype,$_columnlocation $_texttype,$_columnprojectname $_texttype)
    ''');
  }

  Future<int> insert(ClientModel client) async {
    final db = await instance.database;
    db.insert(_tablename, client.toJson());
  }

  

  Future<List<ClientModel>> getAllClients() async {
    final db = await instance.database;
    // db.insert(_tablename, client.toJson());
    // var json = db.query(_tablename);
    final List<Map<String, dynamic>> json = await db.query(_tablename);
      return List.generate(json.length, (i) {
    return ClientModel(
      id: json[i]['id'],
      firstname: json[i]['firstname'],
      lastname: json[i]['lastname'],
      email: json[i]['email'],
      whatsappNo: json[i]['whatsapp_no'],
      location: json[i]['location'],
      project: json[i]['project'],
    );
  });
    // ClientModel.fromJson(json)
    // List<ClientModel>data ;
    // List<Map> list = await database.rawQuery('SELECT * FROM Test');
  }
}
