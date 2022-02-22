part of 'auth_model.dart';

class AuthAdapter extends TypeAdapter<AuthModel> {
  @override
  final typeId = 3;

  @override
  AuthModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthModel(
      token: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AuthModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.token);
  }
}
