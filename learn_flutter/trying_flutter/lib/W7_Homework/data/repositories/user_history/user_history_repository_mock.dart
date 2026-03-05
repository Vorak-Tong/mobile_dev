import 'user_history_repository.dart';

class UserHistoryRepositoryMock implements UserHistoryRepository{
  final List<String> _recentSongIds = [];

  @override
  List<String> fetchRecentSongIds() {
    return List.unmodifiable(_recentSongIds);
  }

  @override
  void addSongId(String id) {
    // remove duplicate then insert at start
    _recentSongIds.remove(id);
    _recentSongIds.insert(0, id);
  }
}
