part of 'posts_fetch_cubit.dart';

abstract class PostsFetchState extends Equatable {
  const PostsFetchState();

  @override
  List<Object> get props => [];
}

class PostsFetchInitial extends PostsFetchState {}

class PostsFetchLoading extends PostsFetchState {}

class PostsFetchLoaded extends PostsFetchState {
  final List<PostModel> postsList;

  const PostsFetchLoaded({
    required this.postsList,
  });
  @override
  List<Object> get props => [postsList];
}

class PostsFetchError extends PostsFetchState {
  final Failure failure;

  const PostsFetchError(
    this.failure,
  );
  @override
  List<Object> get props => [failure];
}
