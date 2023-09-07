import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:api_call_using_bloc_pattern/features/posts/modles/posts_data_ui_modles.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200));
    emit(PostFetchingLoadingState());
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        // adding json data to dart model using fromMap
        PostDataUiModel post =
            PostDataUiModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      print(posts);
      emit(PostFetchingSuccesfull(post: posts));
    } catch (e) {
      print(e.toString());
    }
  }
}
