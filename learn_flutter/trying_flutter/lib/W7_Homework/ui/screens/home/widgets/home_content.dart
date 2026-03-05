import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trying_flutter/W7_Homework/ui/screens/home/view_model/home_view_model.dart';

import '../../../../model/songs/song.dart';
import '../../../states/settings_state.dart';
import '../../../theme/theme.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsState = context.watch<AppSettingsState>();
    final vm = context.watch<HomeViewModel>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Home', style: AppTextStyles.heading),
          const SizedBox(height: 20),

          Text('Your recent songs', style: AppTextStyles.label),
          const SizedBox(height: 8),
          ...vm.recentSongs.map(
            (song) => SongTile(
              song: song,
              isPlaying: vm.isPlaying(song),
              onTap: () => vm.play(song),
              onStop: () => vm.stop(),
            ),
          ),

          const SizedBox(height: 24),
          Text('You might also like', style: AppTextStyles.label),
          const SizedBox(height: 8),
          ...vm.recommendedSongs.map(
            (song) => SongTile(
              song: song,
              isPlaying: vm.isPlaying(song),
              onTap: () => vm.play(song),
              onStop: () => vm.stop(),
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
    required this.onStop,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isPlaying)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text("Playing", style: TextStyle(color: Colors.amber)),
            ),
          IconButton(onPressed: onStop, icon: const Icon(Icons.stop)),
        ],
      ),
    );
  }
}
