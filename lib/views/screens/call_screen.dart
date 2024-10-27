import 'package:flutter/material.dart';
import 'package:my_wp_ui/extensions/extension.dart';


class CallScreen extends StatelessWidget {
  const CallScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 42, 42, 42),
     appBar: AppBar(
      backgroundColor:const Color.fromARGB(255, 42, 42, 42),
     ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const Text("Ringing...", style: TextStyle(color: Color.fromARGB(255, 215, 215, 215), fontSize: 22)),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/wp.png",
                  height: 142,
                  width: 142,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 74,
                  width: MediaQuery.of(context).size.width * 0.9,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 62, 62, 62)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blueGrey),
                          child: IconButton(
                              onPressed: () {
                                // context.pop();
                              },
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 32,
                              ))),
                      Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blueGrey),
                          child: IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: const Icon(
                                Icons.video_call,
                                color: Colors.grey,
                                size: 32,
                              ))),
                      Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blueGrey),
                          child: IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: const Icon(
                                Icons.volume_up,
                                color: Colors.white,
                                size: 32,
                              ))),
                      Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blueGrey),
                          child: IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: const Icon(
                                Icons.mic_off,
                                color: Colors.white,
                                size: 32,
                              ))),
                      Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: const Icon(
                                Icons.call_end,
                                color: Colors.white,
                                size: 32,
                              ))),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
    // Scaffold(
    //   body: Container(
    //     color: Colors.amber,
    //   ),
    //     bottomNavigationBar: Container(
    //       height: 74,
    //       width: MediaQuery.of(context).size.width * 0.9,
    //       // color: Colors.grey,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(12), color: const Color.fromARGB(255, 62, 62, 62)),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Container(
    //               decoration: const BoxDecoration(
    //                   shape: BoxShape.circle, color: Colors.blueGrey),
    //               child: IconButton(
    //                   onPressed: () {
    //                     // context.pop();
    //                   },
    //                   icon: const Icon(
    //                     Icons.menu,
    //                     color: Colors.white,
    //                     size: 32,
    //                   ))),
    //           Container(
    //               decoration: const BoxDecoration(
    //                   shape: BoxShape.circle, color: Colors.blueGrey),
    //               child: IconButton(
    //                   onPressed: () {
    //                     context.pop();
    //                   },
    //                   icon: const Icon(
    //                     Icons.video_call,
    //                     color: Colors.grey,
    //                     size: 32,
    //                   ))),
    //           Container(
    //               decoration: const BoxDecoration(
    //                   shape: BoxShape.circle, color: Colors.blueGrey),
    //               child: IconButton(
    //                   onPressed: () {
    //                     context.pop();
    //                   },
    //                   icon: const Icon(
    //                     Icons.volume_up,
    //                     color: Colors.white,
    //                     size: 32,
    //                   ))),
    //           Container(
    //               decoration: const BoxDecoration(
    //                   shape: BoxShape.circle, color: Colors.blueGrey),
    //               child: IconButton(
    //                   onPressed: () {
    //                     context.pop();
    //                   },
    //                   icon: const Icon(
    //                     Icons.mic_off,
    //                     color: Colors.white,
    //                     size: 32,
    //                   ))),
    //           Container(
    //               decoration: const BoxDecoration(
    //                   shape: BoxShape.circle, color: Colors.red),
    //               child: IconButton(
    //                   onPressed: () {
    //                     context.pop();
    //                   },
    //                   icon: const Icon(
    //                     Icons.call_end,
    //                     color: Colors.white,
    //                     size: 32,
    //                   ))),
    //         ],
    //       ),
    //     )
    //     );
  }
}
