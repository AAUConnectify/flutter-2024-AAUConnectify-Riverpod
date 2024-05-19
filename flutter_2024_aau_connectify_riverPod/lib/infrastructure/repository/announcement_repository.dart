import 'dart:convert';

import 'package:flutter_2024_aau_connectify/infrastructure/data_providers/announcement_data_provider.dart';
import 'package:flutter_2024_aau_connectify/Domain/announcement_mode.dart';

class AnnouncementRepository {
  final AnnouncementDataProvider dataProvider;

  AnnouncementRepository(this.dataProvider);

  Future<List<Announcement>> getAnnouncements(
      int page, int limit, String token) async {
    try {
      final response = await dataProvider.getAnnouncements(page, limit, token);

      final List<Announcement> announcements = [];
      final val = (jsonDecode(response['body']));

      for (var announcement in val) {
        announcements.add(Announcement.fromMap(announcement));
      }
      return announcements;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Announcement> getAnnouncementById(String id, String token) async {
    final response = await dataProvider.getAnnouncementById(id, token);
    if (response['success']) {
      return Announcement.fromMap(jsonDecode(response['body']));
    } else {
      throw Exception(response['message']);
    }
  }

  Future<Map> createAnnouncement(
      String title,
      String content,
      String category,
      String summary,
      String date,
      String image,
      String tag,
      String token) async {
    try {
      final response = await dataProvider.createAnnouncement(
          title, content, category, summary, date, image, tag, token);
      if (response['success']) {
        return {'success': true, 'logout': false};
      }
     else {
        final body = jsonDecode(response['body']);
        if (body['message'] == 'Invalid token') {
          return {'success': false, 'logout': true};
        }
        return {'success': false, 'logout': false};
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map> updateAnnouncementById(
      String id,
      String title,
      String content,
      String category,
      String summary,
      String date,
      String image,
      String tag,
      String token) async {
    try {
      final response = await dataProvider.updateAnnouncementById(
          id, title, content, category, summary, date, image, tag, token);
      if (response['success']) {
        return {'success': true, 'logout': false};
      } else {
        final body = jsonDecode(response['body']);
        if (body['message'] == 'Invalid token') {
          return {'success': false, 'logout': true};
        }
        return {'success': false, 'logout': false};
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map> deleteAnnouncementById(String id, String token) async {
    try {
      final response = await dataProvider.deleteAnnouncementById(id, token);
      if (response['success']) {
        return {'success': true, 'logout': false};
      } else {
        final body = jsonDecode(response['body']);
        if (body['message'] == 'Invalid token') {
          return {'success': false, 'logout': true};
        }
        return {'success': false, 'logout': false};
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
