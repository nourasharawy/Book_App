import 'package:flutter/cupertino.dart';

class Book{
  int _id;
  String _name, _content;
  int _copies;


  Book(dynamic obj){
    _id = obj['id'];
    _name = obj['name'];
    _content = obj['content'];
    _copies = obj['copies'];

  }
  Book.fromMap(Map<String, dynamic> data){
    _id = data['id'];
    _name = data['name'];
    _content = data['content'];
    _copies = data['copies'];

  }
  Map<String, dynamic> toMap() => {'id' : _id, 'name': _name,'content' : _content,'copies':_copies };
  int get id => _id;
  String get name => _name;
  String get content => _content;
  int get copies => _copies;
}