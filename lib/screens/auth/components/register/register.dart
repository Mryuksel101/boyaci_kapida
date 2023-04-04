/* Tab Bar Olucak Ve Tab İsimleri Boyacı Kaydı Ve Kullanıcı Kaydı */
import 'package:boyaci_kapida/constants.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  const Register({Key? key, this.callBack}) : super(key: key);
  final Function()? callBack;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> with TickerProviderStateMixin {
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
                                    CustomSlidingSegmentedControl<int>(
                                      initialValue: 2,
                                      children: {
                                        1: Text('Deneme'),
                                        2: Text('Deneme 2'),
                                      },
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      thumbDecoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.3),
                                            blurRadius: 4.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInToLinear,
                                      onValueChanged: (v) {
                                        print(v);
                                      },
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



