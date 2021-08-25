import 'dart:html';
import 'dart:io';
import '../services/services.dart';
import '../models/models.dart';
import '../utils/utils.dart';
import 'package:flutter/material.dart';

class ContentBloc {
  ContentService service = ContentService();

  dynamic updateContent({
    required ContentModel content,
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

  bool deleteContent(ContentModel content) {
    return true;
    //return service.deleteContent(content);
  }
}
