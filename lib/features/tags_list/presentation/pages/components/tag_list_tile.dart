import 'package:dengun_challenge/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class TagListTile extends StatelessWidget {
  const TagListTile({Key? key, required this.tag}) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(child: Text(tag)),
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.productsListPage,
          arguments: tag,
        );
      },
    );
  }
}
