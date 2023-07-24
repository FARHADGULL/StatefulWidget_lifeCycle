import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import the LanguageModel class
import '../posts/post_controller.dart';
import '../posts/post_model.dart';
import 'language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  final LanguageController _languageController = Get.put(LanguageController());
  //using the functionalities of post controller in laguage view
  final PostController _postController = Get.put(PostController(userSettings: UserSettings(language: 'en')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Selection'),
      ),
      body: ListView.builder(
        itemCount: _languageController.availableLanguages.length,
        itemBuilder: (context, index) {
          final language = _languageController.availableLanguages[index];
          return ListTile(
            onTap: () {
              _languageController.selectLanguage(language);
              _postController.handleLanguageChange();
            },
            title: Text(language.name),
            leading: Obx(() {
              // Show a checkmark for the selected language
              return _languageController.selectedLanguage.value == language
                  ? Icon(Icons.check)
                  : SizedBox.shrink();
            }),
          );
        },
      ),


    );
  }
}
