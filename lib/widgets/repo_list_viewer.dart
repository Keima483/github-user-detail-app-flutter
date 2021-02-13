import 'package:flutter/material.dart';
import 'package:github_user_detail_flutter/module/github_user.dart';
import 'package:github_user_detail_flutter/module/user_data.dart';

class RepoListViewer extends StatelessWidget {

  final List<Repository> repositoryList ;

  RepoListViewer({@required this.repositoryList});

  @override
  Widget build(BuildContext context) {
    return repositoryList != null && repositoryList.isNotEmpty ?
    ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(repositoryList[index].repoName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Align(
                      child: Text(
                        repositoryList[index].description,
                        style: TextStyle(fontSize: 15),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Align(
                      child: Text(
                        repositoryList[index].language,
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      alignment: Alignment.centerRight,
                    )
                  ],
                ),
                onTap: () {
                  UserData.launchURL(repositoryList[index].repoURL , context) ;
                },
              ) ;
            },
          itemCount: repositoryList.length,
        )
        : Container(child: Center(child: Text('No Repository', style: TextStyle(fontSize: 30)))) ;
  }
}
