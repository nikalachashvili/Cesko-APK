import 'package:flutter/material.dart';
import 'package:voters/app/widgets/app_bottom_nav.dart';
import 'package:voters/features/game/game_screen.dart';
import 'package:voters/features/home/home_screen.dart';
import 'package:voters/features/schedule/data/election_events.dart';
import 'package:voters/features/schedule/schedule_screen.dart';

/// Root scaffold holding the three tabs and the bottom navigation bar.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          const HomeScreen(),
          const GameScreen(),
          ScheduleScreen(events: electionEvents),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}
