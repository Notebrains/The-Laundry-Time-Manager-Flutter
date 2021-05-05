import 'package:flutter/material.dart';

/// category : "Order"
/// icon : "1"
/// count : "0"

class HomeCategoryModel {
  String _category;
  IconData _icon;
  String _count;

  String get category => _category;

  IconData get icon => _icon;

  String get count => _count;

  HomeCategoryModel({String category, IconData icon, String count}) {
    _category = category;
    _icon = icon;
    _count = count;
  }

  HomeCategoryModel.fromJson(dynamic json) {
    _category = json["category"];
    _icon = json["icon"];
    _count = json["count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["category"] = _category;
    map["icon"] = _icon;
    map["count"] = _count;
    return map;
  }
}
