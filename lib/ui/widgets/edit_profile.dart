import 'dart:convert';
import 'dart:io';

import 'package:chronosmedic_app/data/controllers/app_controller.dart';
import 'package:chronosmedic_app/data/entities/entities.dart';
import 'package:chronosmedic_app/theme/app_theme.dart';
import 'package:chronosmedic_app/ui/utils/upload_media.dart';
import 'package:chronosmedic_app/ui/widgets/button.dart';
import 'package:chronosmedic_app/ui/widgets/custom_radio_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  final UsuarioEntity userProfile;
  const EditProfile({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  AppController controller = Get.find<AppController>();
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? yourNameController;
  TextEditingController? yourEmailController;
  TextEditingController? yourAgeController;
  TextEditingController? yourAilmentsController;
  String? radioButtonValue;
  File? _image;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    yourEmailController = TextEditingController(text: widget.userProfile.email);
    yourNameController =
        TextEditingController(text: widget.userProfile.displayname);
    yourAgeController =
        TextEditingController(text: widget.userProfile.age.toString());
    yourAilmentsController =
        TextEditingController(text: widget.userProfile.phonernumber);
    print(widget.userProfile.sex);
    radioButtonValue = widget.userProfile.sex;
    // _image = widget.userProfile.photourl
  }

  @override
  void dispose() {
    yourAgeController?.dispose();
    yourEmailController?.dispose();
    yourNameController?.dispose();
    yourAilmentsController?.dispose();
    super.dispose();
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _image = null;
    });
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

  void _subirImagen() async {
    _resetState();
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        if (file.path != null) {
          File img = File(file.path!);
          setState(() => _image = img);
          // showUploadMessage(context, 'Failed to upload media');
        }
      }
    } on PlatformException catch (e) {
      _logException('Unsupported operation ${e.toString()}');
    } catch (e) {
      _logException(e.toString());
    }
  }

  _updateProfile() async {
    final result = await controller.updateProfile(
        yourNameController!.text,
        yourEmailController!.text,
        int.parse(yourAgeController!.text),
        yourAilmentsController!.text,
        radioButtonValue,
        _image);
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
          'Edit Profile',
          style: AppTheme.of(context).title3,
        ),
        // actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).darkBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 80,
                    height: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: _image != null
                        ? Image.file(_image!)
                        : Image.memory(
                            base64Decode(widget.userProfile.photourl!),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Button(
                    onPressed: _subirImagen,
                    text: 'Cambiar Foto',
                    options: ButtonOptions(
                      width: 140,
                      height: 40,
                      color: AppTheme.of(context).primaryBackground,
                      textStyle: AppTheme.of(context).bodyText1,
                      elevation: 2,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourNameController ??= TextEditingController(
                        // text: editProfileUsersRecord.displayName,
                        ),
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
                          const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: AppTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourEmailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Correo Electronico',
                      labelStyle: AppTheme.of(context).bodyText2,
                      hintText: 'Ingrese su correo ...',
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
                          const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: AppTheme.of(context).bodyText1,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourAgeController ??= TextEditingController(
                        // text: editProfileUsersRecord.age?.toString(),
                        ),
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
                          const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: AppTheme.of(context).bodyText1,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourAilmentsController ??=
                        TextEditingController(
                            // text: editProfileUsersRecord.ailments,
                            ),
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
                          const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: AppTheme.of(context).bodyText1,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Seleccione su genero',
                        style: AppTheme.of(context).bodyText2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomRadioButton(
                        options: ['Hombre', 'Mujer', 'Otro'].toList(),
                        initialValue: radioButtonValue ?? 'Otro',
                        onChanged: (val) =>
                            setState(() => radioButtonValue = val),
                        optionHeight: 25,
                        textStyle: AppTheme.of(context).bodyText2,
                        selectedTextStyle: AppTheme.of(context).bodyText1,
                        textPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.horizontal,
                        radioButtonColor: AppTheme.of(context).primaryColor,
                        inactiveRadioButtonColor:
                            AppTheme.of(context).grayLight,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.center,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Button(
                    onPressed: _updateProfile
                    // final usersUpdateData = createUsersRecordData(
                    //   displayName: yourNameController?.text ?? '',
                    //   email: yourEmailController!.text,
                    //   age: int.tryParse(yourAgeController?.text ?? ''),
                    //   ailments: yourAilmentsController?.text ?? '',
                    //   userSex: radioButtonValue,
                    // );
                    // await editProfileUsersRecord.reference
                    //     .update(usersUpdateData);
                    // Navigator.pop(context);
                    ,
                    text: 'Guardar Cambios',
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
    );
    // return StreamBuilder<UsersRecord>(
    //   stream: UsersRecord.getDocument(currentUserReference!),
    //   builder: (context, snapshot) {
    //     // Customize what your widget looks like when it's loading.
    //     if (!snapshot.hasData) {
    //       return Center(
    //         child: SizedBox(
    //           width: 40,
    //           height: 40,
    //           child: SpinKitPumpingHeart(
    //             color: AppTheme.of(context).primaryColor,
    //             size: 40,
    //           ),
    //         ),
    //       );
    //     }
    //     final editProfileUsersRecord = snapshot.data!;
    //     return ;
    //   },
    // );
  }
}
