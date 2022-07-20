import 'package:dartz/dartz.dart' as dartz;
import 'package:dengun_challenge/core/errors/failures/parsing_failure.dart';
import 'package:dengun_challenge/core/errors/failures/server_failure.dart';
import 'package:dengun_challenge/core/injection_container.dart';
import 'package:dengun_challenge/features/tags_list/presentation/pages/components/tag_list_tile.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/get_tags.dart';

class TagsListPage extends StatefulWidget {
  const TagsListPage({Key? key}) : super(key: key);

  @override
  State<TagsListPage> createState() => _TagsListPageState();
}

class _TagsListPageState extends State<TagsListPage> {
  late final Future getTagsFuture;

  @override
  void initState() {
    getTagsFuture = getIt<GetTags>().call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tags List'),
      ),
      body: FutureBuilder(
        future: getTagsFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: Text('Loading....'));
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                late Widget widgetToBeDisplayed;
                final tags = snapshot.data as dartz.Either;

                tags.fold((l) {
                  if (l is ParsingFailure) {
                    widgetToBeDisplayed =
                        const Text('There has been a Parsing Error');
                  } else if (l is ServerFailure) {
                    widgetToBeDisplayed =
                        const Text('There has been a ServerFailure');
                  } else {
                    widgetToBeDisplayed =
                        const Text('There has been an unknown error');
                  }
                }, (r) {
                  widgetToBeDisplayed = ListView.builder(
                    itemCount: r.length,
                    itemBuilder: (context, index) {
                      return TagListTile(tag: r[index]);
                    },
                  );
                });

                return widgetToBeDisplayed;
              }
          }
        },
      ),
    );
  }
}
