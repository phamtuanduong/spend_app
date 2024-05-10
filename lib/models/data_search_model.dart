import 'dart:convert';

class DataSearchModel {
  String key;
  String value;
  DataSearchModel({
    required this.key,
    required this.value,
  });

  DataSearchModel copyWith({
    String? key,
    String? value,
  }) {
    return DataSearchModel(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'value': value,
    };
  }

  factory DataSearchModel.fromMap(Map<String, dynamic> map) {
    return DataSearchModel(
      key: map['key'] ?? '',
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DataSearchModel.fromJson(String source) =>
      DataSearchModel.fromMap(json.decode(source));

  @override
  String toString() => 'DataSearchModel(key: $key, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataSearchModel && other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}
