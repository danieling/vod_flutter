import 'package:http/http.dart' as http;

Future<String> getHotLink(Uri link) async {
  var response = await http.get(link);
  String master = '';

  if (response.statusCode == 200) {
    String htmlToParse = response.body;
    int i = htmlToParse.indexOf('sources: [{file:"') + 17;
    int j = htmlToParse.indexOf('asn=6568') + 8;
    master = htmlToParse.substring(i, j);
    print(master);
  }
  return master;
}
