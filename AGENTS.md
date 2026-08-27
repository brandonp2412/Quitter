# Cross-Project Learning
- Before implementing or fixing generic Flutter, Android, CI, Drift, navigation, theming, lifecycle, import/export, or performance behavior, search the sibling Flutter repositories (`Flexify`, `FitBook`, `MarketMonk`, `Quitter`, and `BlockDrop`) for an existing solution or regression test.
- Reproduce or adapt useful patterns inside this repository rather than adding runtime dependencies on sibling repositories.
- Keep CI workflows owned by this repository; do not call workflows hosted in sibling repositories solely to deduplicate YAML.
- When a generic fix is made here, check whether the same failure pattern exists in sibling apps and apply the lesson independently where appropriate.
