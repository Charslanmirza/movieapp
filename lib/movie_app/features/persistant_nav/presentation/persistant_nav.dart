import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/movie_app/features/dashboard/presentation/dashboard.dart';
import 'package:movieapp/movie_app/features/media_library/presentation/media_library.dart';
import 'package:movieapp/movie_app/features/more/presentation/more.dart';
import 'package:movieapp/movie_app/features/watch/presentation/pages/movies_list.dart';
import 'package:movieapp/movie_app/features/watch/presentation/pages/watch_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PersistentNavBar extends StatefulWidget {
  final int selectedTabIndex;

  PersistentNavBar({Key? key, required this.selectedTabIndex})
      : super(key: key);

  @override
  State<PersistentNavBar> createState() => _PersistentNavBarState();
}

class _PersistentNavBarState extends State<PersistentNavBar> {
  PersistentTabController controller = PersistentTabController();

  Future<bool> preventPop(BuildContext? context) async {
    if (controller.index != 0) {
      controller.jumpToTab(0);
      return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToHome();
  }

  goToHome() {
    controller.jumpToTab(widget.selectedTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        DashboardScreen(),
        WatchScreen(),
        MediaLibraryScreen(),
        MoreScreen()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.grid_view,
          ),
          inactiveIcon: const Icon(
            Icons.grid_view_outlined,
          ),
          textStyle:
              Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
          title: 'Dashboard ',
          activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
          inactiveColorPrimary: Theme.of(context).colorScheme.primaryContainer,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.smart_display,
          ),
          inactiveIcon: const Icon(
            Icons.smart_display_outlined,
          ),
          textStyle:
              Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
          title: 'Watch',
          activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
          inactiveColorPrimary: Theme.of(context).colorScheme.primaryContainer,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.perm_media,
          ),
          title: 'Media Library',
          inactiveIcon: const Icon(
            Icons.perm_media_outlined,
          ),
          activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
          inactiveColorPrimary: Theme.of(context).colorScheme.primaryContainer,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.list,
          ),
          textStyle:
              Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
          title: 'More',
          inactiveIcon: const Icon(
            Icons.list_outlined,
          ),
          activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
          inactiveColorPrimary: Theme.of(context).colorScheme.primaryContainer,
        ),
      ];
    }

    return PersistentTabView(
      padding: NavBarPadding.all(5),
      navBarStyle: NavBarStyle.simple,
      popAllScreensOnTapAnyTabs: true,
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // onWillPop: preventPop,
      // Default is true.
      resizeToAvoidBottomInset: false,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // This prevents scaffold from showing a
      bottomScreenMargin:
          MediaQuery.of(context).viewInsets.bottom > 0.0 ? 0.0 : null,

      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          // colorBehindNavBar: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.3),
                offset: Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 2)
          ]),
      popAllScreensOnTapOfSelectedTab: true,
    );
  }
}
