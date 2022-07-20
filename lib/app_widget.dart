import 'package:dengun_challenge/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'features/products_list/presentation/pages/products_list_page.dart';
import 'features/tags_list/presentation/pages/tags_list_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dengun Challenge',
      home: const TagsListPage(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color.fromRGBO(37, 40, 49, 1))),
      routes: {
        AppRoutes.tagsListPage: (context) => const TagsListPage(),
        AppRoutes.productsListPage: (context) => const ProductsListPage(),
      },
    );
  }
}
