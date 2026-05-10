import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    this.liveCameraBuilder,
    this.uploadChartBuilder,
  });

  final WidgetBuilder? liveCameraBuilder;
  final WidgetBuilder? uploadChartBuilder;

  void _handleNavigation(BuildContext context, WidgetBuilder? builder) {
    if (builder == null) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: builder),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050607),
      body: Stack(
        children: [
          const Positioned.fill(
            child: CustomPaint(
              painter: TradingBackdropPainter(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Header(),
                  const SizedBox(height: 36),
                  const Spacer(),
                  ActionCard(
                    title: 'Open Live Camera',
                    subtitle: 'Real-time AR scanning',
                    icon: Icons.camera_enhance,
                    isPrimary: true,
                    onTap: () => _handleNavigation(
                      context,
                      liveCameraBuilder,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GlassActionCard(
                    title: 'Upload Chart Image',
                    subtitle: 'Analyze saved snapshots',
                    icon: Icons.image_search,
                    onTap: () => _handleNavigation(
                      context,
                      uploadChartBuilder,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF8E39B),
                Color(0xFFF0B90B),
                Color(0xFFC9920B),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF0B90B).withOpacity(0.5),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(
            Icons.auto_awesome,
            color: Color(0xFF1A1404),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          'ARVision Gold',
          style: GoogleFonts.rajdhani(
            color: const Color(0xFFF0B90B),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final gradient = isPrimary
        ? const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8E39B),
              Color(0xFFF0B90B),
              Color(0xFFB87D00),
            ],
          )
        : const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1E24),
              Color(0xFF0F1217),
            ],
          );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.65),
              blurRadius: 26,
              offset: const Offset(0, 16),
            ),
            if (isPrimary)
              BoxShadow(
                color: const Color(0xFFF0B90B).withOpacity(0.4),
                blurRadius: 26,
                offset: const Offset(0, 6),
              ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isPrimary
                    ? const Color(0xFF1C1404)
                    : const Color(0xFF111419),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.45),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(-2, -2),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color:
                    isPrimary ? const Color(0xFFF0B90B) : Colors.white70,
                size: 26,
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.rajdhani(
                      color: isPrimary
                          ? const Color(0xFF1B1304)
                          : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.rajdhani(
                      color: isPrimary
                          ? const Color(0xFF3D2A08)
                          : Colors.white54,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color:
                  isPrimary ? const Color(0xFF1F1304) : Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}

class GlassActionCard extends StatelessWidget {
  const GlassActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.08),
                  Colors.white.withOpacity(0.02),
                ],
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.14),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.65),
                  blurRadius: 24,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF101318),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.45),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.04),
                        blurRadius: 6,
                        offset: const Offset(-2, -2),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFFF0B90B).withOpacity(0.8),
                    size: 26,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.rajdhani(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.rajdhani(
                          color: Colors.white54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.white60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TradingBackdropPainter extends CustomPainter {
  const TradingBackdropPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = const Color(0xFF050607)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    final gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..strokeWidth = 1;

    const gridSpacing = 48.0;
    for (double y = 0; y < size.height; y += gridSpacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    for (double x = 0; x < size.width; x += gridSpacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }

    final chartPaint = Paint()
      ..color = const Color(0xFFF0B90B).withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    final path = Path()
      ..moveTo(0, size.height * 0.65)
      ..quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.58,
        size.width * 0.35,
        size.height * 0.62,
      )
      ..quadraticBezierTo(
        size.width * 0.55,
        size.height * 0.7,
        size.width * 0.7,
        size.height * 0.55,
      )
      ..quadraticBezierTo(
        size.width * 0.85,
        size.height * 0.47,
        size.width,
        size.height * 0.5,
      );

    canvas.drawPath(path, chartPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
