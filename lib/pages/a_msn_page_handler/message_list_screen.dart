// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Message {
  final String id;
  final String sender;
  final String subject;
  final String body;
  final DateTime date;
  bool isArchived;
  bool isDeleted;

  Message({
    required this.id,
    required this.sender,
    required this.subject,
    required this.body,
    required this.date,
    this.isArchived = false,
    this.isDeleted = false,
  });
}

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  _MessageListScreenState createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  List<Message> messages = [
    Message(
      id: '1',
      sender: 'John Doe',
      subject: 'Hello!',
      body: 'This is a test message.',
      date: DateTime.now(),
    ),
    Message(
      id: '2',
      sender: 'Jane Smith',
      subject: 'Meeting Reminder',
      body: 'Don\'t forget the meeting at 3 PM.',
      date: DateTime.now(),
    ),
    Message(
      id: '3',
      sender: 'Support',
      subject: 'Your Ticket Update',
      body: 'Your ticket has been resolved.',
      date: DateTime.now(),
    ),
  ];

  void _openMessage(Message message) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessageDetailScreen(message: message),
      ),
    );
  }

  void _archiveMessage(String id) {
    setState(() {
      messages.firstWhere((msg) => msg.id == id).isArchived = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message archived')),
    );
  }

  void _deleteMessage(String id) {
    setState(() {
      messages.firstWhere((msg) => msg.id == id).isDeleted = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          if (message.isDeleted) return const SizedBox.shrink(); // Skip deleted messages
          return ListTile(
            title: Text(message.sender),
            subtitle: Text(message.subject),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.archive),
                  onPressed: () => _archiveMessage(message.id),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteMessage(message.id),
                ),
              ],
            ),
            onTap: () => _openMessage(message),
          );
        },
      ),
    );
  }
}

class MessageDetailScreen extends StatelessWidget {
  final Message message;

  const MessageDetailScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From: ${message.sender}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Date: ${message.date.toString()}', style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            Text(message.body, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}