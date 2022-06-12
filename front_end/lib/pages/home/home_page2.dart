import 'package:flutter/material.dart';
import 'package:front_end/pages/home/home_company/company_appbar.dart';
import 'package:front_end/pages/home/home_company/company_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageTwo extends StatefulWidget {
  const HomePageTwo({Key? key}) : super(key: key);

  @override
  State<HomePageTwo> createState() => _HomePageTwo();
}

class _HomePageTwo extends State<HomePageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCompanyAppBar(),
      drawer: CompanyDrawer(),
      body: Column(
        children: [],
      ),
    );
  }
}

Future<bool> sair() async {
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  await sharedPreference.clear();
  return true;
}
