import 'package:chatbox_app/screens/home/chat_tile.dart';
import 'package:chatbox_app/screens/home/models/model.dart';
import 'package:chatbox_app/screens/home/status_tile.dart';
import 'package:chatbox_app/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAppBar(context),
            _buildStatusBar(),
            const SizedBox(height: 20),
            _buildChatListSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: dummyChats.length + 1, // +1 for 'My Status'
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildMyStatusTile();
          } else {
            return StatusTile(chat: dummyChats[index - 1]);
          }
        },
      ),
    );
  }

  Widget _buildChatListSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: screenHeight - 110, // Adjust height based on status bar
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.only(top: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // prevent double scroll
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            itemCount: dummyChats.length,
            itemBuilder: (context, index) {
              return ChatTile(
                chat: dummyChats[index],
                onTap: () {
                  Navigator.pushNamed(context, '/message');
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(Icons.search, () {}),
          const Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: PopupMenuButton<String>(
              color: AppColors.whiteColor,
              icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
              onSelected: (value) {
                // Handle actions here
                switch (value) {
                  //case 'new_group':
                  // Navigate or show dialog
                  //break;
                  //case 'new_broadcast':
                  // Do something
                  //break;
                  case 'settings':
                    Navigator.pushNamed(context, '/settings');
                    //break;
                    //case 'help':
                    // Show help
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'new_group',
                  child: Text('New Group'),
                ),
                const PopupMenuItem(
                  value: 'new_broadcast',
                  child: Text('New Broadcast'),
                ),
                const PopupMenuItem(value: 'settings', child: Text('Settings')),
                const PopupMenuItem(value: 'help', child: Text('Help')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}

Widget _buildMyStatusTile() {
  return Column(
    children: [
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryColor, // Customize with your theme
                width: 2.5,
              ),
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 36, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.primaryColor2,
                shape: BoxShape.circle,
                //border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.add, size: 18, color: Colors.white),
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
      const SizedBox(
        width: 70,
        child: Text(
          'My Status',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    ],
  );
}
