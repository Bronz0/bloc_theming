part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
  List<Object> get props => [];
}

class PostFetched extends PostEvent {}
