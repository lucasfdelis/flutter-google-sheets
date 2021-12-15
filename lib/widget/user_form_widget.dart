import 'package:flutter/material.dart';
import 'package:flutter_application/model/user.dart';

import 'button_widget.dart';

class UserFormWidget extends StatefulWidget {
  @override
  _UserFormWidgetState createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildName(),
          const SizedBox(height: 16),
          buildPrice(),
          const SizedBox(height: 16),
          buildSubmit(),
        ],
      );

  Widget buildName() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Produto',
          border: OutlineInputBorder(),
        ),
      );

  Widget buildPrice() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Preço',
          border: OutlineInputBorder(),
        ),
      );
  Widget buildSubmit() => ButtonWidget(
        text: 'Save',
        onClicked: () {},
      );
}
