import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';


import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
String Email="";
 String path="";
  Future<String> Extracttext()async{
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return "";
    final files = result.files;
    path = files.first.path.toString();
    print(path);
    PlatformFile file = result.files.first;

    String name=file.name;
    print("name");
    print(name);
// Assuming you have the PDF file as bytes
    final pdfFileBytes = await File(path.toString()).readAsBytes();
    final document = PdfDocument(inputBytes: pdfFileBytes);
// Extract the text from the PDF
    final extractor = PdfTextExtractor(document);
    final extractedText = extractor.extractText();
    print(extractedText);
    return extractedText;
  }
Future<String> ExtracttextReport()async{






// Assuming you have the PDF file as bytes
  final pdfFileBytes = await File(path.toString()).readAsBytes();
  final document = PdfDocument(inputBytes: pdfFileBytes);
// Extract the text from the PDF
  final extractor = PdfTextExtractor(document);
  final extractedText = extractor.extractText();
  print(extractedText);
  return extractedText;
}
Future<String> summarizeText(String text) async {
  var response;
    try{
       response = await http.post(
        Uri.parse('http://192.168.1.13:8000/summarize'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode({'text': text}),
      );
       print("hasssssssan");
    }
    catch(e)
  {
    print("erro");
    print(e);
  }


  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = json.decode(response.body);
    return responseData['summary'];
  } else {
    throw Exception('Failed to summarize text');
  }
  }


