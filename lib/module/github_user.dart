class User {

  String _name ;
  String _avatarUrl ;
  String _bio ;
  String _userName ;

  User(this._name, this._avatarUrl, this._bio, this._userName);

  String get name => _name;

  String get avatarUrl => _avatarUrl;

  String get bio => _bio;

  String get userName => _userName ;

  @override
  String toString() {
    return 'Name = $_userName' ;
  }
}

class Repository {

  String repoName ;
  String description ;
  String language ;
  String repoURL ;

  Repository(this.repoName, this.description, this.language, this.repoURL);
}