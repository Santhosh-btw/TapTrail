import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_model.dart';
export 'welcome_model.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  late WelcomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFE6E6E6),
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                child: Image.asset(
                  'assets/images/New_Project_(3).png',
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.8, 0.65),
              child: Text(
                'Welcome',
                style: FlutterFlowTheme.of(context).displayMedium,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.7, 0.7),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Sign in / Sign up',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFD95959),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: '  to enter the app',
                      style: TextStyle(),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
