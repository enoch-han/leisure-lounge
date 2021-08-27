import 'package:uuid/uuid.dart';

class CustomUuid {
  final uuid = Uuid().v4();
  //late String value;

  //CustomUuid({required this.value});

  String generateId() {
    return uuid;
  }

  String generateTypeId(String type) {
    // function that generates an id with type in front
    return "$type+$uuid";
  }

  String getType(String idValue) {
    // function that parses the type from previously generated id
    String type = idValue.split('+').first;
    return type;
  }
}
