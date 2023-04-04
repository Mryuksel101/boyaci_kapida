import 'package:boyaci_kapida/components/form_buttons.dart';
import 'package:boyaci_kapida/components/form_inputs.dart';
import 'package:boyaci_kapida/constants.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  const Login({Key? key, this.callBack}) : super(key: key);
  final Function()? callBack;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  bool? check1 = false;
  
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 0.0;
  
  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(0, 1.0, curve: Curves.fastOutSlowIn)
      ),
    );
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController?.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final double tempHeight = MediaQuery.of(context).size.height - (MediaQuery.of(context).size.width / 1.2) + 24.0;
    return Container(
      color: AppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.asset(
                    'assets/images/form-info.png', 
                    fit: BoxFit.cover
                  ),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - (AppTheme.dPadding + 4),
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: AppTheme.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppTheme.dPadding - 12, 
                    right: AppTheme.dPadding - 12
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: infoHeight,
                      maxHeight: tempHeight > infoHeight
                        ? tempHeight
                        : infoHeight
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(
                            top: (AppTheme.dPadding * 2) - 8, 
                            left: AppTheme.dPadding - 2, 
                            right: AppTheme.dPadding - 4,
                          ),
                          child: Text(
                            'Merhaba',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              letterSpacing: 0.27,
                              color: AppTheme.darkerText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppTheme.dPadding - 4, 
                            right: AppTheme.dPadding - 4, 
                            bottom: AppTheme.dPadding - 12, 
                            top: AppTheme.dPadding - 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Boyaci Kapidaya Giriş Yapın',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  letterSpacing: 0.27,
                                  color: AppTheme.amber,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: opacity1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: AppTheme.dPadding - 4, 
                                  right: AppTheme.dPadding - 4, 
                                  top: AppTheme.dPadding - 12, 
                                  bottom: AppTheme.dPadding - 12,
                                ),
                                child: Column(
                                  children: [
                                    AppFormTextField(
                                      hintTextInfo: 'E-Posta Adresiniz Nedir ?',
                                      labelTextInfo: 'Lütfen E-Posta Adresiniz Giriniz', 
                                      customIcon: Icon(
                                        Icons.email,
                                        color: Colors.amber,
                                      ),
                                    ),
                                     
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppTheme.dPadding),
                                      child: AppFormTextField(
                                        hintTextInfo: 'Şifreniz Nedir ?', 
                                        labelTextInfo: 'Lütfen Şifrenizi Giriniz',
                                        customIcon: Icon(
                                          Icons.password,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ), 

                                    Padding(
                                      padding: const EdgeInsets.only(top: AppTheme.dPadding),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: Checkbox(
                                                  side: BorderSide(
                                                    color: AppTheme.black
                                                  ),
                                                  activeColor: AppTheme.black,
                                                  value: check1,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      check1 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: AppTheme.dPadding / 4),
                                                child: GestureDetector(
                                                  child: Text(
                                                    'Beni Hatırla',
                                                    style: TextStyle(
                                                      color: Colors.black
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Şifremi Unuttum',
                                              style: TextStyle(
                                              color: Colors.black
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                    
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppTheme.dPadding),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppFormButton(
                                            width: screenWidth * 0.89 - 0.700,
                                            fontWeightTitle: FontWeight.w400,
                                            fontSizeTitle: 18,
                                            buttonTitle: 'Giriş Yap'
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: AppTheme.dPadding / 4),
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: 1,
                                        height: 50,
                                      ),
                                    ),
                         
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppTheme.dPadding / 4),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppFormButton(
                                            width: screenWidth * 0.89 - 0.700,
                                            fontWeightTitle: FontWeight.w400,
                                            fontSizeTitle: 18,
                                            buttonTitle: 'Hemen Üye Ol'
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppTheme.dPadding),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          AppFormButton(
                                            width: screenWidth * 0.4,
                                            fontWeightTitle: FontWeight.w400,
                                            fontSizeTitle: 14,
                                            buttonTitle: 'Google İle Bağlan'
                                          ),         
                                          AppFormButton(
                                            width: screenWidth * 0.4,
                                            fontWeightTitle: FontWeight.w400,
                                            fontSizeTitle: 14,
                                            buttonTitle: 'Facebook İle Bağlan'
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).padding.bottom)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - (AppTheme.dPadding + 4) - (AppTheme.dPadding + 15),
              right: 35,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: CurvedAnimation(parent: animationController!, curve: Curves.fastOutSlowIn),
                child: Card(
                  color: AppTheme.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.dPadding * 2 + 10),
                  ),
                  elevation: 10.0,
                  child: Container(
                    width: 60,
                    height: 60,
                    child: const Center(
                      child: Icon(
                        Icons.login,
                        color: AppTheme.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppTheme.black,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



