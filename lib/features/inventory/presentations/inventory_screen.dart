import 'package:dashborad/common_model/product_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key, this.product});

  final ProductModel? product;

  static route({ProductModel? product}) => MaterialPageRoute(
        builder: (context) => InventoryScreen(
          product: product,
        ),
      );

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final List<String> _shops = ['Nanny\'s shop', 'Amin\'s shop'];
  var textStyle = const TextStyle(fontWeight: FontWeight.w300);
  final List<Map> myProducts =
      List.generate(2, (index) => {"id": index, "name": "Product $index"})
          .toList();
  bool hasDiscount = false;
  bool hasExpiryDate = false;
  bool hasReturnPolicy = false;

  final QuillController _controller = QuillController.basic();
  final QuillController _shortDescription = QuillController.basic();
  final QuillController _returnPolicy = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    String? selectedItem = _shops.first;
    ProductModel? product = widget.product;
    bool isCreate = (product == null);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
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
        title: Text((isCreate) ? ("Create new product") : ("Update product")),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                informationEditor(context, selectedItem),
                imageSelector(context),
              ],
            ),
          )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Flexible informationEditor(BuildContext context, String? selectedItem) {
    return Flexible(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Theme.of(context).colorScheme.onPrimary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Product Name"),
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonFormField(
                                          isExpanded: true,
                                          focusColor: Colors.transparent,
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          hint: const Text(
                                              "Select Product Category"),
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
                                      )),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            "Selling Price"),
                                              ),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: "Cost Price"),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Selling Price"),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              InkWell(
                                                  onTap: () {},
                                                  child: const Icon(Icons
                                                      .arrow_drop_up_sharp)),
                                              InkWell(
                                                  onTap: () {},
                                                  child: const Icon(Icons
                                                      .arrow_drop_down_sharp)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonFormField(
                                          isExpanded: true,
                                          focusColor: Colors.transparent,
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          hint: const Text("Order Type"),
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
                                      )),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Flexible(
                                          flex: 4, child: Text("Discount")),
                                      Flexible(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            const Flexible(
                                                flex: 2,
                                                child: Text("Add Discount")),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Switch(
                                                value: hasDiscount,
                                                onChanged: (value) {
                                                  setState(() {
                                                    hasDiscount = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  (hasDiscount)
                                      ? Row(
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .surface,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  "Discount"),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Flexible(
                                        flex: 5,
                                        child: Text("Expiry Date"),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Flexible(
                                                flex: 4,
                                                child: Text("Add Expiry Date")),
                                            Flexible(
                                              flex: 2,
                                              child: Switch(
                                                value: hasExpiryDate,
                                                onChanged: (value) {
                                                  setState(() {
                                                    hasExpiryDate = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  (hasExpiryDate)
                                      ? Row(
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .surface,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  "Expiry Date"),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            QuillEditor.basic(
                                              configurations:
                                                  QuillEditorConfigurations(
                                                      controller:
                                                          _shortDescription,
                                                      sharedConfigurations:
                                                          const QuillSharedConfigurations(
                                                        locale: Locale('ar'),
                                                      ),
                                                      placeholder:
                                                          "Short Description"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 16,
                                      )),
                                  const Flexible(
                                      flex: 1,
                                      child: Text("Product Long Description")),
                                  const Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 16,
                                      )),
                                  Flexible(
                                    flex: 6,
                                    child: SingleChildScrollView(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Column(
                                          children: [
                                            QuillToolbar.simple(
                                              configurations:
                                                  QuillSimpleToolbarConfigurations(
                                                showColorButton: false,
                                                showSearchButton: false,
                                                showClipboardCut: false,
                                                showClipboardPaste: false,
                                                showClipboardCopy: false,
                                                showSubscript: false,
                                                showClearFormat: false,
                                                showBackgroundColorButton:
                                                    false,
                                                showSuperscript: false,
                                                showInlineCode: false,
                                                showStrikeThrough: false,
                                                showCodeBlock: false,
                                                showUndo: false,
                                                showRedo: false,
                                                showListCheck: false,
                                                showQuote: false,
                                                showIndent: false,
                                                showListNumbers: false,
                                                showHeaderStyle: false,
                                                controller: _controller,
                                                sharedConfigurations:
                                                    const QuillSharedConfigurations(
                                                  locale: Locale('en'),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: QuillEditor.basic(
                                                configurations:
                                                    QuillEditorConfigurations(
                                                  controller: _controller,
                                                  placeholder:
                                                      "Add a long description for your product",
                                                  sharedConfigurations:
                                                      const QuillSharedConfigurations(
                                                    locale: Locale('ar'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 16,
                                      )),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Flexible(
                                          flex: 5,
                                          child: Text("Return Policy"),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Flexible(
                                                  flex: 3,
                                                  child: Text(
                                                      "Add Return Policy")),
                                              Flexible(
                                                flex: 1,
                                                child: Switch(
                                                  value: hasReturnPolicy,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      hasReturnPolicy = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 16,
                                      )),
                                  (hasReturnPolicy)
                                      ? SingleChildScrollView(
                                          child: Flexible(
                                            flex: 5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface,
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Column(
                                                children: [
                                                  QuillToolbar.simple(
                                                    configurations:
                                                        QuillSimpleToolbarConfigurations(
                                                      showColorButton: false,
                                                      showSearchButton: false,
                                                      showClipboardCut: false,
                                                      showClipboardPaste: false,
                                                      showClipboardCopy: false,
                                                      showSubscript: false,
                                                      showClearFormat: false,
                                                      showBackgroundColorButton:
                                                          false,
                                                      showSuperscript: false,
                                                      showInlineCode: false,
                                                      showStrikeThrough: false,
                                                      showCodeBlock: false,
                                                      showUndo: false,
                                                      showRedo: false,
                                                      showListCheck: false,
                                                      showQuote: false,
                                                      showIndent: false,
                                                      showListNumbers: false,
                                                      showHeaderStyle: false,
                                                      controller: _returnPolicy,
                                                      sharedConfigurations:
                                                          const QuillSharedConfigurations(
                                                        locale: Locale('en'),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: QuillEditor.basic(
                                                      configurations:
                                                          QuillEditorConfigurations(
                                                        controller:
                                                            _returnPolicy,
                                                        placeholder:
                                                            "Add a long description for your product",
                                                        sharedConfigurations:
                                                            const QuillSharedConfigurations(
                                                          locale: Locale('ar'),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  const Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 16,
                                      )),
                                  const Flexible(
                                    flex: 3,
                                    child: Text("Date Addred"),
                                  ),
                                  const Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 16,
                                      )),
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: InkWell(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .surface,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                "Selling Price"),
                                                  ),
                                                )),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface,
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              "Cost Price"),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Flexible imageSelector(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Theme.of(context).colorScheme.onPrimary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: Card(
                      color: Theme.of(context).colorScheme.surface,
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.blue,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.cloud_upload_outlined,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Upload Image",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            Text(
                              "Upload a cover image for your product.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "File Format",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey),
                                ),
                                Text(
                                  "jpeg, png ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  "Recommended Size ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey),
                                ),
                                Text(
                                  "600x600 (1:1)",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Additional Images",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // implement GridView.builder
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 400,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: myProducts.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return (index == 0)
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    child: const Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.image,
                                            color: Colors.blue,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.cloud_upload_outlined,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                "Upload Image",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : (index == (myProducts.length - 1))
                                  ? DottedBorder(
                                      strokeCap: StrokeCap.round,
                                      dashPattern: [4, 4],
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      ))
                                  : Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(myProducts[index]["name"]),
                                    );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
