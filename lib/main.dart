import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/screens/homepage.dart';
import 'package:helloworld/screens/practice.dart';
// import 'package:helloworld/screens/practice.dart';

import 'cubit/posts_fetch_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsFetchCubit>(
          create: (context) => PostsFetchCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.redAccent)),
        home: const UpdateApi(),
        // const MyHomePage(),
      ),
    );
  }
}
