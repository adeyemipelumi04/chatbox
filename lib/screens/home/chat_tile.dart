import 'package:chatbox_app/screens/home/models/model.dart';
import 'package:chatbox_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatTile extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;

  const ChatTile({super.key, required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: AppColors.primaryColor3,
            foregroundColor: AppColors.primaryColor2,
            icon: Icons.phone_outlined,
          ),
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: AppColors.primaryColor3,
            foregroundColor: AppColors.primaryColor2,
            icon: Icons.video_call_outlined,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: AppColors.primaryColor3,
            foregroundColor: AppColors.primaryColor,
            icon: Icons.ring_volume_outlined,
          ),
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: AppColors.primaryColor3,
            foregroundColor: AppColors.primaryColor,
            icon: Icons.pin_outlined,
          ),
        ],
      ),
      child: ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(chat.imageUrl),
              backgroundColor: Colors.grey,
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: chat.isOnline ? Colors.green : Colors.grey,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          chat.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(chat.message),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(chat.time),
            const SizedBox(height: 4),
            if (chat.unreadCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${chat.unreadCount}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
