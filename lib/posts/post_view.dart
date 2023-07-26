//Min Functionality
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/posts/post_controller.dart';
import 'post_model.dart';

class PostWidget extends StatefulWidget {
  final UserSettings userSettings;

  const PostWidget({super.key, required this.userSettings});

  @override
  // ignore: library_private_types_in_public_api
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late PostController _controller;

  // Step 2: Initialization
  @override
  void initState() {
    super.initState();
    _controller = PostController(userSettings: widget.userSettings);
    _controller.init();
  }

  // Step 3: Dependencies
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.handleLanguageChange();
  }

  // Step 4: Build
  @override
  Widget build(BuildContext context) {
    print('Step 4: build - Building the UI');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Column(
  children: [
    Expanded(
      child: FutureBuilder(
        future: _controller.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return _controller.model.posts.isEmpty
                ? const Center(child: Text('No posts found.'))
                : _buildPostList(_controller.model.posts);
          }
        },
      ),
    ),
    ElevatedButton(
      onPressed: () {
        Get.toNamed('/language_view');
      },
      child: const Text('Go to Language View'),
    ),
  ],
),

    );
  }

  Widget _buildPostList(List<dynamic> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        print('Step 4: build - Building post list item $index');
        final post = posts[index];
        return ListTile(
          title: Text(post['title']),
          subtitle: Text(post['body']),
        );
      },
    );
  }

  // Step 6: Deactivation
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}