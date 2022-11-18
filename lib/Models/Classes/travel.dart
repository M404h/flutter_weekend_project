class Travel {
  final String country;
  final double? resturantExpenses;
  final double? hotelExpenses;
  final double? enterntainmentExpenses;
  final double? flightExpenses;
  final double budget;

  Travel({
    required this.country,
    required this.budget,
    this.resturantExpenses,
    this.enterntainmentExpenses,
    this.hotelExpenses,
    this.flightExpenses,
  });
}
