import 'dart:convert';

import 'package:api_test/model/photos_model/photos_model.dart';
import 'package:api_test/model/posts_model/posts_model.dart';
import 'package:api_test/widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel> postsList = [];
  List<PhotosModel> photosList = [];

  Future<List<PostsModel>> getPostAPI() async {
    postsList.clear();
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postsList.add(PostsModel.fromJson(i));
      }
      print('get Posts Completed');
      return postsList;
    } else {
      print('Posts not loaded');
      return postsList;
    }
  }

  Future<List<PhotosModel>> getPhotosAPI() async {
    photosList.clear();
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        photosList.add(PhotosModel.fromJson(i));
      }
      print('get Photos Completed');
      return photosList;
    } else {
      print('Photos not loaded');
      return photosList;
    }
  }

  Future<void> fetchData() async {
    await Future.wait([getPhotosAPI(), getPostAPI()]);
    // await getPhotosAPI();
    // await getPostAPI();
    print('Fetching completed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Test'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const ShimmerEffect();
              },
            );
          } else {
            return ListView.builder(
              itemCount: postsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    photosList[index].title.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(photosList[index].url.toString()),
                  ),
                  subtitle: Text(
                    postsList[index].body.toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
