import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/categorys_entity.dart';
import 'package:flutter_application_base/presentation/providers/categorys_provider.dart';
import 'package:flutter_application_base/presentation/widgets/categorys_card.dart';
import 'package:provider/provider.dart';

class CategorysScreen extends StatelessWidget {
  const CategorysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryprovider = context.watch<CategorysProvider>();
    final colors = Theme.of(context).colorScheme;
    categoryprovider.getCategorys();
    final List<CategorysEntity> categorys = categoryprovider.categorys;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        backgroundColor: colors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8),
            itemCount: categorys.length,
            itemBuilder: (context, index) {
              return CategorysCard(category: categorys[index]);
            }),
      ),
    );
  }
}
