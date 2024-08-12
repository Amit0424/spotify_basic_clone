import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/song_player/pages/song_player.dart';

import '../../../common/widgets/favorite_button/favorite_button.dart';
import '../bloc/favorite_songs_cubit.dart';
import '../bloc/favorite_songs_state.dart';
import '../bloc/profile_info_cubit.dart';
import '../bloc/profile_info_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0xFF2C2B2B),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfo(context),
          const SizedBox(height: 20),
          const Text(
            'Favorite Songs',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _favoriteSongs(context),
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileInfoCubit()..getUser(),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
            if (state is ProfileInfoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileInfoLoaded) {
              return Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? const Color(0xFF2C2B2B)
                      : Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(state.userEntity.profilePic!),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      state.userEntity.email!,
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            context.isDarkMode ? AppColors.grey : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.userEntity.fullName!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: context.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("Failed to load profile info"),
              );
            }
          },
        ));
  }

  Widget _favoriteSongs(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit()..getFavoriteSongs(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
          builder: (context, state) {
            if (state is FavoriteSongsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FavoriteSongsLoaded) {
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SongPlayerPage(
                                  songEntity: state.favoriteSongs[index])));
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    state.favoriteSongs[index].imageUrl)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.favoriteSongs[index].title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                state.favoriteSongs[index].artist,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC6C6C6),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          state.favoriteSongs[index].duration
                              .toString()
                              .replaceAll('.', ':'),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FavoriteButton(
                          songEntity: state.favoriteSongs[index],
                          key: UniqueKey(),
                          function: () {
                            context
                                .read<FavoriteSongsCubit>()
                                .removeSong(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: state.favoriteSongs.length,
              );
            }
            if (state is FavoriteSongsFailure) {
              return const Center(
                child: Text("Failed to load favorite songs"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
