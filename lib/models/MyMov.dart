class MyMov {
  final String title;
  final String year;
  final String type;
  final String poster;
  final String imdbID;

  MyMov(
      {required this.title,
      required this.year,
      required this.type,
      required this.poster,
      required this.imdbID});

  factory MyMov.fromJson(Map<String, dynamic> json) {
    return MyMov(
        title: json['Title'],
        year: json['Year'],
        type: json['Type'],
        poster: json['Poster'],
        imdbID: json['imdbID']);
  }
}
