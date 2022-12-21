import 'package:flutter/cupertino.dart';
import '../models/books_model.dart';

class BookListProvoider extends ChangeNotifier{
  List<BooksList>? booksList=[];
  updateBooks({List<BooksList>? newBooks}){
    booksList=newBooks;
    notifyListeners();
  }
}

