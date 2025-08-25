import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Text('Hello, Welcome 👋', style: TextStyle(fontSize: 11)),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: theme.colorScheme.inverseSurface,
                      child: Icon(Icons.person, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Flexible(
                    flex: 5,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hint: Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            Text(
                              'Search...',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: theme.colorScheme.inverseSurface,
                        foregroundColor: theme.colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(55, 55),
                      ),
                      child: Icon(Icons.settings, size: 26),
                    ),
                  ),
                ],
              ),
            ],
          ),
          floating: true,
          toolbarHeight: 140,
        ),
        SliverFillRemaining(),
      ],
    );
  }
}
