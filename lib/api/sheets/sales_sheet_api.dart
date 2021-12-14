import 'package:flutter_application/model/user.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "gsheets-335013",
  "private_key_id": "d9dda79f1d71590c57e56da1ac319e08a9378019",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDxraiUevjLhqik\ntFRKQ8mtMYklIc0Co5tZKagi80Cr00dpVEh5OgW61C82TJapzcHvwcw4gbukWqXP\nGZXNeP/EKJmwttIyVPk+LCJQjtMKoYhEmt6aQ18Bdztlk6PWpzV31glfK+geN9oc\nHvWimW6gLR3TmEMpd8LDhfwFc6lf2Eh5Wy9FnaOLRVUEmFX03LO6iv5EEyK4XCSj\nRkXRNrtJnmgel4wrxvunPKZKyAqnDfyFeceyMbKnpg80m8KIJYk+V8rX15dLwdK/\ngcsWZry/W/jXqrwAUpYtU+aR+0YJexU/56bXenH2+8qRAss8e3YQGp9WJCm7q5F6\nuhPSHtNfAgMBAAECggEAOxqgtTtDuCaE/M67JHRikJAiPaoABKq1Vb9pxq5dvQfN\nGZXKqZcGirPUnf9qAzn2OWfYRWN4289taHIV4Cu8xSC2wXBchIGieNF7TN84/osV\nk82aLfjW9blOld9e/KJk4Zs/LH7E5Ar9tM3ffbXvR43xEuvUVQJcZ8vPIBgyrmTx\nXwJQqHeuqj2V6SI8BlcUoeFrCTvFYxgr1xfhY4ifL6yNN+uj0Ap4uEGUHyDebt7w\nFOvAc+HKbIPBg5Zvp/Ze0QrueGVkIyFnik3paNxdNRrvHRmcrN0NdMp64XvsgsB8\n2eyZuq1M/WnV+VlouCMROxNBXJpf4UGrzNWs8F2n3QKBgQD45jObzIKYZehQ9NZx\n5mzopYgjxmf/oFphPajPBCX4WGbEZLU0C1SeekN/f7e1lYAEss+nCRZHwVdIXwpH\npvd2cDTCenOHo+I8HwWfyfPSLvIWDgxiDZ1Uvi5NxuJitkTsNdLwHl6fa6D255Xs\nNEpwoLrldaBTWCqjO7Bz/dSEpQKBgQD4krhplqpW0S8bvML/l4T3IIK1AkaSbryk\noze6KqgMyV654WcKWoCdhHdSFWBQWEh22tZRUZ0T7JskF6vlCvKgjhMyGIkRqv7P\n3oHYDagMQC5mj3+0ISUCqiBjFhNSVuSsufir5710Nw3x2t7DKsqbfKOsnz9U23Lb\noVErQs2EswKBgAi+HUX1swijW7usPfQWQfESD2wiRfjmqwYLYmiTHrpQcJupZewE\nEd7XMJPD6rIIJE0F8uFNImk201gJbpUBumOAoXnLT0+OZB30gQAR2eyiFYLMz4aK\nL+KQI5Q7zivldxpM8bHZfz1eTHMfw1Zep9a47peswArtZ+H/8LzCR7q5AoGBAMmg\n+cVsWS+i7rtpGiOJHGn5DQ0Wk3gkKxDA9GsmPrpgfV354EMdtkYPNVp3zHBfrCf8\nyuubb/bBbfaQ3PYlMznZBOkVzdlvAtJKgrhmG3IUfY7jx4qtd//5T9wQBAw+P698\nCqImkB68qasNBrT4+O+24m0bn5uNhlVxPQ4CWgLRAoGAUSlLOB7HfmLIxWfXCGJR\nUCPLM6s++lbiiYyT8SBtUZh1OdsbMMU2GwqDOdiqm6NT6vpWMaNwnAnpCG2Ht0pR\nOaWNUx1Brzt/ugIPYSzlXHOsddKk/pug6pAb4hSO5Hxy27GW8wGsEImH3OgdaPk9\nzAgdGeVEDrBYGQz1vu6/C9k=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-335013.iam.gserviceaccount.com",
  "client_id": "101467843565577325967",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-335013.iam.gserviceaccount.com"
}
''';
  static final _spreadsheetId = '1s6p_lofchChFcJIu01cVtFtsnwjjHI6uYPoqoaXR6nY';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Vendas');

      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }
}
