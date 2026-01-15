import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/message_model.dart';

class ChatDetailViewModel extends Notifier<List<ChatDetailModel>> {
  @override
  List<ChatDetailModel> build() {
    return [
      ChatDetailModel(text: "Halo, Doe", time: "08:00 am", isMe: false),
      ChatDetailModel(
        text: "why does my back hurt so much?",
        time: "08:00 am",
        isMe: false,
      ),
      ChatDetailModel(
        text: "You sit too long. Try drinking lots of water",
        time: "08:01 am",
        isMe: true,
      ),
      ChatDetailModel(text: "Oh like that.", time: "08:50 am", isMe: false),
      ChatDetailModel(
        text: "ok doc. I will drink lots of water and exercise.",
        time: "08:50 am",
        isMe: false,
      ),
      ChatDetailModel(
        text: "Thanks a lot doc 😍",
        time: "08:50 am",
        isMe: false,
      ),
      ChatDetailModel(text: "Don't mention it  ", time: "08:52 am", isMe: true),
    ];
  }

  void sendMessage(String text) {
    state = [...state, ChatDetailModel(text: text, time: "Now", isMe: true)];
  }
}

final chatDetailProvider =
    NotifierProvider<ChatDetailViewModel, List<ChatDetailModel>>(
      ChatDetailViewModel.new,
    );
