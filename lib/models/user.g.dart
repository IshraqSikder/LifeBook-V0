// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoAdapter extends TypeAdapter<UserInfo> {
  @override
  final int typeId = 0;

  @override
  UserInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfo(
      id: fields[0] as int,
      name: fields[1] as String,
      gender: fields[2] as String,
      school: (fields[3] as Map).cast<String, dynamic>(),
      job: fields[4] as JobModel?,
      assets: fields[5] as AssetModel?,
      relationships: (fields[6] as List).cast<Relationship>(),
      activities: (fields[7] as List).cast<Relationship>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserInfo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.school)
      ..writeByte(4)
      ..write(obj.job)
      ..writeByte(5)
      ..write(obj.assets)
      ..writeByte(6)
      ..write(obj.relationships)
      ..writeByte(7)
      ..write(obj.activities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RelationshipAdapter extends TypeAdapter<Relationship> {
  @override
  final int typeId = 1;

  @override
  Relationship read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Relationship(
      type: fields[0] as String,
      relation: fields[1] as String,
      name: fields[2] as String,
      age: fields[3] as int,
      gender: fields[4] as String,
      occupation: fields[5] as String,
      imageUrl: fields[6] as String,
      agreement: fields[7] as double,
      stats: fields[8] as CoreStats,
    );
  }

  @override
  void write(BinaryWriter writer, Relationship obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.relation)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.occupation)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.agreement)
      ..writeByte(8)
      ..write(obj.stats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RelationshipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GameStatsAdapter extends TypeAdapter<GameStats> {
  @override
  final int typeId = 2;

  @override
  GameStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameStats(
      levels: (fields[0] as List).cast<Level>(),
      balance: fields[1] as int,
      coreStats: fields[2] as CoreStats,
    );
  }

  @override
  void write(BinaryWriter writer, GameStats obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.levels)
      ..writeByte(1)
      ..write(obj.balance)
      ..writeByte(2)
      ..write(obj.coreStats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LevelAdapter extends TypeAdapter<Level> {
  @override
  final int typeId = 3;

  @override
  Level read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Level(
      age: fields[0] as int,
      experience: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Level obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.age)
      ..writeByte(1)
      ..write(obj.experience);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 4;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      userInfo: fields[0] as UserInfo,
      gameStats: fields[1] as GameStats,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userInfo)
      ..writeByte(1)
      ..write(obj.gameStats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoreStatsAdapter extends TypeAdapter<CoreStats> {
  @override
  final int typeId = 5;

  @override
  CoreStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoreStats(
      happiness: fields[0] as int,
      health: fields[1] as int,
      smarts: fields[2] as int,
      looks: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CoreStats obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.happiness)
      ..writeByte(1)
      ..write(obj.health)
      ..writeByte(2)
      ..write(obj.smarts)
      ..writeByte(3)
      ..write(obj.looks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
