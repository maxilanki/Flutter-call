import 'package:flutter/material.dart';

/// Represents a conversation shown in the Chats tab.
class ChatConversation {
  const ChatConversation({
    required this.name,
    required this.initials,
    required this.lastMessage,
    required this.time,
    required this.color,
    this.unreadCount = 0,
  });

  final String name;
  final String initials;
  final String lastMessage;
  final String time;
  final Color color;
  final int unreadCount;
}

/// Recent conversations screen displayed in the Chats tab.
class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  static const conversations = <ChatConversation>[
    ChatConversation(
      name: 'Ana García',
      initials: 'AG',
      lastMessage: '¡Perfecto! Nos vemos mañana.',
      time: '10:30',
      color: Color(0xFF7E57C2),
      unreadCount: 2,
    ),
    ChatConversation(
      name: 'Equipo Flutter',
      initials: 'EF',
      lastMessage: 'Carlos: Ya terminé la pantalla.',
      time: '09:45',
      color: Color(0xFF42A5F5),
      unreadCount: 5,
    ),
    ChatConversation(
      name: 'Lucía Torres',
      initials: 'LT',
      lastMessage: 'Te envío el documento ahora.',
      time: 'Ayer',
      color: Color(0xFF26A69A),
    ),
    ChatConversation(
      name: 'Miguel Santos',
      initials: 'MS',
      lastMessage: 'Qué buenas quedaron las fotos.',
      time: 'Ayer',
      color: Color(0xFFEF5350),
    ),
    ChatConversation(
      name: 'Sofía Hernández',
      initials: 'SH',
      lastMessage: 'Gracias por la explicación.',
      time: 'Lun',
      color: Color(0xFFFFA726),
      unreadCount: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: conversations.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, indent: 82),
      itemBuilder: (context, index) {
        final chat = conversations[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),
          leading: CircleAvatar(
            radius: 27,
            backgroundColor: chat.color,
            child: Text(
              chat.initials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            chat.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            chat.lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: SizedBox(
            width: 42,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time,
                  style: TextStyle(
                    fontSize: 12,
                    color: chat.unreadCount > 0
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                  ),
                ),
                const SizedBox(height: 6),
                if (chat.unreadCount > 0)
                  Container(
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${chat.unreadCount}',
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
              ],
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
}
