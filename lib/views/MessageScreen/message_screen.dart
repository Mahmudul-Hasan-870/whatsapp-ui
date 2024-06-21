import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatefulWidget {
  final String name;
  final String image;

  const MessageScreen({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<Map> chatDetails = [
    {"message": "Hello!", "time": "06:00 PM", "isMe": true},
    {"message": "How are you?", "time": "06:05 PM", "isMe": false},
    {"message": "I'm fine, thanks!", "time": "06:06 PM", "isMe": true},
    {"message": "What about you?", "time": "06:07 PM", "isMe": false},
    {
      "message": "Doing great, just working on a project.",
      "time": "06:10 PM",
      "isMe": true
    }
  ];

  TextEditingController messageController = TextEditingController();

  void sendMessage(String message) {
    setState(() {
      chatDetails.add({
        "message": message,
        "time": "${DateTime.now().hour}:${DateTime.now().minute}",
        "isMe": true,
      });
      // Simulating a reply (for demonstration)
      chatDetails.add({
        "message": "Got it!",
        "time": "${DateTime.now().hour}:${DateTime.now().minute}",
        "isMe": false,
      });
      messageController.clear(); // Clear the text field after sending message
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E55),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.image),
          ),
          title: Text(
            widget.name,
            style: GoogleFonts.poppins(color: Colors.white, letterSpacing: 0.5),
          ),
          subtitle: Text(
            "Last seen 07:00 PM",
            style: GoogleFonts.poppins(color: Colors.white70),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatDetails.length,
              itemBuilder: (context, index) {
                final chat = chatDetails[index];
                bool isMe = chat["isMe"] as bool;
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isMe ? const Color(0xFF075E55) : Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat["message"]!,
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          chat["time"]!,
                          style: GoogleFonts.poppins(
                              color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      filled: true,
                      fillColor: Colors.white70,
                      suffixIcon: Icon(Icons.link),
                      prefixIcon: Icon(Icons.emoji_emotions),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (message) {
                      if (message.isNotEmpty) {
                        sendMessage(message);
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    String message = messageController.text.trim();
                    if (message.isNotEmpty) {
                      sendMessage(message);
                    }
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  backgroundColor: const Color(0xFF075E55),
                  shape: CircleBorder(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
