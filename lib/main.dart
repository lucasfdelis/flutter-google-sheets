import 'package:flutter/material.dart';
import 'package:flutter_application/api/sheets/sales_sheet_api.dart';
import 'package:flutter_application/store/tema.store.dart';
import 'package:flutter_application/widget/button_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/model/user.dart';

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
          title: 'Vendas',
          theme: store.clicado
              ? ThemeData(
                  primarySwatch: Colors.blue,
                  brightness: Brightness.light,
                )
              : ThemeData(
                  primarySwatch: Colors.red,
                  brightness: Brightness.dark,
                ),
          home: CreateSheetsPage(),
        ),
      ),
    );
  }
}

class CreateSheetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendas'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        // color: store.clicado ? Colors.white : Colors.black12,
        child: UserFormWidget(
          onSavedUser: (user) async {
            await UserSheetsApi.insert([user.toJson()]);
          },
        ),
      ),
    );

    // Future insertUsers() async {
    //   await UserSheetsApi.insert();
    // }
  }
}

class UserFormWidget extends StatefulWidget {
  final ValueChanged<User> onSavedUser;

  const UserFormWidget({
    Key? key,
    required this.onSavedUser,
  }) : super(key: key);
  @override
  _UserFormWidgetState createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerPrice;
  late TextEditingController controllerPay;

  @override
  void initState() {
    super.initState();

    initUser();
  }

  void initUser() {
    controllerName = TextEditingController();
    controllerPay = TextEditingController();
    controllerPrice = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Observer(
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controllerName,
              decoration: InputDecoration(
                labelText: 'Produto',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.isEmpty
                  ? 'Escreva o nome do produto'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controllerPrice,
              decoration: InputDecoration(
                labelText: 'Preço',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.isEmpty
                  ? 'Escreva o preço do produto'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controllerPay,
              decoration: InputDecoration(
                labelText: 'Tipo de pagamento',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.isEmpty
                  ? 'Escreva a forma de pagamento do produto'
                  : null,
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              text: 'Salvar',
              onClicked: () {
                final form = formKey.currentState!;
                final isValid = form.validate();

                if (isValid) {
                  final user = User(
                    produto: controllerName.text,
                    preco: controllerPrice.text,
                    pagamento: controllerPay.text,
                  );
                  widget.onSavedUser(user);
                }
              },
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                color: store.clicado ? Colors.blue : Colors.red,
                shape: CircleBorder(),
                onPressed: store.clique,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(store.clicado
                      ? Icons.light_mode_outlined
                      : Icons.mode_night_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
