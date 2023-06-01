import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_game_completed/core/cubit/video_game_cubit.dart';
import 'package:video_game_completed/core/data/models/search_videogame_response.dart';

import 'core/cubit/video_game_state.dart';
import 'core/data/models/video_game_short_model.dart';
import 'injection.dart';

Future<void> main() async {
  configureDependencies();
  await getIt.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<VideoGameCubit>(
            create: (context) => getIt<VideoGameCubit>(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchText = '';
  List<VideoGameShortModel> games = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocListener<VideoGameCubit, VideoGameState>(
        listener: _videoGameListener,
        child: Column(
          children: <Widget>[
            SearchBar(
              trailing: <Widget>[
                if (searchText.isNotEmpty && searchText.length >= 3)
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      context
                          .read<VideoGameCubit>()
                          .searchVideoGame(searchText);
                    },
                  )
              ],
              onChanged: (String text) {
                  setState(() {
                    searchText = text;
                    if(searchText.length < 3) games.clear();
                  });
              },
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: games.length,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(games[index].name));
                    }))
          ],
        ),
      ),
    );
  }

  void _videoGameListener(BuildContext context, VideoGameState state) {
    state.whenOrNull(success: (SearchVideogameResponse response){
      setState(() {
        games = response.games;
      });
    });
  }
}
