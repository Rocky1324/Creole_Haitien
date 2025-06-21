import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon App Web',
      home: WebApp(),
    );
  }
}

class WebApp extends StatefulWidget {
  @override
  _WebAppState createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  String htmlContent = '';

  @override
  void initState() {
    super.initState();
    loadHtml();
  }

  Future<void> loadHtml() async {
    String fileHtml = await rootBundle.loadString('assets/my web/du.html');
    setState(() {
      htmlContent = fileHtml;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: htmlContent.isEmpty
          ? Center(child: CircularProgressIndicator())
          : InAppWebView(
              initialData: InAppWebViewInitialData(
                data: htmlContent,
                baseUrl: WebUri("http://localhost"),
                encoding: "utf-8",
                mimeType: "text/html",
              ),
            ),
    );
  }
}    