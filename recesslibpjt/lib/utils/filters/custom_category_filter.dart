import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recesslibpjt/bloc/filters/filters_bloc.dart';
import 'package:recesslibpjt/models/category_model.dart';

class CustomCategoryFilter extends StatelessWidget {
  
  const CustomCategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FiltersState>(builder: (context, state) {
      if (state is FiltersLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is FiltersLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.filter.categoryFilters.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.filter.categoryFilters[index].category.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                    child: Checkbox(
                        value: state.filter.categoryFilters[index].value,
                        onChanged: (bool? newValue) {
                          context.read<FilterBloc>().add(CategoryFilterUpdated(
                              categoryFilter:
                                  state.filter.categoryFilters[index].copyWith(
                                      value: !state.filter
                                          .categoryFilters[index].value)));
                        }),
                  ),
                ],
              ),
            );
          },
        );
      } else {
        return Text("Something went wrong");
      }
    });
  }
}
