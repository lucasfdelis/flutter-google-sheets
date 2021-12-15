import 'package:flutter_application/api/sheets/sales_sheet_api.dart';
import 'package:flutter_application/model/user.dart';
import 'package:flutter_application/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';
import 'package:flutter_application/widget/user_form_widget.dart';

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
