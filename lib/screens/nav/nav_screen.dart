import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_clone/enums/enums.dart';
import 'package:flutter_instagram_clone/screens/nav/cubit/bottom_nav_bar_cubit.dart';
import 'package:flutter_instagram_clone/screens/nav/widgets/bottom_nav_bar.dart';

class NavScreen extends StatelessWidget {
  static const String routeName = '/nav';

  static Route route() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (BuildContext context, Animation<double> animDouble1,
          Animation<double> animDouble2) {
        return BlocProvider<BottomNavBarCubit>(
          create: (_) => BottomNavBarCubit(),
          child: NavScreen(),
        );
      },
    );
  }

  final Map<BottomNavItem, IconData> items = const {
    BottomNavItem.feed: Icons.home,
    BottomNavItem.search: Icons.search,
    BottomNavItem.create: Icons.add,
    BottomNavItem.notifications: Icons.favorite_border,
    BottomNavItem.profile: Icons.account_circle,
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Prevents user from going back to the Login or SignupScreen from the Nav.
      onWillPop: () async => false,
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: Text('Nav Screen'),
            bottomNavigationBar: BottomNavBar(
              items: items,
              selectedItem: state.selectedItem,
              onTap: (index) {
                final selectedItem = BottomNavItem.values[index];
                context
                    .read<BottomNavBarCubit>()
                    .updateSelectedItem(selectedItem);
              },
            ),
          );
        },
      ),
    );
  }
}
