import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medify/cubits/sign_cubit/sign_cubit.dart';
import 'package:medify/data/models/location/location_model.dart';
import 'package:medify/data/models/status/form_status.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/repository/auth_repository.dart';
import 'package:medify/utils/ui_utils/loading_dialog.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState());

  final AuthRepository authRepository;

  Future<UniversalData> signUp({required BuildContext context, required String verificationType}) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.signUp(
      email: context.read<SignUpCubit>().state.emailController.text,
      password: context.read<SignUpCubit>().state.passwordController.text,
      phoneNumber: context.read<SignUpCubit>().state.phoneController.text,
      verificationType: verificationType,
    );
    if(context.mounted){
      hideLoading(context: context);
    }
    if (data.error.isEmpty) {
      emit(state.copyWith(status: FormStatus.authenticated));
      return data;
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
      return UniversalData(error: "Failed");
    }
    // emit(state.copyWith(status: FormStatus.pure));
  }

  Future<UniversalData> login({required BuildContext context, required String email, required String password}) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    print(context.read<SignUpCubit>().state.emailController.text);
    UniversalData data = await authRepository.login(
      email: context.read<SignUpCubit>().state.emailController.text,
      password: context.read<SignUpCubit>().state.passwordController.text
    );
    if(context.mounted){
      hideLoading(context: context);
    }
    if (data.error.isEmpty) {
      emit(state.copyWith(status: FormStatus.authenticated));
      return data;
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
      return UniversalData(error: "Failed");
    }
    // emit(state.copyWith(status: FormStatus.pure));
  }

  Future<UniversalData> resendVerificationToken({required BuildContext context, required String verificationMethod, required String token}) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.resendVerificationToken(
      token: token,
      verificationMethod: verificationMethod,
    );
    if(context.mounted){
      hideLoading(context: context);
    }
    if (data.error.isEmpty) {
      return data;
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
      return UniversalData(error: "Failed");
    }
  }


  Future<UniversalData> userAccountVerify({required BuildContext context, required int verificationToken, required String token}) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.userAccountVerify(
      token: token,
      verificationToken: verificationToken,
    );
    if(context.mounted){
      hideLoading(context: context);
    }
    if (data.error.isEmpty) {
      return data;
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
      return UniversalData(error: "Failed");
    }
  }

  Future<UniversalData> completeRegistration({required BuildContext context, required String token, required String firstName, required String lastName, required String phoneNumber, required String birthDay, required String gender, required XFile file}) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.completeRegistration(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      birthDay: birthDay,
      gender: gender,
      token: token,
      file: file
    );
    if(context.mounted){
      hideLoading(context: context);
    }
    if (data.error.isEmpty) {
      return data;
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
      return UniversalData(error: "Failed");
    }
  }

  Future<UniversalData> updateLocation({required BuildContext context, required UserLocationModel userLocationModel, required String token}) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.updateLocation(
      token: token,
      userLocationModel: userLocationModel,
    );
    if(context.mounted){
      hideLoading(context: context);
    }
    if (data.error.isEmpty) {
      return data;
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
      return UniversalData(error: "Failed");
    }
  }

  Future<UniversalData> verifyCreditCard({required BuildContext context, required int verificationToken, required String token}) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.verifyCreditCard(
      token: token,
      verificationToken: verificationToken,
    );
    if(context.mounted){
      hideLoading(context: context);
    }
    if (data.error.isEmpty) {
      return data;
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
      return UniversalData(error: "Failed");
    }
  }
}
