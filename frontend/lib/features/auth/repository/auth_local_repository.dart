import 'package:nowaste_app/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AuthLocalRepository {
  String tableName = "users";

  Database? _database;

  // Getting or creating DB
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB();
    return _database!;
  }

  // Initialize DB
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    print(dbPath);
    final path = join(dbPath, "auth.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          create table $tableName(
            id text primary key,
            name text not null,
            surname text not null,
            email text not null,
            token text not null,
            createdAt text not null,
            updatedAt text not null
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute('drop table $tableName');
          return db.execute('''
            create table $tableName(
              id text primary key,
              name text not null,
              surname text not null,
              email text not null,
              token text not null,
              createdAt text not null,
              updatedAt text not null
            )
          ''');
        }
      },
    );
  }

  // Add a new user into DB
  Future<void> insertUser(UserModel userModel) async {
    final db = await database;
    await db.insert(
      tableName,
      userModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get an existing user from DB
  Future<UserModel?> getUser() async {
    final db = await database;
    final result = await db.query(tableName, limit: 1);

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }

    return null;
  }
}
