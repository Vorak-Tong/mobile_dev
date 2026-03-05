import 'package:flutter/widgets.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  List<Song> _songs = [];

  final SongRepository _songRepository;
  final PlayerState _playerState;

  late final VoidCallback _playerListener;

  LibraryViewModel({
    required SongRepository songRepository,
    required PlayerState playerState,
  }) : _songRepository = songRepository,
       _playerState = playerState {
    _playerListener = notifyListeners;
    _playerState.addListener(_playerListener); // when PlayerState changes, refresh UI
  }

  Future<void> init() async {
    _songs = _songRepository.fetchSongs();
    notifyListeners();
  }

  @override
  void dispose() {
    _playerState.removeListener(_playerListener);
    super.dispose();
  }

  // Getter
  List<Song> get songs => _songs;
  Song? get currentSong => _playerState.currentSong;

  bool isPlaying(Song song) => _playerState.currentSong == song;

  // Action
  void play(Song song) => _playerState.start(song);
  void stop() => _playerState.stop();
}
