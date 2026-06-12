import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/spacing.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../routes/app_routes_constants.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/custom_chart_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.xs),
          child: Column(
            children: [
              SizedBox(height: 20),

              AppName(),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeroDashboardCard(),

                      SizedBox(height: AppSpacing.lg),

                      LandingHeadline(),

                      SizedBox(height: AppSpacing.lg),

                      AchievementSection(),

                      SizedBox(height: AppSpacing.lg),

                      WeeklyProgressCard(),
                    ],
                  ),
                ),
              ),

              LandingFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      margin: const EdgeInsets.all(AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 28,
            width: 28,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: AppSpacing.sm),

          const Text("TaskFlow", style: AppTextStyles.h2),
        ],
      ),
    );
  }
}

class HeroDashboardCard extends StatelessWidget {
  const HeroDashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.xs),
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: AppTextStyles.body.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: AppColors.gold,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '120 XP',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),

          const Row(
            children: [
              Expanded(
                child: StatCard(
                  icon: Icons.local_fire_department_rounded,
                  title: 'Focus',
                  value: '2.5 hrs',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  icon: Icons.task_alt_rounded,
                  title: 'Tasks',
                  value: '03',
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),

          const ProgressSection(),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.gold.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 20),

          const SizedBox(height: AppSpacing.md),

          Text(
            title,
            style: AppTextStyles.caption.copyWith(color: Colors.black, fontWeight: const FontWeight(500)),
          ),

          const SizedBox(height: AppSpacing.xs),

          Text(
            value,
            style: AppTextStyles.h3.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.gold.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progress',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '70%',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: const LinearProgressIndicator(
              value: 0.7,
              minHeight: 8,
              backgroundColor: Colors.white54,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class LandingHeadline extends StatelessWidget {
  const LandingHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Level Up Your Productivity!',
          textAlign: TextAlign.center,
          style: AppTextStyles.h1,
        ),

        SizedBox(height: AppSpacing.lg),

        Text(
          'Earn XP, build streaks, and stay productive every day with TaskFlow.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }
}

class WeeklyProgressCard extends StatelessWidget {
  const WeeklyProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            'Weekly Progress',
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white,
              // fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChartBar(day: 'M', height: 58),
              ChartBar(day: 'T', height: 74),
              ChartBar(day: 'W', height: 62),
              ChartBar(day: 'T', height: 50),
              ChartBar(day: 'F', height: 100),
              ChartBar(day: 'S', height: 70),
              ChartBar(day: 'S', height: 82),
            ],
          ),
        ],
      ),
    );
  }
}

class AchievementItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const AchievementItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.gold, size: 28),
        const SizedBox(height: 6),
        Text(
          title,
          style: AppTextStyles.body.copyWith(color: Colors.white,fontWeight: FontWeight.w600),
        ),
        Text(subtitle, style: AppTextStyles.caption.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class AchievementSection extends StatelessWidget {
  const AchievementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AchievementItem(
            icon: Icons.local_fire_department_rounded,
            title: '7 Day',
            subtitle: 'Streak',
          ),
          AchievementItem(
            icon: Icons.star_rounded,
            title: 'Level 5',
            subtitle: 'Explorer',
          ),
          AchievementItem(
            icon: Icons.emoji_events_rounded,
            title: '50',
            subtitle: 'Tasks',
          ),
        ],
      ),
    );
  }
}

class LandingFooter extends StatelessWidget {
  const LandingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.xs),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Small steps every day lead to big results.',
            textAlign: TextAlign.center,
            style: AppTextStyles.caption.copyWith(color: AppColors.textMuted),
          ),

          const SizedBox(height: AppSpacing.xl),

          CustomButton(
            text: 'Start Your Journey',
            onPressed: () {context.push(AppRoutesConstants.registerationPage);}
          ),

          const SizedBox(height: AppSpacing.lg),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account? ',
                style: AppTextStyles.bodyMedium,
              ),

              GestureDetector(
                onTap: () {context.push(AppRoutesConstants.loginPage);},
                child: Text(
                  'Sign In',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
