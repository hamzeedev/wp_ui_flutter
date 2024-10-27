import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../utils/consts/img_icon.dart';

class CommunitiesLayout extends StatelessWidget {
  const CommunitiesLayout({super.key});

  

  @override
  Widget build(BuildContext context) {

  final RxList<String> menu = RxList([
      'Settings',
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
           IconButton(
            onPressed: () {},
            icon: ImageIcon(AssetImage(icCamra),size: 22,)
          ),
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
        ],
        
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Communities",
            style: TextStyle(
              color: Colors.black, 
              fontSize: 28,
              ),
          ),
        ),
      ),
    );
  }
}