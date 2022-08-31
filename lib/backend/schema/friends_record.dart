import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'friends_record.g.dart';

abstract class FriendsRecord
    implements Built<FriendsRecord, FriendsRecordBuilder> {
  static Serializer<FriendsRecord> get serializer => _$friendsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'friend_name')
  String get friendName;

  @nullable
  @BuiltValueField(wireName: 'friend_email')
  String get friendEmail;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FriendsRecordBuilder builder) => builder
    ..friendName = ''
    ..friendEmail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friends');

  static Stream<FriendsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<FriendsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  FriendsRecord._();
  factory FriendsRecord([void Function(FriendsRecordBuilder) updates]) =
      _$FriendsRecord;

  static FriendsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createFriendsRecordData({
  String friendName,
  String friendEmail,
}) =>
    serializers.toFirestore(
        FriendsRecord.serializer,
        FriendsRecord((f) => f
          ..friendName = friendName
          ..friendEmail = friendEmail));
