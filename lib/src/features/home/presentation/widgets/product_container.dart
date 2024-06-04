import 'package:dokan/src/features/home/domain/entities/product_entity.dart';
import 'package:dokan/src/features/home/presentation/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.data});

  final ProductEntity data;

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x1a395ab8),
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Container(
              color: const Color(0xFFD8EAEC),
              height: kHeight * 0.2,
              width: kWidth,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "",
                placeholder: (context, url) => const ImageLoader(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: kHeight * 0.01),
          Padding(
            padding: EdgeInsets.only(left: kWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kHeight * 0.055,
                  child: Text(
                    data.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16, fontFamily: 'Roboto'),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$ ${data.price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xFF000000), fontFamily: 'Roboto'),
                    ),
                    SizedBox(width: kWidth * 0.04),
                    Visibility(
                      visible: true,
                      child: Text(
                        '\$ ${data.price}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF989FA8),
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: kHeight * 0.01),
                RatingBarIndicator(
                  rating: double.parse("${4}"),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
