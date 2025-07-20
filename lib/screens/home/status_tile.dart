import 'package:chatbox_app/screens/home/models/model.dart';
import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  final ChatModel chat;

  const StatusTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: chat.hasSeenStatus ? Colors.grey : Colors.green,
              width: 3,
            ),
          ),
          child: CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(chat.imageUrl),
            backgroundColor: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 70,
          child: Text(
            chat.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }
}


