class Source {
  final String id;
  final String kind;
  final String value;
  Source({required this.id, required this.value, required this.kind});
  static Source fromMap({required Map sources}) {
    return Source(
        id: sources["_id"],
        kind: sources["kind"],
        value: sources["value"],
    );
  }
}