import 'dart:math';

import 'package:dashborad/common/extension.dart';
import 'package:dashborad/common_model/order_model.dart';
import 'package:dashborad/common_model/user_model.dart';
import 'package:dashborad/common_widget/dashboard_marketing_card.dart';
import 'package:dashborad/common_widget/dashboard_summary_chip_card.dart';
import 'package:dashborad/common_widget/dashboard_summary_slice_card.dart';
import 'package:dashborad/common_widget/order_item.dart';
import 'package:flutter/material.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({super.key});

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {
  final List<String> _shops = ['Nanny\'s shop', 'Amin\'s shop'];
  final List<String> _items = ['This Week', 'This Day', 'This Month'];
  final List<double> _values = [4.1, 20.4, 3.4, 52.6, 35.1, 67, 10, 3.4, 52.6, 35.1, 67, 10];
  final List<String> _typeFlutter = ['Sales','Customers','Order',];
  final List<String> _dateFlutter = ['Last 7 days','Last 7 weeks','Last 12 month',];

  @override
  Widget build(BuildContext context) {
    String? selectedItem = _shops.first;
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 6,
                ),
                DashboardSummaryChipCard(
                  items: _items,
                  flex: 2,
                  iconData: Icons.sell_outlined,
                  firstFrameTitle: "Sales",
                  firstFrameValue: 0.0,
                  secondFrameTitle: "Volume",
                  secondFrameValue: 0.0,
                  onOrderTypeChange: (p0) {},
                ),
                DashboardSummaryChipCard(
                  items: _items,
                  flex: 2,
                  iconData: Icons.people_alt_outlined,
                  firstFrameTitle: "Customers",
                  firstFrameValue: 0.0,
                  secondFrameTitle: "Active",
                  secondFrameValue: 0.0,
                  onOrderTypeChange: (p0) {},
                ),
                DashboardSummaryChipCard(
                  items: _items,
                  flex: 3,
                  iconData: Icons.shopping_cart_outlined,
                  firstFrameTitle: "All Order",
                  firstFrameValue: 0.0,
                  secondFrameTitle: "Pending",
                  secondFrameValue: 0.0,
                  hasThirdFrame: true,
                  thirdFrameTitle: "Completed",
                  thirdFrameValue: 0.0,
                  onOrderTypeChange: (p0) {},
                ),
                const SizedBox(
                  width: 6,
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    width: context.width,
                    height: context.height - 220,
                    child: Column(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                DashboardMarketingCard(
                                  items: _items,
                                  firstValue: 50,
                                  secondValue: 30,
                                  thirdValue: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Flexible(
                                          child: DashboardSummaryChipCard(
                                        items: _items,
                                        flex: 1,
                                        iconData: Icons.folder_outlined,
                                        firstFrameTitle: "All Products",
                                        firstFrameValue: 0.0,
                                        secondFrameTitle: "Active",
                                        secondFrameValue: 0.0,
                                        hasSecondValueHasPercentage: true,
                                        secondValuePercentage: 0,
                                        hasOrderChange: false,
                                        onOrderTypeChange: (p0) {},
                                      )),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Flexible(
                                          child: DashboardSummaryChipCard(
                                        items: _items,
                                        flex: 1,
                                        iconData: Icons.sell_outlined,
                                        firstFrameTitle: "Sales",
                                        firstFrameValue: 0.0,
                                        secondFrameTitle: "Volume",
                                        secondFrameValue: 0.0,
                                        onOrderTypeChange: (p0) {},
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        DashboardSummarySliceCard(
                          timeSlicesItems: _dateFlutter,
                          flutterSlicesItems: _typeFlutter,
                          values: _values,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    width: context.width,
                    height: context.height - 220,
                    child: Card(
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Flexible(
                              flex: 0,
                              child: Text(
                                "Recent Orders",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Flexible(
                              flex: 10,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: ListView.builder(
                                  itemCount: 100,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return OrderItem(
                                      model: OrderModel(
                                          id: "1234",
                                          date: "2024-07-14T11:50:19.213921Z",
                                          user: UserModel(
                                              id: "1234",
                                              fullName: "Amin Galal",
                                              email: "mail@mail.com"),
                                          price: 99.10,
                                          status: Random().nextInt(4)),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
