import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first/features/dummy/dummy_cubit.dart';
import 'package:offline_first/features/dummy/dummy_view.dart';
import 'package:remote_repository/remote_repository.dart';

class DummyProvider extends StatelessWidget {
  const DummyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          DummyCubit(remoteRepository: context.read<RemoteRepository>()),
      child: const DummyView(),
    );
  }
}
