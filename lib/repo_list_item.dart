import 'package:flutter/material.dart';
import 'repo.dart';

class RepoListItem extends StatelessWidget {
  RepoListItem({Key key, this.repo}): super(key: key);

  final Repo repo;

  String _buildSubtitle(Repo repo) {
    return "${'\u{1f31f}'} ${repo.stargazersCount}   "
      "${'\u{1f374}'} ${repo.forksCount}   "
      "${'\u{2757}'} ${repo.openIssuesCount} issues";
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(repo.fullName),
      subtitle: new Text(_buildSubtitle(repo)),
      leading: new CircleAvatar(
        backgroundImage: new NetworkImage(repo.avatarUrl),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}