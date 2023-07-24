import 'package:flutter/material.dart';
import '../api/simple_pdf_api.dart';
import '../api/paragraph_pdf_api.dart';
import '../api/table_pdf_api.dart';
import '../api/image_pdf_api.dart';

import '/save_and_open_pdf.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Pdf Package Flutter Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final simplePdfFile = await SimplePdfApi.generateSimpleTextPdf(
                    'Sample Text',
                    'Flutter Developer',
                  );
                  SaveAndOpenDocument.openPdf(simplePdfFile);
                },
                child: const Text('Simple Pdf'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final paragraphPdf =
                      await PdfParagraphApi.generateParagraphPdf();
                  SaveAndOpenDocument.openPdf(paragraphPdf);
                },
                child: const Text('Paragraph Pdf'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final tablePdf = await TablePdfApi.generateTablePdf();
                  SaveAndOpenDocument.openPdf(tablePdf);
                },
                child: const Text('Table Pdf'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final imagePdf = await ImagePdfApi.generateImagePdf();
                  SaveAndOpenDocument.openPdf(imagePdf);
                },
                child: const Text('Image Pdf'),
              ),
            ],
          ),
        ),
      );
}
