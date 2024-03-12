part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.password = '',
    this.email = '',
    this.phoneNumber = '',
    this.status = FormStatus.pure,
    this.statusMessage = "",
  });

  final String phoneNumber;
  final String email;
  final String password;
  final FormStatus status;
  final String statusMessage;

  AuthState copyWith({
    String? phoneNumber,
    String? email,
    String? statusMessage,
    String? password,
    FormStatus? status,
  }) =>
      AuthState(
        password: password ?? this.password,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
      );

  @override
  String toString() {
    return '''
    Username: $password
    Email: $email
    PhoneNumber:$phoneNumber
    Status:$status
    ''';
  }

  @override
  List<Object?> get props => [
    phoneNumber,
    email,
    password,
    status,
    statusMessage,
  ];
}