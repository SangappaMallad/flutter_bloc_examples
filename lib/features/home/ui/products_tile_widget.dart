import 'package:bloc_api_examples/features/home/bloc/home_bloc.dart';
import 'package:bloc_api_examples/features/home/models/home_products_data_model.dart';
import 'package:flutter/material.dart';

class ProductsTileWidget extends StatelessWidget {
  final ProductsDataModel productsDataModel;
  final HomeBloc homeBloc;
  const ProductsTileWidget(
      {super.key, required this.productsDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productsDataModel.imagUrl),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productsDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productsDataModel.description),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + productsDataModel.price.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductsWishlistButtonClickedEvent(
                            clickedProducts: productsDataModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductsCartButtonClickedEvent(
                            clickedProducts: productsDataModel));
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
