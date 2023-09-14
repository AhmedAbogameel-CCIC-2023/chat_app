import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/message.dart';
import '../../core/models/user.dart' as User;

part 'states.dart';

class ChatDetailsCubit extends Cubit<ChatDetailsStates> {
  ChatDetailsCubit({required this.user}) : super(ChatDetailsInit());

  final User.User user;

  List<Message> messages = [];
  TextEditingController textEditingController = TextEditingController();

  Future<void> sendMessage() async {
    final text = textEditingController.text;
    if (text.trim().isEmpty || text.trim().length == 0) {
      return;
    }
    textEditingController.clear();
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final message = Message(
      uid: uid,
      message: text,
      time: Timestamp.now(),
    );
    messages.insert(
      0,
      message,
    );
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(uid)
        .collection(user.uid)
        .doc()
        .set(message.toJson());
    emit(ChatDetailsInit());
  }
}
