import 'package:translator/translator.dart';

class TranslationAPI {
  static Future<String> translate(
      String msg, String fromLangCode, String toLangCode) async {

    final translation = await GoogleTranslator()
        .translate(msg, from: fromLangCode, to: toLangCode);

    return translation.text;
  }
}
