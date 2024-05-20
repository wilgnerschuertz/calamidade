abstract class IValueObject<T> {
  final T value;
  IValueObject({
    required this.value,
  });
  String? validate();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
