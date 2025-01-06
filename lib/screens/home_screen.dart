import 'package:bloom_app/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/plant_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plantData = ref.watch(plantProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.stringA)),
      body: plantData.when(
        data: (plants) => ListView.builder(
          itemCount: plants.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(plants[index].name),
              onTap: () {
                // Navigate to details screen
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
