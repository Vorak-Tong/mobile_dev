import 'package:provider/provider.dart';
import 'package:nested/nested.dart';

import 'main_common.dart';
import 'data/repositories/songs/song_repository.dart';
import 'data/repositories/songs/song_repository_mock.dart';
import 'data/repositories/settings/app_settings_repository.dart';
import 'data/repositories/settings/app_settings_repository_mock.dart';
import 'ui/states/player_state.dart';
import 'ui/states/settings_state.dart';

/// Configure provider dependencies for dev environment
List<SingleChildWidget> get devProviders {
  return [
    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryMock()),

    // 2 - Inject the app settings repository
    Provider<AppSettingsRepository>(
      create: (_) => AppSettingsRepositoryMock(),
    ),

    // 2 - Inject the player state
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    // 3 - Inject the  app setting state
    ChangeNotifierProvider<AppSettingsState>(
      create: (context) {
        final repo = context.read<AppSettingsRepository>();
        final state = AppSettingsState(repo);
        state.init();
        return state;
      },
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
