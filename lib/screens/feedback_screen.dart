import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/primary_button.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _commentsController = TextEditingController();
  bool _isSubmitting = false;
  String _selectedRating = '5';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  Future<void> _submitFeedback() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Feedback submitted successfully!'), backgroundColor: AppColors.accent),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback Form", style: TextStyle(color: AppColors.text, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.bg,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.accent),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text("We'd love to hear from you!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 24),
            
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            DropdownButtonFormField<String>(
              initialValue: _selectedRating,

              decoration: const InputDecoration(
                labelText: 'Rating',
                prefixIcon: Icon(Icons.star_outline),
                border: OutlineInputBorder(),
              ),
              items: ['1', '2', '3', '4', '5'].map((rating) {
                return DropdownMenuItem(value: rating, child: Text('$rating Stars'));
              }).toList(),
              onChanged: (value) => setState(() => _selectedRating = value!),
            ),
            const SizedBox(height: 16),
            
            TextFormField(
              controller: _commentsController,
              decoration: const InputDecoration(
                labelText: 'Comments',
                prefixIcon: Icon(Icons.comment_outlined),
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your feedback';
                }
                if (value.length < 10) {
                  return 'Please enter at least 10 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            
            _isSubmitting
                ? const Center(child: CircularProgressIndicator())
                : PrimaryButton(label: "Submit Feedback", onPressed: _submitFeedback),
          ],
        ),
      ),
    );
  }
}
