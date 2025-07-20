import 'package:flutter/material.dart';
import 'package:learning_english/screen/setting_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF667eea), Colors.white],
            stops: [0.4, 0.4],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Profile Header
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 45,
                        child: Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'username surname',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Menu Items
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(20),
                    children: [
                      _buildMenuItem(
                          icon: Icons.settings,
                          title: 'Sozlamalar',
                          color: Colors.blue,
                          onPressed: () {
                            print('sozlamalar bosildi');

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingPage()));
                          }),
                      _buildMenuItem(
                          icon: Icons.bar_chart,
                          title: 'Statistika',
                          color: Colors.green,
                          onPressed: () {}),
                      _buildMenuItem(
                          icon: Icons.notifications,
                          title: 'Bildirishnomalar',
                          color: Colors.orange,
                          onPressed: () {}),
                      _buildMenuItem(
                          icon: Icons.help,
                          title: 'Yordam',
                          color: Colors.purple,
                          onPressed: () {}),
                      _buildMenuItem(
                          icon: Icons.star,
                          title: 'Baholash',
                          color: Colors.amber,
                          onPressed: () {}),
                      _buildMenuItem(
                          icon: Icons.share,
                          title: 'Ulashish',
                          color: Colors.teal,
                          onPressed: () {}),
                      _buildMenuItem(
                          icon: Icons.info,
                          title: 'Ma\'lumot',
                          color: Colors.grey,
                          onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildMenuItem(
      {required IconData icon,
      required String title,
      required Color color,
      required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 70,
        child: Card(
          child: Center(
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2C3E50),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
