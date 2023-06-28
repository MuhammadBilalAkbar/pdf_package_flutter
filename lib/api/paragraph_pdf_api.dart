import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '/save_and_open_pdf.dart';

class PdfParagraphApi {
  static Future<File> generateParagraphPdf() async {
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          customHeader(),
          customHeadline(),
          createLink(),
          ...bulletPoints(),
          Header(text: 'Pdf Paragraph'),
          Paragraph(text: LoremText().paragraph(60)),
          Paragraph(text: LoremText().paragraph(180)),
          Paragraph(text: LoremText().paragraph(60)),
          Paragraph(text: LoremText().paragraph(60)),
        ],
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';
          return Container(
            margin: const EdgeInsets.only(top: PdfPageFormat.cm),
            alignment: Alignment.center,
            child: Text(text),
          );
        },
      ),
    );
    return SaveAndOpenDocument.saveDocument(
        name: 'paragraph_pdf.pdf', pdf: pdf);
  }

  static Widget customHeader() => Container(
        padding: const EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2, color: PdfColors.blue),
          ),
        ),
        child: Row(
          children: [
            PdfLogo(),
            SizedBox(width: 0.5 * PdfPageFormat.cm),
            Text(
              'Create your pdf',
              style: const TextStyle(fontSize: 20, color: PdfColors.blue),
            ),
          ],
        ),
      );

  static Widget customHeadline() => Header(
        child: Text(
          'Another headline',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: PdfColors.white,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(color: PdfColors.red),
      );

  static Widget createLink() => UrlLink(
        child: Text(
          'Go to heyflutter.com',
          style: const TextStyle(color: PdfColors.blue),
        ),
        destination: 'https://heyflutter.com',
      );

  static List<Widget> bulletPoints() => [
        Bullet(text: 'First bullet'),
        Bullet(text: 'Second bullet'),
        Bullet(text: 'Third bullet'),
      ];
}
