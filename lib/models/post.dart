import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String? id;
  final Timestamp? start;
  final Timestamp? end;
  final String imageUrl;

  Post({this.id, required this.imageUrl, this.start, this.end});

  factory Post.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return Post(
      id: snapshot.id,
      end: data?['end'],
      start: data?['start'],
      imageUrl: data?['imageUrl'],
    );
  }

  Map<String, dynamic> toFirebase() {
    return {
      if (end != null) "end": end,
      if (end != null) "start": start,
      if (end != null) "imageUrl": imageUrl,
    };
  }
}
