// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodRecord> _$foodRecordSerializer = new _$FoodRecordSerializer();

class _$FoodRecordSerializer implements StructuredSerializer<FoodRecord> {
  @override
  final Iterable<Type> types = const [FoodRecord, _$FoodRecord];
  @override
  final String wireName = 'FoodRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, FoodRecord object,
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
    value = object.foodName;
    if (value != null) {
      result
        ..add('food_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foodPrice;
    if (value != null) {
      result
        ..add('food_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foodStock;
    if (value != null) {
      result
        ..add('food_stock')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uidUser;
    if (value != null) {
      result
        ..add('uid_user')
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
  FoodRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodRecordBuilder();

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
        case 'food_name':
          result.foodName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'food_price':
          result.foodPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'food_stock':
          result.foodStock = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid_user':
          result.uidUser = serializers.deserialize(value,
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

class _$FoodRecord extends FoodRecord {
  @override
  final String uid;
  @override
  final String foodName;
  @override
  final double foodPrice;
  @override
  final String photo;
  @override
  final String description;
  @override
  final int foodStock;
  @override
  final String category;
  @override
  final String uidUser;
  @override
  final DocumentReference<Object> reference;

  factory _$FoodRecord([void Function(FoodRecordBuilder) updates]) =>
      (new FoodRecordBuilder()..update(updates)).build();

  _$FoodRecord._(
      {this.uid,
      this.foodName,
      this.foodPrice,
      this.photo,
      this.description,
      this.foodStock,
      this.category,
      this.uidUser,
      this.reference})
      : super._();

  @override
  FoodRecord rebuild(void Function(FoodRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodRecordBuilder toBuilder() => new FoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodRecord &&
        uid == other.uid &&
        foodName == other.foodName &&
        foodPrice == other.foodPrice &&
        photo == other.photo &&
        description == other.description &&
        foodStock == other.foodStock &&
        category == other.category &&
        uidUser == other.uidUser &&
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
                            $jc($jc($jc(0, uid.hashCode), foodName.hashCode),
                                foodPrice.hashCode),
                            photo.hashCode),
                        description.hashCode),
                    foodStock.hashCode),
                category.hashCode),
            uidUser.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodRecord')
          ..add('uid', uid)
          ..add('foodName', foodName)
          ..add('foodPrice', foodPrice)
          ..add('photo', photo)
          ..add('description', description)
          ..add('foodStock', foodStock)
          ..add('category', category)
          ..add('uidUser', uidUser)
          ..add('reference', reference))
        .toString();
  }
}

class FoodRecordBuilder implements Builder<FoodRecord, FoodRecordBuilder> {
  _$FoodRecord _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _foodName;
  String get foodName => _$this._foodName;
  set foodName(String foodName) => _$this._foodName = foodName;

  double _foodPrice;
  double get foodPrice => _$this._foodPrice;
  set foodPrice(double foodPrice) => _$this._foodPrice = foodPrice;

  String _photo;
  String get photo => _$this._photo;
  set photo(String photo) => _$this._photo = photo;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _foodStock;
  int get foodStock => _$this._foodStock;
  set foodStock(int foodStock) => _$this._foodStock = foodStock;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _uidUser;
  String get uidUser => _$this._uidUser;
  set uidUser(String uidUser) => _$this._uidUser = uidUser;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  FoodRecordBuilder() {
    FoodRecord._initializeBuilder(this);
  }

  FoodRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _foodName = $v.foodName;
      _foodPrice = $v.foodPrice;
      _photo = $v.photo;
      _description = $v.description;
      _foodStock = $v.foodStock;
      _category = $v.category;
      _uidUser = $v.uidUser;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FoodRecord;
  }

  @override
  void update(void Function(FoodRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodRecord build() {
    final _$result = _$v ??
        new _$FoodRecord._(
            uid: uid,
            foodName: foodName,
            foodPrice: foodPrice,
            photo: photo,
            description: description,
            foodStock: foodStock,
            category: category,
            uidUser: uidUser,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
