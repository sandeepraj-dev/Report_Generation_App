// import 'package:pdf/widgets.dart' as pw;
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

// class PdfInvoiceService {
//   static Future<File> generate(String text) async {
//     final pdf = pw.Document();
//     pdf.addPage(pw.Page(build: (_) => pw.Text(text)));

//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/invoice.pdf');
//     await file.writeAsBytes(await pdf.save());
//     return file;
//   }
// }
