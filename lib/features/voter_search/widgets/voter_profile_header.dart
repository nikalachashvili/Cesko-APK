import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/core/widgets/app_back_button.dart';

/// Green header with a curved bottom edge, a back button and the voter's
/// avatar sitting in the curve.
class VoterProfileHeader extends StatelessWidget {
  const VoterProfileHeader({super.key});

  static const _bodyHeight = 168.0;
  static const _curveDepth = 72.0;
  static const _avatarSize = 132.0;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return SizedBox(
      height: top + _bodyHeight,
      child: Stack(
        children: [
          const Positioned.fill(
            child: ClipPath(
              clipper: _CurvedBottomClipper(depth: _curveDepth),
              child: ColoredBox(color: AppColors.green),
            ),
          ),
          Positioned(top: top + 4, left: 4, child: const AppBackButton()),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: _Avatar(size: _avatarSize),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurvedBottomClipper extends CustomClipper<Path> {
  const _CurvedBottomClipper({required this.depth});

  final double depth;

  @override
  Path getClip(Size size) => Path()
    ..lineTo(size.width, 0)
    ..lineTo(size.width, size.height - depth)
    ..quadraticBezierTo(
      size.width / 2,
      size.height + depth,
      0,
      size.height - depth,
    )
    ..close();

  @override
  bool shouldReclip(_CurvedBottomClipper oldClipper) =>
      oldClipper.depth != depth;
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: ColoredBox(
            color: AppColors.fieldFill,
            child: Align(
              alignment: const Alignment(0, 1.6),
              child: Icon(
                Icons.person,
                size: size * 0.95,
                color: AppColors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
