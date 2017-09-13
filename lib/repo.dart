class Repo {
  Repo({
    this.id,
    this.name,
    this.fullName,
    this.githubUrl,
    this.avatarUrl,
    this.stargazersCount,
    this.openIssuesCount,
    this.forksCount
  });

  final int id;
  final String name;
  final String fullName;
  final String githubUrl;
  final String avatarUrl;
  final int stargazersCount;
  final int openIssuesCount;
  final int forksCount;
}
