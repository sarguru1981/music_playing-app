import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  final String id;
  final String? email;
  final String? displayName;

  const UserModel({
    required this.id,
    this.email,
    this.displayName,
  });

  /// Empty user which represents an unauthenticated user.
  static const empty = UserModel(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == UserModel.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [email, id, displayName];
}