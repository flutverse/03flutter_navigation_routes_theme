// ============================================================
//  details_screen.dart
// ============================================================
//
//  LEARNING TOPICS:
//  1. Receiving path parameters
//     The router extracts ':id' from the URL and passes it here
//     as a constructor argument. The screen doesn't know or care
//     about routing — it just receives clean data.
//
//  2. context.pop()
//     Goes back to the previous route (only works if canPop() is true).
//     Equivalent to pressing the device's Back button.
//
//  3. Widget receives data, not BuildContext navigation details
//     This makes DetailsScreen TESTABLE — you can create it in
//     a test with DetailsScreen(id: 'test') without a router.
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// [DetailsScreen] displays information about a specific item.
///
/// The [id] is extracted from the URL path parameter ':id'
/// by [AppRouter] and passed directly to this constructor.
class DetailsScreen extends StatelessWidget {
  /// The unique identifier of the item to display.
  final String id;

  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme   = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail View'),

        // The default back button uses Navigator.pop internally.
        // We override it here to use go_router's context.pop()
        // so the routing state is managed correctly.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // LEARNING:
            //   context.pop()     → go_router aware back navigation
            //   Navigator.pop(ctx)→ works too for simple cases
            if (context.canPop()) context.pop();
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Hero section ─────────────────────────────
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.description_outlined,
                    size: 60, color: colorScheme.primary),
              ),
            ),
            const SizedBox(height: 32),

            // ── Learning notes ────────────────────────────
            Text('Path Parameter Received:', style: textTheme.labelLarge),
            const SizedBox(height: 8),

            // Display the id we received from the URL
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                id,
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ── Explanation card ──────────────────────────
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('How did the id get here?',
                        style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text(
                      '1. HomeScreen called:\n'
                      '   context.pushNamed("details",\n'
                      '     pathParameters: {"id": "..."});\n\n'
                      '2. go_router built the URL:\n'
                      '   /home/details/item_0\n\n'
                      '3. The router matched the pattern:\n'
                      '   /home/details/:id\n\n'
                      '4. It extracted "item_0" and passed\n'
                      '   it to DetailsScreen(id: "item_0").',
                      style: TextStyle(fontFamily: 'monospace', fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // ── Back button ───────────────────────────────
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
