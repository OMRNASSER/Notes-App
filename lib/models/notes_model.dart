import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String? id;
  final String title;
  final String content;
  final Timestamp createdAt;
  final String? userId ;
  Note({this.id,  required this.title, required this.content, required this.createdAt, required this.userId});
  factory Note.fromJson(Map<String, dynamic> json, String id) {
    return Note(
      id: id,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      createdAt: json['createdAt'],
      userId: json['userId'] ?? "",
    );
  }

  // Convert NoteModel to JSON
  Map<String, dynamic> toJson() {
    return {

      'title': title,
      'content': content,
      'createdAt': createdAt,
      "userId": userId,
    };
  }

}

