import 'package:chronosmedic_app/theme/app_theme.dart';
import 'package:chronosmedic_app/ui/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAnotherProfile extends StatefulWidget {
  const AddAnotherProfile({Key? key}) : super(key: key);

  @override
  _AddAnotherProfileState createState() => _AddAnotherProfileState();
}

class _AddAnotherProfileState extends State<AddAnotherProfile> {
  String? radioButtonValue;
  TextEditingController? phoneNumberController1;
  TextEditingController? phoneNumberController2;
  TextEditingController? phoneNumberController3;
  TextEditingController? phoneNumberController4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    phoneNumberController1 = TextEditingController();
    phoneNumberController2 = TextEditingController();
    phoneNumberController3 = TextEditingController();
    phoneNumberController4 = TextEditingController();
  }

  @override
  void dispose() {
    phoneNumberController1?.dispose();
    phoneNumberController2?.dispose();
    phoneNumberController3?.dispose();
    phoneNumberController4?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: AppTheme.of(context).grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Add Another Profile',
          style: AppTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/uiAvatar@2x.png',
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Upload a photo for us to easily identify this person.',
                        textAlign: TextAlign.center,
                        style: AppTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: phoneNumberController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Persons Name',
                      labelStyle: AppTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: AppTheme.of(context).grayLight,
                          ),
                      hintText: 'Official name here...',
                      hintStyle: AppTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: AppTheme.of(context).secondaryText,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: AppTheme.of(context).secondaryBackground,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: AppTheme.of(context).bodyText1.override(
                          fontFamily: 'Outfit',
                          color: AppTheme.of(context).secondaryText,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: phoneNumberController2,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Persons Age',
                      labelStyle: AppTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: AppTheme.of(context).grayLight,
                          ),
                      hintText: 'i.e. 34',
                      hintStyle: AppTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: AppTheme.of(context).secondaryText,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: AppTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: AppTheme.of(context).bodyText1.override(
                          fontFamily: 'Outfit',
                          color: AppTheme.of(context).secondaryText,
                        ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: phoneNumberController3,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Persons Ailments',
                      labelStyle: AppTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: AppTheme.of(context).grayLight,
                          ),
                      hintText: 'What types of allergies do they have..',
                      hintStyle: AppTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: AppTheme.of(context).secondaryText,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: AppTheme.of(context).secondaryBackground,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: AppTheme.of(context).bodyText1.override(
                          fontFamily: 'Outfit',
                          color: AppTheme.of(context).textColor,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: phoneNumberController4,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: AppTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: AppTheme.of(context).grayLight,
                          ),
                      hintText: 'Please enter a valid email...',
                      hintStyle: AppTheme.of(context).bodyText1.override(
                            fontFamily: 'Outfit',
                            color: AppTheme.of(context).secondaryText,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: AppTheme.of(context).secondaryBackground,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: AppTheme.of(context).bodyText1.override(
                          fontFamily: 'Outfit',
                          color: AppTheme.of(context).textColor,
                        ),
                    keyboardType: TextInputType.streetAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Persons Birth Sex',
                        style: AppTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: CustomRadioButton(
                              options:
                                  ['Male', 'Female', 'Undisclosed'].toList(),
                              onChanged: (val) =>
                                  setState(() => radioButtonValue = val),
                              optionHeight: 25,
                              textStyle: AppTheme.of(context).bodyText2,
                              selectedTextStyle:
                                  AppTheme.of(context).subtitle2.override(
                                        fontFamily: 'Outfit',
                                        color: AppTheme.of(context).primaryText,
                                      ),
                              textPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 12, 0),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.horizontal,
                              radioButtonColor:
                                  AppTheme.of(context).primaryColor,
                              inactiveRadioButtonColor:
                                  AppTheme.of(context).grayLight,
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.center,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Button(
                    onPressed: () async {
                      // await Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         NavBarPage(initialPage: 'homePage'),
                      //   ),
                      // );
                    },
                    text: 'Complete Profile',
                    options: ButtonOptions(
                      width: 230,
                      height: 50,
                      color: AppTheme.of(context).primaryColor,
                      textStyle: AppTheme.of(context).subtitle2.override(
                            fontFamily: 'Outfit',
                            color: AppTheme.of(context).textColor,
                          ),
                      elevation: 3,
                      borderSide: const BorderSide(
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
        ),
      ),
    );
  }
}
