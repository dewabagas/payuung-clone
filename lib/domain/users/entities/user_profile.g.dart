// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      name: json['name'] as String?,
      birthDate: json['birthDate'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      education: json['education'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      ktpPhoto: json['ktpPhoto'] as String?,
      nik: json['nik'] as String?,
      address: json['address'] as String?,
      province: json['province'] as String?,
      city: json['city'] as String?,
      subDistrict: json['subDistrict'] as String?,
      village: json['village'] as String?,
      postalCode: json['postalCode'] as String?,
      businessName: json['businessName'] as String?,
      businessAddress: json['businessAddress'] as String?,
      jobPosition: json['jobPosition'] as String?,
      workDuration: json['workDuration'] as String?,
      incomeSource: json['incomeSource'] as String?,
      annualGrossIncome: (json['annualGrossIncome'] as num?)?.toDouble(),
      bankName: json['bankName'] as String?,
      bankBranch: json['bankBranch'] as String?,
      accountNumber: json['accountNumber'] as String?,
      accountHolderName: json['accountHolderName'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'education': instance.education,
      'maritalStatus': instance.maritalStatus,
      'ktpPhoto': instance.ktpPhoto,
      'nik': instance.nik,
      'address': instance.address,
      'province': instance.province,
      'city': instance.city,
      'subDistrict': instance.subDistrict,
      'village': instance.village,
      'postalCode': instance.postalCode,
      'businessName': instance.businessName,
      'businessAddress': instance.businessAddress,
      'jobPosition': instance.jobPosition,
      'workDuration': instance.workDuration,
      'incomeSource': instance.incomeSource,
      'annualGrossIncome': instance.annualGrossIncome,
      'bankName': instance.bankName,
      'bankBranch': instance.bankBranch,
      'accountNumber': instance.accountNumber,
      'accountHolderName': instance.accountHolderName,
    };
