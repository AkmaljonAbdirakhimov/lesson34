import 'package:flutter/material.dart';
import 'package:lesson34/models/song.dart';
import 'package:lesson34/pages/song_page.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final songsManager = SongsManager();

  @override
  void initState() {
    super.initState();

    songsManager.initSongs();
  }

  @override
  Widget build(BuildContext context) {
    final songs = songsManager.songs;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player"),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (ctx, index) {
          final Song song = songs[index];
          return Card(
              child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => SongPage(index),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundColor: song.color,
            ),
            title: Text(song.title),
            trailing: IconButton(
              onPressed: () async {
                if (song.isPlaying) {
                  songsManager.pauseSong();
                } else {
                  songsManager.playSong(index);
                }
                song.togglePlaying();
                setState(() {});
              },
              icon: Icon(song.isPlaying ? Icons.pause : Icons.play_arrow),
            ),
          ));
        },
      ),
    );
  }
}
