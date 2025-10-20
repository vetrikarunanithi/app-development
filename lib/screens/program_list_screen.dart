import 'package:flutter/material.dart';
import '../theme.dart';
import 'program_details_screen.dart';

class ProgramListScreen extends StatelessWidget {
  const ProgramListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chips = ["internship", "competitions", "master classes"];
    int selected = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search", style: TextStyle(color: AppColors.text)),
        backgroundColor: AppColors.bg,
        elevation: 0,
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search now...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(icon: const Icon(Icons.tune), onPressed: () {}),
                  filled: true,
                  fillColor: AppColors.chipBg,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                children: List.generate(chips.length, (i) {
                  final active = i == selected;
                  return ChoiceChip(
                    label: Text(chips[i]),
                    selected: active,
                    onSelected: (_) => setState(() => selected = i),
                    selectedColor: AppColors.accent.withValues(alpha: 0.15),
                    labelStyle: TextStyle(color: active ? AppColors.accent : AppColors.text),
                  );
                }),
              ),
              const SizedBox(height: 16),
              _ProgramItem(
                color: Colors.purple.shade100, title: "Web Designer Internship", weeks: 4, onTap: () {},
              ),
              _ProgramItem(
                color: Colors.blue.shade100, title: "App Developer Internship", weeks: 4, onTap: () {},
              ),
              _ProgramItem(
                color: AppColors.accent, title: "Front-end Developer Internship", weeks: 4,
                onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const ProgramDetailsScreen())),
              ),
              _ProgramItem(
                color: Colors.blueGrey.shade100, title: "Back-end Developer", weeks: 4, onTap: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProgramItem extends StatelessWidget {
  const _ProgramItem({required this.title, required this.weeks, required this.color, required this.onTap});
  final String title;
  final int weeks;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool lightText = ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(Icons.school, color: lightText ? Colors.white : Colors.black54, size: 44),
        title: Text(title, style: TextStyle(color: lightText ? Colors.white : AppColors.text, fontWeight: FontWeight.bold)),
        subtitle: Text("$weeks weeks", style: TextStyle(color: lightText ? Colors.white70 : AppColors.subtext)),
        trailing: Icon(Icons.arrow_forward_ios, color: lightText ? Colors.white : AppColors.text),
        onTap: onTap,
      ),
    );
  }
}
