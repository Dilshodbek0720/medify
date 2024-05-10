part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class UpdateFavorite extends FavoriteEvent{

  UpdateFavorite();
}
class GetFavorite extends FavoriteEvent{}