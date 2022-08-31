import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustQRCodeWidget extends StatefulWidget {
  const CustQRCodeWidget({Key key}) : super(key: key);

  @override
  _CustQRCodeWidgetState createState() => _CustQRCodeWidgetState();
}

class _CustQRCodeWidgetState extends State<CustQRCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: Color(0xFFEEEEEE),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(
                thickness: 3,
                indent: 150,
                endIndent: 150,
                color: Color(0x8B8C8989),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: AuthUserStreamWidget(
                  child: Text(
                    'Barcode User: ${currentUserDisplayName}',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                child: custom_widgets.Qr(
                  width: 250,
                  height: 250,
                  data: currentUserUid,
                  size: 250.0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  semanticsLabel: 'This is QR Code for User ID',
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0x80F9CF6B),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                    child: Text(
                      'Use this QR Code to make it easier for canteen staff to read user data.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            fontSize: 13,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
