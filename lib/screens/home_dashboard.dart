import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/course_card.dart';
import '../widgets/section_header.dart';
import '../services/program_service.dart';
import '../models/program.dart';
import 'program_list_screen.dart';
import 'program_details_screen.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  late Future<List<Program>> _programsFuture;

  @override
  void initState() {
    super.initState();
    _programsFuture = ProgramService.loadPrograms();
  }

  void _refreshPrograms() {
    setState(() {
      _programsFuture = ProgramService.loadPrograms();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          _refreshPrograms();
          await _programsFuture;
        },
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 8),

            // 👋 Greeting Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hi, John 👋",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Find your next skill to learn!",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.lightAccent,
                  child: const Icon(Icons.notifications_none_rounded, color: AppColors.accent),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search courses, skills, or mentors...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: AppColors.chipBg,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),

            const SizedBox(height: 24),

            // 🌈 Hero Banner (responsive, aligned)
            LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 360;
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.accent, AppColors.accent.withValues(alpha: 0.85)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accent.withValues(alpha: 0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: isNarrow
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Start Developing Your\nSkills Today!",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Explore curated learning paths designed to boost your career.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 13.5,
                                color: Colors.white70,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.accent,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {},
                              child: const Text("Explore Now", style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Start Developing Your\nSkills Today!",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      height: 1.3,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Explore curated learning paths designed to boost your career.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.accent,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {},
                              child: const Text("Explore Now", style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                );
              },
            ),

            const SizedBox(height: 30),

            // 🎓 Popular Courses Section with FutureBuilder
            SectionHeader(
              title: "Popular Courses",
              action: "See all",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProgramListScreen()),
              ),
            ),

            FutureBuilder<List<Program>>(
              future: _programsFuture,
              builder: (context, snapshot) {
                // Loading state
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    padding: const EdgeInsets.all(40),
                    child: const Center(
                      child: CircularProgressIndicator(color: AppColors.accent),
                    ),
                  );
                }

                // Error state
                if (snapshot.hasError) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    color: Colors.red.shade50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(Icons.error_outline, color: Colors.red, size: 48),
                          const SizedBox(height: 12),
                          const Text(
                            "Failed to load programs",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            snapshot.error.toString(),
                            style: const TextStyle(fontSize: 12, color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: _refreshPrograms,
                            icon: const Icon(Icons.refresh),
                            label: const Text("Retry"),
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

                // Empty state
                final programs = snapshot.data ?? [];
                if (programs.isEmpty) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: const [
                          Icon(Icons.inbox_outlined, size: 48, color: Colors.grey),
                          SizedBox(height: 12),
                          Text("No programs available", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  );
                }

                // Success state - display programs
                return Column(
                  children: programs.take(2).map((program) {
                    return CourseCard(
                      title: program.title,
                      duration: program.duration,
                      level: program.level,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProgramDetailsScreen(programId: program.id),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),

            const SizedBox(height: 30),

            // 📘 Continue Learning Section
            SectionHeader(
              title: "Continue Learning",
              action: "View all",
              onTap: () {},
            ),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.chipBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.play_circle_fill_rounded, color: AppColors.accent, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Introduction to Creative Thinking",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: 0.45,
                          color: AppColors.accent,
                          backgroundColor: Colors.white,
                          minHeight: 6,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "45% completed",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
