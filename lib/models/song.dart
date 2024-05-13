import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Song {
  final String title;
  final Color color;
  final String url;
  bool isPlaying;

  Song({
    required this.title,
    this.color = Colors.blue,
    required this.url,
    this.isPlaying = false,
  });

  void togglePlaying() {
    isPlaying = !isPlaying;
  }
}

class SongsManager {
  SongsManager._singleton();

  static final _songsManager = SongsManager._singleton();

  factory SongsManager() {
    return _songsManager;
  }

  final audioPlayer = AudioPlayer();

  List<Song> songs = [
    Song(
      title: "Song 1",
      url: "assets/song1.mp3",
      color: Colors.amber,
    ),
    Song(
      title: "Song 2",
      url: "assets/song2.mp3",
      color: Colors.red,
    ),
    Song(
      title: "Song 3",
      url: "assets/song3.mp3",
      color: Colors.pink,
    ),
    Song(
      title: "Song 4",
      url: "assets/song4.mp3",
      color: Colors.purple,
    ),
    Song(
      title: "Song 5",
      url: "assets/song5.mp3",
      color: Colors.green,
    ),
    Song(
      title: "Song 6",
      url: "assets/song6.mp3",
      color: Colors.blue,
    ),
  ];

  void initSongs([int currentIndex = 0]) async {
    final playlist = ConcatenatingAudioSource(
      useLazyPreparation: true,
      shuffleOrder: DefaultShuffleOrder(),
      children: songs.map((song) {
        return AudioSource.asset(song.url);
      }).toList(),
    );
    await audioPlayer.setAudioSource(playlist,
        initialIndex: currentIndex, initialPosition: Duration.zero);
  }

  void playSong(int index) async {
    await audioPlayer.seek(Duration.zero, index: index);
    await audioPlayer.play();
  }

  void pauseSong() async {
    await audioPlayer.pause();
  }

  void nextSong() async {
    pauseSong();
    await audioPlayer.seekToNext();
  }

  void previousSong() async {
    pauseSong();
    await audioPlayer.seekToPrevious();
  }

  Stream<Duration?> duration() {
    return audioPlayer.durationStream;
  }

  Stream<Duration> currentPosition() {
    return audioPlayer.positionStream;
  }

  Stream<int?> currentIndex() {
    return audioPlayer.currentIndexStream;
  }
}
