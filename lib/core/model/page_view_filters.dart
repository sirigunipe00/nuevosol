import 'package:equatable/equatable.dart';

class PageViewFilters extends Equatable {
  factory PageViewFilters.initial() =>
      const PageViewFilters(status: 'Draft');

  const PageViewFilters({
    required this.status,
    this.query,
    this.department,
  });

  final String status;
  final String? query;
  final String? department;

  @override
  List<Object?> get props => [
        status,
        query,
        department,
      ];

  PageViewFilters copyWith({
    String? status,
    String? query,
    String? department,
  }) =>
      PageViewFilters(
        status: status ?? this.status,
        query: query ?? this.query,
        department: department ?? this.department,
      );
}