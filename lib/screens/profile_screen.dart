import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'login_screen.dart';

/// A simple static profile screen with mock user data, plus a
/// functional dark-mode toggle (the dark mode bonus feature lives
/// here for easy access, in addition to the icon on the Home tab).
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                    child: Icon(
                      Icons.person,
                      size: 44,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Guest User',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'guest@minimart.app',
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.color
                          ?.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) {
                return Card(
                  child: SwitchListTile(
                    title: const Text('Dark Mode'),
                    subtitle: const Text('Toggle light / dark theme'),
                    secondary: const Icon(Icons.dark_mode_outlined),
                    value: themeProvider.isDarkMode,
                    onChanged: (_) => themeProvider.toggleTheme(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  _ProfileMenuItem(
                    icon: Icons.location_on_outlined,
                    label: 'Shipping Address',
                  ),
                  const Divider(height: 1),
                  _ProfileMenuItem(
                    icon: Icons.payment_outlined,
                    label: 'Payment Methods',
                  ),
                  const Divider(height: 1),
                  _ProfileMenuItem(
                    icon: Icons.notifications_outlined,
                    label: 'Notifications',
                  ),
                  const Divider(height: 1),
                  _ProfileMenuItem(
                    icon: Icons.help_outline,
                    label: 'Help & Support',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.redAccent),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A row in the profile menu list. These are static/non-functional
/// links since the task only requires mock profile data.
class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ProfileMenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label — coming soon'),
            duration: const Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
    );
  }
}
