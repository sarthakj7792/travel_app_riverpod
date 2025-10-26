import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/presentation/pages/add_trip_screen.dart';
import 'package:travel_app/features/trip/presentation/pages/my_trip_screen.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';

class MainScreen extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  MainScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tripListNotifierProvider.notifier).loadTrips();
    
    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text(
              "Hi Sarthak",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        children: [MyTripScreen(), AddTripScreen(), Text('3')],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, pageIndex, child) {
          return BottomNavigationBar(
            currentIndex: pageIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "My Trips",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "Add Trips",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: "Maps"),
            ],
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          );
        },
      ),
    );
  }
}
