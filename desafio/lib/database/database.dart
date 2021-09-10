import 'package:objectdb/objectdb.dart';

class Database {
  final ObjectDB db;
  Database({required this.db});

  Future<ObjectId> insertUser(Map document) async {
    ObjectId id = await db.insert(document);

    return id;
  }

  Future<ObjectId> insertUserLastPosition(Map document) async {
    ObjectId id = await db.insert(document);

    return id;
  }
}
