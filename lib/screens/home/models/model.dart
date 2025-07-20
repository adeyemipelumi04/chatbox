class ChatModel {
  final int id;
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String imageUrl;
  final bool isOnline;
  final bool hasSeenStatus;

  ChatModel({
    required this.id,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.imageUrl,
    required this.isOnline,
    required this.hasSeenStatus,
  });
}


final List<ChatModel> dummyChats = List.generate(8, (index) {
  return ChatModel(
    id: index,
    name: 'User $index',
    message: 'Message preview from User $index...',
    time: '10:${30 + index} AM',
    unreadCount: index % 3,
    imageUrl: 'assets/user_$index.png',
    isOnline: index % 2 == 0,
    hasSeenStatus: index % 2 == 0,
  );
});
