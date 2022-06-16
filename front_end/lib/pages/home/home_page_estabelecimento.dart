import 'package:flutter/material.dart';
import 'package:front_end/pages/home/home_company/company_appbar.dart';
import 'package:front_end/pages/home/home_company/company_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageEstabelecimento extends StatefulWidget {
  const HomePageEstabelecimento({Key? key}) : super(key: key);

  @override
  State<HomePageEstabelecimento> createState() => _HomePageEstabelecimento();
}

class _HomePageEstabelecimento extends State<HomePageEstabelecimento> {
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
