import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lesson34/models/song.dart';

class SongPage extends StatefulWidget {
  final int index;
  const SongPage(this.index, {super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  final songsManager = SongsManager();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    songsManager.initSongs(widget.index);

    songsManager.currentIndex().listen((event) {
      currentIndex = event!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Song song = songsManager.songs[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: song.color,
            ),
            const Gap(20),
            Text(song.title),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: currentIndex == 0
                      ? null
                      : () {
                          currentIndex--;
                          songsManager.previousSong();
                          setState(() {});
                        },
                  icon: const Icon(Icons.skip_previous),
                ),
                IconButton(
                  onPressed: () {
                    if (song.isPlaying) {
                      songsManager.pauseSong();
                    } else {
                      songsManager.playSong(currentIndex);
                    }
                    song.togglePlaying();
                    setState(() {});
                  },
                  icon: Icon(song.isPlaying ? Icons.pause : Icons.play_arrow),
                ),
                IconButton(
                  onPressed: currentIndex == songsManager.songs.length - 1
                      ? null
                      : () {
                          currentIndex++;
                          songsManager.nextSong();
                          setState(() {});
                        },
                  icon: const Icon(Icons.skip_next),
                ),
              ],
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder(
                  stream: songsManager.duration(),
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.toString());
                    } else {
                      return const Text("00:00");
                    }
                  },
                ),
                StreamBuilder(
                  stream: songsManager.currentPosition(),
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.toString());
                    } else {
                      return const Text("00:00");
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
