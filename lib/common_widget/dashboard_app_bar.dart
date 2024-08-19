import 'package:flutter/material.dart';

class DashboardAppBar extends StatefulWidget {
  const DashboardAppBar(
      {super.key, required this.shops, required this.onStoreChange});

  final List<String> shops;
  final VoidCallback onStoreChange;

  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();
}

class _DashboardAppBarState extends State<DashboardAppBar> {
  @override
  Widget build(BuildContext context) {
    String? selectedItem = widget.shops.first;
    return AppBar(
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
              color:
                  Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.5),
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
              items: widget.shops.map((item) {
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
    );
  }
}
