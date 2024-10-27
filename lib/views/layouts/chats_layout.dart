import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/state_manager.dart';
import 'package:my_wp_ui/extensions/extension.dart';
import 'package:random_x/random_x.dart';

import '../../utils/consts/colors.dart';
import '../../utils/consts/img_icon.dart';
import '../screens/chat_screen.dart';

class ChatsLayout extends StatelessWidget {
  const ChatsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> myData = {
      "Hamza": "Hello..?",
      "Ali": "How are you",
      "Ahmad": "meeting is coming..",
    };

    final RxList<String> menu = RxList([
      'New Group',
      'New Broadcast',
      'Linked Devices',
      'Starred Messages',
      'Settings',
    ]);
    // Rx<String> selectedMenu;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(icCamra),
                size: 22,
              )),
          PopupMenuButton(
            icon: ImageIcon(
              AssetImage(icMenu),
              size: 22,
            ),
            // onSelected: (value) {
            //  Obx(()=> selectedMenu = value);
            // },
            itemBuilder: (context) => menu.map((group) {
              return PopupMenuItem(
                value: group,
                child: Text(group),
              );
            }).toList(),
          ),

          // IconButton(
          //   onPressed: (){},
          //   icon: ImageIcon(AssetImage(icMenu),size: 22,)
          // ),
        ],
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "WhatsApp",
            style: TextStyle(
              color: appColor,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 16,
          itemBuilder: (_, index) {
            var number = Random().nextInt(10);

            if (index < myData.length) {
              var item = myData.entries.toList()[index];
              return getChatTile(
                      context,
                      {
                        "name": item.key,
                        "id": RndX.genUUID(),
                      },
                      item.value,
                      number)
                  .animate()
                  .fadeIn(
                    duration: 2.seconds,
                  );
            } else {
              return getChatTile(
                      context,
                      {
                        "name": RndX.randomCompletePersonDetails().name,
                        "id": RndX.genUUID(),
                      },
                      RndX.randomCompletePersonDetails().email,
                      number)
                  .animate()
                  .fadeIn(
                    duration: const Duration(seconds: 2),
                  );
            }
          }),
    );
  }

  Widget getChatTile(BuildContext context, Map<String, dynamic> user,
      String lastMessage, int unread) {
    var image = "https://loremflickr.com/200/200?random=1$unread";
    return ListTile(
      leading: Hero(
        tag: user['id'],
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 5, 26, 6),
            shape: BoxShape.circle,
            image: DecorationImage(image: CachedNetworkImageProvider(image)),
          ),
        ),
      ),
      title: Text(
        user['name'],
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(lastMessage),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Badge.count(
            count: unread,
            isLabelVisible: unread != 0,
          ),
          const Text("06:00 AM"),
        ],
      ),
      onTap: () {
        context.openScreen(ChatScreen(
          username: user['name'],
          image   : image,
          userId  : user['id'],
        ));
      },
    );
  }
}
