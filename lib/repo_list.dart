import 'package:flutter/material.dart';
import 'repo_list_item.dart';
import 'repo.dart';

class RepoList extends StatelessWidget {
  const RepoList(this.list);

  final List<Repo> list;

  @override
  Widget build(BuildContext context) {

    Iterable<Widget> listTiles = list.map((item) {
      return new MergeSemantics(
        child: new RepoListItem(
          repo: item,
          key: new Key(item.id.toString())
        ),
      );
    });

    listTiles = ListTile.divideTiles(context: context, tiles: listTiles);

    return new ListView(
      children: listTiles.toList(),
    );
  }
}