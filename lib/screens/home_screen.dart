import 'dart:ui';
import 'package:flutter/material.dart';
import 'program_list_screen.dart';
import 'program_details_screen.dart';
import 'events_screen.dart';
import 'community_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    EventsScreen(),
    CommunityScreen(),
    ProfileScreen(),
  ];

  void onItemTapped(int index) => setState(() => selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFF9FAFB),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[selectedIndex],
      ),
      bottomNavigationBar: _buildModernNavBar(),
    );
  }

  Widget _buildModernNavBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white.withOpacity(0.9),
            elevation: 0,
            selectedItemColor: const Color(0xFFFF5757),
            unselectedItemColor: Colors.grey[600],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.event_rounded), label: "Events"),
              BottomNavigationBarItem(icon: Icon(Icons.people_rounded), label: "Community"),
              BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
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
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProgramListScreen()));
              },
              child: const Text("See all →", style: TextStyle(color: Color(0xFFFF5757))),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Featured Course Card
        _featuredCourseCard(context),
      ],
    );
  }

  Widget _featuredCourseCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ProgramDetailsScreen()));
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
              child: const Icon(Icons.traffic_rounded, color: Color(0xFFFF5757), size: 42),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Design Thinking for Global Traffic Solutions",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.timer_outlined, color: Colors.grey, size: 18),
                        SizedBox(width: 6),
                        Text("8h 36min", style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 10),
                        Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                        SizedBox(width: 4),
                        Text("4.8", style: TextStyle(fontWeight: FontWeight.w600)),
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
