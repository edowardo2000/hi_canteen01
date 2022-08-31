import '../all_signin_page/all_signin_page_widget.dart';
import '../all_signup_page/all_signup_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllMainPageHiCanteenWidget extends StatefulWidget {
  const AllMainPageHiCanteenWidget({Key key}) : super(key: key);

  @override
  _AllMainPageHiCanteenWidgetState createState() =>
      _AllMainPageHiCanteenWidgetState();
}

class _AllMainPageHiCanteenWidgetState
    extends State<AllMainPageHiCanteenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: Image.asset(
                  'assets/images/food.jpg',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                  child: Container(
                    width: 190,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/HiCanteen_Logo.JPG',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Text(
                    'MODERN WAY TO ORDER \nYOUR FOOD',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllSignupPageWidget(),
                        ),
                      );
                    },
                    text: 'SIGN UP',
                    options: FFButtonOptions(
                      width: 260,
                      height: 60,
                      color: Color(0xFFC2C2C2),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Roboto',
                                color: Color(0xFF080000),
                              ),
                      borderSide: BorderSide(
                        color: Color(0xFF050101),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllSigninPageWidget(),
                        ),
                      );
                    },
                    text: 'SIGN IN',
                    options: FFButtonOptions(
                      width: 260,
                      height: 60,
                      color: Color(0xFFC2C2C2),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Roboto',
                                color: Color(0xFF080000),
                              ),
                      borderSide: BorderSide(
                        color: Color(0xFF050101),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
