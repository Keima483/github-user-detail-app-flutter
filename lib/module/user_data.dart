import 'dart:convert';
import 'package:github_user_detail_flutter/module/github_user.dart';
import 'package:http/http.dart' as http ;

class UserData {

  static String url = "https://api.github.com/users/" ;

  static Future getResponse(String userName) async {

    var response = await http.get(url + userName.trim()) ;
    if(response.statusCode < 299) {
      return jsonDecode(response.body) ;
    } else {
      print('ERROR') ;
      return null ;
    }
  }

  static Future getUserName(String userName) async {

    var jsonObject = await getResponse(userName) ;
    if(jsonObject != null) {
      return new User(
          jsonObject['name'] != null ? jsonObject['name'] : "No name",
          jsonObject['avatar_url'],
          jsonObject['bio'] != null ? jsonObject['bio'] : "No bio" ,
          jsonObject['login']
      ) ;
    } else {
      return null ;
    }
  }
  
  static Future getFollowerFollowingList(String userName, String listType) async {
    
    var folListJson = await getResponse(userName + "/$listType") ;
    if(folListJson != null) {

      List<User> folList = [] ;
      for(var user in folListJson) {
        folList.add(
          new User(
              "",
              user['avatar_url'],
              "",
              user['login']
          )
        );
      }
      return folList ;
    } else {
      return null ;
    }
  }
}