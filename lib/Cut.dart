class Cut {
  final String cutDate;
  String cutStatus;

  Cut({required this.cutDate, required this.cutStatus});

  String getCutDate() => cutDate;
  String getCutStatus() => cutStatus;
}
