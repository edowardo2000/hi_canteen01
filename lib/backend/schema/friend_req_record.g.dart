// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_req_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FriendReqRecord> _$friendReqRecordSerializer =
    new _$FriendReqRecordSerializer();

class _$FriendReqRecordSerializer
    implements StructuredSerializer<FriendReqRecord> {
  @override
  final Iterable<Type> types = const [FriendReqRecord, _$FriendReqRecord];
  @override
  final String wireName = 'FriendReqRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, FriendReqRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailAcc;
    if (value != null) {
      result
        ..add('emailAcc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailReq;
    if (value != null) {
      result
        ..add('emailReq')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accReq;
    if (value != null) {
      result
        ..add('accReq')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.reqReq;
    if (value != null) {
      result
        ..add('reqReq')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.rejReq;
    if (value != null) {
      result
        ..add('rejReq')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.nameReq;
    if (value != null) {
      result
        ..add('nameReq')
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
  FriendReqRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FriendReqRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'emailAcc':
          result.emailAcc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'emailReq':
          result.emailReq = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accReq':
          result.accReq = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'reqReq':
          result.reqReq = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'rejReq':
          result.rejReq = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'nameReq':
          result.nameReq = serializers.deserialize(value,
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

class _$FriendReqRecord extends FriendReqRecord {
  @override
  final String uid;
  @override
  final String emailAcc;
  @override
  final String emailReq;
  @override
  final bool accReq;
  @override
  final bool reqReq;
  @override
  final bool rejReq;
  @override
  final DateTime timestamp;
  @override
  final String nameReq;
  @override
  final DocumentReference<Object> reference;

  factory _$FriendReqRecord([void Function(FriendReqRecordBuilder) updates]) =>
      (new FriendReqRecordBuilder()..update(updates)).build();

  _$FriendReqRecord._(
      {this.uid,
      this.emailAcc,
      this.emailReq,
      this.accReq,
      this.reqReq,
      this.rejReq,
      this.timestamp,
      this.nameReq,
      this.reference})
      : super._();

  @override
  FriendReqRecord rebuild(void Function(FriendReqRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FriendReqRecordBuilder toBuilder() =>
      new FriendReqRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FriendReqRecord &&
        uid == other.uid &&
        emailAcc == other.emailAcc &&
        emailReq == other.emailReq &&
        accReq == other.accReq &&
        reqReq == other.reqReq &&
        rejReq == other.rejReq &&
        timestamp == other.timestamp &&
        nameReq == other.nameReq &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, uid.hashCode), emailAcc.hashCode),
                                emailReq.hashCode),
                            accReq.hashCode),
                        reqReq.hashCode),
                    rejReq.hashCode),
                timestamp.hashCode),
            nameReq.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FriendReqRecord')
          ..add('uid', uid)
          ..add('emailAcc', emailAcc)
          ..add('emailReq', emailReq)
          ..add('accReq', accReq)
          ..add('reqReq', reqReq)
          ..add('rejReq', rejReq)
          ..add('timestamp', timestamp)
          ..add('nameReq', nameReq)
          ..add('reference', reference))
        .toString();
  }
}

class FriendReqRecordBuilder
    implements Builder<FriendReqRecord, FriendReqRecordBuilder> {
  _$FriendReqRecord _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _emailAcc;
  String get emailAcc => _$this._emailAcc;
  set emailAcc(String emailAcc) => _$this._emailAcc = emailAcc;

  String _emailReq;
  String get emailReq => _$this._emailReq;
  set emailReq(String emailReq) => _$this._emailReq = emailReq;

  bool _accReq;
  bool get accReq => _$this._accReq;
  set accReq(bool accReq) => _$this._accReq = accReq;

  bool _reqReq;
  bool get reqReq => _$this._reqReq;
  set reqReq(bool reqReq) => _$this._reqReq = reqReq;

  bool _rejReq;
  bool get rejReq => _$this._rejReq;
  set rejReq(bool rejReq) => _$this._rejReq = rejReq;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  String _nameReq;
  String get nameReq => _$this._nameReq;
  set nameReq(String nameReq) => _$this._nameReq = nameReq;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  FriendReqRecordBuilder() {
    FriendReqRecord._initializeBuilder(this);
  }

  FriendReqRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _emailAcc = $v.emailAcc;
      _emailReq = $v.emailReq;
      _accReq = $v.accReq;
      _reqReq = $v.reqReq;
      _rejReq = $v.rejReq;
      _timestamp = $v.timestamp;
      _nameReq = $v.nameReq;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FriendReqRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FriendReqRecord;
  }

  @override
  void update(void Function(FriendReqRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FriendReqRecord build() {
    final _$result = _$v ??
        new _$FriendReqRecord._(
            uid: uid,
            emailAcc: emailAcc,
            emailReq: emailReq,
            accReq: accReq,
            reqReq: reqReq,
            rejReq: rejReq,
            timestamp: timestamp,
            nameReq: nameReq,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
