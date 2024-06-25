// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, annotate_overrides, no_leading_underscores_for_local_identifiers, use_super_parameters, unnecessary_string_interpolations, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram1/providers/likd_users_provider.dart';
import 'package:instagram1/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class LikedUsersList extends StatefulWidget {
  final List<dynamic> listofuserids;
  const LikedUsersList({
    Key? key,
    required this.listofuserids,
  }) : super(key: key);
  @override
  State<LikedUsersList> createState() => _LikedUsersListState();
}

class _LikedUsersListState extends State<LikedUsersList> {
  @override
  void initState() {
    super.initState();
    print(
        "list of user ids while opening the screen is ${widget.listofuserids}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final _provider = Provider.of<LikedUsersProvider>(context, listen: false);
      _provider.fetchLikedUsersProfiles(widget.listofuserids);
    });
  }

  Widget build(BuildContext context) {
    return Consumer<LikedUsersProvider>(
        builder: (context, likedusersprovider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.5),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            "Likes",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          children: [
            Divider(
              color: Colors.grey,
              thickness: 0.4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "LIKED BY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "1000 likes",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.4,
            ),
            likedusersprovider.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: likedusersprovider.likedUsers.length,
                      itemBuilder: (context, Index) {
                        return UserProfileCard(
                          likedusersprovider.likedUsers[Index].photoUrl,
                          likedusersprovider.likedUsers[Index].username,
                          likedusersprovider.likedUsers[Index].password,
                          likedusersprovider.likedUsers[Index].followers,
                          likedusersprovider.likedUsers[Index].uid,
                        );
                      },
                    ),
                  )
          ],
        ),
      );
    });
  }

  Widget UserProfileCard(String imageurl, String username, String description,
      List<dynamic> followers, String uid) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(
              uid: uid,
            ),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            "$imageurl",
          ),
        ),
        title: Text(
          "$username",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "$description",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
        ),
        trailing: followers.contains(FirebaseAuth.instance.currentUser!.uid)
            ? GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Colors.white, width: 0.6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    child: Text(
                      "Following",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    "Follow",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
