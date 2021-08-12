import 'package:flutter_instagram_clone/models/models.dart';

abstract class BaseNotificationRepository {
  Stream<List<Future<Notif>>> getUserNotifications({String userId});
  
}
