import 'dart:math';

import 'package:dashborad/common/extension.dart';
import 'package:dashborad/common_model/customer_model.dart';
import 'package:dashborad/common_model/order_model.dart';
import 'package:dashborad/common_model/product_model.dart';
import 'package:dashborad/common_widget/customer_row.dart';
import 'package:dashborad/common_widget/dashboard_summary_chip_card.dart';
import 'package:dashborad/common_widget/order_row.dart';
import 'package:dashborad/common_widget/product_row.dart';
import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final List<String> _items = ['This Week', 'This Day', 'This Month'];
  bool _isChecked = false;
  final List<int> _pages = [1, 2, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    int selectedItem = _pages.first;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Inventory Summary"),
                  FilledButton(
                      onPressed: () {}, child: const Text("+ Add a new product"))
                ],
              ),
            ),
            Flexible(
              flex: 5,
              child: Row(
                children: [
                  DashboardSummaryChipCard(
                    items: _items,
                    flex: 3,
                    hasOrderChange: false,
                    iconData: Icons.folder_outlined,
                    firstFrameTitle: "All Products",
                    firstFrameValue: 0,
                    secondFrameTitle: "Active",
                    secondFrameValue: 0,
                    onOrderTypeChange: (p0) {},
                  ),
                  DashboardSummaryChipCard(
                    items: _items,
                    flex: 3,
                    iconData: Icons.inventory_2_outlined,
                    firstFrameTitle: "Low Stock Alert",
                    firstFrameValue: 0,
                    secondFrameTitle: "Expired",
                    secondFrameValue: 0,
                    hasThirdFrame: true,
                    thirdFrameTitle: "1 Start Rating",
                    thirdFrameValue: 0,
                    onOrderTypeChange: (p0) {},
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 18,
              child: Card(
                color: Theme.of(context).colorScheme.onPrimary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 2,
                        child: SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Inventory Items"),
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
                      ),
                      const Divider(),
                      Flexible(
                        flex: 1,
                        child: Row(
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
                                  const Text("Product Name"),
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
                                const Text("Category"),
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
                                const Text("Unit Price"),
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
                                const Text("In-Stock"),
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
                                const Text("Discount"),
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
                                const Text("Total Value"),
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
                      ),
                      const Divider(),
                      Flexible(
                        flex: 20,
                        child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ProductRow(
                              isChecked: false,
                              product: ProductModel(
                                id: "12334567",
                                name: "Mac Pro",
                                price: 3200,
                                inStock: 23,
                                discount: 0,
                                category: "Techo",
                                status: Random().nextInt(2),
                                images: ["https://picsum.photos/id/237/300/300"]
                              ),
                            );

                          },
                        ),
                      ),
                      const Divider(),
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            const Text("1-10 of 200 items"),
                            const Spacer(),
                            Container(
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outline
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300),
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
                            const SizedBox(
                              width: 2,
                            ),
                            Text("of ${_pages.last} pages"),
                            const SizedBox(
                              width: 16,
                            ),
                            const Icon(
                              Icons.arrow_back_ios,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
