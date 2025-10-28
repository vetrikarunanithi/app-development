import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/primary_button.dart';
import 'home_shell.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.lightAccent, Colors.white],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🪶 App Logo / Title
                    const Icon(Icons.school_rounded,
                        color: AppColors.accent, size: 56),
                    const SizedBox(height: 16),
                    const Text(
                      "Welcome Back 👋",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Login to continue your learning journey",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // ✉️ Email Input
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.mail_outline_rounded),
                        filled: true,
                        fillColor: AppColors.chipBg,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 🔒 Password Input
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        filled: true,
                        fillColor: AppColors.chipBg,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // 🧠 Remember Me + Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              activeColor: AppColors.accent,
                              onChanged: (val) {
                                setState(() => rememberMe = val ?? false);
                              },
                            ),
                            const Text('Remember me'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.accent,
                          ),
                          child: const Text('Forgot password?'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // 🔘 Login Button
                    PrimaryButton(
                      label: 'Login',
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeShell()),  // Not HomeScreen
                      ),

                    ),

                    const SizedBox(height: 18),

                    // 🌐 Divider
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("or continue with"),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // 🧩 Social Login Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialButton(Icons.g_mobiledata_rounded, "Google"),
                        const SizedBox(width: 16),
                        _socialButton(Icons.apple_rounded, "Apple"),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // 🆕 Signup Redirect
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SignUpScreen()),
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.accent,
                          ),
                          child: const Text("Sign up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.chipBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.accent, size: 24),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
