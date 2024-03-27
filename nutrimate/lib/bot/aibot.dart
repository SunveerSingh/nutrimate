import 'package:flutter/material.dart';

class BotScreen extends StatefulWidget {
  const BotScreen({super.key});

  @override
  State<BotScreen> createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: _buildMessageComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                // TODO: Implement photo picker
              },
            ),
            Expanded(
              child: TextField(
                controller: _textEditingController,
                textInputAction: TextInputAction.send,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: "Type a message",
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textEditingController.text),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    ChatMessage message = ChatMessage(text: text);
    setState(() {
      _messages.insert(0, message);
      _messages.insert(
          1,
          ChatMessage(
              text:
                  "Greek Yogurt Parfait Greek yogurt (or plant-based yogurt) Fresh mixed berries (such as strawberries, blueberries, raspberries) Granola (look for low-sugar varieties or make your own with oats, nuts, and seeds) Drizzle of honey or maple syrup Optional: chia seeds or flaxseeds for extra fiber",
              isBot: true));
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String time;
  final bool isBot;

  ChatMessage({required this.text, this.time = '', this.isBot = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          isBot ? _buildAvatar() : SizedBox(),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isBot ? Colors.white : Colors.blue[200],
                borderRadius: isBot
                    ? BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isBot ? 'Bot' : 'You',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isBot ? Colors.black : Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    text,
                    style:
                        TextStyle(color: isBot ? Colors.black : Colors.white),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: isBot ? Colors.grey[600] : Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isBot ? SizedBox() : _buildAvatar(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      //child: Text('B', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
    );
  }
}
