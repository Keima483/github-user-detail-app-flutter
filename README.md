# GitHub user details app

A pleasant looking flutter app to get details of a github user like name, bio, followers and following list\
[click here to run it in your browser](https://github-user-search-398ee.web.app/) \
or go to https://github-user-search-398ee.web.app/

## Features:

### First push:
1. A simple and smooth interface which is pleasing to look at
2. Good exception handling so your app doesn't crash when you need it the most
3. This app provides you the the name, bio, followers and following list of the user you search for
4. Every user card displayes in the following and followers list is clickable and will redirect you to that user's profile

### Update 0.1:
1. Added Icon buttons beside all the ListTile, i mean all the list items of the followers and following have an Icon button now, which on clicked will open that person's profile in your default browser or GitHub app if you have it installed in your devide
2. Added a Repository tab containing list of all repositories with there name, description and the language they are write in
3. Repo Tab list items area also clickable and will lead you to the github webpage of that repository

## ScreenShots:
<img src ="images/search_screen.jpg" width = 360>  <img src ="images/followers.jpg" width = 360>
<img src ="images/following.jpg" width = 360> <img src ="images/repo.jpg" width = 360>

## Packages Used :
* **http** [http: ^0.12.2](https://pub.dev/packages/http)
* **modal_progress_hud** [modal_progress_hud: ^0.1.3](https://pub.dev/packages/modal_progress_hud)
* **url_launcher** [url_launcher: ^5.7.10](https://pub.dev/packages/url_launcher)

## API used :

[GitHub APi](https://api.github.com/users/keima483) : https://api.github.com/users/keima483  (replace my username with your and you are ready to go)

Also Special Thanks to [Sarthak Bhatnagar](https://github.com/sarthak7509) for testing the app and giving his valuable feedbacks on it
