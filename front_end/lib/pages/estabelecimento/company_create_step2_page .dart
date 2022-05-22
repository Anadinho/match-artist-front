import 'package:flutter/material.dart';

import '../../components/custom_colors.dart';

class CompanyCreateStepOne extends StatefulWidget {
  CompanyCreateStepOne({Key? key}) : super(key: key);

  @override
  State<CompanyCreateStepOne> createState() => _CompanyCreateStepOne();
}

class _CompanyCreateStepOne extends State<CompanyCreateStepOne> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //todoRepository.getTodoList().then((value) {
    //setState(() {
    ///  todos = value;
    // });
    //});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: CustomColors().getBackGround()),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage('lib/ui/assets/logo.png'),
                      width: 120,
                      color: Colors.blue[700],
                    ),
                    SizedBox(height: 16),
                    Text('Cadastro',
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                        )),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.work,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'CNPJ',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.home_work_rounded,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Telefone',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Logradouro',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.gps_fixed,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Complemento',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.work,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Descrição',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.work,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Descrição',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.work,
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('CADASTRAR'),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff00056b),
                                padding: EdgeInsets.all(14)),
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('VOLTAR LOGIN'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red, padding: EdgeInsets.all(14)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
