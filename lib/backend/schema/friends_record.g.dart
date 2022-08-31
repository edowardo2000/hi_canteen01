// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FriendsRecord> _$friendsRecordSerializer =
    new _$FriendsRecordSerializer();

class _$FriendsRecordSerializer implements StructuredSerializer<FriendsRecord> {
  @override
  final Iterable<Type> types = const [FriendsRecord, _$FriendsRecord];
  @override
  final String wireName = 'FriendsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, FriendsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.friendName;
    if (value != null) {
      result
        ..add('friend_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.friendEmail;
    if (value != null) {
      result
        ..add('friend_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  FriendsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FriendsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'friend_name':
          result.friendName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'friend_email':
          result.friendEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$FriendsRecord extends FriendsRecord {
  @override
  final String friendName;
  @override
  final String friendEmail;
  @override
  final DocumentReference<Object> reference;

  factory _$FriendsRecord([void Function(FriendsRecordBuilder) updates]) =>
      (new FriendsRecordBuilder()..update(updates)).build();

  _$FriendsRecord._({this.friendName, this.friendEmail, this.reference})
      : super._();

  @override
  FriendsRecord rebuild(void Function(FriendsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FriendsRecordBuilder toBuilder() => new FriendsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FriendsRecord &&
        friendName == other.friendName &&
        friendEmail == other.friendEmail &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, friendName.hashCode), friendEmail.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FriendsRecord')
          ..add('friendName', friendName)
          ..add('friendEmail', friendEmail)
          ..add('reference', reference))
        .toString();
  }
}

class FriendsRecordBuilder
    implements Builder<FriendsRecord, FriendsRecordBuilder> {
  _$FriendsRecord _$v;

  String _friendName;
  String get friendName => _$this._friendName;
  set friendName(String friendName) => _$this._friendName = friendName;

  String _friendEmail;
  String get friendEmail => _$this._friendEmail;
  set friendEmail(String friendEmail) => _$this._friendEmail = friendEmail;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  FriendsRecordBuilder() {
    FriendsRecord._initializeBuilder(this);
  }

  FriendsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _friendName = $v.friendName;
      _friendEmail = $v.friendEmail;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FriendsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FriendsRecord;
  }

  @override
  void update(void Function(FriendsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FriendsRecord build() {
    final _$result = _$v ??
        new _$FriendsRecord._(
            friendName: friendName,
            friendEmail: friendEmail,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
