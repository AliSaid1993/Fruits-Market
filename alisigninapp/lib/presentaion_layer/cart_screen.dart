import 'package:alisigninapp/logic_layer/cart_item_bloc/cart_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic_layer/cart_bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int itemselect = 0;
  int itemindex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart Items'),
      ),
      body: BlocBuilder<VendorCartBloc, VendorCartState>(
        builder: (context, state) {
          if (state is VendorCartLoadedState) {
            return state.carts[0].items!.isEmpty
                ? Center(
                    child: Text("لا يوجد أية منتجات"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.carts[0].items!.length,
                    itemBuilder: (context, index) {
                      return BlocListener<CartItemBloc, CartItemState>(
                        listener: (context, state3) {
                          // TODO: implement listener
                          if (state3 is CartItemLoadedState) {
                            setState(() {
                              itemselect = 0;
                              state.carts[0].items![itemindex].quantity =
                                  state3.value;
                              itemindex = -1;
                            });
                          } else {
                            setState(() {
                              itemselect = 0;
                            });
                          }
                        },
                        child: ListTile(
                          title: Text(
                              state.carts[0].items![index].product!.title!),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              itemselect == state.carts[0].items![index].id!
                                  ? CircularProgressIndicator()
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          itemindex = index;
                                          itemselect =
                                              state.carts[0].items![index].id!;
                                        });
                                        var qu = state.carts[0].items![index]
                                                .quantity! +
                                            1;
                                        BlocProvider.of<CartItemBloc>(context)
                                            .add(CartDecrementEvent(
                                                cartid: state.carts[0].id!,
                                                productid: state
                                                    .carts[0].items![index].id!,
                                                quantity: qu));
                                      },
                                      icon: const Icon(
                                          Icons.add_shopping_cart_outlined),
                                    ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(state.carts[0].items![index].quantity
                                  .toString()),
                              SizedBox(
                                width: 5,
                              ),
                              itemselect == state.carts[0].items![index].id!
                                  ? CircularProgressIndicator()
                                  : IconButton(
                                      onPressed: () {
                                        if (state.carts[0].items![index]
                                                .quantity! >
                                            1) {
                                          setState(() {
                                            itemindex = index;

                                            itemselect = state
                                                .carts[0].items![index].id!;
                                          });
                                          var qu = state.carts[0].items![index]
                                                  .quantity! -
                                              1;
                                          BlocProvider.of<CartItemBloc>(context)
                                              .add(CartDecrementEvent(
                                                  cartid: state.carts[0].id!,
                                                  productid: state.carts[0]
                                                      .items![index].id!,
                                                  quantity: qu));
                                        }
                                      },
                                      icon: const Icon(
                                          Icons.remove_shopping_cart_outlined),
                                    ),
                            ],
                          ),
                        ),
                      );
                    });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
