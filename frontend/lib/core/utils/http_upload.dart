import 'package:http/http.dart' as http;

Future<http.StreamedResponse> _sendMultipartRequest(
    String url, String filePath, Map<String, dynamic> params) async {
  var request = http.MultipartRequest('POST', Uri.parse(url));
  request.files.add(await http.MultipartFile.fromPath('file', filePath));
  params.forEach((key, value) {
    request.fields[key] = value.toString();
  });
  return await request.send();
}

Future<String> fetchData(String filePath, Map<String, dynamic> params) async {
  var response = await _sendMultipartRequest(
      'http://localhost:8000/predict/data', filePath, params);

  if (response.statusCode == 200) {
    return await response.stream.bytesToString();
  } else {
    throw Exception(
        'Failed to fetch data with status code: ${response.statusCode}');
  }
}
