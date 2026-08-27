# Required Flutter Completion Checks

- Before considering any work complete, run all of the following and ensure they pass:
  1. `dart format .`
  2. `flutter analyze`
  3. `flutter test`
- If the repository pins Flutter in a local `flutter/` SDK or submodule, use the pinned equivalents: `flutter/bin/dart format .`, `flutter/bin/flutter analyze`, and `flutter/bin/flutter test`.
- Do not report work as completed while any of these checks are failing. Fix failures caused by the work; if a required check cannot be run, explicitly report why.

# Cross-Project Learning
- Before implementing or fixing generic Flutter, Android, CI, Drift, navigation, theming, lifecycle, import/export, or performance behavior, search the sibling Flutter repositories (`Flexify`, `FitBook`, `MarketMonk`, `Quitter`, and `BlockDrop`) for an existing solution or regression test.
- Reproduce or adapt useful patterns inside this repository rather than adding runtime dependencies on sibling repositories.
- Keep CI workflows owned by this repository; do not call workflows hosted in sibling repositories solely to deduplicate YAML.
- When a generic fix is made here, check whether the same failure pattern exists in sibling apps and apply the lesson independently where appropriate.
