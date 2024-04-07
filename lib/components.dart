import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'dart:convert';
import 'dart:io';


import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
String Email="";
  Future<String> Extracttext()async{
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return "";
    final files = result.files;
    final path = files.first.path.toString();
// Assuming you have the PDF file as bytes
    final pdfFileBytes = await File(path.toString()).readAsBytes();
    final document = PdfDocument(inputBytes: pdfFileBytes);
// Extract the text from the PDF
    final extractor = PdfTextExtractor(document);
    final extractedText = extractor.extractText();
    print(extractedText);
    return extractedText;
  }




