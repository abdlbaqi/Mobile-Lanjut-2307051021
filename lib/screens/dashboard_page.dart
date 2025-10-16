import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';
import 'profile_page.dart';
import 'login_page.dart';

// 🟦 DASHBOARD PAGE (STATEFUL)
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  // list 
  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'Top Up',
      'amount': '+Rp 500.000',
      'date': '10 Oct 2025',
      'icon': Icons.arrow_downward,
      'color': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF1E88E5), Color(0xFF42A5F5), Color(0xFF64B5F6)],
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: Column(
            children: [
              HeaderSection(onLogout: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SaldoCard(),
              ),
              const SizedBox(height: 20),
              const QuickActionRow(),
              const SizedBox(height: 20),
              TransactionSection(transactions: _transactions),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildBottomNav(BuildContext context) => BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
          }
          setState(() => _currentIndex = i);
        },
        selectedItemColor: const Color(0xFF1E88E5),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      );
}


class HeaderSection extends StatelessWidget {
  final VoidCallback onLogout;
  const HeaderSection({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello,', style: TextStyle(color: Colors.white70, fontSize: 16)),
              Text('Fuad Abdul Baqi',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          GlassContainer(
            blur: 10,
            opacity: 0.15,
            borderRadius: BorderRadius.circular(15),
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: onLogout,
            ),
          ),
        ],
      ),
    );
  }
}


class SaldoCard extends StatelessWidget {
  const SaldoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 15,
      opacity: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Saldo', style: TextStyle(color: Colors.white70, fontSize: 14)),
                Icon(Icons.visibility, color: Colors.white70, size: 20),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Rp 9.500.000',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildButton(onPressed: () {}, label: 'Top Up', icon: Icons.add, filled: true),
                const SizedBox(width: 10),
                _buildButton(onPressed: () {}, label: 'Transfer', icon: Icons.send),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildButton({
    required VoidCallback onPressed,
    required String label,
    required IconData icon,
    bool filled = false,
  }) {
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
    return Expanded(
      child: filled
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon, size: 18),
              label: Text(label),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1E88E5),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: shape,
              ),
            )
          : OutlinedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon, size: 18),
              label: Text(label),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 2),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: shape,
              ),
            ),
    );
  }
}


class QuickActionRow extends StatelessWidget {
  const QuickActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _QuickAction(icon: Icons.phone_android, label: 'Pulsa'),
          _QuickAction(icon: Icons.flash_on, label: 'Listrik'),
          _QuickAction(icon: Icons.wifi, label: 'Internet'),
          _QuickAction(icon: Icons.more_horiz, label: 'More'),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _QuickAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 10,
      opacity: 0.15,
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 28),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}


class TransactionSection extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;
  const TransactionSection({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Transaksi Terbaru',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                  TextButton(onPressed: () {}, child: const Text('Lihat Semua')),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: transactions.length,
                itemBuilder: (_, i) => TransactionItem(transaction: transactions[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TransactionItem extends StatelessWidget {
  final Map<String, dynamic> transaction;
  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: transaction['color'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(transaction['icon'], color: transaction['color']),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction['title'],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87)),
                const SizedBox(height: 4),
                Text(transaction['date'], style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
          ),
          Text(
            transaction['amount'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: transaction['amount'].startsWith('+') ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
