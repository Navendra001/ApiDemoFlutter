import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:helloworld/api_services.dart';
import 'package:helloworld/model/failure_model.dart';
import '../model/post_model.dart';

part 'posts_fetch_state.dart';

class PostsFetchCubit extends Cubit<PostsFetchState> {
  PostsFetchCubit() : super(PostsFetchInitial());

  Future<void> fetchPostApi() async {
    // emit(PostsFetchLoading());

    try {
      final List<PostModel>? postList = await ApiServices().getPostData();
      emit(PostsFetchLoaded(postsList: postList ?? []));
    } on Failure catch (err) {
      emit(PostsFetchError(err));
    } catch (e) {
      throw ("Error $e");
    }
  }
}
