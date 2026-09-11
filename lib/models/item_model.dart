// ============================================================
//  item_model.dart  — A simple data class
// ============================================================
//
//  LEARNING: Model classes hold pure data — no Flutter widgets,
//  no BuildContext, no navigation. This keeps them:
//    ✔ Testable  (easy to unit test without a device)
//    ✔ Reusable  (works in any layer: UI, service, cache)
//    ✔ Readable  (clear purpose, no side effects)
//
//  We also add fromJson / toJson for future API integration.
// ============================================================

/// Represents a single lesson item shown in [HomeScreen].
class ItemModel {
  /// Unique identifier — used as the ':id' path parameter.
  final String id;

  /// Display title shown in the list.
  final String title;

  /// Short description shown below the title.
  final String subtitle;

  // 'const' constructor = instances can be compile-time constants.
  const ItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
  });

  // ── JSON serialisation ────────────────────────────────────

  /// Creates an [ItemModel] from a JSON map (e.g. from an API).
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id:       json['id']       as String,
      title:    json['title']    as String,
      subtitle: json['subtitle'] as String,
    );
  }

  /// Converts this model to a JSON map (e.g. for local storage).
  Map<String, dynamic> toJson() => {
        'id':       id,
        'title':    title,
        'subtitle': subtitle,
      };

  // ── Equality / debug helpers ──────────────────────────────

  @override
  String toString() => 'ItemModel(id: \, title: \)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
