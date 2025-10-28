import 'package:flutter/material.dart';
import '../models/program.dart';
import '../services/program_service.dart';
import 'program_details_screen.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
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
    return RefreshIndicator(
      onRefresh: () async => _refreshPrograms(),
      child: FutureBuilder<List<Program>>(
        future: _programsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: const [
                SizedBox(height: 200),
                Center(child: CircularProgressIndicator()),
              ],
            );
          }

          if (snapshot.hasError) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 50),
                Center(
                  child: Text(
                    'Failed to load programs: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _refreshPrograms,
                    child: const Text('Retry'),
                  ),
                ),
              ],
            );
          }

          final programs = snapshot.data ?? [];
          if (programs.isEmpty) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: const [
                SizedBox(height: 50),
                Center(child: Text("No programs available")),
              ],
            );
          }

          // First program as Featured
          final featuredProgram = programs.first;

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 12),
              // Greeting
              const Text(
                "👋 Hi, John!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                "Find your perfect learning path today.",
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
              const SizedBox(height: 20),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for courses...",
                  prefixIcon: const Icon(Icons.search_rounded),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Hero Banner
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF6B6B), Color(0xFFFF8C8C)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF5757).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start Developing Your\nSkills Today!",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Join top-rated online courses to boost your career.",
                            style: TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFFFF5757),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Explore",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Popular Courses", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  TextButton(
                    onPressed: () {
                      // Navigate to full list
                    },
                    child: const Text("See all →", style: TextStyle(color: Color(0xFFFF5757))),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Featured Course Card (dynamic)
              _courseCard(context, featuredProgram),

              const SizedBox(height: 20),

              // Popular Courses (remaining)
              ...programs.skip(1).map((program) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _courseCard(context, program),
                  )),
            ],
          );
        },
      ),
    );
  }

  Widget _courseCard(BuildContext context, Program program) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProgramDetailsScreen(programId: program.id)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                ),
                color: const Color(0xFFFFE6E6),
              ),
              child: Icon(Icons.school_rounded, color: const Color(0xFFFF5757), size: 42),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      program.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.timer_outlined, color: Colors.grey, size: 18),
                        const SizedBox(width: 6),
                        Text(program.duration, style: const TextStyle(color: Colors.grey)),
                        const SizedBox(width: 10),
                        const Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(program.rating.toString(), style: const TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black54, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
