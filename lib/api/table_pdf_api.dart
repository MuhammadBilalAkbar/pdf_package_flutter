import 'dart:io';

import 'package:pdf/widgets.dart';
import '/save_and_open_pdf.dart';

class User {
  final String name;
  final int age;

  const User({required this.name, required this.age});
}

class TablePdfApi {
  static Future<File> generateTablePdf() async {
    final pdf = Document();

    final headers = ['Name', 'Age'];

    final users = [
      const User(name: 'James', age: 19),
      const User(name: 'Sarah', age: 21),
      const User(name: 'Emma', age: 2),
    ];
    final data = users.map((user) => [user.name, user.age]).toList();

    pdf.addPage(
      Page(
        build: (context) => TableHelper.fromTextArray(
          headers: headers,
          data: data,
          cellAlignment: Alignment.center,
          tableWidth: TableWidth.max,
        ),
      ),
    );
    return SaveAndOpenDocument.saveDocument(name: 'table_pdf.pdf', pdf: pdf);
  }
}
