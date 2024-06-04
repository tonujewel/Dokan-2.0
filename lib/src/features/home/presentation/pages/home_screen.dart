import 'package:dokan/src/features/home/presentation/pages/widgets/filter_container.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';
import '../widgets/product_container.dart';
import '../widgets/title_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
          child: Column(
            children: [
              SizedBox(height: kHeight * 0.09),
              const TitleRow(),
              SizedBox(height: kHeight * 0.03),
              FilterContainer(
                onTap: () {},
              ),
              SizedBox(height: kHeight * 0.04),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.75,
                    crossAxisSpacing: kHeight * 0.02,
                    mainAxisSpacing: kHeight * 0.02,
                  ),
                  itemBuilder: (context, index) {
                    return const ProductContainer(
                      data: ProductEntity(
                        name: "name",
                        dateCreated: "dateCreated",
                        description: "description",
                        price: "price",
                        totalSales: "totalSales",
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
