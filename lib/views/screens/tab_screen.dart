import 'package:flutter/material.dart';
import '../../utils/consts/img_icon.dart';
import '../layouts/calls_layout.dart';
import '../layouts/chats_layout.dart';
import '../layouts/community_layout.dart';
import '../layouts/updates_layout.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> layoutsData = {
      "Chats"  : {"layout": const ChatsLayout(),       "icon": const Icon(Icons.chat)},
      "Updates": {"layout": const UpdatesLayout(),    "icon": const Icon(Icons.update)},
      "Com"    : {"layout": const CommunitiesLayout(), "icon": const Icon(Icons.person_pin_sharp)},
      "Calls"  : {"layout": const CallsLayout(),       "icon": const Icon(Icons.call)},
    };

    return Scaffold(
      body: layoutsData.entries.toList()[currentIndex].value['layout'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(icChat),size: 24,),        label: "Chats",),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(icUpdates),size: 24,),     label: "Updates",),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(icCommunities),size: 24,), label: "Communities",),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(icCall),size: 22,),        label: "Calls",),
        ],
        onTap: (index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
