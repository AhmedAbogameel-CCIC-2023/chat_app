import 'package:flutter/material.dart';

import '../../core/models/user.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  final isMe = index.isEven;
                  return Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      UnconstrainedBox(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 10,
                            maxWidth: 300,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 12),
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Message' * (index + 1),
                              style: TextStyle(
                                color: isMe ? null : Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: isMe
                                  ? Colors.grey.withOpacity(0.5)
                                  : Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                hintText: "Message...",
              ),
              onFieldSubmitted: (v) {},
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
