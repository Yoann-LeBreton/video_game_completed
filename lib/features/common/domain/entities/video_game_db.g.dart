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
    r'imageName': PropertySchema(
      id: 0,
      name: r'imageName',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'platformSelected': PropertySchema(
      id: 2,
      name: r'platformSelected',
      type: IsarType.string,
    ),
    r'releaseYear': PropertySchema(
      id: 3,
      name: r'releaseYear',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 4,
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
  bytesCount += 3 + object.imageName.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.platformSelected;
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
  writer.writeString(offsets[0], object.imageName);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.platformSelected);
  writer.writeLong(offsets[3], object.releaseYear);
  writer.writeByte(offsets[4], object.status.index);
}

VideoGameDb _videoGameDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VideoGameDb(
    imageName: reader.readString(offsets[0]),
    name: reader.readString(offsets[1]),
    platformSelected: reader.readStringOrNull(offsets[2]),
    releaseYear: reader.readLong(offsets[3]),
    remoteId: id,
    status: _VideoGameDbstatusValueEnumMap[reader.readByteOrNull(offsets[4])] ??
        VideoGameStatus.started,
  );
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
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
  return object.remoteId;
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

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterWhereClause> nameNotEqualTo(
      String name) {
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
    String name, {
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
    String name, {
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
    String lowerName,
    String upperName, {
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
  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      imageNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      imageNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      imageNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      imageNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      imageNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      imageNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      imageNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      imageNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      imageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageName',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      imageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageName',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> nameEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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
      platformSelectedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'platformSelected',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'platformSelected',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platformSelected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'platformSelected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'platformSelected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'platformSelected',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'platformSelected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'platformSelected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'platformSelected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'platformSelected',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platformSelected',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      platformSelectedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'platformSelected',
        value: '',
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      releaseYearEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseYear',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      releaseYearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'releaseYear',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      releaseYearLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'releaseYear',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      releaseYearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'releaseYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition> remoteIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remote_id',
        value: value,
      ));
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterFilterCondition>
      remoteIdGreaterThan(
    Id value, {
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
    Id value, {
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
    Id lower,
    Id upper, {
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
  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> sortByImageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageName', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> sortByImageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageName', Sort.desc);
    });
  }

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

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy>
      sortByPlatformSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformSelected', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy>
      sortByPlatformSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformSelected', Sort.desc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> sortByReleaseYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseYear', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> sortByReleaseYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseYear', Sort.desc);
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
  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> thenByImageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageName', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> thenByImageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageName', Sort.desc);
    });
  }

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

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy>
      thenByPlatformSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformSelected', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy>
      thenByPlatformSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformSelected', Sort.desc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> thenByReleaseYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseYear', Sort.asc);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QAfterSortBy> thenByReleaseYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseYear', Sort.desc);
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
  QueryBuilder<VideoGameDb, VideoGameDb, QDistinct> distinctByImageName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QDistinct> distinctByPlatformSelected(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'platformSelected',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VideoGameDb, VideoGameDb, QDistinct> distinctByReleaseYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'releaseYear');
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

  QueryBuilder<VideoGameDb, String, QQueryOperations> imageNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageName');
    });
  }

  QueryBuilder<VideoGameDb, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<VideoGameDb, String?, QQueryOperations>
      platformSelectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'platformSelected');
    });
  }

  QueryBuilder<VideoGameDb, int, QQueryOperations> releaseYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'releaseYear');
    });
  }

  QueryBuilder<VideoGameDb, VideoGameStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
