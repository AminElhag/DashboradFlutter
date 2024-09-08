import 'package:dashborad/features/customers/presentations/customers_screen.dart';
import 'package:dashborad/features/inventory/presentations/inventory_monitor_screen.dart';
import 'package:dashborad/features/monitor/presentations/monitor_screen.dart';
import 'package:dashborad/features/order/presentations/order_screen.dart';
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
  final List<String> _shops = ['Nanny\'s shop', 'Amin\'s shop'];

  @override
  Widget build(BuildContext context) {
    String? selectedItem = _shops.first;
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
          : AppBar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              leading: const Column(
                children: [
                  Spacer(),
                  Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 15),
                  ),
                  Spacer(),
                ],
              ),
              leadingWidth: 100,
              actions: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondaryFixed
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      focusColor: Colors.transparent,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      value: selectedItem,
                      items: _shops.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedItem = newValue;
                        });
                      },
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: Theme.of(context).colorScheme.primary,
                    )),
                const SizedBox(
                  width: 6,
                ),
                const SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/id/237/300/300',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
              ],
            ),
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: Center(
              child: _SelectScreens(
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
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6),
            child: (extended)
                ? Column(
                    children: [
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .surfaceContainerHigh,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.headphones_outlined,
                              color: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .onSurface,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text("Contact Support",
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        child: Row(
                          children: [
                            Icon(
                              Icons.output,
                              color: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .error,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text("Logout",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
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
                            backgroundColor: Theme.of(context)
                                .buttonTheme
                                .colorScheme!
                                .surfaceContainerHigh,
                            shape: const CircleBorder()),
                        icon: Icon(
                          Icons.headphones_outlined,
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .onSurface,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'You logout',
                                style: TextStyle(color: Colors.black),
                              ),
                              backgroundColor: Colors.white,
                            ),
                          );
                        },
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        icon: Icon(
                          Icons.output,
                          color:
                              Theme.of(context).buttonTheme.colorScheme!.error,
                        ),
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

class _SelectScreens extends StatelessWidget {
  const _SelectScreens({
    super.key,
    required this.controller,
  });

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
            return const MonitorScreen();
          case 1:
            return const OrderScreen();
          case 2:
            return const CustomersScreen();
          case 3:
            return const InventoryMonitoryScreen();
          default:
            return Scaffold(
              appBar: AppBar(
                leading: Text(
                  pageTitle,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
            );
        }
      },
    );
  }
}

final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);
