import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class SaveAndOpenDocument {
  static Future<File> saveDocument({
    required String name,
    // Document is from pdf widgets.
    required Document pdf,
  }) async {
    final root = await getApplicationDocumentsDirectory();
    final file = File('${root.path}/$name');
    await file.writeAsBytes(await pdf.save());
    print('${root.path}/$name');
    return file;
  }

  static Future<void> openPdf(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
