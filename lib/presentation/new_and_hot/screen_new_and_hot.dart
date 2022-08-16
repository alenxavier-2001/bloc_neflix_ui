import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:neflix_ui/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/presentation/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:neflix_ui/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

import 'package:neflix_ui/widgets/appbar_widget.dart';
import 'package:neflix_ui/widgets/custom_button_widget.dart';
import 'package:neflix_ui/widgets/video_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  size: 30,
                  color: Colors.white,
                ),
                kWidth,
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.blue,
                ),
                kWidth
              ],
              bottom: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: kWhite,
                    borderRadius: kRadius30,
                  ),
                  unselectedLabelColor: kWhite,
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  labelColor: kBlack,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(
                      text: "  😗 Coming Soon",
                    ),
                    Tab(
                      text: "  🍿 Everyone Seeing",
                    )
                  ]),
            ),
          ),
          body: const TabBarView(children: [
            ComingSoonList(
              key: Key('coming soon'),
            ),
            EveryOneisWatchingList(
              key: Key('everyone is watching'),
            )
          ]),
        ),
      ),
    );
  }

  /* Widget _buildComingSoon() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ComingSoonWidget();
        });
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
          return const EveryonesWatchingWidget();
        }));
  }*/
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("Error Occur"),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text("Coming soon list is empty"),
            );
          } else {
            return ListView.builder(
                itemCount: state.comingSoonList.length,
                itemBuilder: (context, index) {
                  final movie = state.comingSoonList[index];
                  final date = DateTime.parse(movie.releaseDate!);
                  final formattedDate = DateFormat.yMMMMd('en_US').format(date);
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  return ComingSoonWidget(
                      id: movie.id.toString(),
                      month: formattedDate
                          .split(' ')
                          .first
                          .substring(0, 3)
                          .toUpperCase(),
                      day: movie.releaseDate!.split('-')[1],
                      posterPath: "$imageAppendUrl${movie.posterPath}",
                      movieName: movie.originalTitle ?? 'no title',
                      description: movie.overview ?? 'no description');
                });
          }
        },
      ),
    );
  }
}

class EveryOneisWatchingList extends StatelessWidget {
  const EveryOneisWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryoneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("Error Occur"),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text("Watching error list is empty"),
            );
          } else {
            return ListView.builder(
                itemCount: state.everyOneIsWatchingList.length,
                itemBuilder: (context, index) {
                  final tv = state.everyOneIsWatchingList[index];

                  if (tv.id == null) {
                    return const SizedBox();
                  }
                  return EveryonesWatchingWidget(
                      id: tv.id.toString(),
                      posterPath: "$imageAppendUrl${tv.posterPath}",
                      movieName: tv.originalName ?? 'no title',
                      description: tv.overview ?? 'no description');
                });
          }
        },
      ),
    );
  }
}
