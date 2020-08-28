abstract class EnumClass<T> {
  final T ix;
  final String text;

  const EnumClass(this.ix, this.text);

  List<EnumClass<T>> values();
  String toString() => text;
}
