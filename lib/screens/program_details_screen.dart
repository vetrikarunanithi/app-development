import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/stat_badge.dart';
import '../widgets/primary_button.dart';

class ProgramDetailsScreen extends StatelessWidget {
  const ProgramDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text("Course Overview", style: TextStyle(color: AppColors.text, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.bg,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.accent),
      ),

      // Main scrollable content
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
              ],
            ),
            child: const Center(child: Icon(Icons.traffic, color: Colors.white, size: 80)),
          ),
          const SizedBox(height: 20),

          const Text(
            "Design Thinking for Global Traffic Solutions",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: const [
              StatBadge(icon: Icons.timer, text: "8h 36min"),
              StatBadge(icon: Icons.money_off, text: "Free"),
              StatBadge(icon: Icons.home, text: "Online"),
              StatBadge(icon: Icons.language, text: "English"),
            ],
          ),
          const SizedBox(height: 20),

          const Text("Course Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          const Text(
            "Design Thinking for Global Traffic Solutions is a comprehensive course aimed at equipping participants with the skills to identify and solve traffic congestion issues using the principles of design thinking. The course includes hands-on exercises, persona development, and prototype validation.",
            style: TextStyle(height: 1.5, color: Colors.black87),
          ),
          const SizedBox(height: 100), // spacer so last paragraph isn't hidden behind CTA
        ],
      ),

      // Persistent bottom CTA like a navbar
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            label: "Enroll Now",
            onPressed: () {
              // TODO: handle enroll
            },
          ),
        ),
      ),
    );
  }
}
