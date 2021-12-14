import 'package:flutter/material.dart';
import 'package:flutter_application/api/sheets/sales_sheet_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserSheetsApi.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google Sheets API';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Container(),
      );
}
