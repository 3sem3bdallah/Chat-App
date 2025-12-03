import 'package:cloud_firestore/cloud_firestore.dart';

class MsgModel {
  final String text;
  final Timestamp createdAt;

  MsgModel({
    required this.text,
    required this.createdAt,
  });

  factory MsgModel.fromJson(Map<String, dynamic> json) {
    return MsgModel(
      text: json["text"] ?? "", 
      createdAt: json["createdAt"] ?? Timestamp.now(),
    );
  }
}
