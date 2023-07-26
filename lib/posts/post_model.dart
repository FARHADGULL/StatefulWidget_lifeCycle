
//Model Class
class UserSettings {
  String language;
  UserSettings({required this.language});
}

//Model Class
class PostModel {
  late List<dynamic> posts;
  bool isLoading;
  
  PostModel({required this.posts, this.isLoading = false});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      posts: List<dynamic>.from(json['posts']),
    );
  }
  
}

