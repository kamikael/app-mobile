import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          /// 🖼️ IMAGE BACKGROUND (NETTE)
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding.png',
              fit: BoxFit.cover,
            ),
          ),

          /// 🌫️ FLOU PARTIEL (BAS → JUSQU’AU COU)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: height * 0.35, // ajuste ici (0.4–0.5 selon l’image)
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 12,
                  sigmaY: 12,
                ),
                child: Container(
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
          ),

          /// 📦 CONTENU (TEXTE + BOUTON)
          Positioned(
            left: 24,
            right: 24,
            bottom: 48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITRE
                Text(
                  "Skincare Product\n& Cosmetics",
                  style: AppTextStyle.title.copyWith(
                    fontSize: 32,
                    color: AppColors.white,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 12),

                /// SOUS-TITRE
                Text(
                  "Beauty gives you the confidence\nyou deserve",
                  style: AppTextStyle.subtitle.copyWith(
                    color: AppColors.white.withOpacity(0.95),
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 32),

                /// BOUTON
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRouter.home,
                      );
                    },
                    child: Text(
                      "Get Started",
                      style: AppTextStyle.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
