import 'package:chat_app/features/presentation/screens/home/widgets/home_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'Messages',
  );

  final TextEditingController controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? HomeUi(
              controller: controller,
              messages: messages,
            )
            : Center(child: Text("Loading.."));
      },
    );
  }
}
