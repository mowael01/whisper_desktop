import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whisper_desktop/pages/report_feeds.dart';

// Create a proper StateNotifier for route management
class RouteNotifier extends StateNotifier<int> {
  RouteNotifier() : super(0);

  void setRoute(int newRoute) {
    state = newRoute;
  }
}

// Create the provider - add this to your main.dart or providers file
final routeProvider = StateNotifierProvider<RouteNotifier, int>((ref) {
  return RouteNotifier();
});

class MainLayout extends ConsumerStatefulWidget {
  const MainLayout({super.key});

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends ConsumerState<MainLayout> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // Watch the route provider
    final route = ref.watch(routeProvider);
    final hoverColor = Theme.of(
      context,
    ).buttonTheme.colorScheme?.surfaceTint.withAlpha(70);

    return Row(
      children: [
        Material(
          color: Colors.black,
          child: SizedBox(
            width: 250,
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(child: SizedBox()),
                    SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          TextButton(
                            onPressed: () {
                              _pageController.jumpToPage(0);
                              ref.read(routeProvider.notifier).setRoute(0);
                            },
                            style: TextButton.styleFrom(
                              fixedSize: Size(200, 50),
                              alignment: Alignment.centerLeft,
                              backgroundColor: route == 0 ? hoverColor : null,
                            ),
                            child: Text(
                              'Reports',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              _pageController.jumpToPage(1);
                              ref.read(routeProvider.notifier).setRoute(1);
                            },
                            style: TextButton.styleFrom(
                              fixedSize: Size(200, 50),
                              alignment: Alignment.centerLeft,
                              backgroundColor: route == 1 ? hoverColor : null,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              // Update the route when page changes via swipe
              ref.read(routeProvider.notifier).setRoute(index);
            },
            children: [ReportPage()],
          ),
        ),
      ],
    );
  }
}
