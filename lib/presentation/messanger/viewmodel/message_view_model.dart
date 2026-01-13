import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/message_model.dart';

// ViewModel State
class MessageState {
  final List<ChatMessage> allMessages;
  final List<ChatMessage> filteredMessages;
  final String searchQuery;

  MessageState({
    required this.allMessages,
    required this.filteredMessages,
    this.searchQuery = '',
  });

  MessageState copyWith({
    List<ChatMessage>? filteredMessages,
    String? searchQuery,
  }) {
    return MessageState(
      allMessages: allMessages,
      filteredMessages: filteredMessages ?? this.filteredMessages,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

// ViewModel Logic using Notifier
class MessageViewModel extends Notifier<MessageState> {
  @override
  MessageState build() {
    final initialData = [
      ChatMessage(
        name: "John Doe",
        message: "Hey, about the project.",
        time: "11:32 AM",
        imageUrl: "https://i.pravatar.cc/150?u=1",
        isOnline: true,
      ),
      ChatMessage(
        name: "Courtney Henry",
        message: "Thanks! That works for me.",
        time: "1:32 PM",
        imageUrl: "https://i.pravatar.cc/150?u=2",
        isOnline: true,
      ),
      ChatMessage(
        name: "Eleanor Pena",
        message: "Got it. I'll get started.",
        time: "Yesterday",
        imageUrl: "https://i.pravatar.cc/150?u=3",
      ),
      ChatMessage(
        name: "Darrell Steward",
        message: "9+ new messages",
        time: "Yesterday",
        imageUrl: "https://i.pravatar.cc/150?u=4",
        badge: "32m",
      ),
      ChatMessage(
        name: "Savannah Nguyen",
        message: "Your listing has been updated.",
        time: "Yesterday",
        imageUrl: "https://i.pravatar.cc/150?u=5",
      ),
      ChatMessage(
        name: "Darlene Robertson",
        message: "Let me know if you're interested.",
        time: "Sep 7",
        imageUrl: "https://i.pravatar.cc/150?u=6",
        badge: "12m",
      ),
      ChatMessage(
        name: "Jerome Bell",
        message: "I'm available for the job.",
        time: "Aug 30",
        imageUrl: "https://i.pravatar.cc/150?u=7",
      ),
    ];

    return MessageState(
      allMessages: initialData,
      filteredMessages: initialData,
    );
  }

  void updateSearch(String query) {
    final results = state.allMessages
        .where((msg) => msg.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    state = state.copyWith(filteredMessages: results, searchQuery: query);
  }
}

// Global Provider
final messageProvider = NotifierProvider<MessageViewModel, MessageState>(
  MessageViewModel.new,
);
