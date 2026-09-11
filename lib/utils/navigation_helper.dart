// ============================================================
//  navigation_helper.dart  — Extension methods for navigation
// ============================================================
//
//  LEARNING: Extension methods let you add new methods to
//  existing types WITHOUT subclassing them.
//
//  Syntax:
//    extension <ExtensionName> on <ExistingType> { ... }
//
//  After defining 'extension NavHelper on BuildContext', you can
//  call these methods directly on any BuildContext:
//
//    context.goHome();
//    context.goToDetails('item_5');
//    context.safePop();
//
//  This is completely optional — you can always call
//  context.goNamed(...) directly. Extensions just reduce repetition.
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_routes.dart';

/// Convenience navigation methods added to every [BuildContext].
extension NavHelper on BuildContext {

  // ── Shortcuts to common destinations ──────────────────────

  void goHome()     => goNamed(AppRoutes.homeName);
  void goLogin()    => goNamed(AppRoutes.loginName);
  void goProfile()  => pushNamed(AppRoutes.profileName);
  void goSettings() => pushNamed(AppRoutes.settingsName);

  /// Navigate to the Details screen for the given [id].
  void goToDetails(String id) {
    pushNamed(
      AppRoutes.detailsName,
      pathParameters: {'id': id},
    );
  }

  // ── Safe back navigation ────────────────────────────────

  /// Pops the current route only if it is safe to do so.
  void safePop() {
    if (canPop()) pop();
  }
}
