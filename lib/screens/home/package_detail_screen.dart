import 'package:boyaci_kapida/Models/category.dart';
import 'package:boyaci_kapida/constants.dart';
import 'package:flutter/material.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({Key? key, this.callBack}) : super(key: key);

  final Function()? callBack;
  @override
  _PackageDetailScreenState createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: SizedBox(
        height: 134,
        width: double.infinity,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 0),
                itemCount: Category.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = Category.categoryList.length > 10
                      ? 10
                      : Category.categoryList.length;
                  final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                  animationController?.forward();
                  
                  return CategoryView(
                    category: Category.categoryList[index],
                    animation: animation,
                    animationController: animationController,
                    callback: widget.callBack,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key? key,
      this.category,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback? callback;
  final Category? category;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(100 * (1.0 - animation!.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: callback,
              child: SizedBox(
                width: 280,
                child: Stack(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 48),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.amber,
                              borderRadius: BorderRadius.all(
                                Radius.circular(AppTheme.dPadding / 2),
                              ),
                              border: Border.all(color: AppTheme.black)
                            ),
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 48 + 24.0),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: AppTheme.dPadding - 4,
                                            right: AppTheme.dPadding - 10,
                                          ),
                                          child: Text(
                                            category!.title,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                              letterSpacing: 0.27,
                                              color: AppTheme.black,
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                          child: SizedBox(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: AppTheme.dPadding - 4),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                '(${category!.quantity} Adet)',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  letterSpacing: 0.27,
                                                  color: AppTheme.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: AppTheme.dPadding - 4,
                                            bottom: AppTheme.dPadding - 4, 
                                            right: AppTheme.dPadding - 4,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${category!.money} TL',
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                  letterSpacing: 0.27,
                                                  color: AppTheme.white,
                                                ),
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                  color: AppTheme.black,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(AppTheme.dPadding - 12)
                                                  ),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(AppTheme.dPadding - 16),
                                                  child: Icon(
                                                    Icons.shopping_cart_outlined,
                                                    color:AppTheme.white
                                                  ),
                                                ),
                                              )
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
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: AppTheme.dPadding + 4, 
                          bottom: AppTheme.dPadding + 4, 
                          left: AppTheme.dPadding - 6,
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppTheme.black),
                                borderRadius: BorderRadius.circular(AppTheme.dPadding - 4),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(AppTheme.dPadding - 4),
                                ),
                                child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Image.asset(category!.imagePath),
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
            ),
          ),
        );
      },
    );
  }
}
