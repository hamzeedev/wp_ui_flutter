import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../utils/consts/colors.dart';
import '../../utils/consts/img_icon.dart';

class CallsLayout extends StatelessWidget {
  const CallsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
           IconButton(
            onPressed: () {},
            icon: ImageIcon(AssetImage(icCamra),size: 22,)
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(AssetImage(icSearch),size: 24,)
          ),
          
          IconButton(
            onPressed: () {},
            icon: ImageIcon(AssetImage(icMenu),size: 22,)
          ),
        ],
        
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Calls",
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Favourites", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          ),
         ListTile(
          leading: Container(
            
            height: 44,
            width: 44,
            decoration:  BoxDecoration(
              color: appColor,
              shape: BoxShape.circle
            ),
            child: const Icon(Icons.favorite, color: Colors.white,),
          ),
          title: const Text("Add Favourite"),
         ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Recent", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (_, index) {
                return getCallTile("Hamza Rafique", "Today, 3:15 PM");
              }),
            
        ],
      ),
    ),
    );
  }

  Widget getCallTile(String name, String callType) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 5, 26, 6),
          shape: BoxShape.circle,
        
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                  "https://loremflickr.com/200/200?random=1")),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle:  Row(
        children: [
          const Icon(Icons.call_missed_outlined, color: Colors.red,),
          Text(callType),
        ],
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: ImageIcon(AssetImage(icCall),size: 22, color: appColor,)
        ),
      
      
    );
  }
  
}
