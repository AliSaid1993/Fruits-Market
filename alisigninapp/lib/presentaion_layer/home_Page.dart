import 'package:alisigninapp/logic_layer/cart_bloc/cart_bloc.dart';
import 'package:alisigninapp/presentaion_layer/deatails_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

import '../logic_layer/category_bloc/category_bloc.dart';
import '../logic_layer/product_bloc/product_bloc.dart';
import '../models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchProductsController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();
  int cartcount = 0;
  int productselect = 0;

  @override
  Widget build(BuildContext context) {
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    // final cartBloc=VendorCartBloc.of<VendorCartBloc>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black12,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_call),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Home',
            ),
          ],
        ),
        // // drawer: Drawer(
        //   child: ListView(
        //     children: [
        //       UserAccountsDrawerHeader(
        //           accountName: Text(),
        //           accountEmail: accountEmail),
        //     ],
        //   ),
        // ),
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(''),
          leading: Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'cart_products');
              },
              child: Card(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Colors.yellowAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    BlocBuilder<VendorCartBloc, VendorCartState>(
                      builder: (context, state) {
                        if (state is VendorCartLoadedState) {
                          cartcount = state.carts[0].items!.length;
                          return Text(cartcount.toString());
                        } else {
                          return Text(cartcount.toString());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        BlocProvider.of<ProductBloc>(context).add(
                            SearchForSomeProduct(
                                query: searchProductsController.text));
                      },
                      child: Center(
                        child: Text(
                          'Search',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, bottom: 20, left: 10),
                      child: Container(
                        width: 200,
                        height: 55,
                        child: TextField(
                          controller: searchProductsController,
                          onChanged: (value) {
                            print(searchProductsController.text);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Find a Product..',
                            hintStyle: TextStyle(color: Colors.black38),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    badges.Badge(
                      badgeContent: Text('1'),
                      child: Image(
                        height: 30,
                        width: 30,
                        image: AssetImage('assets/images/icons8-chat-32.png'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    badges.Badge(
                      badgeContent: Text('9+'),
                      child: Image(
                          height: 30,
                          width: 30,
                          image: AssetImage(
                              'assets/images/icons8-bookmark-100.png')),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .23,
                  child: Image(
                    image: AssetImage(
                        'assets/images/Best-Way-to-Store-Fruit-at-Home-1.jpg'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          BlocBuilder<CategoryBloc, CategoryState>(
                              builder: (context, state) {
                            if (state is CategoryLoadProgressState) {
                              return CircularProgressIndicator();
                            } else if (state is CategoryLoadedSuccessState) {
                              return SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: state.categories.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        BlocProvider.of<ProductBloc>(context)
                                            .add(SelectCategoryToFilterProducts(
                                                categoryId: state
                                                    .categories[index].id!));
                                      },
                                      child: Container(
                                        color: Colors.black12,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 5.0),
                                        child: Text(
                                            state.categories[index].title!),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else if (state is CategoryFailureState) {
                              return Text("failure");
                            } else if (state is CategoryErrorState) {
                              return Text("error");
                            } else {
                              return Container();
                            }
                          }),
                          SizedBox(
                            height: 20,
                            child: Text('--------------------'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<ProductBloc, ProductState>(
                              builder: (context, state) {
                            if (state is ProductLoadProgressState) {
                              return CircularProgressIndicator();
                            } else if (state is ProducrLoadedSuccessState) {
                              return GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisExtent:
                                      MediaQuery.of(context).size.height * .40,
                                ),
                                itemCount: state.products.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3),
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 2,
                                      child: Column(
                                        children: [
                                          state.products[index].images!.isEmpty
                                              ? InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetailPage(
                                                                  product: state
                                                                          .products[
                                                                      index]),
                                                        ));
                                                  },
                                                  child: Image.asset(
                                                    'assets/images/defaultImages.png',
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .2,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .65,
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetailPage(
                                                                  product: state
                                                                          .products[
                                                                      index]),
                                                        ));
                                                  },
                                                  child: Hero(
                                                    tag: state.products[index]
                                                            .title! +
                                                        state.products[index].id
                                                            .toString(),
                                                    child: Image.network(
                                                      state.products[index]
                                                          .images![0].image!,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .2,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .65,
                                                    ),
                                                  ),
                                                ),
                                          // Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state
                                                        .products[index].title!,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                      state.products[index]
                                                          .price!
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.black)),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .star_border_outlined,
                                                        color: Colors.yellow,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              productselect ==
                                                      state.products[index].id!
                                                  ? BlocListener<VendorCartBloc,
                                                      VendorCartState>(
                                                      listener:
                                                          (context, state) {
                                                        // TODO: implement listener
                                                        if (state
                                                            is VendorCartLoadedState) {
                                                          setState(() {
                                                            productselect = 0;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            productselect = 0;

                                                          });
                                                          //وجب اضافة تنبيه ان هناك مشكلة
                                                        }
                                                      },
                                                      child: Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    )
                                                  : Center(
                                                      child: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            productselect =
                                                                state
                                                                    .products[
                                                                        index]
                                                                    .id!;
                                                          });
                                                          BlocProvider.of<
                                                                      VendorCartBloc>(
                                                                  context)
                                                              .add(VendorCartAddProductEvent(
                                                                  1,
                                                                  state
                                                                      .products[
                                                                          index]
                                                                      .id!));
                                                        },
                                                        icon: Icon(Icons
                                                            .add_shopping_cart),
                                                        color:
                                                            Colors.orange[900],
                                                      ),
                                                    )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (state is ProductFailureState) {
                              return Text("failure");
                            } else if (state is ProductErrorState) {
                              return Text("error");
                            } else {
                              return Container();
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
