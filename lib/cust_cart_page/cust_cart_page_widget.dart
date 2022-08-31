import '../all_home_page/all_home_page_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../cust_change_address_page/cust_change_address_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustCartPageWidget extends StatefulWidget {
  const CustCartPageWidget({
    Key key,
    this.uidFood,
    this.notes,
    this.foodPrice,
    this.totalStock,
    this.image,
    this.foodName,
    this.uidCanteen,
  }) : super(key: key);

  final String uidFood;
  final String notes;
  final double foodPrice;
  final int totalStock;
  final String image;
  final String foodName;
  final String uidCanteen;

  @override
  _CustCartPageWidgetState createState() => _CustCartPageWidgetState();
}

class _CustCartPageWidgetState extends State<CustCartPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF994B),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Cart',
          style: FlutterFlowTheme.of(context).subtitle1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 30),
                child: StreamBuilder<List<CustomerRecord>>(
                  stream: queryCustomerRecord(
                    queryBuilder: (customerRecord) =>
                        customerRecord.where('uid', isEqualTo: currentUserUid),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<CustomerRecord> rowCustomerRecordList = snapshot.data;
                    final rowCustomerRecord = rowCustomerRecordList.isNotEmpty
                        ? rowCustomerRecordList.first
                        : null;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Address',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Text(
                                  rowCustomerRecord.custLocation,
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 50,
                          icon: Icon(
                            Icons.edit_rounded,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CustChangeAddressPageWidget(),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              FutureBuilder<List<FoodRecord>>(
                future: queryFoodRecordOnce(
                  queryBuilder: (foodRecord) =>
                      foodRecord.where('uid', isEqualTo: widget.uidFood),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<FoodRecord> cardFoodRecordList = snapshot.data;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data.isEmpty) {
                    return Container();
                  }
                  final cardFoodRecord = cardFoodRecordList.isNotEmpty
                      ? cardFoodRecordList.first
                      : null;
                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFF5F5F5),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.network(
                            valueOrDefault<String>(
                              cardFoodRecord.photo,
                              'https://tse1.mm.bing.net/th?id=OIP.q7GO6j_hjpfE1ePnqukeIwHaFo&pid=Api&P=0&w=210&h=160',
                            ),
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cardFoodRecord.foodName,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Text(
                                    'Quantity:${widget.totalStock.toString()}',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Text(
                                    'Notes: ${widget.notes}',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 60),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FutureBuilder<List<UserRecord>>(
                        future: queryUserRecordOnce(
                          queryBuilder: (userRecord) => userRecord.where('uid',
                              isEqualTo: widget.uidCanteen),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<UserRecord> columnUserRecordList = snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final columnUserRecord =
                              columnUserRecordList.isNotEmpty
                                  ? columnUserRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 0, 25, 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                    Text(
                                      'RM ${widget.foodPrice.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                  ],
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  final orderCreateData = createOrderRecordData(
                                    uid: random_data.randomString(
                                      10,
                                      10,
                                      true,
                                      true,
                                      true,
                                    ),
                                    timeorder: getCurrentTimestamp,
                                    statusorder: 'Order',
                                    customername: currentUserDisplayName,
                                    pricefood: widget.foodPrice,
                                    uidCust: currentUserUid,
                                    uidFood: widget.uidFood,
                                    notes: widget.notes,
                                    namefood: widget.foodName,
                                    photofood: widget.image,
                                    stock: widget.totalStock,
                                    uidCanteen: widget.uidCanteen,
                                  );
                                  await OrderRecord.collection
                                      .doc()
                                      .set(orderCreateData);

                                  final userUpdateData = createUserRecordData(
                                    email: currentUserEmail,
                                    displayName: currentUserDisplayName,
                                    photoUrl: currentUserPhoto,
                                    uid: currentUserUid,
                                    createdTime: getCurrentTimestamp,
                                    phoneNumber: currentPhoneNumber,
                                    userBalance: functions.balanceDeduct(
                                        valueOrDefault(
                                            currentUserDocument?.userBalance,
                                            0.0),
                                        widget.foodPrice),
                                    isCanteen: valueOrDefault(
                                        currentUserDocument?.isCanteen, false),
                                  );
                                  await currentUserReference
                                      .update(userUpdateData);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllHomePageWidget(),
                                    ),
                                  );
                                },
                                text: 'Pay Now',
                                options: FFButtonOptions(
                                  width: 310,
                                  height: 40,
                                  color: Color(0xFFFF994B),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
