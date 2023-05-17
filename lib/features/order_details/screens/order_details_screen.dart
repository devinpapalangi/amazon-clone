// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/models/order.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_layout.dart';
import '../../../utils/app_style.dart';
import '../../search/screens/search_screen.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String routeName = '/order-details';
  final Order order;
  const OrderDetailsScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final AdminServices adminServices = AdminServices();
  int currentStep = 0;
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  void initState() {
    super.initState();
    currentStep = widget.order.status;
  }

  void changeOrderStatus(int status) {
    adminServices.changeOrderStatus(
      context: context,
      status: status + 1,
      order: widget.order,
      onSuccess: () {
        setState(() {
          currentStep += 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Styles.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: AppLayout.getHeight(42),
                  margin: EdgeInsets.only(left: AppLayout.getWidth(15)),
                  child: Material(
                    borderRadius: BorderRadius.circular(AppLayout.getWidth(7)),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: AppLayout.getWidth(6),
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: AppLayout.getWidth(23),
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(
                            top: AppLayout.getHeight(10),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppLayout.getWidth(7)),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppLayout.getWidth(7)),
                            ),
                            borderSide: BorderSide(
                                color: Colors.black38,
                                width: AppLayout.getWidth(1)),
                          ),
                          hintText: 'Search Amazon.in',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: AppLayout.getWidth(17))),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: AppLayout.getHeight(42),
                margin: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(10),
                ),
                child: Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: AppLayout.getWidth(25),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'View Order Details',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Date:     ${DateFormat().format(
                    DateTime.fromMillisecondsSinceEpoch(widget.order.orderedAt),
                  )}'),
                  Text('Order ID :        ${widget.order.id}'),
                  Text('Total :             \$${widget.order.totalPrice}'),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
            ),
            Gap(AppLayout.getHeight(10)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Purchase Details',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Column(
                children: [
                  for (int i = 0; i < widget.order.products.length; i++)
                    Row(
                      children: [
                        Image.network(
                          widget.order.products[i].images[0],
                          width: AppLayout.getWidth(120),
                          height: AppLayout.getHeight(120),
                        ),
                        Gap(AppLayout.getWidth(5)),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.order.products[i].name,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text('Qty: ${widget.order.quantity[i].toString()}'),
                          ],
                        ))
                      ],
                    )
                ],
              ),
            ),
            Gap(AppLayout.getHeight(10)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tracking',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Stepper(
                currentStep: currentStep,
                controlsBuilder: (context, details) {
                  if (user.type == 'admin' && currentStep != 3) {
                    return CustomButton(
                        text: 'Done',
                        onPressed: () =>
                            changeOrderStatus(details.currentStep));
                  }
                  return SizedBox();
                },
                steps: [
                  Step(
                    title: Text('Pending'),
                    content: Text('Your order is yet to be delivered!'),
                    isActive: currentStep >= 0,
                    state: currentStep >= 0
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: Text('Completed'),
                    content: Text(
                        'Your order has been delivered, you are yet to sign!'),
                    isActive: currentStep > 1,
                    state: currentStep > 1
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: Text('Recieved'),
                    content: Text(
                        'Your order has been delivered and recieved by you'),
                    isActive: currentStep > 2,
                    state: currentStep > 2
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: Text('Delivered'),
                    content: Text(
                        'Your order has been delivered and recieved by you'),
                    isActive: currentStep >= 3,
                    state: currentStep >= 3
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
