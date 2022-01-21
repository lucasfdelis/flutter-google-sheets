import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/api/sheets/sales_sheet_api.dart';
import 'package:flutter_application/page/create_sheets_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserSheetsApi.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Registro de vendas';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: CreateSheetsPage(),
      );
}
