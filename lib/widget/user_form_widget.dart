import 'package:flutter/material.dart';
import 'package:flutter_application/model/user.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_application/store/tema.store.dart';
import 'package:provider/provider.dart';
import 'button_widget.dart';

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
    final store = Provider.of<TemaStore>(context);
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
              text: 'Save',
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
            ButtonWidget(
              text: 'oi',
              onClicked: store.clique,
            ),
            const SizedBox(height: 16),
            Text(
              '${store.clicado}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
