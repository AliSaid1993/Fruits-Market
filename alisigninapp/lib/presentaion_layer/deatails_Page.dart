import 'package:alisigninapp/models/product_model.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Icon(
                        Icons.share,
                        size: 30,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Badge(
                        badgeContent: Text('1'),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //           height: 5,
            //
            //        ),
            SizedBox(
              height: 5,
            ),
            widget.product.images!.isEmpty
                ? Image.asset(
                    'assets/images/defaultImages.png',
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width * .65,
                  )
                : Hero(
                    tag: widget.product.title! + widget.product.id.toString(),
                    child: Image.network(
                      widget.product.images![0].image!,
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .65,
                    ),
                  ),
            Row(
              children: [
                Icon(
                  Icons.on_device_training_sharp,
                  color: Colors.grey[900],
                ),
                Text(
                  'AsAsAs.id',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'best things for happy day',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange[900],
                ),
                Text(
                  '4.9 Ratings',
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Text(
                  '*',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Text(
                  '2.3k+ Reviews',
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                Text(
                  '*',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Text(
                  '2.9k+ Sold',
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: Colors.orange[100],
                  child: Text(
                    'About Item ',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Card(
                  color: Colors.orange[100],
                  child: Text(
                    'reviews ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        'ProductType',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'fruits',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'numInBox',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'TEN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      children: const [
                        Text('totalPrice'),
                        Text(
                          '\$12.00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
