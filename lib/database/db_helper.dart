import 'package:bookapp/models/book.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();

  factory DbHelper() => _instance;

  DbHelper.internal();

  static Database _db;

  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'booking.db');
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      //create all tables
      db.execute(
          "create table books(id integer primary key , name varchar(50),content varchar(1000), copies integer )");
    });
    return _db;
  }

  Future<Database> createBook() async {
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    db.insert('books', {'id': 1, 'name': "Introduction to Algorithms " ,'content':"Introduction to Algorithms, the bible of the field, is a comprehensive textbook covering the full spectrum of modern algorithms: from the fastest algorithms and data structures to polynomial-time algorithms for seemingly intractable problems, from classical algorithms in graph theory to special algorithms for string matching, computational geometry, and number theory. The revised third edition notably adds a chapter on van Emde Boas trees, one of the most useful data structures, and on multithreaded algorithms, a topic of increasing importance.", "copies": 10});
    db.insert('books', {'id': 2, 'name': "Object-Oriented Programming in C++ " ,'content':"Object-Oriented Programming in C++ begins with the basic principles of the C++ programming language and systematically introduces increasingly advanced topics while illustrating the OOP methodology. While the structure of this book is similar to that of the previous edition, each chapter reflects the latest ANSI C++ standard and the examples have been thoroughly revised to reflect current practices and standards.", "copies": 10});
    db.insert('books', {'id': 3, 'name': " Data Structures " ,'content':"Algorithms and data structures are much more than abstract concepts. Mastering them enables you to write code that runs faster and more efficiently, which is particularly important for todays web and mobile apps. Take a practical approach to data structures and algorithms, with techniques and real-world scenarios that you can use in your daily production code, with examples in JavaScript, Python, and Ruby. This new and revised second edition features new chapters on recursion, dynamic programming.", "copies": 10});
    db.insert('books', {'id': 4, 'name': "Data Visualization " ,'content':"This book works as a guide to present fundamental Python Libraries and a basis related to Data Visualization using Python", "copies": 10});
    db.insert('books', {'id': 5, 'name': "Data Mining " ,'content':"Data Mining: Practical Machine Learning Tools and Techniques, Fourth Edition, offers a thorough grounding in machine learning concepts, along with practical advice on applying these tools and techniques in real world data mining situations. This highly anticipated fourth edition of the most acclaimed work on data mining and machine learning teaches readers everything they need to know to get going, from preparing inputs, interpreting outputs, evaluating results, to the algorithmic methods at the heart of successful data mining approaches.", "copies": 10});
    db.insert('books', {'id': 6, 'name': "Introduction to Flutter " ,'content':"In this book we cover in detail the Dart programming language (version 2.10, with null safety support) and the Flutter framework (version 1.20).While reading the chapters, you'll find a lot of good practices, tips and performance advices to build high quality products. The book is divided in 3 parts: - Part 1. It's about the Dart programming language (classes, exceptions, inheritance, null safety, streams, SOLID principles...) - Part 2. It's about the Flutter framework (localization, routing, state management with Bloc and Provider, testing, performances with DevTools, animations...) - Part 3. It's a long collection of examples (using Firestore, monetizing apps, using gestures, networking, publishing packages at pub.dev, race recognition with ML kits, playing audio and video...)The official website of the book contains the complete source code of the examples and a Quiz Game to test your Dart and Flutter skills!", "copies": 10});

    return db;
  }

  Future<List> allBooks() async {
    Database db = await createDatabase();
    //db.rawQuery("select * from books")
    return db.query('books');
  }


  Future<int> updateBook(Book book) async {
    Database db = await createDatabase();
    return await db.update('books', book.toMap(),
        where: 'id = ?', whereArgs: [book.id]);
  }
}
