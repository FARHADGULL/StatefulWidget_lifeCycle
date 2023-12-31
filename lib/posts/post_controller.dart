import 'package:new_project/posts/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostController {
  final PostModel model;
  final UserSettings userSettings;

  PostController({required this.userSettings}) : model = PostModel(posts: []);

  Future<void> init() async {
    print('Step 2: initState - Initializing the controller');
    await fetchPosts();
  }

  // Step 5: State Update
  Future fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        model.posts = json.decode(response.body);
        print('Step 5: setState - Posts fetched successfully.');
      } else {
        print('Step 5: setState - Failed to fetch posts. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Step 5: setState - Error while fetching posts: $error');
    }
  }

  void handleLanguageChange() {
    if (userSettings.language == 'en') {
      print('Step 3: didChangeDependencies - Language preference changed to English.');
      // Performing actions specific to English language preference
    } else if (userSettings.language == 'fr') {
      print('Step 3: didChangeDependencies - Language preference changed to French.');
      // Performing actions specific to French language preference
    } else if (userSettings.language == 'de') {
      print('Step 3: didChangeDependencies - Language preference changed to German.');
      // Performing actions specific to German language preference
    } else if (userSettings.language == 'es') {
      print('Step 3: didChangeDependencies - Language preference changed to Spanish.');
      // Performing actions specific to Spanish language preference
    } else if (userSettings.language == 'zh') {
      print('Step 3: didChangeDependencies - Language preference changed to Chinese.');
      // Performing actions specific to Chinese language preference
    }
  }

   // Step 7: Disposal
   void dispose() {
    print('Step 7: dispose - Widget disposed');
    http.Client().close();
  }
}