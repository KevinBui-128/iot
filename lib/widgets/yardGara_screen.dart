import 'package:du_an_iot/blocs/home_bloc/home_bloc.dart';
import 'package:du_an_iot/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YardGatePage extends StatefulWidget {
  @override
  _YardGatePageState createState() => _YardGatePageState();
}

class _YardGatePageState extends State<YardGatePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is ErrorState) {}
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 15, 0, 5),
                      child: Text(
                        Utils.titleSanGara,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        // physics: (),
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<HomeBloc>(context)
                                    .add(PressBtnDoorYardEvent());
                              },
                              splashColor: Colors.red,
                              child: Center(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Image.asset(
                                        Utils.cuaNha
                                            ? Utils.moCua
                                            : Utils.dongCua,
                                        width: 50),
                                  ),
                                  Text(
                                    Utils.cuaNha ? Utils.cuaMo : Utils.cuaDong,
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              )),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<HomeBloc>(context)
                                    .add(PressBtnClothesYardEvent());
                              },
                              splashColor: Colors.red,
                              child: Center(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: Image.asset(
                                        Utils.quanAo
                                            ? Utils.phoiDo
                                            : Utils.thuDo,
                                        width: 50),
                                  ),
                                  Text(
                                    Utils.quanAo ? Utils.doPhoi : Utils.doThu,
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
