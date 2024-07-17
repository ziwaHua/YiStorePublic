import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import '../until/log_util.dart';

part 'database.g.dart';

@DriftDatabase(
  include: {'store.drift'},
)
class MyDb extends _$MyDb {
  MyDb() : super(_openConnection());

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        // onUpgrade: (m, from, to) async {
        //   if (from == 1 && to == 2) {
        //     await m.addColumn(goods, goods.count);
        //   }
        // },
      );

  @override
  int get schemaVersion => 1;

  Future<List<Good>> getGoods() async {
    return await select(goods).get();
  }


  Future<Good?> getGoodByCode(String code) async {
    try{
      return await (select(goods)..where((t) => t.code.equals(code))).getSingle();
    } catch(e){
      logV(e);
      return null;
   }
  }

  Future<int> insertOrUpdateGoods(GoodsCompanion good) {
    return into(goods).insertOnConflictUpdate(good);
  }

  //插入一条数据
  Future<bool> saveGood(GoodsCompanion companion) async {
    try {
      await into(goods).insert(companion);
      return true;
    } catch (e) {
      logV(e);
      return false;
    }
  }

  Future<int> deleteAllGoods() async {
    return await delete(goods).go();
  }

  Future<int> updateEmployee(GoodsCompanion companion) async {
    return await update(goods).write(GoodsCompanion(
        name: Value(companion.name as String),
        price: Value(companion.price as double)
    ));
  }

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'yi_store2.db'));
    return NativeDatabase(file);
    //return NativeDatabase.createInBackground(file);
  });
}