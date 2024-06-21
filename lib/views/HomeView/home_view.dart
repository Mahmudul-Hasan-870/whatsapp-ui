import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/views/MessageScreen/message_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> users = [
      {
        "name": "Charlie",
        "message": "Nice to meet you!",
        "time": "14:23",
        "number_of_messages": 4,
        "image":
        "https://images.pexels.com/photos/5917850/pexels-photo-5917850.jpeg"
      },
      {
        "name": "Diana",
        "message": "Good morning!",
        "time": "08:45",
        "number_of_messages": 5,
        "image":
        "https://images.pexels.com/photos/5917850/pexels-photo-5917850.jpeg"
      },
      {
        "name": "George",
        "message": "See you soon!",
        "time": "19:12",
        "number_of_messages": 1,
        "image":
        "https://images.pexels.com/photos/5917850/pexels-photo-5917850.jpeg"
      },
      {
        "name": "Hannah",
        "message": "Good night!",
        "time": "23:08",
        "number_of_messages": 5,
        "image":
        "https://images.pexels.com/photos/5917850/pexels-photo-5917850.jpeg"
      },
      {
        "name": "Bob",
        "message": "Hello there!",
        "time": "11:20",
        "number_of_messages": 8,
        "image":
        "https://images.pexels.com/photos/5917850/pexels-photo-5917850.jpeg"
      },
      {
        "name": "Julia",
        "message": "What's up?",
        "time": "16:34",
        "number_of_messages": 4,
        "image":
        "https://images.pexels.com/photos/5917850/pexels-photo-5917850.jpeg"
      },
      {
        "name": "Ian",
        "message": "Take care!",
        "time": "20:55",
        "number_of_messages": 3,
        "image":
        "https://images.pexels.com/photos/5917850/pexels-photo-5917850.jpeg"
      },
      {
        "name": "Alice",
        "message": "Goodbye!",
        "time": "05:14",
        "number_of_messages": 2,
        "image":
        "https://images.pexels.com/photos/5917850/pexels-photo-5917850.jpeg"
      },
      {
        "name": "Fiona",
        "message": "Good morning!",
        "time": "07:30",
        "number_of_messages": 9,
        "image":
        "https://images.pexels.com/photos/5917850/pexels-photo-5917850.jpeg"
      },
      {
        "name": "Edward",
        "message": "Have a great day!",
        "time": "14:57",
        "number_of_messages": 0,
        "image":
        "https://images.pexels.com/photos/5917850/pexels-photo-5917850.jpeg"
      }
    ];

    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF075E55),
          title: Text(
            'WhatsApp',
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, letterSpacing: 0.5),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ))
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.white70,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              const Tab(
                icon: Icon(
                  Icons.camera_alt_rounded,
                ),
              ),
              Tab(
                child: Text(
                  "CHATS",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Tab(
                child: Text(
                  "STATUS",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Tab(
                child: Text(
                  "CALLS",
                  style: GoogleFonts.poppins(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF075E55),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          Center(child: Text("Camera")),
          ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessageScreen(
                              name: user['name'],
                              image: user['image']),
                        ));
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['image']),
                  ),
                  title: Text(
                    user['name'],
                    style: GoogleFonts.poppins(
                        color: Colors.black, letterSpacing: 0.5),
                  ),
                  subtitle: Text(
                    user['message'],
                    style: GoogleFonts.poppins(
                        color: Colors.black54, letterSpacing: 0.5),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  trailing: Column(
                    children: [
                      Text(
                        user['time'],
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF10CE62), letterSpacing: 0.5),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      user['number_of_messages'] == 0
                          ? const SizedBox()
                          : Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                            color: Color(0xFF10CE62),
                            shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                              user['number_of_messages'].toString(),
                              style: GoogleFonts.poppins(
                                  color: Colors.white, letterSpacing: .5),
                            )),
                      )
                    ],
                  ),
                );
              }),
          Center(child: Text('Status')),
          Center(child: Text('Calls'))
        ]),
      ),
    );
  }
}
