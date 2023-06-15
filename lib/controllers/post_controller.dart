import 'dart:convert';
import 'dart:html';

import 'package:pertemuan_v/models/post.dart';
import 'package:pertemuan_v/services/post_service.dart';

class PostController {
  Future<List<Post>> fetchAll() async {
    return await PostService().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonBody = jsonDecode(res.body);
        return List.generate(
          jsonBody.length,
          (index) => Post.fromMap(
            jsonBody[index],
          ),
        );
      } else {
        throw Exception();
      }
      ;
    });
  }
}
