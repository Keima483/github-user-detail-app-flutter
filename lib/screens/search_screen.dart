import 'package:flutter/material.dart';
import 'package:github_user_detail_flutter/constants.dart';
import 'package:github_user_detail_flutter/module/github_user.dart';
import 'package:github_user_detail_flutter/module/user_data.dart';
import 'package:github_user_detail_flutter/screens/display_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  String userName = "" ;
  bool showSpinner = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search User"),
      ),
      body: ModalProgressHUD (
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                onChanged: (value) {
                  userName = value ;
                },
                decoration: kUserSearchButton.copyWith(
                  hintText: "Enter github username"
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  onPressed: () async {
                    setState(() {
                      showSpinner = true ;
                    });
                    try {
                      User userToSearch = await UserData.getUserName(userName);
                      List<User> userFollowersList = await UserData.getFollowerFollowingList(userName, 'followers') ;
                      List<User> userFollowingList = await UserData.getFollowerFollowingList(userName, 'following') ;
                      List<Repository> repoList = await UserData.getRepoList(userName) ;

                      if(userToSearch != null) {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayScreen(
                            user: userToSearch,
                          followersList: userFollowersList,
                          followingList: userFollowingList,
                          repoList: repoList,
                        )));
                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("No such user found"),
                        ));
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch(e) {
                      print(e) ;
                    }
                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Get User Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                  child: Image.asset("images/Octocat.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
