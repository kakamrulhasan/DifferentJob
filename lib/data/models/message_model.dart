class ChatMessage {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool isOnline;
  final String? badge; 

  ChatMessage({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    this.isOnline = false,
    this.badge,
  });
}


class ChatDetailModel {
  final String text;
  final String time;
  final bool isMe; 

  ChatDetailModel({
    required this.text,
    required this.time,
    required this.isMe,
  });
}