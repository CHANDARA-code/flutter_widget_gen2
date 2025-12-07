import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
/**
 * 
 * 
 * 
{
"results": [
{
"name": {
"title": "Mr",
"first": "Felix",
"last": "Andersen"
},
"email": "felix.andersen@example.com"
}
],
"info": {
"seed": "f7194cb06a60d33c",
"results": 1,
"page": 1,
"version": "1.4"
}
}
***/

// https://randomuser.me/api/?inc=name,email

// Data Class
class UserInfo {
  String? name;
  String? email;
  UserInfo({this.name, this.email});
  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      name:
          "${json['name']["title"]} ${json['name']["first"]}  ${json['name']["last"]}}",
      email: "${json['email']}",
    );
  }
}

class FetchApiFutureBuilder extends StatefulWidget {
  const FetchApiFutureBuilder({super.key});

  @override
  State<FetchApiFutureBuilder> createState() => _FetchApiFutureBuilderState();
}

class _FetchApiFutureBuilderState extends State<FetchApiFutureBuilder> {
  late Future<UserInfo> fetchUser;

  @override
  void initState() {
    fetchUser = fetchUserInfo();
    super.initState();
  }

  Future<UserInfo> fetchUserInfo() async {
    try {
      final api = 'https://randomuser.me/api/?inc=name,email';
      final response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        // Success
        final dataJson = jsonDecode(response.body);
        List<dynamic> result = dataJson['results'];
        return UserInfo.fromJson(result[0]);
      } else {
        throw Exception("Cannot Get User Profile");
      }
    } catch (e) {
      throw Exception("Cannot Get User Profile");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fetch With Future Builder")),
      body: FutureBuilder(
        future: fetchUser,
        builder: (context, asyncSnapshot) {
          print("Async Snapshot: $asyncSnapshot");

          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (asyncSnapshot.hasError) {
            final error = asyncSnapshot.error.toString();
            return Center(child: Text("Error Fetching $error"));
          } else if (asyncSnapshot.connectionState == ConnectionState.done) {
            final user = asyncSnapshot.data;
            if (user == null) return Center(child: Text("User Info Get Null"));
            return Column(
              children: [
                Text("Name: ${user.name}"),
                Text("Email: ${user.email}"),
              ],
            );
          }
          return Center(child: Text("Unxpected Error"));
        },
      ),
    );
  }
}
