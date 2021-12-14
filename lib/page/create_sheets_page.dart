import 'dart:html';
import 'package:flutter_application/api/sheets/sales_sheet_api.dart';
import 'package:flutter_application/model/user.dart';
import 'package:flutter_application/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';

class CreateSheetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          child: ButtonWidget(
            text: 'Save',
            onClicked: () async {
              final user = {
                UserFields.data: 1,
                UserFields.produto: 'óleo',
                UserFields.preco: '12,95',
                UserFields.pagamento: 'Crédito',
              };
              await UserSheetsApi.insert([user]);
            },
          ),
        ),
      );
}
