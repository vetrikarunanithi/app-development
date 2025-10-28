import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/stat_badge.dart';
import '../widgets/primary_button.dart';
import '../services/program_service.dart';
import '../models/program.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final String programId;
  
  const ProgramDetailsScreen({super.key, required this.programId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text(
          "Course Overview",
          style: TextStyle(color: AppColors.text, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.bg,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.accent),
      ),

      body: FutureBuilder<Program?>(
        future: ProgramService.getProgramById(programId),
        builder: (context, snapshot) {
          // Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.accent),
            );
          }

          // Error state
          if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    const Text(
                      "Failed to load program details",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.hasError ? snapshot.error.toString() : "Program not found",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text("Go Back"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // Success state - display program details
          final program = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Thumbnail
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.school, color: Colors.white, size: 80),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                program.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 12),

              // Stats badges
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: [
                  StatBadge(icon: Icons.timer, text: program.duration),
                  StatBadge(icon: Icons.money_off, text: program.priceLabel),
                  StatBadge(icon: Icons.home, text: program.mode),
                  StatBadge(icon: Icons.language, text: program.language),
                  StatBadge(icon: Icons.bar_chart, text: program.level),
                  StatBadge(icon: Icons.star, text: "${program.rating} (${program.reviewCount})"),
                ],
              ),
              const SizedBox(height: 20),

              // Description
              const Text(
                "Course Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                program.description,
                style: const TextStyle(height: 1.5, color: Colors.black87),
              ),
              const SizedBox(height: 100), // spacer so content isn't hidden behind CTA
            ],
          );
        },
      ),

      // Persistent bottom CTA
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: PrimaryButton(
          label: "Enroll Now",
          onPressed: () {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Enrollment feature coming soon!'),
                backgroundColor: AppColors.accent,
              ),
            );
          },
        ),
      ),
    );
  }
}
