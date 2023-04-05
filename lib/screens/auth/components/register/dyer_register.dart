import 'package:boyaci_kapida/components/form_buttons.dart';
import 'package:boyaci_kapida/components/form_inputs.dart';
import 'package:boyaci_kapida/constants.dart';
import 'package:boyaci_kapida/components/info_boxes.dart';
import 'package:flutter/material.dart';

class DyerRegister extends StatefulWidget {

  const DyerRegister({Key? key, this.callBack}) : super(key: key);
  final Function()? callBack;

  @override
  _DyerRegisterState createState() => _DyerRegisterState();
}

class _DyerRegisterState extends State<DyerRegister> with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  
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
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final double tempHeight = MediaQuery.of(context).size.height - (MediaQuery.of(context).size.width / 1.2) + 24.0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Image.asset(
            
            'assets/images/form-info.png', 
            fit: BoxFit.cover,
            width: screenWidth,
          ),
          
          
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.width/2+80,
              ),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular((AppTheme.dPadding * 2) - 8),
                  topRight: Radius.circular((AppTheme.dPadding * 2) - 8),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppTheme.amber.withOpacity(0.5),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 10.0
                  ),
                ],
              ),
              child: Column(
                
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppTheme.dPadding - 12, 
                      right: AppTheme.dPadding - 12
                    ),
                    child: Column(
                      
                      children: <Widget>[
          
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppTheme.dPadding - 2, 
                            right: AppTheme.dPadding - 4,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Usta Başvurusu',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  letterSpacing: 0.27,
                                  color: AppTheme.darkerText,
                                ),
                              ),
            
                              const SizedBox(
                                width: 20,
                              ),
            
                              Card(
                                color: AppTheme.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppTheme.dPadding * 2 + 10),
                                ),
                                elevation: 10.0,
                                child: const SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Center(
                                    child: Icon(
                                      Icons.app_registration,
                                      color: AppTheme.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                                'Şehrindeki Usta Sen Ol',
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
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity1,
                          child: Padding(
                            padding: const EdgeInsets.all(AppTheme.dPadding - 12),
                            child: Row(
                              children: <Widget>[
                                renderInfoUI('İş Modeli', '5 Adet'),
                                renderInfoUI('MYK', 'Belgesi'),
                                renderInfoUI('Bölge', '81 İl'),
                              ],
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: AppTheme.dPadding - 4, 
                              right: AppTheme.dPadding - 4, 
                              top: AppTheme.dPadding - 12, 
                              bottom: AppTheme.dPadding - 12,
                            ),
                            child: Column(
                              children: [
                                const AppFormTextField(
                                  labelTextInfo: 'Lütfen Adınızı Ve Soyadınızı Giriniz', 
                                  hintTextInfo: 'Adınız Ve Soyadınız Nedir', 
                                  customIcon: Icon(
                                    Icons.person,
                                    color: Colors.amber,
                                  ),
                                ), 
                          
                                const AppFormTextField(
                                  hintTextInfo: 'Telefon Numranız Nedir ?', 
                                  labelTextInfo: 'Lütfen Telefon Numaranızı Giriniz',
                                  customIcon: Icon(
                                    Icons.phone_android,
                                    color: Colors.amber,
                                  ),
                                ),  
                           
                                const AppFormTextField(
                                  hintTextInfo: 'E-Posta Adresiniz Nedir ?', 
                                  labelTextInfo: 'Lütfen E-Posta Adresiniz Giriniz',
                                  customIcon: Icon(
                                    Icons.mail,
                                    color: Colors.amber,
                                  ),
                                ),
                            
                                AppFormDropDownButtonFormField(
                                  labelTextInfo: 'Lütfen Cinsiyetinizi Giriniz',
                                  hintTextInfo: 'Cinsiyetiniz Nedir',
                                  customIcon: const Icon(
                                    Icons.info,
                                    color: Colors.amber,
                                  ),
                                  items: [
                                    const DropdownMenuItem(child: Text('Erkek'),value: 'Erkek'),
                                    const DropdownMenuItem(child: Text('Kadın'),value: 'Kadın'),
                                    const DropdownMenuItem(child: Text('Belirtmek İstemiyorum'),value: 'Belirtmek İstemiyorum'),
                                  ],
                                ), 
                            
                                AppFormDropDownButtonFormField(
                                  labelTextInfo: 'Lütfen Usta Olduğunuz Alanları Giriniz',
                                  hintTextInfo: 'Usta Olduğunuz Alanlar',
                                  customIcon: const Icon(
                                    Icons.sixty_fps_select_sharp,
                                    color: Colors.amber,
                                  ),
                                  items: [
                                    const DropdownMenuItem(child: Text('Boya'),value: 'Boya'),
                                    const DropdownMenuItem(child: Text('Alçı'),value: 'Alçı'),
                                    const DropdownMenuItem(child: Text('Tadilat'),value: 'Tadilat'),
                                    const DropdownMenuItem(child: Text('Doğrama Kapı'),value: 'Doğrama Kapı'),
                                    const DropdownMenuItem(child: Text('Hepsini Anlıyorum'),value: 'Hepsini Anlıyorum'),
                                    const DropdownMenuItem(child: Text('Kısmen Anlıyorum'),value: 'Kısmen Anlıyorum'),
                                    const DropdownMenuItem(child: Text('Kadın Boya Ustası'),value: 'Kadın Boya Ustası'),
                                  ],
                                ), 
                            
                                const AppFormTextField(
                                  labelTextInfo: 'Lütfen MYK Belge Numranızı Giriniz',
                                  hintTextInfo: 'MYK Belge Numranız', 
                                  customIcon: Icon(
                                    Icons.document_scanner,
                                    color: Colors.amber,
                                  ),
                                ),
                            
                                const AppFormTextArea(
                                  labelTextInfo: 'Öz Geçmişinizi Anlatın',
                                  hintTextInfo: 'Lütfen Öz Geçmişinizi Anlatın',
                                  customIcon: Icon(
                                    Icons.edit_document,
                                    color: Colors.amber,
                                  ),
                                ),
                         
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    AppFormButton(
                                      width: screenWidth * 0.4,
                                      fontWeightTitle: FontWeight.w600,
                                      fontSizeTitle: 18,
                                      buttonTitle: 'İptal'
                                    ),
                                    AppFormButton(
                                      width: screenWidth * 0.4,
                                      fontWeightTitle: FontWeight.w600,
                                      fontSizeTitle: 18,
                                      buttonTitle: 'Kaydet'
                                    ),
                                  ],
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
          ),
          
        ],
      ),
    );
  }
}



