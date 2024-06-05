import 'package:equatable/equatable.dart';

class FilterDm extends Equatable {
  final String name;
  final bool isSelected;

  const FilterDm({
    required this.name,
    required this.isSelected,
  });

  FilterDm copyWith({
    String? name,
    bool? isSelected,
  }) {
    return FilterDm(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object> get props => [name, isSelected];
}
