import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:my_wp_ui/extensions/extension.dart';

import '../../utils/consts/colors.dart';
import '../../utils/consts/img_icon.dart';
import 'call_screen.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  
  String username, image, userId;

  ChatScreen({
    super.key,
    required this.username,
    required this.image,
    required this.userId,
  });

  // reactive list
  RxList<Map<String, dynamic>> messages = RxList([]);
  TextEditingController inputController = TextEditingController();
  var number = Random().nextInt(40);
  

  //reactive intiger
  // Rx<int> length = Rx(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:  [
          const Icon(
            Icons.video_call_outlined,
            size: 32,
          ),
          const SizedBox(
            width: 12,
          ),
          IconButton(
            onPressed: (){
              Get.to(()=> const CallScreen(),
                );
            }, 
            icon: ImageIcon(
                AssetImage(icCall),
                size: 22,
              ),
          ),
          ImageIcon(
                AssetImage(icMenu),
                size: 22,
              ),
          const SizedBox(
            width: 12,
          ),
          // Obx(() {
          //   return Text(length.value.toString());
          // })
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Last seen $number mins ago",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        centerTitle: false,
        leadingWidth: MediaQuery.of(context).size.width * 0.25,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back)),
            Hero(
              tag: userId,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      image,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/bg.jpg",
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.5),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Obx(
                    () { 
                      return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (_, index) {
                          var item = messages[index];
                          var sender = index % 2 == 0;

                          return Align(
                            alignment: sender
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Column(
                              children: [
                                CupertinoContextMenu(
                                  actions: [
                                    CupertinoContextMenuAction(
                                      onPressed: () {
                                        messages.removeAt(index);
                                        context.pop();
                                      },
                                      isDestructiveAction: true,
                                      trailingIcon: CupertinoIcons.delete,
                                      child: const Text("Delete"),
                                      
                                    ),
                                    CupertinoContextMenuAction(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      
                                      child: const Text("Dismiss"),
                                    ),
                                  ],
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Card(
                                      elevation: 6,
                                      shape: Border.all(
                                          color: sender
                                              ? Colors.green
                                              : Colors.black),
                                      child: ListTile(
                                        tileColor: sender
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 199, 201, 202),
                                        title: Text(item['text'].toString()),
                                        subtitle: Text(
                                            (item['timestamp'] as int)
                                                .formatDate("hh:mm a")),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            controller: inputController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Enter message here",
                            ),
                            //! ya agr hum enter press krny pr message send krwana chaty hain to waha use hota hai
                            onFieldSubmitted: (data) {
                              sendMessage(data);
                            },
                            //! also if you want to use upper line of code
                            //! the you have to remove below ones
                            // minLines: 1,
                            // maxLines: 4,
                            // onChanged: (x) {
                            //   length.value = x.length;
                            // },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: appColor, shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {
                          var text = inputController.text;
                          sendMessage(text);
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(String text) {
    if (text.isNotEmpty) {
      messages.add({
        "text": text,
        "timestamp": DateTime.now().millisecondsSinceEpoch,
      });
      inputController.clear();
      // length.value = 0;
    }
  }
}

/**
 * "text" : "mesage ho ga yaha",
 * "timestamp": time ho ga es mai
 */
