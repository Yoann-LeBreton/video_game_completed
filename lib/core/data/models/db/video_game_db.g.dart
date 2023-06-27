// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_game_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVideoGameDbCollection on Isar {
  IsarCollection<VideoGameDb> get videoGameDbs => this.collection();
}

const VideoGameDbSchema = CollectionSchema(
  name: r'VideoGameDb',
  id: -6983015980806404873,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 1,
      name: r'status',
      type: IsarType.byte,
      enumMap: _VideoGameDbstatusEnumValueMap,
    )
  },
  estimateSize: _videoGameDbEstimateSize,
  serialize: _videoGameDbSerialize,
  deserialize: _videoGameDbDeserialize,
  deserializeProp: _videoGameDbDeserializeProp,
  idName: r'remote_id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _videoGameDbGetId,
  getLinks: _videoGameDbGetLinks,
  attach: _videoGameDbAttach,
  version: '3.1.0+1',
);

int _videoGameDbEstimateSize(
  VideoGameDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _videoGameDbSerialize(
  VideoGameDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeByte(offsets[1], object.status.index);
}

VideoGameDb _videoGameDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoGameDb();
  object.name = reader.readStringOrNull(offsets[0]);
  object.remoteId = id;
  object.status =
      _VideoGameDbstatusValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          VideoGameStatus.started;
  return object;
}

P _videoGameDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_VideoGameDbstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          VideoGameStatus.started) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VideoGameDbstatusEnumValueMap = {
  'started': 0,
  'finished': 1,
  'wishlisted': 2,
  'abandoned': 3,
};
const _VideoGameDbstatusValueEnumMap = {
  0: VideoGameStatus.started,
  1: VideoGameStatus.finished,
  2: VideoGameStatus.wishlisted,
  3: VideoGameStatus.abandoned,
};

Id _videoGameDbGetId(VideoGameDb object) {
  return object.remoteId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _videoGameDbGetLinks(VideoGameDb object) {
  return [];
}

void _videoGameDbAttach(
    IsarCollection<dynamic> col, Id id, VideoGameDb object) {
  object.remoteId = id;
}

extension VideoGameDbQueryWhereSort
    on QueryBuilder<VideoGameDb, VideoGameDb, QWhere> {
  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhere> anyRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhere> anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }
}

extension VideoGameDbQueryWhere
    on QueryBuilder<VideoGameDb, VideoGameDb, QWhereClause> {
  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> remoteIdEqualTo(
      Id remoteId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: remoteId,
        upper: remoteId,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> remoteIdNotEqualTo(
      Id remoteId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: remoteId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: remoteId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: remoteId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: remoteId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> remoteIdGreaterThan(
      Id remoteId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: remoteId, includeLower: include),
      );
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> remoteIdLessThan(
      Id remoteId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: remoteId, includeUpper: include),
      );
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> remoteIdBetween(
    Id lowerRemoteId,
    Id upperRemoteId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerRemoteId,
        includeLower: includeLower,
        upper: upperRemoteId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [null],
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameNotEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameGreaterThan(
    String? name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [name],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameLessThan(
    String? name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [],
        upper: [name],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameBetween(
    String? lowerName,
    String? upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [lowerName],
        includeLower: includeLower,
        upper: [upperName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameStartsWith(
      String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [NamePrefix],
        upper: ['$NamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [''],
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ));
      }
    });
  }
}

extension VideoGameDbQueryFilter
    on QueryBuilder<VideoGameDb, VideoGameDb, QFilterCondition> {
  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remote_id',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remote_id',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> remoteIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remote_id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      remoteIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remote_id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      remoteIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remote_id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> remoteIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remote_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> statusEqualTo(
      VideoGameStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      statusGreaterThan(
    VideoGameStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> statusLessThan(
    VideoGameStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> statusBetween(
    VideoGameStatus lower,
    VideoGameStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VideoGameDbQueryObject
    on QueryBuilder<VideoGameDb, VideoGameDb, QFilterCondition> {}

extension VideoGameDbQueryLinks
    on QueryBuilder<VideoGameDb, VideoGameDb, QFilterCondition> {}

extension VideoGameDbQuerySortBy
    on QueryBuilder<VideoGameDb, VideoGameDb, QSortBy> {
  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension VideoGameDbQuerySortThenBy
    on QueryBuilder<VideoGameDb, VideoGameDb, QSortThenBy> {
  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remote_id', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remote_id', Sort.desc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension VideoGameDbQueryWhereDistinct
    on QueryBuilder<VideoGameDb, VideoGameDb, QDistinct> {
  QueryBuilder<VideoGameDb, VideoGameDb, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension VideoGameDbQueryProperty
    on QueryBuilder<VideoGameDb, VideoGameDb, QQueryProperty> {
  QueryBuilder<VideoGameDb, int, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remote_id');
    });
  }

  QueryBuilder<VideoGameDb, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<VideoGameDb, VideoGameStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
