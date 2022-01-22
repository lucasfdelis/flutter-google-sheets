import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/api/sheets/sales_sheet_api.dart';
import 'package:flutter_application/page/create_sheets_page.dart';
import 'package:flutter_application/store/tema.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

final store = TemaStore();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserSheetsApi.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TemaStore>(
          create: (_) => TemaStore(),
        )
      ],
      child: Observer(
        builder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'oi',
          theme: ThemeData.dark(),
          home: CreateSheetsPage(),
        ),
      ),
    );
  }
}
