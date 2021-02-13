# GitHub user details app

A pleasant looking flutter app to get details of a github user like name, bio, followers and following list

## Features:

### First push:
1. A simple and smooth interface which is pleasing to look at
2. Good exception handling so your app doesn't crash when you need it the most
3. This app provides you the the name, bio, followers and following list of the user you search for
4. Every user card displayes in the following and followers list is clickable and will redirect you to that user's profile

### Updates 0.1:
1. Now the app will also give you a list of the repositories of the user you searched for in the form of a ListView in which every tile is clickable and will lead you to the link of that repository in your browser
2. In this new push i have added clickable icon beside every follower and following list tile which will lead the user to the github profie page of that user
3. The icon button is also implemented for the user you searched for

## ScreenShots:
<img src ="images/search_screen.jpg" width = 360>  <img src ="images/followers.jpg" width = 360>
<img src ="images/following.jpg" width = 360> <img src ="images/repo.jpg" width = 360>
## Packages Used :
* **http** [http: ^0.12.2](https://pub.dev/packages/http)
* **modal_progress_hud** [modal_progress_hud: ^0.1.3](https://pub.dev/packages/modal_progress_hud)
* **url_launcher** [url_launcher: ^5.7.10](https://pub.dev/packages/url_launcher)

## API used :

[GitHub APi](https://api.github.com/users/keima483) : https://api.github.com/users/keima483  (replace my username with your and you are ready to go)

Special Thanks to [Sarthak Bhatnagar](https://github.com/sarthak7509) for acting as a tester for this app