import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble.first({
    super.key,
    required this.message,
    required this.isMe,
    required this.userImage,
    required this.userName,
  }) : isFirstInSquence = true;

  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
  })  : userImage = null,
        userName = null,
        isFirstInSquence = false;

  final bool isFirstInSquence;
  final String? userImage;
  final String? userName;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        if (userImage != null)
          Positioned(
            top: 15,
            // Align user image to the right, if the message is from me.
            right: isMe ? 0 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                userImage!,
              ),
              backgroundColor: theme.colorScheme.primary.withAlpha(180),
              radius: 23,
            ),
          ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 46),
          child: Row(
            mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (isFirstInSquence) const SizedBox(height: 18),
                  if (userName != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Text(
                        userName!,
                        style: TextStyle(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      color: isMe ? theme.colorScheme.onInverseSurface : theme.colorScheme.secondary,
                      borderRadius: BorderRadius.only(
                        topLeft: !isMe && isFirstInSquence ? Radius.zero : const Radius.circular(12),
                        topRight: isMe && isFirstInSquence ? Radius.zero : const Radius.circular(12),
                        bottomLeft: const Radius.circular(12),
                        bottomRight: const Radius.circular(12),
                      ),
                    ),
                    constraints: const BoxConstraints(maxWidth: 200),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        height: 1.3,
                        color: isMe ? theme.colorScheme.onSurface : theme.colorScheme.onInverseSurface,
                      ),
                      softWrap: true,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
