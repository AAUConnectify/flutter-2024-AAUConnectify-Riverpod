class APIEndpoints {
  static const String baseUrl = 'http://localhost:3000';

  static const String checkStudent = '/students/check';
  static const String createStudent = '/students';

  static const String register = '/auth/register';
  static const String verifyEmail = '/auth/verify-email';
  static const String login = '/auth/login';
  static const String changeRole = '/auth/role';
  static const String deleteUser = '/auth/userId';
  static const String getAllUsers = '/auth';
  static const String getProfile = '/auth/profile';
  static const String createProfile= '/auth/profile';
  static const String updateProfile = '/auth/profile';

  static const String createAnnouncement = '/announcements';
  static const String getAnnouncements = '/announcements';
  static const String getAnnouncementById = '/announcements';
  static const String updateAnnouncement = '/announcements';
  static const String deleteAnnouncement = '/announcements';

  static const String createComment = '/comments';
  static const String getCommentsByAnnouncementId = '/comments';
  static const String getCommentById = '/comments';
  static const String updateComment = '/comments';
  static const String deleteComment = '/comments';
}