import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("34-Dars"),
      ),
      body: Column(
        children: [
          Gap(30),
          Center(
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Ma'lumot saqlandi")),
                );
              },
              child: const Text("Show Snackbar"),
            ),
          ),
          Gap(30),
          Center(
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: const Text("Ma'lumot saqlandi"),
                    actions: [
                      IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .clearMaterialBanners();
                          },
                          icon: const Icon(Icons.clear))
                    ],
                  ),
                );
              },
              child: const Text("Show Material Banner"),
            ),
          ),
          Gap(30),
          Center(
            child: OutlinedButton(
              onPressed: () {
                // showDialog(
                //   context: context,
                //   builder: (ctx) {
                //     return const AboutDialog(
                //       applicationIcon: Icon(Icons.abc),
                //     );
                //   },
                // );

                // showAboutDialog(context: context, applicationName: "Flutter");

                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      icon: Icon(Icons.add),
                      title: const Text("Flutter App"),
                    );
                  },
                );
              },
              child: const Text("Show About Dialog"),
            ),
          ),
          Gap(30),
          Center(
            child: OutlinedButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: false,
                    context: context,
                    builder: (ctx) {
                      return const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CircleAvatar(
                            radius: 50,
                          ),
                          Text("Salom"),
                        ],
                      );
                    });
              },
              child: const Text("Show Bottom Modal Window"),
            ),
          ),
        ],
      ),
    );
  }
}
