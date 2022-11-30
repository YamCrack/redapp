import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'user_model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class UserModel {
  UserModel(
      {this.id,
      this.code,
      this.firstName,
      this.lastName,
      this.email,
      this.role,
      this.status,
      this.phone,
      this.taxId,
      this.signedFrom,
      this.lastPurchaseAt,
      this.countPurchases,
      this.lastLoginAt,
      this.defaultPrice});

  String? id;
  String? code;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? status;
  String? phone;
  String? taxId;
  String? signedFrom;
  String? lastPurchaseAt;
  String? countPurchases;
  String? lastLoginAt;
  String? defaultPrice;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
