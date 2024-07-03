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
  @override
  void initState() {
    super.initState();
    print("The saved post IDs we got are: ${widget.savedPostsIds}");
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
      body: widget.savedPostsIds == null || widget.savedPostsIds!.isEmpty
          ? Center(
              child: Text(
                "No saved posts",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: widget.savedPostsIds!.length,
              itemBuilder: (ctx, index) {
                String postId = widget.savedPostsIds![index];
                return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('posts')
                      .doc(postId)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return Container();
                    }
                    var postData = snapshot.data!.data();
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: width > webScreenSize ? width * 0.3 : 0,
                        vertical: width > webScreenSize ? 15 : 0,
                      ),
                      child: PostCard(
                        snap: postData!,
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
