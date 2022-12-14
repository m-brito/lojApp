import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // ignore: unused_field
  bool _isLoading = true;

  // Não mais necessario pois esta sendo usado FutureBuilder
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<OrderList>(
  //     context,
  //     listen: false,
  //   ).loadOrders().then((_) {
  //     setState(() => _isLoading = false);
  //   });
  // }

  Future<void> _refreshOrders(BuildContext context) {
    setState(() => _isLoading = true);
    return Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders().then(
          (_) => setState(() => _isLoading = false),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Pedidos'),
          centerTitle: true,
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
          future: Provider.of<OrderList>(context, listen: false).loadOrders(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.error != null) {
              return const Center(child: Text('Ocorreu um erro!'));
            } else {
              return RefreshIndicator(
                onRefresh: () => _refreshOrders(context),
                child: Consumer<OrderList>(
                  builder: (ctx, orders, child) => ListView.builder(
                    itemCount: orders.itemsCount,
                    itemBuilder: (ctx, index) =>
                        OrderWidget(order: orders.items[index]),
                  ),
                ),
              );
            }
          },
        ));
  }
}
