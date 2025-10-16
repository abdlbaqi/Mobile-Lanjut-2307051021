import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';
import 'dashboard_page.dart';

// stateful widget navigasi
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

// state karena menandakan posisi tab yg aktif
class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 1; // posisi aktif di tab "Profile"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1E88E5),
              Color(0xFF42A5F5),
              Color(0xFF64B5F6),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const _ProfileHeader(),
              const SizedBox(height: 20),
              const _ProfileAvatar(),
              const SizedBox(height: 20),
              const _ProfileInfo(),
              const SizedBox(height: 30),
              const Expanded(child: _ProfileBiodataSection()),
            ],
          ),
        ),
      ),

      // 🔹 Bottom Navigation
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  /// Bottom Navigation untuk pindah halaman
  Widget _buildBottomNav(BuildContext context) => BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          if (i == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const DashboardPage()),
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

// 🔹 Header tanpa tombol back
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// stateless karena tidak berubah
class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar();

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 15,
      opacity: 0.2,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/profilee.jpg'),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

// stateless karena tidak berubah
class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Fuad Abdul Baqi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'fuadbaqi910@gmail.com',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

// stateless karena tidak berubah
class _ProfileBiodataSection extends StatelessWidget {
  const _ProfileBiodataSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GlassContainer(
            blur: 10,
            opacity: 0.1,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Biodata',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 15),
                  BiodataItem(label: 'Nama Lengkap', value: 'Fuad Abdul Baqi'),
                  BiodataItem(label: 'Jenis Kelamin', value: 'Laki-laki'),
                  BiodataItem(
                      label: 'Pendidikan',
                      value: 'Mahasiswa - Universitas Lampung'),
                  BiodataItem(label: 'NIM', value: '2307051021'),
                  BiodataItem(
                      label: 'Prodi', value: 'D3 Manajemen Informatika'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget stateless untuk item biodata
class BiodataItem extends StatelessWidget {
  final String label;
  final String value;

  const BiodataItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
