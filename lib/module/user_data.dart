import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_user_detail_flutter/module/github_user.dart';
import 'package:http/http.dart' as http ;
import 'package:url_launcher/url_launcher.dart';

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

  static Future  getRepoList(String userName) async {

    var repoListResponse = await getResponse(userName + '/repos') ;
    if(repoListResponse != null) {

      List<Repository> repoList = [] ;

      for(var repo in repoListResponse) {

        repoList.add(
          new Repository(
              repo['name'],
              repo['description'] != null ? repo['description'] : 'NO description' ,
              repo['language'] != null ? repo['language'] : 'Unknown',
              repo['html_url']
          )
        ) ;
      }
      return repoList ;
    } else {
      return null ;
    }
  }

  static void openUserInBrowser(String userName, BuildContext context) async {
    const url = 'https://github.com/';
    launchURL(url + userName, context) ;
  }

  static void launchURL(String url, BuildContext context) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Can't access Github right now"),
      ));
    }
  }
}