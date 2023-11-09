import 'package:aplikasi/homepage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int friend = 5;

  List<String> images = [
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdisney.fandom.com%2Fwiki%2FMoana_%2528character%2529&psig=AOvVaw0HW9KCv1Q8Kb6Glm0YIRj5&ust=1699612442406000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPDivvDbtoIDFQAAAAAdAAAAABAE',
    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj2O0AHnrvGwqhPKoIt9CgvdK3zxvTw_h2Nw-5ahABMDPf8SvohmuUkW8jc2yXOXMCfvJUgkQjOsbmglBf_dh7aznqPTLBsBzWEHGfqMqvyAFVUiWh9axydshro8bfZKVz55yPu7Q1y1VzFw615uTiabMWFpocEcZGZT4t_xfup4Sjn5XNrfH0ypqU5/s600/b29a6a903ceffc06-600x338.jpg',
    'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2023/06/09/42-alex-rins_lg99107gallery_ful-20230609020812.jpg',
    'https://media.vanityfair.com/photos/64a57415fa3d2f4f2b8958e0/master/w_2560%2Cc_limit/1511418315',
    'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt3a49d84fc6489998/60db4c0790ef0d39a2fcee5a/fcd9b766bc07ed7607df941d8b67223930c8eed9.jpg?auto=webp&format=pjpg&width=3840&quality=60'
  ];

  List<String> names = [
    'Lala',
    'Dea',
    'Zyyan',
    'Ian',
    'Sayang',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(padding: EdgeInsets.zero, children: <Widget>[
      const SizedBox(height: 50),
      profileImage(70,
          'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'),
      const SizedBox(height: 20),
      description(),
      const SizedBox(height: 40),
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27.0, bottom: 10),
              child: Text(
                "Friend List ($friend)",
                style: const TextStyle(fontSize: 25, fontFamily: 'ChakraPetch'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: friend,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          profileImage(40, images[index]),
                          const SizedBox(height: 8),
                          Text(
                            names[index],
                            style: const TextStyle(
                                fontSize: 18, fontFamily: 'ChakraPetch'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 20),
      Center(
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      )
    ]));
  }

  Widget profileImage(double sizeRadius, String linkImage) => CircleAvatar(
        radius: sizeRadius,
        backgroundColor: Colors.grey.shade800,
        child: ClipOval(
          child: Image.network(
            linkImage,
            fit: BoxFit.cover,
            width: sizeRadius * 2,
            height: sizeRadius * 2,
          ),
        ),
      );

  Widget description() => const Column(
        children: [
          SizedBox(height: 8),
          Text(
            'Indriarin Maria M.O',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'ChakraPetch'),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '152021133',
            style: TextStyle(fontSize: 24, fontFamily: 'ChakraPetch'),
          )
        ],
      );
}
