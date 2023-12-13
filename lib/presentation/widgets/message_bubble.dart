import 'package:flutter/material.dart';

enum Sender { user, oni }

class MessageBubble extends StatelessWidget {
  final Sender sender;

  const MessageBubble({super.key, required this.sender});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: 10,bottom: 10,
        right: (size.width > 1080) ? 150 : 40,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: ClipOval(
              child: (sender == Sender.user)
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
                  sender == Sender.user
                      ? 'Who is Ed Rodriguez?'
                      : '''Aliqua veniam proident eu exercitation eu anim officia sit dolor consequat aute. Voluptate consequat proident dolore eu ullamco in ad excepteur aute amet magna ullamco occaecat. Voluptate esse nostrud minim in exercitation. Sint eu est dolore culpa sunt consectetur quis tempor reprehenderit cillum est id id laborum.

Ea laborum nulla officia esse ut minim commodo sunt do. Voluptate aliqua eu laborum commodo qui ullamco qui nisi. Enim ad aute Lorem laborum ea aute labore. Elit sunt eu incididunt laborum in ut. Non aute ad excepteur ut ea nulla minim.

Irure ad ea culpa ea exercitation cillum laborum ex deserunt excepteur excepteur adipisicing eiusmod. Reprehenderit enim officia voluptate velit exercitation eiusmod incididunt dolore enim. Ullamco laborum id nisi mollit cupidatat occaecat mollit magna. Et esse commodo ex ad cillum. Aliqua labore eiusmod in culpa ad et deserunt enim proident et quis enim magna enim.''',
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
