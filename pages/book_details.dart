import 'package:bookapp/database/db_helper.dart';
import 'package:bookapp/models/book.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {

  Book book;
  BookDetails(this.book);
  String name, content;
  int copies;

  DbHelper helper;

  @override
  Widget build(BuildContext context) {
    //int newHours  = course.hours -1 ;
    return Scaffold(
      appBar: AppBar(title: Text('Book Details'),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                    child: Text(book.name, style: TextStyle(fontWeight: FontWeight.bold , color: Colors.blue , fontSize: 40),)),
              ),
              SizedBox(height: 20,),
              Center(
                  child: Text("about this book : ${book.content}",style: TextStyle(fontWeight: FontWeight.w500 , color: Colors.black , fontSize: 20),)),
              SizedBox(height: 20,),
              Text('Note : Number of available Copies for this book = ${book.copies}', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}