import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/posts_fetch_cubit.dart';
import 'package:helloworld/model/post_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PostModel>? postList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostsFetchCubit>(context).fetchPostApi();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Api Post Data"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<PostsFetchCubit, PostsFetchState>(
          builder: (context, state) {
            if (state is PostsFetchLoading) {
              return const CircularProgressIndicator();
            } else if (state is PostsFetchError) {
              return Text(state.failure.message);
            } else if (state is PostsFetchLoaded) {
              final postListData = state.postsList;
              return postListData.isEmpty
                  ? const Text("No Data Available")
                  : ListView.builder(
                      itemCount:state.props.length,
                      itemBuilder: ((context, index) {
                        final PostModel singleItem = postListData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Text("${singleItem.id}")),
                            title: Text(
                              "${singleItem.title?.toUpperCase()}",
                              maxLines: 2,
                            ),
                            subtitle: Text(
                              "${singleItem.body?.toLowerCase()}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      }),
                    );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
