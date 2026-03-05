import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trying_flutter/W7_Homework/ui/screens/home/view_model/home_view_model.dart';

import '../../../data/repositories/songs/song_repository.dart';
import '../../../data/repositories/user_history/user_history_repository.dart';
import '../../states/player_state.dart';
import 'widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        songRepository: context.read<SongRepository>(), 
        historyRepository: context.read<UserHistoryRepository>(),
        playerState: context.read<PlayerState>(),
      )..init(),
      child: const HomeContent(),
    );
  }
}