import 'package:chronosmedic_app/data/controllers/app_controller.dart';
import 'package:chronosmedic_app/routers/app_routers.dart';
import 'package:chronosmedic_app/theme/app_theme.dart';
import 'package:chronosmedic_app/ui/widgets/complete_profile.dart';
import 'package:chronosmedic_app/ui/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppController controller = Get.find<AppController>();
  TextEditingController? emailAddressController;
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  TextEditingController? passwordConfirmController;
  late bool passwordConfirmVisibility;
  TextEditingController? emailAddressLoginController;
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordCreateController = TextEditingController();
    passwordCreateVisibility = false;
    passwordConfirmController = TextEditingController();
    passwordConfirmVisibility = false;
    emailAddressLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    passwordLoginVisibility = false;
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    emailAddressController?.dispose();
    passwordCreateController?.dispose();
    passwordConfirmController?.dispose();
    emailAddressLoginController?.dispose();
    passwordLoginController?.dispose();
    super.dispose();
  }

  _singIn() async {
    final result = await controller.signInWithEmail(
      emailAddressLoginController!.text,
      passwordLoginController!.text,
    );

    if (result) {
      controller.getUsuario();
      Get.offAllNamed(AppRouters.home);
    }
  }

  _signUp() async {
    final result = await controller.signUp(
      emailAddressController!.text,
      passwordCreateController!.text,
    );

    if (result) {
      await Get.to(const CompleteProfile());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).secondaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height * 1,
                    constraints: const BoxConstraints(maxWidth: 600),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset(
                                  'assets/images/page_bg_transparent@2x.png')
                              .image),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (Theme.of(context).brightness ==
                                    Brightness.dark)
                                  Image.asset(
                                    'assets/images/choronosmedic_logoVert.png',
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.fitHeight,
                                  ),
                                if (!(Theme.of(context).brightness ==
                                    Brightness.dark))
                                  Image.asset(
                                    'assets/images/choronosmedic_logoVert.png',
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.fitHeight,
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: DefaultTabController(
                              length: 2,
                              initialIndex: 0,
                              child: Column(
                                children: [
                                  TabBar(
                                    isScrollable: true,
                                    labelColor:
                                        AppTheme.of(context).tertiaryColor,
                                    unselectedLabelColor:
                                        AppTheme.of(context).grayLight,
                                    labelPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 24, 0),
                                    labelStyle: AppTheme.of(context).subtitle2,
                                    indicatorColor:
                                        AppTheme.of(context).tertiaryColor,
                                    indicatorWeight: 3,
                                    tabs: const [
                                      Tab(
                                        text: 'Iniciar Sesión',
                                      ),
                                      Tab(
                                        text: 'Registrarse',
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(24, 0, 24, 0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          0, 20, 0, 0),
                                                  child: TextFormField(
                                                    controller:
                                                        emailAddressLoginController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Correo Electronico',
                                                      labelStyle:
                                                          AppTheme.of(context)
                                                              .bodyText2,
                                                      hintText:
                                                          'Ingrese su correo...',
                                                      hintStyle:
                                                          AppTheme.of(context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      filled: true,
                                                      fillColor: AppTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      contentPadding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              20, 24, 20, 24),
                                                    ),
                                                    style: AppTheme.of(context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          0, 12, 0, 0),
                                                  child: TextFormField(
                                                    controller:
                                                        passwordLoginController,
                                                    obscureText:
                                                        !passwordLoginVisibility,
                                                    decoration: InputDecoration(
                                                      labelText: 'Contraseña',
                                                      labelStyle:
                                                          AppTheme.of(context)
                                                              .bodyText2,
                                                      hintText:
                                                          'Ingrese su Contraseña...',
                                                      hintStyle:
                                                          AppTheme.of(context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      filled: true,
                                                      fillColor: AppTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      contentPadding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              20, 24, 20, 24),
                                                      suffixIcon: InkWell(
                                                        onTap: () => setState(
                                                          () => passwordLoginVisibility =
                                                              !passwordLoginVisibility,
                                                        ),
                                                        focusNode: FocusNode(
                                                            skipTraversal:
                                                                true),
                                                        child: Icon(
                                                          passwordLoginVisibility
                                                              ? Icons
                                                                  .visibility_outlined
                                                              : Icons
                                                                  .visibility_off_outlined,
                                                          color: AppTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    style: AppTheme.of(context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          0, 24, 0, 0),
                                                  child: Button(
                                                    onPressed: _singIn,
                                                    text: 'Ingresar',
                                                    options: ButtonOptions(
                                                      width: 230,
                                                      height: 50,
                                                      color:
                                                          AppTheme.of(context)
                                                              .primaryColor,
                                                      textStyle:
                                                          AppTheme.of(context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: AppTheme.of(
                                                                        context)
                                                                    .textColor,
                                                              ),
                                                      elevation: 3,
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          0, 20, 0, 24),
                                                  child: Button(
                                                    onPressed: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ForgotPassword(),
                                                        ),
                                                      );
                                                    },
                                                    text:
                                                        'Olvidé mi contraseña',
                                                    options: ButtonOptions(
                                                      width: 185,
                                                      height: 40,
                                                      color: AppTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      textStyle:
                                                          AppTheme.of(context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: AppTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                      elevation: 0,
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(24, 0, 24, 0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          0, 20, 0, 0),
                                                  child: TextFormField(
                                                    controller:
                                                        emailAddressController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Correo Electronico',
                                                      labelStyle:
                                                          AppTheme.of(context)
                                                              .bodyText2,
                                                      hintText:
                                                          'Ingrese su correo...',
                                                      hintStyle:
                                                          AppTheme.of(context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      filled: true,
                                                      fillColor: AppTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      contentPadding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              20, 24, 20, 24),
                                                    ),
                                                    style: AppTheme.of(context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          0, 12, 0, 0),
                                                  child: TextFormField(
                                                    controller:
                                                        passwordCreateController,
                                                    obscureText:
                                                        !passwordCreateVisibility,
                                                    decoration: InputDecoration(
                                                      labelText: 'Contraseña',
                                                      labelStyle:
                                                          AppTheme.of(context)
                                                              .bodyText2,
                                                      hintText:
                                                          'Ingrese su Contraseña...',
                                                      hintStyle:
                                                          AppTheme.of(context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      filled: true,
                                                      fillColor: AppTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                      contentPadding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              20, 24, 20, 24),
                                                      suffixIcon: InkWell(
                                                        onTap: () => setState(
                                                          () => passwordCreateVisibility =
                                                              !passwordCreateVisibility,
                                                        ),
                                                        focusNode: FocusNode(
                                                            skipTraversal:
                                                                true),
                                                        child: Icon(
                                                          passwordCreateVisibility
                                                              ? Icons
                                                                  .visibility_outlined
                                                              : Icons
                                                                  .visibility_off_outlined,
                                                          color:
                                                              Color(0x98FFFFFF),
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    style: AppTheme.of(context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          0, 24, 0, 24),
                                                  child: Button(
                                                    onPressed: _signUp,
                                                    text: 'Crear Cuenta',
                                                    options: ButtonOptions(
                                                      width: 230,
                                                      height: 50,
                                                      color:
                                                          AppTheme.of(context)
                                                              .primaryColor,
                                                      textStyle:
                                                          AppTheme.of(context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: AppTheme.of(
                                                                        context)
                                                                    .textColor,
                                                              ),
                                                      elevation: 3,
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
