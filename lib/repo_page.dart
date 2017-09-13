import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'repo_list.dart';
import 'repo.dart';

class RepoPage extends StatefulWidget {
  RepoPage({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => new _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {

  final _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  var list = <Repo>[];

  Future _fetchRepos() async {

    const url = 'https://api.github.com/search/repositories?q=language:javascript';

    var httpClient = createHttpClient();
    var response = await httpClient.read(url);
    var data = JSON.decode(response);

    if (!mounted) return;

    var repoList = <Repo>[];

    data['items'].forEach((item) {
      repoList.add(new Repo(
        id: item['id'],
        name: item['name'],
        fullName: item['full_name'],
        githubUrl: item['html_url'],
        avatarUrl: item['owner']['avatar_url'],
        stargazersCount: item['stargazers_count'],
        openIssuesCount: item['open_issues_count'],
        forksCount: item['forks_count']
      ));
    });

    setState(() {
      list = repoList;
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('OctoFlutter'),
      ),
      body: new RefreshIndicator(
        key: _refreshIndicatorKey,
        child: new RepoList(list),
        onRefresh: _fetchRepos,
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.sync),
        onPressed: () {
          _refreshIndicatorKey.currentState.show();
        }
      ),
    );
  }
}