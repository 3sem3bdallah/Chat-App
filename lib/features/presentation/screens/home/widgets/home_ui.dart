import 'package:chat_app/features/presentation/screens/home/widgets/chat_bubble.dart';
import 'package:chat_app/features/presentation/widgets/app_text_form_field.dart';
import 'package:chat_app/utils/constant/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeUi extends StatefulWidget {
  const HomeUi({
    super.key,
    required this.controller,
    required this.messages,
  });

  final TextEditingController controller;
  final CollectionReference messages;

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  final ScrollController scrollController = ScrollController();

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          "Chat",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ------------------ REALTIME LIST ------------------
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: widget.messages
                  .orderBy("createdAt", descending: false) // oldest → newest
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;

                // scroll to bottom on new messages
                scrollToBottom();

                return ListView.builder(
                  controller: scrollController,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data =
                        docs[index].data() as Map<String, dynamic>;

                    return ChatBubble(
                      message: data["text"] ?? "",
                    );
                  },
                );
              },
            ),
          ),

          // ------------------ INPUT FIELD ------------------
          Padding(
            padding: const EdgeInsets.all(16),
            child: AppTextFormField(
              controller: widget.controller,
              hintText: "Send message",
              suffixIcon: InkWell(
                onTap: () {
                  if (widget.controller.text.trim().isEmpty) return;

                  widget.messages.add({
                    "text": widget.controller.text.trim(),
                    "createdAt": Timestamp.now(),
                  });

                  widget.controller.clear();
                  scrollToBottom();
                },
                child: Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
