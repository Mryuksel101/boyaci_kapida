import 'package:boyaci_kapida/constants.dart';
import 'package:boyaci_kapida/enum/services_category.dart';
import 'package:boyaci_kapida/screens/auth/components/register/dyer_register.dart';
import 'package:boyaci_kapida/screens/home/components/apply_category_list.dart';
import 'package:boyaci_kapida/screens/home/service_options_screen.dart';
import 'package:boyaci_kapida/screens/home/package_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ServicesCategory servicesCategory = ServicesCategory.emlakci;

  @override
   Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: Scaffold(
        backgroundColor: AppTheme.transparent,
        appBar: AppBar(
          backgroundColor: AppTheme.amber,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: (){},
            splashColor: AppTheme.white, 
            splashRadius: 22, 
            icon: const Icon(
              Icons.menu,
              color: AppTheme.black,
              size: 30,  
            ),
          ),
          title: Image.asset(
            'assets/icons/logo.png',
            width: 90,
            height: 90,
            fit: BoxFit.contain,
          ),
          actions: [
            IconButton(
              onPressed: (){},
              splashColor: AppTheme.white, 
              splashRadius: 22,
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: AppTheme.black,
                size: 30,  
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            renderHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      renderPackages(),
                      Flexible(
                        child: renderActionButtons(),
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

  Widget renderHeader() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Container(
            color: AppTheme.amber,
           
          ),        
        ],
      ),
    );
  }

  Widget renderPackages() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(
            top: AppTheme.dPadding,
            left: AppTheme.dPadding,
            right: AppTheme.dPadding
          ),
          child: Text(
            'Paketler',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              letterSpacing: 0.27,
              color: AppTheme.black,
            ),
          ),
        ),
        const Divider(
          color: AppTheme.amber, 
          thickness: 2, 
          indent: 20, 
          endIndent: 320
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              renderOptionButtons(
                ServicesCategory.emlakci, servicesCategory == ServicesCategory.emlakci
              ),
              const SizedBox(width: 16),
              renderOptionButtons(
                ServicesCategory.usta, servicesCategory == ServicesCategory.usta
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        PackageDetailScreen(
          callBack: () {
            moveTo();
          },
        ),
      ],
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => ServiceOptionsScreen(),
      ),
    );
  }


  Widget renderOptionButtons(ServicesCategory servicesCategoryData, bool isSelected) {
    String txt = '';
    if (ServicesCategory.emlakci == servicesCategoryData){
      txt = 'Emlakçı Paketi';
    } 
    else if (ServicesCategory.usta == servicesCategoryData){
      txt = 'Usta Paketi';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.amber : AppTheme.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppTheme.dPadding / 2)
          ),
          border: Border.all(color: AppTheme.black),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppTheme.black.withOpacity(0.3),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0
            ),
          ],
        ),
        child: Material(
          color: AppTheme.transparent,
          child: InkWell(
            splashColor: AppTheme.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppTheme.dPadding / 2)
            ),
            onTap: (){
              setState((){
                servicesCategory = servicesCategoryData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppTheme.dPadding / 2, 
                bottom: AppTheme.dPadding / 2, 
                left: AppTheme.dPadding / 2, 
                right: AppTheme.dPadding / 2,
              ),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    letterSpacing: 0.27,
                    color: isSelected ? AppTheme.white : AppTheme.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget renderActionButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(
            top: AppTheme.dPadding,
            left: AppTheme.dPadding,
            right: AppTheme.dPadding
          ),
          child: Text(
            'Bizimle Çalışın',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              letterSpacing: 0.27,
              color: AppTheme.black,
            ),
          ),
        ),
        const Divider(
          color: AppTheme.amber, 
          thickness: 2, 
          indent: 20, 
          endIndent: 320
        ),
        const SizedBox(height: 16),
         Flexible(
          child: ApplyCategoryList(
            callBack: () {
              moveToApply();
            },
          ),
        ),
      ],
    );
  }

  void moveToApply() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => DyerRegister(),
      ),
    );
  }
}





