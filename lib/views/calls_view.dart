import 'package:flutter/material.dart';

enum CallKind { incoming, outgoing, missed }

/// Represents a call shown in the Calls tab.
class CallRecord {
  const CallRecord({
    required this.name,
    required this.initials,
    required this.kind,
    required this.dateTime,
    required this.color,
    this.isVideo = false,
  });

  final String name;
  final String initials;
  final CallKind kind;
  final String dateTime;
  final Color color;
  final bool isVideo;
}

/// Call history screen displayed in the Calls tab.
class CallsView extends StatelessWidget {
  const CallsView({super.key});

  static const calls = <CallRecord>[
    CallRecord(
      name: 'Ana García',
      initials: 'AG',
      kind: CallKind.incoming,
      dateTime: 'Hoy, 10:15',
      color: Color(0xFF7E57C2),
    ),
    CallRecord(
      name: 'Carlos Ruiz',
      initials: 'CR',
      kind: CallKind.outgoing,
      dateTime: 'Hoy, 09:30',
      color: Color(0xFF42A5F5),
      isVideo: true,
    ),
    CallRecord(
      name: 'Lucía Torres',
      initials: 'LT',
      kind: CallKind.missed,
      dateTime: 'Ayer, 18:42',
      color: Color(0xFF26A69A),
    ),
    CallRecord(
      name: 'Miguel Santos',
      initials: 'MS',
      kind: CallKind.outgoing,
      dateTime: 'Ayer, 16:20',
      color: Color(0xFFEF5350),
      isVideo: true,
    ),
    CallRecord(
      name: 'Sofía Hernández',
      initials: 'SH',
      kind: CallKind.incoming,
      dateTime: '25 oct, 11:05',
      color: Color(0xFFFFA726),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: calls.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, indent: 82),
      itemBuilder: (context, index) {
        final call = calls[index];
        final details = _callDetails(call.kind);
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),
          leading: CircleAvatar(
            radius: 27,
            backgroundColor: call.color,
            child: Text(
              call.initials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            call.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: call.kind == CallKind.missed ? Colors.red.shade700 : null,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(details.icon, size: 16, color: details.color),
              const SizedBox(width: 5),
              Text(call.dateTime, style: const TextStyle(fontSize: 13)),
            ],
          ),
          trailing: Icon(
            call.isVideo ? Icons.videocam_outlined : Icons.phone_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
          onTap: () {},
        );
      },
    );
  }

  _CallDetails _callDetails(CallKind kind) {
    switch (kind) {
      case CallKind.incoming:
        return const _CallDetails(Icons.call_received, Colors.green);
      case CallKind.outgoing:
        return const _CallDetails(Icons.call_made, Colors.blue);
      case CallKind.missed:
        return const _CallDetails(Icons.call_missed, Colors.red);
    }
  }
}

class _CallDetails {
  const _CallDetails(this.icon, this.color);
  final IconData icon;
  final Color color;
}
