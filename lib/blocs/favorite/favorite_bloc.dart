import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/repository/favorite_repository.dart';
import 'package:medify/utils/constants/storage_keys.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({required this.favoriteRepository}) : super(const FavoriteState(message: "")) {
    on<GetFavorite>(getFavorite);
    add(GetFavorite());
  }

  final FavoriteRepository favoriteRepository;

  Future<void> getFavorite(GetFavorite event, Emitter<FavoriteState> emit) async{
    // emit(state.copyWith(status: FormStatus.loading, statusText: 'Loading...'));
    UniversalData response = await favoriteRepository.getAllFavoriteDoctors(token: StorageRepository.getString(StorageKeys.userToken));
    emit(
      state.copyWith(
        message: response.error,
      ),
    );
  }

}