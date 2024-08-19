import 'dart:math';

import 'package:dashborad/common/extension.dart';
import 'package:dashborad/common_model/order_model.dart';
import 'package:dashborad/common_model/customer_model.dart';
import 'package:dashborad/common_widget/dashboard_summary_chip_card.dart';
import 'package:dashborad/common_widget/order_row.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<String> _items = ['This Week', 'This Day', 'This Month'];
  bool _isChecked = false;
  final List<int> _pages = [1,2,4,5,6,7,8,9,10];
  @override
  Widget build(BuildContext context) {
    int selectedItem = _pages.first;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Order Summary"),
                FilledButton(
                    onPressed: () {}, child: const Text("+ Create a new order"))
              ],
            ),
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
                  flex: 3,
                  iconData: Icons.sell_outlined,
                  firstFrameTitle: "All Orders",
                  firstFrameValue: 0,
                  secondFrameTitle: "Pending",
                  secondFrameValue: 0,
                  hasThirdFrame: true,
                  thirdFrameTitle: "Completed",
                  thirdFrameValue: 0,
                  onOrderTypeChange: (p0) {},
                ),
                DashboardSummaryChipCard(
                  items: _items,
                  flex: 3,
                  iconData: Icons.sell_outlined,
                  firstFrameTitle: "Canceled",
                  firstFrameValue: 0,
                  secondFrameTitle: "Returned",
                  secondFrameValue: 0,
                  hasThirdFrame: true,
                  thirdFrameTitle: "Damaged",
                  thirdFrameValue: 0,
                  onOrderTypeChange: (p0) {},
                ),
                DashboardSummaryChipCard(
                  items: _items,
                  flex: 2,
                  iconData: Icons.shopping_cart_outlined,
                  firstFrameTitle: "Abandoned Cart",
                  firstFrameValue: 0,
                  secondFrameTitle: "Customers",
                  secondFrameValue: 0,
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
            Card(
              color: Theme.of(context).colorScheme.onPrimary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Customers Orders"),
                          const Spacer(),
                          Row(
                            children: [
                              SizedBox(
                                width: 200,
                                child: SearchBar(
                                  backgroundColor: WidgetStateProperty.all(
                                      Theme.of(context).colorScheme.onPrimary),
                                  hintText: "Search",
                                  leading: const Icon(Icons.search),
                                  shadowColor: WidgetStateProperty.all(
                                      Colors.transparent),
                                  side: WidgetStateProperty.all(BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  )),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.filter_alt_outlined,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                      Text(
                                        "Filter",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                width: 6,
                              ),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                      Text(
                                        "Filter",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                width: 6,
                              ),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.send,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                      Text(
                                        "Share",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: context.width / 7,
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                value: _isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Customer Name"),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                child: const Icon(Icons.filter_list_outlined),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Text("Order Date"),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: const Icon(Icons.filter_list_outlined),
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Row(
                          children: [
                            const Text("Order Type"),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: const Icon(Icons.filter_list_outlined),
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Row(
                          children: [
                            const Text("Tracking ID"),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: const Icon(Icons.filter_list_outlined),
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Row(
                          children: [
                            const Text("Order Totlal"),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: const Icon(Icons.filter_list_outlined),
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Row(
                          children: [
                            const Text("Action"),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: const Icon(Icons.filter_list_outlined),
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Row(
                          children: [
                            const Text("Status"),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: const Icon(Icons.filter_list_outlined),
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 6,
                    ),
                    ListView.builder(
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return OrderRow(
                            isChecked: false,
                            order: OrderModel(
                                id: "123456789",
                                date: "2024-07-14T11:50:19.213921Z",
                                user: CustomerModel(
                                  id: "1234",
                                  fullName: "Amin Galal",
                                  email: "mail@mail.com",
                                  phone: "+249912345678",
                                  createdAt: "2024-07-14T11:50:19.213921Z",
                                  totalSpend: 4520,
                                  numberOfOrders: 25,
                                  status: Random().nextInt(5),
                                ),
                                price: 459.16,
                                status: Random().nextInt(4),
                                type: Random().nextInt(2)));
                      },
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text("1-10 of 200 items"),
                        const Spacer(),
                        Container(
                          width: 70,
                          decoration: BoxDecoration(
                              color:
                              Theme.of(context).colorScheme.outline.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              focusColor: Colors.transparent,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              value: 1,
                              items: _pages.map((item) {
                                return DropdownMenuItem<int>(
                                  value: item,
                                  child: Text(
                                    item.toString(),
                                    style: const TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedItem = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 2,),
                        Text("of ${_pages.last} pages"),
                        const SizedBox(width: 16,),
                        const Icon(Icons.arrow_back_ios,size: 12,),
                        const SizedBox(width: 2,),
                        const Icon(Icons.arrow_forward_ios,size: 12,),
                        const SizedBox(width: 16,),

                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
