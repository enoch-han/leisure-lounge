import 'dart:html';
import 'dart:io';
import '../services/services.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import 'package:flutter/material.dart';

class ContentBloc {
  ContentService service = ContentService();

  dynamic createContent(String title, ContentType type, String url,
      String titleUrl, String description, Color color) {
    //this funtion creates new content and stores the file
    //and if done successfully it returns the content else status as false
    bool status = false;
    Content content = Content.newContent(
        title: title,
        type: type,
        url: url,
        imageUrl: titleUrl,
        description: description);
    return content;
  }

  dynamic updateContent({
    required Content content,
    required String which,
    required String value,
  }) {
    //this function updates the content by taking the content which to edit and the value
    bool status = false;
    switch (which) {
      case 'title':
        {
          content.setTitle = value;
        }
        break;
      case 'url':
        {
          content.setUrl = value;
        }
        break;
      case 'titleurl':
        {
          content.setImageUrl = value;
        }
        break;
      case 'description':
        {
          content.setDescription = value;
        }
        break;
    }
    ;
    return content;
  }

  bool deleteContent(Content content) {
    return service.deleteContent(content);
  }
}
