import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trying_flutter/W7_Homework/ui/screens/library/view_model/library_view_model.dart';

import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';
import 'widgets/library_content.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryViewModel(
        songRepository: context.read<SongRepository>(), 
        playerState: context.read<PlayerState>()
      )..init(),
      child: const LibraryContent(),
    );
  }
}