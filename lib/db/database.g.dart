// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Goods extends Table with TableInfo<Goods, Good> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Goods(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns => [code, name, content, price, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goods';
  @override
  VerificationContext validateIntegrity(Insertable<Good> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Good map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Good(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
    );
  }

  @override
  Goods createAlias(String alias) {
    return Goods(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Good extends DataClass implements Insertable<Good> {
  final String code;
  final String name;
  final String? content;
  final double price;
  final int count;
  const Good(
      {required this.code,
      required this.name,
      this.content,
      required this.price,
      required this.count});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['price'] = Variable<double>(price);
    map['count'] = Variable<int>(count);
    return map;
  }

  GoodsCompanion toCompanion(bool nullToAbsent) {
    return GoodsCompanion(
      code: Value(code),
      name: Value(name),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      price: Value(price),
      count: Value(count),
    );
  }

  factory Good.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Good(
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      content: serializer.fromJson<String?>(json['content']),
      price: serializer.fromJson<double>(json['price']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'content': serializer.toJson<String?>(content),
      'price': serializer.toJson<double>(price),
      'count': serializer.toJson<int>(count),
    };
  }

  Good copyWith(
          {String? code,
          String? name,
          Value<String?> content = const Value.absent(),
          double? price,
          int? count}) =>
      Good(
        code: code ?? this.code,
        name: name ?? this.name,
        content: content.present ? content.value : this.content,
        price: price ?? this.price,
        count: count ?? this.count,
      );
  @override
  String toString() {
    return (StringBuffer('Good(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('content: $content, ')
          ..write('price: $price, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, name, content, price, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Good &&
          other.code == this.code &&
          other.name == this.name &&
          other.content == this.content &&
          other.price == this.price &&
          other.count == this.count);
}

class GoodsCompanion extends UpdateCompanion<Good> {
  final Value<String> code;
  final Value<String> name;
  final Value<String?> content;
  final Value<double> price;
  final Value<int> count;
  final Value<int> rowid;
  const GoodsCompanion({
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.content = const Value.absent(),
    this.price = const Value.absent(),
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoodsCompanion.insert({
    required String code,
    required String name,
    this.content = const Value.absent(),
    required double price,
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : code = Value(code),
        name = Value(name),
        price = Value(price);
  static Insertable<Good> custom({
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? content,
    Expression<double>? price,
    Expression<int>? count,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (content != null) 'content': content,
      if (price != null) 'price': price,
      if (count != null) 'count': count,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoodsCompanion copyWith(
      {Value<String>? code,
      Value<String>? name,
      Value<String?>? content,
      Value<double>? price,
      Value<int>? count,
      Value<int>? rowid}) {
    return GoodsCompanion(
      code: code ?? this.code,
      name: name ?? this.name,
      content: content ?? this.content,
      price: price ?? this.price,
      count: count ?? this.count,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoodsCompanion(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('content: $content, ')
          ..write('price: $price, ')
          ..write('count: $count, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDb extends GeneratedDatabase {
  _$MyDb(QueryExecutor e) : super(e);
  _$MyDbManager get managers => _$MyDbManager(this);
  late final Goods goods = Goods(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [goods];
}

typedef $GoodsInsertCompanionBuilder = GoodsCompanion Function({
  required String code,
  required String name,
  Value<String?> content,
  required double price,
  Value<int> count,
  Value<int> rowid,
});
typedef $GoodsUpdateCompanionBuilder = GoodsCompanion Function({
  Value<String> code,
  Value<String> name,
  Value<String?> content,
  Value<double> price,
  Value<int> count,
  Value<int> rowid,
});

class $GoodsTableManager extends RootTableManager<
    _$MyDb,
    Goods,
    Good,
    $GoodsFilterComposer,
    $GoodsOrderingComposer,
    $GoodsProcessedTableManager,
    $GoodsInsertCompanionBuilder,
    $GoodsUpdateCompanionBuilder> {
  $GoodsTableManager(_$MyDb db, Goods table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $GoodsFilterComposer(ComposerState(db, table)),
          orderingComposer: $GoodsOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $GoodsProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> code = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<int> count = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoodsCompanion(
            code: code,
            name: name,
            content: content,
            price: price,
            count: count,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String code,
            required String name,
            Value<String?> content = const Value.absent(),
            required double price,
            Value<int> count = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoodsCompanion.insert(
            code: code,
            name: name,
            content: content,
            price: price,
            count: count,
            rowid: rowid,
          ),
        ));
}

class $GoodsProcessedTableManager extends ProcessedTableManager<
    _$MyDb,
    Goods,
    Good,
    $GoodsFilterComposer,
    $GoodsOrderingComposer,
    $GoodsProcessedTableManager,
    $GoodsInsertCompanionBuilder,
    $GoodsUpdateCompanionBuilder> {
  $GoodsProcessedTableManager(super.$state);
}

class $GoodsFilterComposer extends FilterComposer<_$MyDb, Goods> {
  $GoodsFilterComposer(super.$state);
  ColumnFilters<String> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get count => $state.composableBuilder(
      column: $state.table.count,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $GoodsOrderingComposer extends OrderingComposer<_$MyDb, Goods> {
  $GoodsOrderingComposer(super.$state);
  ColumnOrderings<String> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get count => $state.composableBuilder(
      column: $state.table.count,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$MyDbManager {
  final _$MyDb _db;
  _$MyDbManager(this._db);
  $GoodsTableManager get goods => $GoodsTableManager(_db, _db.goods);
}
