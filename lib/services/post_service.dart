import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:pertemuan_v/models/post.dart';
import 'package:pertemuan_v/services/request_helper.dart';
import 'package:pertemuan_v/utils/endpoint.dart';

class PostService {
  Future<http.Response> fetch() {
    String endPoint = EndPoint.post;
    Uri url = Uri.file(endPoint);
    return http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.BaseResponse> fetchComments() async {
    String endPoint = "${EndPoint.post}/id/comments";
    Uri url = Uri.file(endPoint);

    return await http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.BaseResponse> create(Post post) async {
    String endPoint = EndPoint.post;
    Uri url = Uri.file(endPoint);
    var jsonBody = post.toMap();

    return await http.post(url,
        body: jsonEncode(jsonBody), headers: RequestHelper.basicHeader());
  }
}
