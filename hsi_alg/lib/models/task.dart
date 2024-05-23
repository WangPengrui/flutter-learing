class Task {
  String name;
  String imagePath;
  String description;

  Task({
    required this.name,
    required this.imagePath,
    required this.description,
  });

  String get _name => name;
  String get _imagePath => imagePath;
  String get _description => description;
}
