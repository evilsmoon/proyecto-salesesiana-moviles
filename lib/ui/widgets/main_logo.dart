import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MainLogo extends StatefulWidget {
  const MainLogo({Key? key}) : super(key: key);

  @override
  _MainLogoState createState() => _MainLogoState();
}

class _MainLogoState extends State<MainLogo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!(Theme.of(context).brightness == Brightness.dark))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Image.asset(
              'assets/images/health-ai_logoHorz_dark@3x.png',
              width: 120,
              height: 40,
              fit: BoxFit.fitWidth,
            ),
          ),
        if (Theme.of(context).brightness == Brightness.dark)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Image.asset(
              'assets/images/health-ai_logoHorz.png',
              width: 120,
              height: 40,
              fit: BoxFit.fitWidth,
            ),
          ),
      ],
    );
  }
}
