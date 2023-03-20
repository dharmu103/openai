import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Api {
  var url = Uri.parse('https://api.openai.com/v1/completions');
  var headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer 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',
  };

  Future getData(input, maxlength, temp) async {
    var data =
        '{\n  "model": "text-davinci-002",\n  "prompt": "$input",\n  "temperature": $temp,\n  "max_tokens": $maxlength,\n  "top_p": 1,\n  "frequency_penalty": 0.2,\n  "presence_penalty": 0\n}';
    var res = await http.post(url, headers: headers, body: data);
    if (res.statusCode != 200) {
      Get.snackbar('Error', res.statusCode.toString());
    }
    print(res.body);
    return res;
  }
}
