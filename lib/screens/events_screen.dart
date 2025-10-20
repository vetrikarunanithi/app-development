import 'package:flutter/material.dart';
import '../theme.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Upcoming Events",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 16),

          // Event Cards
          _EventCard(
            title: "Hackathon 24H",
            date: "Sat, 26 Oct",
            color: AppColors.lightAccent,
            icon: Icons.flash_on_rounded,
          ),
          const SizedBox(height: 12),
          _EventCard(
            title: "Design Meetup",
            date: "Fri, 31 Oct",
            color: const Color(0xFFEAF4FF),
            icon: Icons.design_services_rounded,
          ),
        ],
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  const _EventCard({
    required this.title,
    required this.date,
    required this.color,
    this.icon = Icons.event,
  });

  final String title;
  final String date;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // Event Icon
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.accent, size: 32),
            ),
            const SizedBox(width: 16),

            // Event Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_rounded,
                          size: 14, color: Colors.black54),
                      const SizedBox(width: 4),
                      Text(date,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),

            // Forward Arrow
            const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.black45, size: 20),
          ],
        ),
      ),
    );
  }
}
