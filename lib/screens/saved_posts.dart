// ignore_for_file: annotate_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/utils/dimensions.dart';
import 'package:instagram1/widgets/post_card.dart';

class SavedPosts extends StatefulWidget {
  final List? savedPostsIds; // List<String> to hold post IDs
  const SavedPosts({Key? key, required this.savedPostsIds}) : super(key: key);
  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  late Future<List<DocumentSnapshot<Map<String, dynamic>>>> _postsFuture;
  @override
  void initState() {
    super.initState();
    print("The saved post IDs we got are: ${widget.savedPostsIds}");
    _postsFuture = _fetchSavedPosts();
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      _fetchSavedPosts() async {
    if (widget.savedPostsIds == null || widget.savedPostsIds!.isEmpty) {
      return [];
    }
    return Future.wait(widget.savedPostsIds!.map((postId) {
      return FirebaseFirestore.instance.collection('posts').doc(postId).get();
    }));
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Text(
          "Saved Posts",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<DocumentSnapshot<Map<String, dynamic>>>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error loading posts"),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No saved posts",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          var posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (ctx, index) {
              var postData = posts[index].data();
              if (postData == null) {
                return Container();
              }
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width > webScreenSize ? width * 0.3 : 0,
                  vertical: width > webScreenSize ? 15 : 0,
                ),
                child: PostCard(
                  snap: postData,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
