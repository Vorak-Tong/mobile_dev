import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trying_flutter/W7_Homework/ui/screens/library/view_model/library_view_model.dart';

import '../../../../model/songs/song.dart';
import '../../../states/settings_state.dart';
import '../../../theme/theme.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsState = context.watch<AppSettingsState>();
    final vm = context.watch<LibraryViewModel>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: vm.songs.length,
              itemBuilder: (context, index) {
                final song = vm.songs[index];

                return SongTile(
                  song: song,
                  isPlaying: vm.isPlaying(song),
                  onTap: () => vm.play(song),
                  onStop: vm.stop,
                );
              },
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
