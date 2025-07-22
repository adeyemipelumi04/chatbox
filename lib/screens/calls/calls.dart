import 'package:chatbox_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

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
        _buildCallList(screenHeight, context),
      ],
    );
  }

  Widget _buildCallList(double screenHeight, BuildContext context) {
    return Container(
      height: screenHeight * 0.90,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Text(
              'Recent',
              style: TextStyle(
                color: AppColors.primaryColor2,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Replace with actual call count
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/user_1.png'),
                  ),
                  title: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Call $index',
                            style: const TextStyle(
                              color: AppColors.primaryColor2,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: const [
                              Icon(
                                Icons.phone_callback,
                                color: AppColors.textColor,
                                size: 16,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Today, 00:00 AM',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: const [
                          Icon(
                            Icons.call_outlined,
                            color: AppColors.primaryColor2,
                            size: 24,
                          ),
                          SizedBox(width: 16),
                          Icon(
                            Icons.videocam_outlined,
                            color: AppColors.primaryColor2,
                            size: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle call tile tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: IconButton(
              icon: const Icon(Icons.search, size: 30, color: Colors.white),
              onPressed: () {
                // Handle search action
              },
            ),
          ),
          const Text(
            'Calls',
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
            child: IconButton(
              icon: const Icon(
                Icons.add_ic_call_outlined,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                // Handle new call action
              },
            ),
          ),
        ],
      ),
    );
  }
}
