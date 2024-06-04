import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: kHeight * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x1a395ab8),
              offset: Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: kWidth * 0.05),
            SvgPicture.asset('assets/svg/filter.svg'),
            SizedBox(width: kWidth * 0.03),
            const Text(
              'Filter',
              style: TextStyle(fontSize: 16, fontFamily: 'Roboto', color: Color(0xFF818995), fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            const Text(
              'Sort by',
              style: TextStyle(fontSize: 16, fontFamily: 'Roboto', color: Color(0xFF818995), fontWeight: FontWeight.w400),
            ),
            SizedBox(width: kWidth * 0.02),
            SvgPicture.asset('assets/svg/down.svg'),
            SizedBox(width: kWidth * 0.07),
            SvgPicture.asset('assets/svg/menu.svg'),
            SizedBox(width: kWidth * 0.03),
          ],
        ),
      ),
    );
  }
}
