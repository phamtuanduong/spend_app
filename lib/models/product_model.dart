import 'dart:convert';

import 'package:spend_app/models/category_model.dart';

class ProductModel {
  int id;
  String name;
  double money;
  ProductModel({
    required this.id,
    required this.name,
    required this.money,
  });

  CategoryModel? categoryModel;

  ProductModel copyWith({
    int? id,
    String? name,
    double? money,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      money: money ?? this.money,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'money': money,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      money: map['money']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductModel(id: $id, name: $name, money: $money)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.money == money;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ money.hashCode;
}
