import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_game_completed/presentation/search/cubits/search_video_game_cubit.dart';
import 'package:video_game_completed/presentation/search/search_page.dart';
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
          BlocProvider<SearchVideoGameCubit>(
            create: (context) => getIt<SearchVideoGameCubit>(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
            useMaterial3: true,
          ),
          home: const SearchPage(title: 'Search',),
        ));
  }
}


