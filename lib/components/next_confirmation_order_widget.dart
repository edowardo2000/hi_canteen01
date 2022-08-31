import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextConfirmationOrderWidget extends StatefulWidget {
  const NextConfirmationOrderWidget({
    Key key,
    this.uid,
  }) : super(key: key);

  final String uid;

  @override
  _NextConfirmationOrderWidgetState createState() =>
      _NextConfirmationOrderWidgetState();
}

class _NextConfirmationOrderWidgetState
    extends State<NextConfirmationOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrderRecord>>(
      future: queryOrderRecordOnce(
        queryBuilder: (orderRecord) =>
            orderRecord.where('uid', isEqualTo: widget.uid),
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
        List<OrderRecord> containerOrderRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final containerOrderRecord = containerOrderRecordList.isNotEmpty
            ? containerOrderRecordList.first
            : null;
        return Container(
          width: double.infinity,
          height: 280,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3B1D2429),
                offset: Offset(0, -3),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: FutureBuilder<List<FoodRecord>>(
              future: queryFoodRecordOnce(
                queryBuilder: (foodRecord) => foodRecord.where('uid',
                    isEqualTo: containerOrderRecord.uidFood),
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
                List<FoodRecord> columnFoodRecordList = snapshot.data;
                final columnFoodRecord = columnFoodRecordList.isNotEmpty
                    ? columnFoodRecordList.first
                    : null;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        final orderUpdateData = createOrderRecordData(
                          uid: containerOrderRecord.uid,
                          timeorder: getCurrentTimestamp,
                          statusorder: 'Done',
                          customername: containerOrderRecord.customername,
                          namefood: containerOrderRecord.namefood,
                          photofood: containerOrderRecord.photofood,
                          pricefood: containerOrderRecord.pricefood,
                          uidCust: containerOrderRecord.uidCust,
                          uidFood: containerOrderRecord.uidFood,
                          uidCanteen: containerOrderRecord.uidCanteen,
                          notes: containerOrderRecord.notes,
                          stock: containerOrderRecord.stock,
                        );
                        await containerOrderRecord.reference
                            .update(orderUpdateData);

                        final userUpdateData = {
                          ...createUserRecordData(
                            email: currentUserEmail,
                            displayName: currentUserDisplayName,
                            photoUrl: currentUserPhoto,
                            uid: currentUserUid,
                            createdTime: getCurrentTimestamp,
                            phoneNumber: currentPhoneNumber,
                            isCanteen: valueOrDefault(
                                currentUserDocument?.isCanteen, false),
                            userBalance: functions.balanceTopup(
                                valueOrDefault(
                                    currentUserDocument?.userBalance, 0.0),
                                containerOrderRecord.pricefood),
                          ),
                          'numOrder': FieldValue.increment(1),
                        };
                        await currentUserReference.update(userUpdateData);

                        final foodUpdateData = createFoodRecordData(
                          uid: columnFoodRecord.uid,
                          foodName: columnFoodRecord.foodName,
                          foodPrice: columnFoodRecord.foodPrice,
                          photo: columnFoodRecord.photo,
                          description: columnFoodRecord.description,
                          foodStock: functions.stockDeduct(
                              columnFoodRecord.foodStock,
                              containerOrderRecord.stock),
                          category: columnFoodRecord.category,
                          uidUser: columnFoodRecord.uidUser,
                        );
                        await columnFoodRecord.reference.update(foodUpdateData);
                        Navigator.pop(context);
                      },
                      text: 'Done',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: FutureBuilder<List<UserRecord>>(
                        future: queryUserRecordOnce(
                          queryBuilder: (userRecord) => userRecord.where('uid',
                              isEqualTo: containerOrderRecord.uid),
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
                          List<UserRecord> buttonUserRecordList = snapshot.data;
                          final buttonUserRecord =
                              buttonUserRecordList.isNotEmpty
                                  ? buttonUserRecordList.first
                                  : null;
                          return FFButtonWidget(
                            onPressed: () async {
                              final orderUpdateData = createOrderRecordData(
                                uid: columnFoodRecord.uid,
                                timeorder: getCurrentTimestamp,
                                statusorder: 'Cancel',
                                customername: containerOrderRecord.customername,
                                namefood: containerOrderRecord.namefood,
                                photofood: containerOrderRecord.photofood,
                                pricefood: containerOrderRecord.pricefood,
                                uidCust: containerOrderRecord.uidCust,
                                uidFood: containerOrderRecord.uidFood,
                                uidCanteen: containerOrderRecord.uidCanteen,
                                notes: containerOrderRecord.notes,
                                stock: containerOrderRecord.stock,
                              );
                              await containerOrderRecord.reference
                                  .update(orderUpdateData);

                              final userUpdateData = createUserRecordData(
                                email: currentUserEmail,
                                displayName: currentUserDisplayName,
                                photoUrl: currentUserPhoto,
                                uid: currentUserUid,
                                createdTime: getCurrentTimestamp,
                                phoneNumber: currentPhoneNumber,
                                isCanteen: valueOrDefault(
                                    currentUserDocument?.isCanteen, false),
                                userBalance: functions.balanceTopup(
                                    buttonUserRecord.userBalance,
                                    containerOrderRecord.pricefood),
                              );
                              await buttonUserRecord.reference
                                  .update(userUpdateData);
                              Navigator.pop(context);
                            },
                            text: 'Cancel Order',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60,
                              color: Color(0xFFFF5963),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Return',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context).subtitle2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
