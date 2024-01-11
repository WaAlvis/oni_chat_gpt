import 'package:flutter/material.dart';
import 'package:oni_chat_gpt/domain/entities/message.dart';

class MessageBubble extends StatelessWidget {
  final FromWho fromWho;
  final String message;

  const MessageBubble({super.key, required this.fromWho, required this.message});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: (size.width > 1080) ? 150 : 40,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: ClipOval(
              child: (fromWho == FromWho.user)
                  ? Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOYjs3zDA9mA1DqDKDch1DPuTDBG87OuAKhgMYrN_dxqBQ8PZAu2ehyPjUnzevS96X120&usqp=CAU',
                    )
                  : Image.asset('assets/images/oni.gif'),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'You',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  message,
                  style: const TextStyle(fontSize: 12, height: 2),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
