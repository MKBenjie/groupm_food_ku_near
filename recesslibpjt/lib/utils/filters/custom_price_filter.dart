import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recesslibpjt/bloc/filters/filters_bloc.dart';
// import 'package:recesslibpjt/models/price_model.dart';
// import 'package:bloc/bloc.dart';
// import 'package:recesslibpjt/models/price_model.dart';

class CustomPriceFilter extends StatelessWidget {
  // final List<Price> prices;
  const CustomPriceFilter({super.key, /*required this.prices*/});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FiltersState>(builder: (context, state) {
      if (state is FiltersLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is FiltersLoaded) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: state.filter.priceFilters
              .asMap()
              .entries
              .map(
                (price) => InkWell(
                  onTap: () {
                    context.read<FilterBloc>().add(PriceFilterUpdated(
                          priceFilter: state.filter.priceFilters[price.key]
                              .copyWith(
                                  value: !state
                                      .filter.priceFilters[price.key].value),
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                        color: state.filter.priceFilters[price.key].value
                            ? Colors.red[100]
                            : Colors.white,
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      state.filter.priceFilters[price.key].price.price,
                      // Price.prices.toString(),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      } else {
        return
            // Container(
            // padding: EdgeInsets.all(10.0),
            // child:
            Text('Something went wrong.')
            // )
            ;
      }
    });
  }
}
