import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/product_container.dart';
import '../widgets/title_row.dart';
import '../widgets/filter_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GerProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: BlocBuilder<HomeBloc, HomeLoadedState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
            child: Column(
              children: [
                SizedBox(height: kHeight * 0.06),
                const TitleRow(),
                SizedBox(height: kHeight * 0.03),
                StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                  return FilterContainer(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const FilterBottomSheet();
                        },
                      );
                    },
                  );
                }),

                SizedBox(height: kHeight * 0.04),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(bottom: 40),
                    shrinkWrap: true,
                    itemCount: state.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.75,
                      crossAxisSpacing: kHeight * 0.02,
                      mainAxisSpacing: kHeight * 0.02,
                    ),
                    itemBuilder: (context, index) {
                      return ProductContainer(
                        data: state.products[index],
                      );
                    },
                  ),
                ),
                // const VerticalMargin(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}
