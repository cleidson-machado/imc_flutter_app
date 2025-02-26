// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/screens/app_configuration_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const TopicContentPointScreen(),
    const UserProfileScreen(),
    const AppConfigurationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        height: 80,
        iconSize:40,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: "USER",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear_big),
            label: "CONFIG",
          ),
        ],
      ),
    );
  }
}

/// 📝 Tela Principal - Lista de Conteúdos cadastrados ou compartilhados pelos usuários
class TopicContentPointScreen extends StatelessWidget {
  const TopicContentPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> blogPosts = List.generate(25, (index) {
      return {
        "title": "Blog Post ${index + 1}",
        "subtitle": "Short description of the blog post.",
        "image": "https://picsum.photos/200/300?random=$index",
      };
    });

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text("Blogs")),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: CupertinoSearchTextField(),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: blogPosts.length,
              itemBuilder: (context, index) {
                final post = blogPosts[index];
                return Column(
                  children: [
                    _buildBlogCard(post),
                    const Divider(color: CupertinoColors.systemGrey4),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlogCard(Map<String, String> post) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post["title"]!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  post["subtitle"]!,
                  style: const TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              post["image"]!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  color: CupertinoColors.systemGrey5,
                  child: const Icon(CupertinoIcons.photo, color: CupertinoColors.white),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔍 Tela de Pesquisa
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("User Profile")),
      child: Center(child: Text("User Content", style: TextStyle(fontSize: 20))),
    );
  }
}

/// 👤 Tela de Perfil
class AppConfigurationScreen_ORIG extends StatelessWidget {
  const AppConfigurationScreen_ORIG({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Configuration")),
      child: Center(child: Text("Profile for App Configuration", style: TextStyle(fontSize: 20))),
    );
  }
}
