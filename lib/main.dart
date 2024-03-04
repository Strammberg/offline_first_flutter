import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'package:offline_first/features/dummy/dummy_provider.dart';
import 'package:remote_repository/remote_repository.dart';

Future<void> main() async {
  await LocalStorage.loadBoxes();

  const baseUrl = 'http://10.0.2.2:3000';
  final dio = DioClient.init(baseUrl);
  final remoteRepository = RemoteRepository(baseUrl: baseUrl, dio: dio.client);

  runApp(MyApp(remoteRepository: remoteRepository));
}

class MyApp extends StatelessWidget {
  final RemoteRepository remoteRepository;
  const MyApp({required this.remoteRepository, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(create: (_) => remoteRepository),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DummyProvider()
      ),
    );
  }
}