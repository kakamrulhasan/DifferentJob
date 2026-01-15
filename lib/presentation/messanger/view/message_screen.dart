import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/presentation/messanger/view/widgets/filter_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/message_model.dart';
import '../viewmodel/message_view_model.dart';
import 'widgets/avatar_with_badge.dart';
import 'widgets/chat_detail_screen.dart';

class MessageScreen extends ConsumerWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(messageProvider);
    final viewModel = ref.read(messageProvider.notifier);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Message",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, color: Colors.black54),
            ),
          ],
        ),
        body: Column(
          children: [
            // Search Bar Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: viewModel.updateSearch,
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor:  ColorManager.backgroundColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilterButton(),
                ],
              ),
            ),
            // Custom Styled TabBar
            const TabBar(
              labelColor: ColorManager.primary,
              unselectedLabelColor: Colors.grey,
              indicatorColor: ColorManager.primary,
              indicatorWeight: 3,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: "General (4)"),
                Tab(text: "Ad Responses (9)"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _MessageListWidget(messages: state.filteredMessages),
                  const Center(child: Text("Ad Responses Section")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageListWidget extends StatelessWidget {
  final List<ChatMessage> messages;
  const _MessageListWidget({required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: messages.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, indent: 85, color: Color(0xFFEEEEEE)),
      itemBuilder: (context, index) {
        final chat = messages[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailScreen(
                  userName: chat.name,
                  imageUrl: chat.imageUrl,
                ),
              ),
            );
          },
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: AvatarWithBadge(chat: chat),
          title: Text(
            chat.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            chat.message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: Text(
            chat.time,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        );
      },
    );
  }
}

