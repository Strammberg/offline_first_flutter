import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first/features/dummy/dummy_cubit.dart';
import 'package:offline_first/features/dummy/dummy_state.dart';

class DummyView extends StatelessWidget {
  const DummyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: context.read<DummyCubit>().getDummy,
        child: BlocBuilder<DummyCubit, DummyState>(
          builder: (context, state) {
            return state.status.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_) => const Center(child: Text('Error')),
              orElse: () => ListView.separated(
                itemBuilder: (_,i) => Text('${state.dummies[i].value}'),
                separatorBuilder: (_,__) => const SizedBox(height: 10),
                itemCount: state.dummies.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
