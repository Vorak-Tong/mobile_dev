import 'package:flutter/widgets.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../data/repositories/user_history/user_history_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../states/player_state.dart';

class HomeViewModel extends ChangeNotifier {
  List<Song> _recentSongs = [];
  List<Song> _recommendedSongs = [];

  final SongRepository _songRepository;
  final UserHistoryRepository _historyRepository;
  final PlayerState _playerState;

  late final VoidCallback _playerListener;

  HomeViewModel({
    required SongRepository songRepository,
    required UserHistoryRepository historyRepository,
    required PlayerState playerState,
  }) : _songRepository = songRepository,
       _historyRepository = historyRepository,
       _playerState = playerState {
    _playerListener = notifyListeners;
    _playerState.addListener(
      _playerListener,
    ); // when PlayerState changes, refresh UI
  }

  Future<void> init() async {
    _refreshSongs();
  }

  void _refreshSongs() {
    final allSongs = _songRepository.fetchSongs();
    final recentIds = _historyRepository.fetchRecentSongIds();

    // recent song: keep order of IDs, ignore unknown IDs
    _recentSongs = recentIds
        .map((id) {
          try {
            return allSongs.firstWhere((s) => s.id == id);
          } catch (_) {
            return null;
          }
        })
        .whereType<Song>()
        .toList();

    // recommended song: songs not in recent
    final recentSet = recentIds.toSet();
    _recommendedSongs = allSongs
        .where((s) => !recentSet.contains(s.id))
        .toList();

    notifyListeners();
  }

  @override
  void dispose() {
    _playerState.removeListener(_playerListener);
    super.dispose();
  }

  // Getter
  List<Song> get recentSongs => _recentSongs;
  List<Song> get recommendedSongs => _recommendedSongs;
  Song? get currentSong => _playerState.currentSong;

  bool isPlaying(Song song) => _playerState.currentSong == song;

  // Action
  void play(Song song){
    _playerState.start(song);
    _historyRepository.addSongId(song.id); // update history
    _refreshSongs(); // refresh recent and recommed immediately
  }
  void stop() => _playerState.stop();
}
