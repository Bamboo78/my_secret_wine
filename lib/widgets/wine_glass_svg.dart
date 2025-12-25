import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WineGlassSvgIcon extends StatelessWidget {
  final WineGlassState state;
  final double size;
  final Color color;

  const WineGlassSvgIcon({
    super.key,
    required this.state,
    this.size = 24,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _getAssetPath(),
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  String _getAssetPath() {
    switch (state) {
      case WineGlassState.empty:
        return 'assets/icons/wine_glass_empty.svg';
      case WineGlassState.half:
        return 'assets/icons/wine_glass_half.svg';
      case WineGlassState.full:
        return 'assets/icons/wine_glass_full.svg';
    }
  }
}

enum WineGlassState {
  empty,
  half,
  full,
}

// Widget con gradiente para iconos SVG
class WineGlassSvgGradient extends StatelessWidget {
  final WineGlassState state;
  final double size;
  final List<Color> gradientColors;

  const WineGlassSvgGradient({
    super.key,
    required this.state,
    this.size = 24,
    this.gradientColors = const [Colors.orange, Colors.purple],
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: gradientColors,
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ).createShader(bounds),
      child: WineGlassSvgIcon(
        state: state,
        size: size,
        color: Colors.white,
      ),
    );
  }
}