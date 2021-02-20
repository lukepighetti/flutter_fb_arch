import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_models.freezed.dart';
part 'firebase_models.g.dart';

/// Public information about a user
@freezed
abstract class FBUserPublicInfo with _$FBUserPublicInfo {
  factory FBUserPublicInfo({
    @JsonKey(name: 'name') String displayName,
    @JsonKey(name: 'pronoun') IdentityPronoun pronouns,
    @JsonKey(name: 'theme') ThemeColor themeColor,
    @JsonKey(name: 'avatar') String avatarUrl,
  }) = _FBUserPublicInfo;

  factory FBUserPublicInfo.fromJson(Map<String, dynamic> json) =>
      _$FBUserPublicInfoFromJson(json);
}

/// Private information about a user
@freezed
abstract class FBUserPrivateInfo with _$FBUserPrivateInfo {
  factory FBUserPrivateInfo({
    @JsonKey(name: 'dob') DateTime dateOfBirth,
    @JsonKey(name: 'hand') AccessibilityHandedness handedness,
  }) = _FBUserPrivateInfo;

  factory FBUserPrivateInfo.fromJson(Map<String, dynamic> json) =>
      _$FBUserPrivateInfoFromJson(json);
}

/// The handedness of a person.
enum AccessibilityHandedness {
  /// This person likes to hold their phone with their right hand.
  rightHanded,

  /// This person likes to hold their phone with their left hand.
  leftHanded,

  /// This person will hold their phone with either hand.
  ///
  /// Typically defaults to [rightHanded] features.
  ambidextrious,
}

/// The pronouns of a person.
enum IdentityPronoun {
  /// `He` went to the park.
  /// I went with `him`.
  /// `He` brought `his` frisbee.
  /// At least I think it was `his`.
  /// `He` threw the frisbee to `himself`.
  heHim,

  /// `She` went to the park.
  /// I went with `her`.
  /// `She` brought `her` frisbee.
  /// At least I think it was `hers`.
  /// `She` threw the frisbee to `herself`.
  sheHer,

  /// `They` went to the park.
  /// I went with `them`.
  /// `They` brought `their` frisbee.
  /// At least I think it was `theirs`.
  /// `They` threw the frisbee to `themselves`.
  theyThem,
}

/// The colors that we can select from
enum ThemeColor {
  red,
  orange,
  green,
  blue,
  purple,
  pink,
}
