import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quitter/settings_provider.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  String _pin = '';
  bool _isError = false;
  bool _isVerifying = false;
  Timer? _lockoutTimer;
  int? _lockoutSecondsSnapshot;

  @override
  void initState() {
    super.initState();
    _syncLockoutUi();
  }

  @override
  void dispose() {
    _lockoutTimer?.cancel();
    super.dispose();
  }

  void _syncLockoutUi() {
    final settings = context.read<SettingsProvider>();
    _lockoutTimer?.cancel();

    if (!settings.isPinLockoutActive) {
      setState(() {
        _lockoutSecondsSnapshot = null;
      });
      return;
    }

    final remaining = settings.pinLockoutRemainingSeconds;
    setState(() {
      _lockoutSecondsSnapshot = remaining;
    });

    _lockoutTimer = Timer(Duration(seconds: remaining), () async {
      if (!mounted) return;
      await context.read<SettingsProvider>().clearExpiredPinLockout();
      if (!mounted) return;
      setState(() {
        _isError = false;
        _pin = '';
        _lockoutSecondsSnapshot = null;
      });
    });
  }

  void _onNumberTap(String number) {
    setState(() {
      _pin += number;
      _isError = false;
    });
  }

  void _onBackspace() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
        _isError = false;
      });
    }
  }

  Future<void> _onSubmit() async {
    if (_pin.isEmpty) return;

    setState(() {
      _isVerifying = true;
    });

    final settings = context.read<SettingsProvider>();
    final isValid = await settings.unlock(_pin);

    if (!mounted) return;

    if (!isValid) {
      setState(() {
        _isError = true;
        _pin = '';
        _isVerifying = false;
      });
      _syncLockoutUi();
    } else {
      setState(() {
        _isError = false;
        _pin = '';
        _isVerifying = false;
      });
    }
  }

  String _buildLockoutMessage(SettingsProvider settings) {
    final base = AppLocalizations.of(context)!.pinPageTooManyAttempts;
    final remaining = _lockoutSecondsSnapshot ??
        settings.pinLockoutRemainingSeconds;
    return '$base ($remaining s left)';
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    final isLockedOut = settings.isPinLockoutActive;
    final failedAttempts = settings.pinFailedAttempts;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.pinPageEnterPIN,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 48),
                // PIN display
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _isError
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _pin.isEmpty ? ' ' : '•' * _pin.length,
                      style: TextStyle(
                        fontSize: 32,
                        letterSpacing: 8,
                        color: _isError
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                if (_isError) ...[
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      isLockedOut
                          ? _buildLockoutMessage(settings)
                          : AppLocalizations.of(context)!.pinPageIncorrectPIN,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
                if (isLockedOut && !_isError) ...[
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      _buildLockoutMessage(settings),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 64),
                // Number pad
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  children: [
                    ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map(
                      (number) => _NumberButton(
                        number: number.toString(),
                        onTap: !isLockedOut && !_isVerifying
                            ? () => _onNumberTap(number.toString())
                            : null,
                      ),
                    ),
                    _IconButton(
                      icon: Icons.backspace_outlined,
                      onTap: !isLockedOut && !_isVerifying
                          ? _onBackspace
                          : null,
                    ),
                    _NumberButton(
                      number: '0',
                      onTap: !isLockedOut && !_isVerifying
                          ? () => _onNumberTap('0')
                          : null,
                    ),
                    _IconButton(
                      icon: _isVerifying ? Icons.hourglass_empty : Icons.check,
                      onTap:
                          !isLockedOut &&
                              !_isVerifying &&
                              _pin.isNotEmpty
                          ? _onSubmit
                          : null,
                    ),
                  ],
                ),
                if (failedAttempts > 0 && !isLockedOut && !_isError) ...[
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      '$failedAttempts/3',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NumberButton extends StatelessWidget {
  final String number;
  final VoidCallback? onTap;

  const _NumberButton({required this.number, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _IconButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Icon(
            icon,
            size: 28,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
