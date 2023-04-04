import 'package:boyaci_kapida/components/form_buttons.dart';
import 'package:boyaci_kapida/components/form_inputs.dart';
import 'package:boyaci_kapida/constants.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {

  const UserRegister({Key? key, this.callBack}) : super(key: key);
  final Function()? callBack;

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  bool? check1 = false, check2 = true, check3 = false;

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
                            'Hoşgeldiniz',
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
                                'Yeni Üyelik',
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
                                      hintTextInfo: 'Adınız Nedir ?', 
                                      labelTextInfo: 'Lütfen Adınızı Giriniz', 
                                      customIcon: Icon(
                                        Icons.person,
                                        color: Colors.amber,
                                      ),
                                    ), 
                                   
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppTheme.dPadding),
                                      child: AppFormTextField(
                                        hintTextInfo: 'Soyadınız Nedir ?', 
                                        labelTextInfo: 'Lütfen Soyadınızı Giriniz',
                                        customIcon: Icon(
                                          Icons.info,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ), 
                                   
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppTheme.dPadding),
                                      child: AppFormTextField(
                                        hintTextInfo: 'E-Posta Adresiniz Nedir ?',
                                        labelTextInfo: 'Lütfen E-Posta Adresiniz Giriniz', 
                                        customIcon: Icon(
                                          Icons.email,
                                          color: Colors.amber,
                                        ),
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
                                      child: AppFormTextField(
                                        hintTextInfo: 'Şifreniz Tekrarı Nedir ?', 
                                        labelTextInfo: 'Lütfen Şifrenizin Tekrar Giriniz',
                                        customIcon: Icon(
                                          Icons.password,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                    
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppTheme.dPadding),
                                      child: Container(
                                        height: 60,
                                        child: DropdownButtonFormField(
                                          icon: Icon(Icons.keyboard_arrow_down_sharp),
                                          onChanged: (v) {},
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(AppTheme.dPadding / 2),
                                              ),
                                              borderSide: BorderSide(
                                                color: AppTheme.black
                                              ),
                                            ),
                                            hintText: 'Cinsiyetiniz Nedir ?',
                                              hintStyle: TextStyle(
                                                color: AppTheme.amber,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400
                                              ),
                                             focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(AppTheme.dPadding / 2),
                                              ),
                                              borderSide: BorderSide(
                                                color: AppTheme.black
                                              ),
                                            ),
                                            labelText: 'Lütfen Cinsiyetinizi Giriniz',
                                              labelStyle: TextStyle(
                                                color: AppTheme.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400
                                              ),
                                            prefixIcon: Icon(
                                              Icons.accessibility,
                                              color: AppTheme.amber,
                                            ),
                                          ),
                                          items: [
                                            DropdownMenuItem(
                                              child: Text(
                                                "Erkek",
                                              ),
                                              value: "Erkek",
                                            ),
                                            DropdownMenuItem(
                                              child: Text(
                                                "Kadın",
                                              ),
                                              value: "Kadın",
                                            ),
                                            DropdownMenuItem(
                                              child: Text(
                                                "Belirtmek İstemiyorum",
                                              ),
                                              value: "Belirtmek İstemiyorum",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                   
                                    Padding(
                                      padding: const EdgeInsets.only(top: AppTheme.dPadding),
                                      child: AppFormTextField(
                                        hintTextInfo: 'Cep Telefonu Numaranız Nedir ?', 
                                        labelTextInfo: 'Lütfen Cep Telefonu Numaranız Giriniz',
                                        customIcon: Icon(
                                          Icons.phone_android,
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
                                                  activeColor: AppTheme.black,
                                                  side: BorderSide(
                                                    color: AppTheme.black
                                                  ),
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
                                                    'Aydınlatma Metninde belirtilen ilkeler nezdinde Elektronik \nTicaret İletisi almak istiyorum.',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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
                                                  activeColor: AppTheme.black,
                                                  side: BorderSide(
                                                    color: AppTheme.black
                                                  ),
                                                  value: check2,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      check2 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: AppTheme.dPadding / 4),
                                                child: GestureDetector(
                                                  child: Text(
                                                    'Üyelik sözleşmesini kabul ediyorum.',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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
                                                  activeColor: AppTheme.black,
                                                  side: BorderSide(
                                                    color: AppTheme.black
                                                  ),
                                                  value: check3,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      check3 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: AppTheme.dPadding / 4),
                                                child: GestureDetector(
                                                  child: Text(
                                                    'Kişisel verilerin işlenmesine ilişkin Aydınlatma Metnini \nokudum.',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                            fontSizeTitle: 18,
                                            fontWeightTitle: FontWeight.w400,
                                            buttonTitle: 'İptal'
                                          ),
                                          AppFormButton(
                                            width: screenWidth * 0.4,
                                            fontSizeTitle: 18,
                                            fontWeightTitle: FontWeight.w400,
                                            buttonTitle: 'Kaydet'
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
                        Icons.app_registration,
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



