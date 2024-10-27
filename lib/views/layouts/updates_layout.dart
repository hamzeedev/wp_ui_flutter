import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/consts/colors.dart';
import '../../utils/consts/img_icon.dart';

class UpdatesLayout extends StatelessWidget {
  const UpdatesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {}, icon: ImageIcon(AssetImage(icCamra), size: 22)),
          IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage(icSearch), size: 24)),
          IconButton(
              onPressed: () {}, icon: ImageIcon(AssetImage(icMenu), size: 22)),
        ],
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Updates",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                "My Status",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"))),
                    height: 60,
                    width: 60,
                  ),
                   Icon(
                    Icons.add_a_photo,
                    size: 18,
                    color: appColor,
                  )
                ],
              ),
              subtitle: const Text("Tap to add status update"),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Recent Updates",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (_, index) {
                  return getRecentUpdate("Hamza", "24m ago", 1);
                }),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Viewed Updates",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (_, index) {
                  return getViewedUpdate("name", "2m ago", 3);
                }),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Channels",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 8),
              child: Text(
                "Stay updated on topics that matter to you. Find channels to follow below.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 155, 
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, 
                  itemBuilder: (context, index) {
                    return getChannels("WhatsApp");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget getRecentUpdate(String name, String minsAgo, int unread) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 5, 26, 6),
          shape: BoxShape.circle,
          border: Border.all(color: appColor, width: 3),
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                  "https://loremflickr.com/200/200?random=1$unread")),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(minsAgo),
    );
  }

  Widget getViewedUpdate(String name, String minsAgo, int unread) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 5, 26, 6),
          shape: BoxShape.circle,
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                  "https://loremflickr.com/200/200?random=1$unread")),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(minsAgo),
    );
  }

  Widget getChannels(String channelName){
    return Container(
                      margin: const EdgeInsets.only(right: 8.0), 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      width: 140,
                      height: 155,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(imgWpLog, height: 54, width: 54),
                          const Text("WhatsApp"),
                          SizedBox(
                            width: 110,
                            height: 34,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor:appColorLight,),
                              onPressed: () {},
                              child: const Text('Follow'),
                            ),
                          )
                        ],
                      ),
                    );
  }
}
