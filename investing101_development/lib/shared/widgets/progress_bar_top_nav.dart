import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:investing101_development/core/theme/colors.dart';

/// Shared top bar for onboarding screens: a back button and a
/// progress bar reflecting overall onboarding progress (0.0-1.0).
class ProgressBarTopNav extends StatelessWidget {
  const ProgressBarTopNav({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFD4DBDE), width: 2),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: Get.back,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 28,
                height: 28,
                child: Center(
                  child: SizedBox(
                    width: 19.14,
                    height: 18.52,
                    child: _BackIcon(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: _ProgressBar(progress: progress)),
        ],
      ),
    );
  }
}

class _BackIcon extends StatelessWidget {
  const _BackIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/icon_back.svg');
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      decoration: BoxDecoration(
        color: const Color(0xFFD4DBDE),
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.shadowOnPrimary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Container(
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
