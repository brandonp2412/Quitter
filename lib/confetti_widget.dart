import 'dart:math';

import 'package:flutter/material.dart';

class ConfettiWidget extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final VoidCallback? onAnimationComplete;

  const ConfettiWidget({
    super.key,
    required this.child,
    this.isActive = false,
    this.onAnimationComplete,
  });

  @override
  State<ConfettiWidget> createState() => _ConfettiWidgetState();
}

class _ConfettiWidgetState extends State<ConfettiWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  List<ConfettiPiece> confettiPieces = [];
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _animationController.addListener(() {
      setState(() {
        for (var piece in confettiPieces) {
          piece.update();
        }
      });
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          confettiPieces.clear();
        });
        widget.onAnimationComplete?.call();
      }
    });
  }

  @override
  void didUpdateWidget(ConfettiWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      _startConfetti();
    }
  }

  void _startConfetti() {
    setState(() {
      confettiPieces.clear();

      for (int i = 0; i < 60; i++) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        confettiPieces.add(
          ConfettiPiece(
            x: screenWidth * 0.85 + (random.nextDouble() - 0.5) * 100,
            y: screenHeight * 0.85,
            color: _getRandomColor(),
            size: random.nextDouble() * 6 + 3,
            velocityX: (random.nextDouble() - 0.5) * 8,
            velocityY: -(random.nextDouble() * 8 + 5), // Negative to go up
            rotation: random.nextDouble() * 2 * pi,
            rotationSpeed: (random.nextDouble() - 0.5) * 0.3,
            gravity: 0.2,
          ),
        );
      }
    });

    _animationController.reset();
    _animationController.forward();
  }

  Color _getRandomColor() {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.cyan,
      Colors.lime,
      Colors.indigo,
      Colors.amber,
      Colors.teal,
    ];
    return colors[random.nextInt(colors.length)];
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (confettiPieces.isNotEmpty)
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(painter: ConfettiPainter(confettiPieces)),
            ),
          ),
      ],
    );
  }
}

class ConfettiPiece {
  double x;
  double y;
  final Color color;
  final double size;
  double velocityX;
  double velocityY;
  double rotation;
  final double rotationSpeed;
  final double gravity;

  ConfettiPiece({
    required this.x,
    required this.y,
    required this.color,
    required this.size,
    required this.velocityX,
    required this.velocityY,
    required this.rotation,
    required this.rotationSpeed,
    this.gravity = 0.1,
  });

  void update() {
    x += velocityX;
    y += velocityY;
    velocityY += gravity;
    velocityX *= 0.99; // Air resistance
    rotation += rotationSpeed;
  }
}

class ConfettiPainter extends CustomPainter {
  final List<ConfettiPiece> confettiPieces;

  ConfettiPainter(this.confettiPieces);

  @override
  void paint(Canvas canvas, Size size) {
    for (var piece in confettiPieces) {
      final paint = Paint()
        ..color = piece.color
        ..style = PaintingStyle.fill;

      canvas.save();
      canvas.translate(piece.x, piece.y);
      canvas.rotate(piece.rotation);

      final shapeType = piece.size.toInt() % 3;
      switch (shapeType) {
        case 0:
          canvas.drawRect(
            Rect.fromCenter(
              center: Offset.zero,
              width: piece.size,
              height: piece.size * 1.5,
            ),
            paint,
          );
          break;
        case 1:
          canvas.drawCircle(Offset.zero, piece.size / 2, paint);
          break;
        case 2:
          // Triangle
          final path = Path();
          path.moveTo(0, -piece.size / 2);
          path.lineTo(-piece.size / 2, piece.size / 2);
          path.lineTo(piece.size / 2, piece.size / 2);
          path.close();
          canvas.drawPath(path, paint);
          break;
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
