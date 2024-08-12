import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/song_player/bloc/song_player_state.dart';

import '../bloc/song_player_cubit.dart';

class SongPlayerPage extends StatelessWidget {
  const SongPlayerPage({super.key, required this.songEntity});

  final SongEntity songEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          "Now Playing",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        action: IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubit()..loadSong(songEntity.url),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _songCover(context),
              const SizedBox(height: 20),
              _songDetail(),
              const SizedBox(height: 30),
              _songPlayer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(songEntity.imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              songEntity.artist,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            songEntity.isFavorite
                ? Icons.favorite
                : Icons.favorite_outline_outlined,
            size: 35,
            color: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }

  Widget _songPlayer() {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
        builder: (context, state) {
      if (state is SongPlayerLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is SongPlayerLoaded) {
        return Column(
          children: [
            Slider(
              activeColor: AppColors.grey,
              inactiveColor: AppColors.darkGrey,
              value: context
                  .read<SongPlayerCubit>()
                  .songPosition
                  .inSeconds
                  .toDouble(),
              onChanged: (value) {
                // context.read<SongPlayerCubit>().seekTo(value.toInt());
              },
              min: 0,
              max: context
                  .read<SongPlayerCubit>()
                  .songDuration
                  .inSeconds
                  .toDouble(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDuration(context.read<SongPlayerCubit>().songPosition),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  formatDuration(context.read<SongPlayerCubit>().songDuration),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.read<SongPlayerCubit>().playOrPauseSong();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  context.read<SongPlayerCubit>().audioPlayer.playing
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ],
        );
      }
      return Container();
    });
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
