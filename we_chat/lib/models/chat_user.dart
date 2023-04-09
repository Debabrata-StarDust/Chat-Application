import 'package:flutter/material.dart';

class Chatuser {
// Lets create a constructor 
  Chatuser({
    required this.image,
    required this.about,
    required this.createdAt,
    required this.isOnline,
    required this.id,
    required this.lastActive,
    required this.email,
    required this.pushToken,
  });

// declare the variable
  late final String image;
  late final String about;
  late final String createdAt;
  late final bool isOnline;
  late final String id;
  late final String lastActive;
  late final String email;
  late final String pushToken;

// that is function to jsondata to dart, when we take the data from the server
// its take the data from the server json format and give it us as a dart format
// get method
  Chatuser.fromjson(Map<String, dynamic> json) {
    image = json['image'];
    about = json['about'];
    createdAt = json['createdAt'];
    isOnline = json['isOnline'];
    id = json['id'];
    lastActive = json['lastActive'];
    email = json['email'];
    pushToken = json['pushToken'];
  }

// dart to json data when we send the data to the server
// its take custom object and send to the server as a json format
// post method
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["image"] = image;
    data['about'] = about;
    data['createdAt'] = createdAt;
    data['isOnline'] = isOnline;
    data['id'] = id;
    data['lastActive'] = lastActive;
    data['email'] = email;
    data['pushToken'] = pushToken;
    return data;
  }
}
