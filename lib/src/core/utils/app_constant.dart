import '../../features/home/domain/entities/filter_dm.dart';

class AppConstant {
  static final List<FilterDm> filterItems = [
    const FilterDm(name: 'Newest', isSelected: true),
    const FilterDm(name: 'Oldest', isSelected: false),
    const FilterDm(name: 'Price low > High', isSelected: false),
    const FilterDm(name: 'Price high > Low', isSelected: false),
    const FilterDm(name: 'Best selling', isSelected: false),
  ];
}
