import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Container(
                height: 180,
                width: double.infinity,
                color: ColorManager.primary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(''),
                      Text(''),
                      Divider(),
                      Icon(
                        Icons.person_add_alt_1_outlined,
                        color: Colors.white,
                      ),
                      Icon(Icons.settings_outlined, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(0.1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorManager.backgroundColor,
                        width: 1,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://i.pravatar.cc/300?img=12',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Austine, Tx',
                    style: TextStyle(color: ColorManager.black54),
                  ),
                  const SizedBox(height: 20),
                  const TabBar(
                    labelColor: ColorManager.primary,
                    unselectedLabelColor: ColorManager.black54,
                    indicatorColor: ColorManager.primary,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: 'Post'),
                      Tab(text: 'Info'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(child: Text('post')),
                        Center(child: Text('about')),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
