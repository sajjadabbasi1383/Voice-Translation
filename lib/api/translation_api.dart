import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';

class TranslationAPI {
  static Future<String> translate(
      String msg, String fromLangCode, String toLangCode) async {

    final translation = await GoogleTranslator()
        .translate(msg, from: fromLangCode, to: toLangCode);

    return translation.text;
  }
}
