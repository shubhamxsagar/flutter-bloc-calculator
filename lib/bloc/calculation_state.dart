part of 'calculation_bloc.dart';

sealed class CalculationState extends Equatable {
  const CalculationState();
  
  @override
  List<Object> get props => [];
}

final class CalculationInitial extends CalculationState {}
