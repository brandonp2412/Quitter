# Project Instructions

Follow the repository-specific engineering rules in `CLAUDE.md` in addition to these instructions.

# Cross-Project Flutter Reuse

- Before implementing or fixing generic Flutter, Android, CI, navigation, theming, lifecycle, startup, logging, import/export, or performance behavior, search the sibling Flutter repositories (`Flexify`, `FitBook`, `MarketMonk`, `Quitter`, and `BlockDrop`) for an existing solution or regression test.
- Reusable app-agnostic Flutter infrastructure should come from the `frisbee_flutter_foundation` package hosted under `packages/flutter_foundation` in Flexify rather than being copied between apps.
- Shared CI behavior should use the reusable workflows hosted by Flexify; keep only app-specific orchestration and parameters locally.
- When a generic fix is made here, check whether the same failure pattern exists in sibling apps before considering the task complete.
- Keep shared-package and shared-workflow Git references pinned to a concrete commit and update the pin deliberately.
