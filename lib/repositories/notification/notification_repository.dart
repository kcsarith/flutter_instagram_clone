import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram_clone/config/paths.dart';
import 'package:flutter_instagram_clone/models/notif_model.dart';
import 'package:flutter_instagram_clone/repositories/notification/base_notification_repository.dart';
import 'package:meta/meta.dart';

class NotificationRepository extends BaseNotificationRepository {
  final FirebaseFirestore _firebaseFirestore;

  NotificationRepository({FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Future<Notif>>> getUserNotifications({@required String userId}) {
    return _firebaseFirestore
        .collection(Paths.notifications)
        .doc(userId)
        .collection(Paths.userNotifications)
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs.map((doc) => Notif.fromDocument(doc)).toList(),
        );
  }
}
