import 'package:flutter/material.dart';
import 'package:helloworld/api_services.dart';
import 'package:helloworld/model/post_model.dart';

class UpdateApi extends StatefulWidget {
  const UpdateApi({Key? key}) : super(key: key);

  @override
  State<UpdateApi> createState() => _UpdateApiState();
}

class _UpdateApiState extends State<UpdateApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Get Data;
                ElevatedButton(
                    onPressed: () async {
                      var output = await ApiServices().getPostData();
                      print("Get Data done : > ${output![1].title}");
                    },
                    child: const Text("Get Request")),

                ElevatedButton(
                    onPressed: () async {
                      PostModel obj1 = PostModel(
                        userId: 1,
                        id: 100,
                        title: "Hello I Am New Here",
                        body: "All Good",
                      );
                      var output = await ApiServices().postData("/posts", obj1);
                      if (output == null) return;
                      print("Post Data done : > ${output.title}");
                    },
                    child: const Text("Post Request")),

                ElevatedButton(
                    onPressed: () async {
                      PostModel obj1 = PostModel(
                        // id: 1,
                        userId: 1,
                        title: "Hello I Am New York",
                        body: "All Good",
                      );
                      var output =
                          await ApiServices().putData("/posts/1", obj1);
                      if (output == null) return;
                      print("Put Data done : > ${output.title}");
                    },
                    child: const Text("Put Request")),

                ElevatedButton(
                    onPressed: () async {
                      var response = await ApiServices().deleteData("/posts/1");
                      if (response == null) return;

                      print(response);
                    },
                    child: const Text("Delete Request")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
