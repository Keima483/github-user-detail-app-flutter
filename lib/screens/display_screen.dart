import 'package:flutter/material.dart' ;
import 'package:github_user_detail_flutter/module/github_user.dart';
import 'package:github_user_detail_flutter/module/user_data.dart';
import 'package:github_user_detail_flutter/widgets/repo_list_viewer.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayScreen extends StatefulWidget {

  final User user ;
  final List<User> followersList ;
  final List<User> followingList ;
  final List<Repository> repoList ;

  DisplayScreen({
    @required this.user,
    @required this.followersList,
    @required this.followingList,
    @required this.repoList}) ;

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {

  bool showSpinner = false ;

  Widget getFolList(List<User> folList) {

    if(folList != null && folList.isNotEmpty) {

      return ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(folList[index].avatarUrl),),
              title: Text(folList[index].userName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
              trailing: IconButton(
                icon: Icon(Icons.open_in_new),
                onPressed: () {
                  UserData.openUserInBrowser(folList[index].userName, context);
                },
              ),
              onTap: () async {
                setState(() {
                  showSpinner = true ;
                });
                User userToSearch = await UserData.getUserName(folList[index].userName);
                List<User> userFollowersList = await UserData.getFollowerFollowingList(folList[index].userName, 'followers');
                List<User> userFollowingList = await UserData.getFollowerFollowingList(folList[index].userName, 'following');
                List<Repository> repositoryList = await UserData.getRepoList(folList[index].userName) ;

                if (userToSearch != null) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      DisplayScreen(
                        user: userToSearch,
                        followersList: userFollowersList,
                        followingList: userFollowingList,
                        repoList: repositoryList,
                      ),
                  ),
                  );
                  setState(() {
                    showSpinner = false ;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Network Error/API call Limit Exhausted"),
                  ));
                }
              }
            ) ;
          },
        itemCount: folList.length,
      ) ;
    } else {

      return Container(child: Center(child: Text('Empty', style: TextStyle(fontSize: 30)))) ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Github User Detail'),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(widget.user.avatarUrl),
                        radius: 30,
                      ),
                      title: Text(widget.user.name, style: TextStyle(fontSize: 25),),
                      subtitle: Text(widget.user.bio, style: TextStyle(fontSize: 13),),
                      trailing: IconButton(
                        icon: Icon(Icons.open_in_new),
                        onPressed: () {
                          UserData.openUserInBrowser(widget.user.userName, context);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.blue,
                tabs: [
                  Tab(text: "Repository",),
                  Tab(text: "Followers",),
                  Tab(text: "Following",),
                ],
              ),
              Expanded(
                flex: 5,
                  child: TabBarView(
                    children: [
                      RepoListViewer(repositoryList: widget.repoList),
                      getFolList(widget.followersList),
                      getFolList(widget.followingList),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
