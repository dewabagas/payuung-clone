import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    String? name,
    String? birthDate,
    String? gender,
    String? email,
    String? phoneNumber,
    String? education,
    String? maritalStatus,
    String? ktpPhoto,
    String? nik,
    String? address,
    String? province,
    String? city,
    String? subDistrict,
    String? village,
    String? postalCode,
    String? businessName,
    String? businessAddress,
    String? jobPosition,
    String? workDuration,
    String? incomeSource,
    double? annualGrossIncome,
    String? bankName,
    String? bankBranch,
    String? accountNumber,
    String? accountHolderName,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
