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
  String pdfFilesName = 'https://medify-s3-cloud-storage.s3.ap-southeast-1.amazonaws.com/Mdist/b2103578/9016347_2714106.ru.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAZI2LB3OEYIVCFWDZ%2F20240513%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240513T142940Z&X-Amz-Expires=900&X-Amz-Signature=c4dbceff953985126d6afee6b26371e89bff206b828c52f25415f693f8492ad5&X-Amz-SignedHeaders=host&x-id=GetObject';
  String docFileName = "assets/svg/others/shaxboz.doc";
  String docFileNames = "https://espace.cern.ch/amici/Public%20Documents/How%20to%20create%20URL%20to%20public%20document.docx";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SfPdfViewer.network(
        pdfFilesName,
      ),
    );
  }
}
