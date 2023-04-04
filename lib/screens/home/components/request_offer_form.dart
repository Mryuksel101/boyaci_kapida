import 'package:boyaci_kapida/components/form_buttons.dart';
import 'package:boyaci_kapida/components/form_inputs.dart';
import 'package:boyaci_kapida/constants.dart';
import 'package:boyaci_kapida/components/info_boxes.dart';
import 'package:flutter/material.dart';

class RequestOfferForm extends StatefulWidget {

  const RequestOfferForm({Key? key, this.callBack}) : super(key: key);
  final Function()? callBack;

  @override
  _RequestOfferFormState createState() => _RequestOfferFormState();
}

class _RequestOfferFormState extends State<RequestOfferForm> with TickerProviderStateMixin {
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
                            'Teklif Alın',
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
                                'Şehrin En İyi Ustası Gelsin',
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
                        Expanded(
                          child: SingleChildScrollView(
                            child: AnimatedOpacity(
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
                                    AppFormTextField(
                                      labelTextInfo: 'Lütfen Adınızı Ve Soyadınızı Giriniz', 
                                      hintTextInfo: 'Adınız Ve Soyadınız Nedir', 
                                      customIcon: Icon(
                                        Icons.person,
                                        color: Colors.amber,
                                      ),
                                    ), 

                                    AppFormTextField(
                                      labelTextInfo: 'Lütfen E-Posta Adresinizi Giriniz',
                                      hintTextInfo: 'E-Posta Adresiniz Nedir', 
                                      customIcon: Icon(
                                        Icons.mail,
                                        color: Colors.amber,
                                      ),
                                    ),      

                                    AppFormTextField(
                                      labelTextInfo: 'Lütfen Telefon Numaranızı Giriniz',
                                      hintTextInfo: 'Telefon Numaranız Nedir', 
                                      customIcon: Icon(
                                        Icons.phone_android,
                                        color: Colors.amber,
                                      ),
                                    ),  
                                    
                                    AppFormDropDownButtonFormField(
                                      labelTextInfo: 'Lütfen Yaşadığınız Şehri Seçiniz', 
                                      hintTextInfo: 'Yaşadığınız Şehri Giriniz',
                                      customIcon: Icon(
                                        Icons.location_city,
                                        color: Colors.amber,
                                      ),
                                      items: [
                                        DropdownMenuItem(child: Text('İzmir'),value: 'İzmir',),
                                        DropdownMenuItem(child: Text('İstanbul'),value: 'İstanbul',),
                                        DropdownMenuItem(child: Text('Ankara'),value: 'Ankara',)
                                      ],
                                    ),
                                   
                                    AppFormDropDownButtonFormField(
                                      labelTextInfo: 'Lütfen Oda Sayınızı Giriniz',
                                      hintTextInfo: 'Oda Sayısını Giriniz',
                                      customIcon: Icon(
                                        Icons.account_tree_sharp,
                                        color: Colors.amber,
                                      ),
                                      items: [
                                        DropdownMenuItem(child: Text('1 + 1'),value: '1 + 1',),
                                        DropdownMenuItem(child: Text('2 + 1'),value: '2 + 1',),
                                        DropdownMenuItem(child: Text('3 + 1'),value: '3 + 1',),
                                        DropdownMenuItem(child: Text('4 + 1 ve üstü'),value: '4 + 1 ve üstü',)
                                      ],
                                    ),

                                    AppFormDropDownButtonFormField(
                                      labelTextInfo: 'Lütfen Eşya Durumunu Giriniz',
                                      hintTextInfo: 'Eşya Durumunu Giriniz',
                                      customIcon: Icon(
                                        Icons.add_home_rounded,
                                        color: Colors.amber,
                                      ),
                                      items: [
                                        DropdownMenuItem(child: Text('Eşyalı'),value: 'Eşyalı',),
                                        DropdownMenuItem(child: Text('Eşyasız'),value: 'Eşyasız',),
                                      ],
                                    ),

                                    AppFormDropDownButtonFormField(
                                      labelTextInfo: 'Lütfen Tadilat İçeriğini Giriniz',
                                      hintTextInfo: 'Tadilat İçeriğini Giriniz',
                                      customIcon: Icon(
                                        Icons.home_repair_service,
                                        color: Colors.amber,
                                      ),
                                      items: [
                                        DropdownMenuItem(child: Text('İstemiyorum'),value: 'İstemiyorum',),
                                        DropdownMenuItem(child: Text('Hafif Tadilat'),value: 'Hafif Tadilat',),
                                        DropdownMenuItem(child: Text('Yoğun Tadilat'),value: 'Yoğun Tadilat',),
                                      ],
                                    ),
                       
                                    AppFormTextArea(
                                      labelTextInfo: 'Lütfen Tadilatınız Giriniz',
                                      hintTextInfo: 'Tadilatınız Nedir', 
                                      customIcon: Icon(
                                        Icons.reduce_capacity_rounded,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    
                                    AppFormDropDownButtonFormField(
                                      labelTextInfo: 'Lütfen Boya Terciğinizi Giriniz',
                                      hintTextInfo: 'Boya İstiyormusunuz',
                                      customIcon: Icon(
                                        Icons.format_paint_rounded,
                                        color: Colors.amber,
                                      ),
                                      items: [
                                        DropdownMenuItem(child: Text('Boya Dahil'),value: 'Boya Dahil'),
                                        DropdownMenuItem(child: Text('Sadece İşçilik'),value: 'Sadece İşçilik'),
                                        DropdownMenuItem(child: Text('İşçilik + Boya Dahil Fiyat İstiyorum'),value: 'İşçilik + Boya Dahil Fiyat İstiyorum',),
                                      ],
                                    ),

                                    AppFormDropDownButtonFormField(
                                      labelTextInfo: 'Lütfen Ekstra Boyatmak İsteğinizi Giriniz',
                                      hintTextInfo: 'Ekstra Boyatmak İsteğiniz',
                                      customIcon: Icon(
                                        Icons.info,
                                        color: Colors.amber,
                                      ),
                                      items: [
                                        DropdownMenuItem(child: Text('Kapı'),value: 'Kapı'),
                                        DropdownMenuItem(child: Text('Dolap'),value: 'Dolap'),
                                        DropdownMenuItem(child: Text('Dekor'),value: 'Dekor'),
                                        DropdownMenuItem(child: Text('Alçı'),value: 'Alçı'),
                                        DropdownMenuItem(child: Text('Ekstra Yok'),value: 'Ekstra Yok'),
                                        DropdownMenuItem(child: Text('Bunların Dışında'),value: 'Bunların Dışında'),
                                      ],
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
                                          buttonTitle: 'Gönder'
                                        ),
                                      ],
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





