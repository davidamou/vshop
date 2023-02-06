import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post.dart';

class PostProvider {
  static final ref =
      FirebaseFirestore.instance.collection('post').withConverter(
            fromFirestore: Post.fromFirebase,
            toFirestore: (Post post, _) => post.toFirebase(),
          );
}
