import 'package:bookapp/database/db_helper.dart';
import 'package:bookapp/models/book.dart';
import 'package:flutter/material.dart';
import 'package:snack/snack.dart';

import 'book_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper helper; // an object from database helper
  var bar  =SnackBar(content: Text("Borrowing operation done successfully"));

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
    helper.createBook();
  }

  @override
  Widget build(BuildContext context) {
    String raisedText = 'Borrow Now';
    Color raisedColor = Colors.blue;
    return Scaffold(
      appBar: AppBar(
        title: Text('All Books'),
        actions: <Widget>[],
      ),
      body: FutureBuilder(
        future: helper.allBooks(),
        builder: (context, AsyncSnapshot snapshot) {
          //this CircularProgressIndicator run until data get from database
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
            //once data prepared it will shown i listview
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  Book book = Book.fromMap(snapshot.data[i]);
                  return Card(
                    child: ListTile(
                      title: Text('${book.name}'),
                      subtitle:
                          Text('# Copies = ${book.copies} , show more...'),
                      trailing: Column(
                        children: [
                          Expanded(
                            child: RaisedButton(
                              child: Text(raisedText),
                              color: raisedColor,
                              //if number of each book =0 , the borrow btn will disabled , else , it works smothly
                              onPressed: (book.copies < 1)
                                  ? null
                                  : () async {
                                      setState(() {
                                        Book updatedBook = Book({
                                          'id': book.id,
                                          'name': book.name,
                                          'content': book.content,
                                          'copies': book.copies - 1,
                                          // once the user borrow a book # of this book copies -1
                                        });
                                        helper.updateBook(updatedBook);
                                        bar.show(context);
                                      });

                                    },
                            ),
                          ),
                        ],
                      ),
                      //user can navigate to more information about this book
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookDetails(book)));
                      },
                    ),
                  );
                });
          }
        },
      ),
    );
  }

}

