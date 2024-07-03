// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram1/models/user.dart';

// class Post {
//   final String description;
//   final String uid;
//   final String username;
//   final likes;
//   final String postId;
//   final DateTime datePublished;
//   final String postUrl;
//   final String profImage;

//   const Post(
//       {required this.description,
//       required this.uid,
//       required this.username,
//       required this.likes,
//       required this.postId,
//       required this.datePublished,
//       required this.postUrl,
//       required this.profImage,
//       });

//   static Post fromSnap(DocumentSnapshot snap){
//     var snapshot = snap.data() as Map<String, dynamic>;
//     return Post(
//       description: snapshot["description"],
//       uid: snapshot["uid"],
//       likes: snapshot["likes"],
//       postId: snapshot["postId"],
//       datePublished: snapshot["datePublished"],
//       username: snapshot["username"],
//       postUrl: snapshot['postUrl'],
//       profImage: snapshot['profImage']
//     );
//   }

//    Map<String, dynamic> toJson() => {
//         "description": description,
//         "uid": uid,
//         "likes": likes,
//         "username": username,
//         "postId": postId,
//         "datePublished": datePublished,
//         'postUrl': postUrl,
//         'profImage': profImage
//       };
// }

class Post {
  final String description;
  final String uid;
  final String username;
  final likes;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;

  Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      description: json['description'],
      username: json["username"],
      uid: json["uid"],
      likes: json["likes"],
      postId: json["postId"],
      datePublished: json["datePublished"],
      postUrl: json['postUrl'],
      profImage: json['profImage'],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "likes": likes,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        'postUrl': postUrl,
        'profImage': profImage,
      };
}
