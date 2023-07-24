import 'package:get/get.dart';

import 'language_model.dart';

class LanguageController extends GetxController {
  Rx<LanguageModel> selectedLanguage = LanguageModel("English").obs; // Default language

  List<LanguageModel> availableLanguages = [
    LanguageModel("English"),
    LanguageModel("Spanish"),
    LanguageModel("French"),
    LanguageModel("German"),
    LanguageModel("Chinese"),
  ];

  void selectLanguage(LanguageModel language) {
    selectedLanguage.value = language;
  }
}
