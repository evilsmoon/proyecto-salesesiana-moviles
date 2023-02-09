import 'dart:io';

import 'package:chronosmedic_app/data/controllers/app_controller.dart';
import 'package:chronosmedic_app/routers/app_routers.dart';
import 'package:chronosmedic_app/theme/app_theme.dart';
import 'package:chronosmedic_app/ui/widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  AppController controller = Get.find<AppController>();
  String? radioButtonValue;
  bool isMediaUploading = false;
  TextEditingController? phoneController;
  TextEditingController? yourAgeController;
  TextEditingController? yourNameController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

/* 
 */

  File? _image;

/*  */
  @override
  void initState() {
    super.initState();

    phoneController = TextEditingController();
    yourAgeController = TextEditingController();
    yourNameController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    phoneController?.dispose();
    yourAgeController?.dispose();
    yourNameController?.dispose();
    super.dispose();
  }

  _completeProfile() async {
    final result = await controller.completeProfile(
        yourNameController!.text,
        int.parse(yourAgeController!.text),
        phoneController!.text.toString(),
        radioButtonValue,
        _image);
    if (result) {
      await controller.getUser();
      await Get.offAllNamed(AppRouters.home);
    }
  }

  void _logException(String message) {
    print(message);
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _image = null;
    });
  }

  void _subirImagen() async {
    _resetState();
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        if (file.path?.isNotEmpty == true) {
          File img = File(file.path!);
          setState(() => _image = img);
        }
      }
    } on PlatformException catch (e) {
      _logException('Unsupported operation ${e.toString()}');
    } catch (e) {
      _logException(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).secondaryBackground,
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
          'Completar Perfil',
          style: AppTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: Image.asset(
                    'assets/images/page_bg_transparent@2x.png',
                  ).image,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: _subirImagen,
                        child: Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: _image != null
                              ? Image.file(_image!)
                              : Image.asset(
                                  'assets/images/uiAvatar@2x.png',
                                ),
                        ),
                      ),
                      Text(
                        'Sube una foto con la que te sientas identificado.',
                        style: AppTheme.of(context).bodyText1,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          controller: yourNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                            labelStyle: AppTheme.of(context).bodyText2,
                            hintText: 'Ingrese su nombre...',
                            hintStyle: AppTheme.of(context).bodyText2,
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
                            fillColor: AppTheme.of(context).primaryBackground,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                          ),
                          style: AppTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          controller: yourAgeController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Edad',
                            labelStyle: AppTheme.of(context).bodyText2,
                            hintText: 'i.e. 34',
                            hintStyle: AppTheme.of(context).bodyText2,
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
                            fillColor: AppTheme.of(context).primaryBackground,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                          ),
                          style: AppTheme.of(context).bodyText1,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          controller: phoneController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Numero Celular',
                            labelStyle: AppTheme.of(context).bodyText2,
                            hintText: '+593 ..',
                            hintStyle: AppTheme.of(context).bodyText2,
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
                            fillColor: AppTheme.of(context).primaryBackground,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 20, 24),
                          ),
                          style: AppTheme.of(context).bodyText1,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Seleccione el genero',
                              style: AppTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: CustomRadioButton(
                                options: ['Hombre', 'Mujer', 'Otro'].toList(),
                                onChanged: (val) =>
                                    setState(() => radioButtonValue = val),
                                optionHeight: 25,
                                textStyle: AppTheme.of(context).bodyText2,
                                selectedTextStyle:
                                    AppTheme.of(context).bodyText1,
                                textPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 15, 0),
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
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      //   child: Button(
                      //     onPressed: () async {
                      //       await Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => const AddAnotherProfile(),
                      //         ),
                      //       );
                      //     },
                      //     text: 'Add Another Profile',
                      //     icon: const Icon(
                      //       Icons.add_rounded,
                      //       size: 15,
                      //     ),
                      //     options: ButtonOptions(
                      //       width: 230,
                      //       height: 50,
                      //       color: AppTheme.of(context).secondaryBackground,
                      //       textStyle: AppTheme.of(context).subtitle2.override(
                      //             fontFamily: 'Outfit',
                      //             color: AppTheme.of(context).primaryText,
                      //           ),
                      //       elevation: 3,
                      //       borderSide: const BorderSide(
                      //         color: Colors.transparent,
                      //         width: 1,
                      //       ),
                      //       borderRadius: BorderRadius.circular(40),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: Button(
                          onPressed: _completeProfile,
                          text: 'Complete Profile',
                          options: ButtonOptions(
                            width: 230,
                            height: 50,
                            color: AppTheme.of(context).primaryColor,
                            textStyle: AppTheme.of(context).subtitle2,
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
          ],
        ),
      ),
    );
  }
}
