import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_game_completed/features/details/cubits/details_video_game_cubit.dart';
import 'package:video_game_completed/features/favorites/cubits/favorite_video_games_cubit.dart';
import 'package:video_game_completed/features/search/cubits/search_video_game_cubit.dart';
import 'package:video_game_completed/features/search/search_page.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SearchVideoGameCubit>(
            create: (context) => getIt<SearchVideoGameCubit>(),
          ),
          BlocProvider<DetailsVideoGameCubit>(
              create: (context) => getIt<DetailsVideoGameCubit>()),
          BlocProvider<FavoriteVideoGameCubit>(
              create: (context) => getIt<FavoriteVideoGameCubit>())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
            useMaterial3: true,
          ),
          home: const SearchPage(
            title: 'Search',
          ),
        ));
  }
}
