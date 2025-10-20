import 'package:flutter/material.dart';
import '../theme.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final TextEditingController controller = TextEditingController();
  final List<_Message> messages = [
    _Message(author: "Alice", text: "Welcome everyone 👋", me: false),
    _Message(author: "You", text: "Hi Alice! Great to be here.", me: true),
    _Message(author: "Bob", text: "Please check the new internship listing.", me: false),
  ];

  void sendMessage() {
    final text = controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      messages.add(_Message(author: "You", text: text, me: true));
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        elevation: 0,
        title: const Text(
          "Community",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: const [
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final alignment =
                    msg.me ? Alignment.centerRight : Alignment.centerLeft;
                final color = msg.me ? AppColors.accent : AppColors.chipBg;
                final textColor = msg.me ? Colors.white : AppColors.text;
                final radius = msg.me
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      );

                return Align(
                  alignment: alignment,
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: radius,
                    ),
                    child: Text(msg.text, style: TextStyle(color: textColor, fontSize: 14)),
                  ),
                );
              },
            ),
          ),

          // Composer
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline),
                    color: AppColors.accent,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.chipBg,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: controller,
                        minLines: 1,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: "Message...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: sendMessage,
                    icon: const Icon(Icons.send),
                    color: AppColors.accent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Message {
  _Message({required this.author, required this.text, required this.me});
  final String author;
  final String text;
  final bool me;
}
