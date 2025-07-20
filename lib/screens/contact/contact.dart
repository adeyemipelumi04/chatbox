import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:chatbox_app/utils/colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  final Map<String, List<String>> groupedContacts = const {
    'A': ['Alex', 'Alice'],
    'B': ['Ben', 'Bianca'],
    'C': ['Chris'],
    'D': ['Diana'],
    'E': ['Ethan', 'Emma'],
    'F': ['Frank'],
    'G': ['Grace', 'George'],
    'H': ['Hannah'],
    'I': ['Ian'],
  };

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor2,
      body: SingleChildScrollView(child: _buildBody(screenHeight, context)),
    );
  }

  Widget _buildBody(double screenHeight, BuildContext context) {
    return Column(
      children: [
        _buildAppBar(),
        const SizedBox(height: 20),
        _buildContactList(context),
      ],
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _circularIcon(Icons.search, () {
            // Handle search
          }),
          const Text(
            'Contacts',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          _circularIcon(Icons.person_add_alt_1_outlined, () {
            // Handle add contact
          }),
        ],
      ),
    );
  }

  Widget _circularIcon(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: IconButton(
        icon: Icon(icon, size: 30, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildContactList(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Contacts',
              style: TextStyle(
                color: AppColors.primaryColor2,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...groupedContacts.entries.map((entry) {
              final letter = entry.key;
              final names = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    letter,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...names.map((name) => _buildContactTile(context, name)),
                  const SizedBox(height: 16),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildContactTile(BuildContext context, String name) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Handle delete
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
            'assets/user_1.png',
          ), // Replace with dynamic asset if needed
        ),
        title: Text(
          name,
          style: TextStyle(
            color: AppColors.primaryColor2,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          'Profile preview...',
          style: TextStyle(color: AppColors.textColor, fontSize: 14),
        ),
        onTap: () {
          // Handle tap
        },
      ),
    );
  }
}
