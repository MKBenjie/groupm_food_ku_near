import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ku_near_backend/blocs/blocs.dart';
import 'package:food_ku_near_backend/config/responsive.dart';
import 'package:food_ku_near_backend/models/models.dart';
import 'package:food_ku_near_backend/models/product_model.dart';

import '../widgets/widgets.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: CustomDrawer(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Restaurant Menu',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: Product.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                                product: Product.products[index], index: index);
                          }),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Responsive.isMobile(context) || Responsive.isTablet(context)
                        ? Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(children: [
                              _buildCategory(),
                              const SizedBox(
                                height: 20.0,
                              ),
                              _buildProduct(),
                            ]),
                          )
                        : Container(
                            constraints: const BoxConstraints(
                              minHeight: 300,
                              maxHeight: 1000,
                            ),
                            child: Row(children: [
                              Expanded(
                                child: _buildCategory(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: _buildProduct(),
                              ),
                            ]),
                          )
                  ],
                ),
              ),
            ),
          ),
          // Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
          //     ? Expanded(
          //         child: Container(
          //         margin: const EdgeInsets.only(
          //           top: 20,
          //           bottom: 20,
          //           right: 20,
          //         ),
          //         color: Colors.grey[300],
          //         child: const Center(
          //           child: Text('Some ads here'),
          //         ),
          //       ))
          //     : const SizedBox(),
        ],
      ),
    );
  }

  Container _buildCategory() {
    return Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.grey[300],
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Categories',
            style: TextStyle(fontSize: 20.0),
          ),
          BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orangeAccent,
                ),
              );
            }
            if (state is CategoryLoaded) {
              return ReorderableListView(
                  shrinkWrap: true,
                  children: [
                    for (int index = 0;
                        index < state.categories.length;
                        index++,)
                      CategoryListTile(
                        category: state.categories[index],
                        onTap: () {
                          context
                              .read<CategoryBloc>()
                              .add(SelectCategory(state.categories[index]));
                        },
                        key: ValueKey(state.categories[index].id),
                      )
                  ],
                  onReorder: (oldIndex, newIndex) {
                    context.read<CategoryBloc>().add(
                        SortCatrgories(oldIndex: oldIndex, newIndex: newIndex));
                  });
            } else {
              return Text('Something went wrong');
            }
          })
        ]));
  }

  Container _buildProduct() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product',
            style: TextStyle(fontSize: 20.0),
          ),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orangeAccent,
                ),
              );
            }
            if (state is ProductLoaded) {
              return ReorderableListView(
                  shrinkWrap: true,
                  children: [
                    for (int index = 0; index < state.products.length; index++,)
                      ProductListTile(
                        product: state.products[index],
                        onTap: () {},
                        key: ValueKey(state.products[index].id),
                      )
                  ],
                  onReorder: (oldIndex, newIndex) {
                    context.read<CategoryBloc>().add(
                        SortCatrgories(oldIndex: oldIndex, newIndex: newIndex));
                  });
            } else {
              return Text('Something went wrong');
            }
          })
          // ...Product.products.map((product) {
          //   return ProductListTile(product: product);
          // }).toList(),
        ],
      ),
    );
  }
}
