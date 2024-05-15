class OrderEntity {
  final double value;
  final String title, helpedName, description, localName;
  final DateTime date;

  const OrderEntity(
      {required this.value,
      required this.title,
      required this.helpedName,
      required this.description,
      required this.localName,
      required this.date});
}
