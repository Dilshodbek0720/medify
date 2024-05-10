part of 'favorite_bloc.dart';

@immutable

class FavoriteState extends Equatable {
  final String message;

  const FavoriteState(
      {required this.message});

  FavoriteState copyWith({
    String? message,
  }) {
    return FavoriteState(
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [message];
}