import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("34-Dars"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const Gap(40),
            // Container(
            //   width: double.infinity,
            //   height: 200,
            //   color: Colors.amber,
            //   padding: const EdgeInsets.all(20),
            //   child: const Column(
            //     children: [
            //       CircleAvatar(
            //         radius: 40,
            //         backgroundImage: NetworkImage(
            //           "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
            //         ),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Icon(Icons.star),
            //           Text("iPhone 15"),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            const Gap(50),
            Container(
              color: Colors.red,
              height: 300,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.amber,
                    padding: const EdgeInsets.all(20),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.star),
                      Text("iPhone 15"),
                    ],
                  ),
                  const Align(
                    alignment: Alignment(0, -1.2),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                      ),
                    ),
                  ),
                  const Positioned(
                    top: -60,
                    left: -50,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(40),
            const SizedBox(
              width: double.infinity,
              height: 400,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Positioned(
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Positioned(
                    left: 25,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.88, -1),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.amber,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.82, -1),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
