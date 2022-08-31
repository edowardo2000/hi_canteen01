import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double totalPrice(
  double price,
  int stock,
) {
  // Add your function code here!
  assert(stock > 0);
  return (stock * price);
}

double balanceTopup(
  double balanceCurrent,
  double balanceAdd,
) {
  // Add your function code here!
  return balanceCurrent + balanceAdd;
}

double balanceDeduct(
  double balanceCurrent,
  double balanceMinus,
) {
  // Add your function code here!
  return balanceCurrent - balanceMinus;
}

int stockDeduct(
  int stockFood,
  int stockOrder,
) {
  // Add your function code here!
  return stockFood - stockOrder;
}

int orderPlus(int currentOrder) {
  // Add your function code here!
  return currentOrder + 1;
}

double splitBill(
  double oriPrice,
  int oriPeople,
) {
  // Add your function code here!
  return oriPrice / oriPeople;
}
