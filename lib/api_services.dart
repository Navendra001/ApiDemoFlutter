import 'dart:convert';
import 'dart:developer';
import 'package:helloworld/model/post_model.dart';
import 'package:http/http.dart' as http;

// here  is the example of how to fetch data of List<Map<String , Dynamics>>  api link : "https://jsonplaceholder.typicode.com/posts";
// in List

class ApiServices {
  Future<List<PostModel>?> getPostData() async {
    try {
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        Map<String, dynamic> output = {"posts": data};
        PostListModel model = PostListModel.fromJson(output);
        return model.posts;
      }
    } catch (e) {
      log("Error getPostData $e");
    }
    return null;
  }

  var baseUri = "https://jsonplaceholder.typicode.com";
  Future<PostModel?> postData(String endUrl, dynamic object) async {
    try {
      var payload = jsonEncode(object);
      var uri = Uri.parse(baseUri + endUrl);
      var response = await http.post(
        uri,
        body: payload,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 201) {
        PostModel modal = PostModel.fromJson((jsonDecode(response.body)));
        return modal;

      }
    } catch (e) {
      log("Error postData $e");
    }
    return null;
  }

  Future<PostModel?> putData(String endUrl, dynamic object) async {
    try {
      var payload = jsonEncode(object);
      var uri = Uri.parse(baseUri + endUrl);
      var response = await http.put(
        uri,
        body: payload,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        PostModel modal = PostModel.fromJson((jsonDecode(response.body)));
        return modal;

      }
    } catch (e) {
      log("Error putData $e");
    }
    return null;
  }
    Future<String?> deleteData(String endUrl)async {
     try {
       var uri = Uri.parse(baseUri + endUrl);
       var response = await http.delete(
         uri,
         headers: {
           'Content-Type': 'application/json; charset=UTF-8',
         },
       );
       if (response.statusCode == 200) {
         print(response.body);
         return response.body;

       }
     } catch (e) {
       log("Error deleteData $e");
     }
     return null;

   }


}
