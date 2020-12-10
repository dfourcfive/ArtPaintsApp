import 'package:art/db/databaseHelper.dart';

class SaveRepo {
  void insert(Map<String, dynamic> row) async {
    final dbHelper = DatabaseHelper.instance;
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  Future<List<Map<String, dynamic>>> query() async {
    final dbHelper = DatabaseHelper.instance;
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
    return allRows;
  }

  void delete(final id) async {
    final dbHelper = DatabaseHelper.instance;
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
