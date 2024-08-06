import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
              title: Text(_getTitleByIndex(_controller.selectedIndex)),
              leading: IconButton(
                onPressed: () {
                  // if (!Platform.isAndroid && !Platform.isIOS) {
                  //   _controller.setExtended(true);
                  // }
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Dashboard';
    case 1:
      return 'Orders';
    case 2:
      return 'Customers';
    case 3:
      return 'Inventory';
    case 4:
      return 'Conversations';
    case 5:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle:
            TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedItemDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        iconTheme: IconThemeData(
          color: Colors.black.withAlpha(80),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
      ),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: (extended)
                ? Row(
                    children: [
                      Image.asset("assets/img/app_icon.png"),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "DashBoard",
                        style: TextStyle(
                            fontSize: 18.0,
                            color:
                                Theme.of(context).textTheme.bodySmall?.color),
                      ),
                    ],
                  )
                : Image.asset("assets/img/app_icon.png"),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
          onTap: () {
            debugPrint('dashboard');
          },
        ),
        const SidebarXItem(
          icon: Icons.shopping_cart_outlined,
          label: 'Order',
        ),
        const SidebarXItem(
          icon: Icons.people_alt_outlined,
          label: 'Customers',
        ),
        const SidebarXItem(
          icon: Icons.folder_copy_outlined,
          label: 'Inventory',
          // onTap: () => _showDisabledAlert(context),
        ),
        const SidebarXItem(
          icon: Icons.chat_bubble_outline,
          label: 'Conversations',
          // onTap: () => _showDisabledAlert(context),
        ),
        const SidebarXItem(
          icon: Icons.settings,
          label: 'Setting',
          // onTap: () => _showDisabledAlert(context),
        ),
      ],
      footerBuilder: (context, extended) {
        return SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 6),
            child: (extended)
                ? Column(
                    children: [
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor:
                          Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .surfaceContainerHigh,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.headphones_outlined,color: Theme.of(context)
                                .buttonTheme
                                .colorScheme!
                                .onSurface,),
                            const SizedBox(width: 6,),
                            Text("Contact Support",
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                      ),
                      const SizedBox(height: 6,),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor:
                          Colors.transparent
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.output,color: Theme.of(context)
                                .buttonTheme
                                .colorScheme!
                                .error,),
                            const SizedBox(width: 6,),
                            Text("Logout",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context)
                                    .buttonTheme
                                    .colorScheme!
                                    .error))
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor:
                    Theme.of(context)
                        .buttonTheme
                        .colorScheme!
                        .surfaceContainerHigh,
                    shape: const CircleBorder()
                  ), icon: Icon(Icons.headphones_outlined,color: Theme.of(context)
                    .buttonTheme
                    .colorScheme!
                    .onSurface,),
                ),
                const SizedBox(height: 6,),
                IconButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                      backgroundColor:
                      Colors.transparent
                  ),
                  icon: Icon(Icons.output,color: Theme.of(context)
                      .buttonTheme
                      .colorScheme!
                      .error,),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDisabledAlert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Item disabled for selecting',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);
