import 'package:boyaci_kapida/components/info_boxes.dart';
import 'package:boyaci_kapida/constants.dart';
import 'package:flutter/material.dart';

class ServiceOptionsScreen extends StatefulWidget {
  @override
  _ServiceOptionsScreenState createState() => _ServiceOptionsScreenState();
}

class _ServiceOptionsScreenState extends State<ServiceOptionsScreen> with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)
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
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset('assets/images/form-info.png', fit: BoxFit.cover,),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.nearlyWhite,
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
                  padding: const EdgeInsets.only(left: AppTheme.dPadding - 12, right: AppTheme.dPadding - 12),
                  child: SingleChildScrollView(
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
                          Padding(
                            padding: const EdgeInsets.only(
                              top: (AppTheme.dPadding * 2) - 8, 
                              left: AppTheme.dPadding - 2, 
                              right: AppTheme.dPadding - 4,
                            ),
                            child: Text(
                              'Minimum Paket',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
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
                              children: <Widget>[
                                Text(
                                  '250 TL',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
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
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    renderInfoUI('Teklif', '20'),
                                    renderInfoUI('Zamansız', 'Kullanıma Bağlı'),
                                    renderInfoUI('Paket', '1 Adet'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                                child: Text(
                                  'Teklif süreci ustaların teklif almasını sağlayan süreç tarihidir Bir usta paket aldıktan sonra tekliflerin ne zaman bitmesini istediği iş takvim planmasina göre teklif alma veya dondurma alarm sistemidir',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    letterSpacing: 0.27,
                                    color: AppTheme.black,
                                  ),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: AppTheme.dPadding - 4, 
                                bottom: AppTheme.dPadding - 4, 
                                right: AppTheme.dPadding - 4
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 48,
                                    height: 48,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.black,
                                        borderRadius: const BorderRadius.all(Radius.circular(AppTheme.dPadding / 2)),
                                        border: Border.all(color: AppTheme.black),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppTheme.black.withOpacity(0.5),
                                            offset: const Offset(1.1, 1.1),
                                            blurRadius: 10.0
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: AppTheme.white,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppTheme.black,
                                        borderRadius: const BorderRadius.all(Radius.circular(AppTheme.dPadding / 2)),
                                        border: Border.all(color: AppTheme.black),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppTheme.black.withOpacity(0.5),
                                            offset: const Offset(1.1, 1.1),
                                            blurRadius: 10.0
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Paketi Satın Al',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
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
                    child: Center(
                      child: Icon(
                        Icons.card_giftcard,
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
                    child: Icon(
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
