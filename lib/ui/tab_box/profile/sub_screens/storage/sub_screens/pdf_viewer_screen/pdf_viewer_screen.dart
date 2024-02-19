import 'package:flutter/material.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({super.key});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  String pdfFileName = 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf';
  String docFileName = "assets/svg/others/shaxboz.doc";
  String docFileNames = "https://espace.cern.ch/amici/Public%20Documents/How%20to%20create%20URL%20to%20public%20document.docx";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
      ),
        body: SfPdfViewer.network(
            pdfFileName,
        ));
  }
}
