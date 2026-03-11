import 'package:flutter/material.dart';
import 'package:trying_flutter/W8_Small_Homework/ui/utils/async_value.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  AsyncValue<List<Song>> songsState = AsyncValue.loading();
  // List<Song>? _songs;

  LibraryViewModel({required this.songRepository, required this.playerState}) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  // List<Song> get songs => _songs == null ? [] : _songs!;

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    // 1 - Fetch songs
    // _songs = await songRepository.fetchSongs();
    songsState = AsyncValue.loading();
    notifyListeners();

    try {
      final songs = await songRepository.fetchSongs();
      songsState = AsyncValue.success(songs);
    } catch (e) {
      songsState = AsyncValue.error(e);
    }

    // 2 - notify listeners
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
