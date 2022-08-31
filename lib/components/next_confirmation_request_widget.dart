import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextConfirmationRequestWidget extends StatefulWidget {
  const NextConfirmationRequestWidget({
    Key key,
    this.email,
    this.uid,
  }) : super(key: key);

  final String email;
  final String uid;

  @override
  _NextConfirmationRequestWidgetState createState() =>
      _NextConfirmationRequestWidgetState();
}

class _NextConfirmationRequestWidgetState
    extends State<NextConfirmationRequestWidget> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FFButtonWidget(
              onPressed: () async {
                final userUpdateData = {
                  ...createUserRecordData(
                    email: currentUserEmail,
                    displayName: currentUserDisplayName,
                    photoUrl: currentUserPhoto,
                    uid: currentUserUid,
                    createdTime: getCurrentTimestamp,
                    phoneNumber: currentPhoneNumber,
                    isCanteen:
                        valueOrDefault(currentUserDocument?.isCanteen, false),
                    userBalance:
                        valueOrDefault(currentUserDocument?.userBalance, 0.0),
                    numOrder: valueOrDefault(currentUserDocument?.numOrder, 0),
                  ),
                  'friendList': FieldValue.arrayUnion([widget.email]),
                };
                await currentUserReference.update(userUpdateData);
                Navigator.pop(context);
              },
              text: 'Accept',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                color: FlutterFlowTheme.of(context).tertiaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
        ),
      ),
    );
  }
}
