import '../all_signin_page/all_signin_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustVerificationSentEmailWidget extends StatefulWidget {
  const CustVerificationSentEmailWidget({Key key}) : super(key: key);

  @override
  _CustVerificationSentEmailWidgetState createState() =>
      _CustVerificationSentEmailWidgetState();
}

class _CustVerificationSentEmailWidgetState
    extends State<CustVerificationSentEmailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 219,
                decoration: BoxDecoration(
                  color: Color(0xFFFF994B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(78),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(245, 20, 0, 0),
                      child: Text(
                        'HiCanteen',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Satisfy',
                              color: Colors.white,
                              fontSize: 17,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(145, 30, 0, 0),
                      child: Text(
                        'Forgot Password',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                      child: Image.network(
                        'https://pngimg.com/uploads/email/email_PNG27.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        'CHECK YOUR EMAIL',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Text(
                        'The instruction to reset your password \nhas been sent to your email',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 95, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllSigninPageWidget(),
                      ),
                    );
                  },
                  text: 'Back to Login',
                  options: FFButtonOptions(
                    width: 310,
                    height: 40,
                    color: Color(0xFFFF994B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
