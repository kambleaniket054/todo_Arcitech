// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'repository/Objectbox.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 204023434036085050),
      name: 'Tasks',
      lastPropertyId: const IdUid(6, 8239386714063259674),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5340373648839023546),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8569628487686977789),
            name: 'Title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 9218005904765119851),
            name: 'dispriction',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3215211577575230400),
            name: 'status',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1414251185995457674),
            name: 'userId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8239386714063259674),
            name: 'username',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 6251797268544529911),
      name: 'User',
      lastPropertyId: const IdUid(4, 9013798880286348033),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7379525945130980074),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2412582865431116765),
            name: 'password',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1199766008832553420),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 9013798880286348033),
            name: 'email',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 6251797268544529911),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Tasks: EntityDefinition<Tasks>(
        model: _entities[0],
        toOneRelations: (Tasks object) => [],
        toManyRelations: (Tasks object) => {},
        getId: (Tasks object) => object.id,
        setId: (Tasks object, int id) {
          object.id = id;
        },
        objectToFB: (Tasks object, fb.Builder fbb) {
          final TitleOffset = fbb.writeString(object.Title);
          final disprictionOffset = fbb.writeString(object.dispriction);
          final statusOffset = fbb.writeString(object.status);
          final usernameOffset = fbb.writeString(object.username);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, TitleOffset);
          fbb.addOffset(2, disprictionOffset);
          fbb.addOffset(3, statusOffset);
          fbb.addInt64(4, object.userId);
          fbb.addOffset(5, usernameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Tasks(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              userId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0),
              Title: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              username: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              dispriction: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              status: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''));

          return object;
        }),
    User: EntityDefinition<User>(
        model: _entities[1],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {},
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final passwordOffset = fbb.writeString(object.password);
          final nameOffset = fbb.writeString(object.name);
          final emailOffset = fbb.writeString(object.email);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, passwordOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, emailOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = User(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              password: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Tasks] entity fields to define ObjectBox queries.
class Tasks_ {
  /// see [Tasks.id]
  static final id = QueryIntegerProperty<Tasks>(_entities[0].properties[0]);

  /// see [Tasks.Title]
  static final Title = QueryStringProperty<Tasks>(_entities[0].properties[1]);

  /// see [Tasks.dispriction]
  static final dispriction =
      QueryStringProperty<Tasks>(_entities[0].properties[2]);

  /// see [Tasks.status]
  static final status = QueryStringProperty<Tasks>(_entities[0].properties[3]);

  /// see [Tasks.userId]
  static final userId = QueryIntegerProperty<Tasks>(_entities[0].properties[4]);

  /// see [Tasks.username]
  static final username =
      QueryStringProperty<Tasks>(_entities[0].properties[5]);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[1].properties[0]);

  /// see [User.password]
  static final password = QueryStringProperty<User>(_entities[1].properties[1]);

  /// see [User.name]
  static final name = QueryStringProperty<User>(_entities[1].properties[2]);

  /// see [User.email]
  static final email = QueryStringProperty<User>(_entities[1].properties[3]);
}
