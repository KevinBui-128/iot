import 'package:du_an_iot/blocs/home_bloc/home_bloc.dart';
import 'package:du_an_iot/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateHomePage extends StatefulWidget {
  @override
  _StateHomePageState createState() => _StateHomePageState();
}

class _StateHomePageState extends State<StateHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        Utils.titleTrangThaiChung,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    // Container(
                    //   padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                    //   height: 150,
                    //   child: Card(
                    //     color: nguon ? Colors.green[200] : Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(15.0),
                    //     ),
                    //     child: InkWell(
                    //       onTap: () {
                    //         vNguon();
                    //       },
                    //       // splashColor: Colors.red,
                    //       child: Center(
                    //           child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: <Widget>[
                    //           Padding(
                    //             padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    //             child:
                    //                 Image.asset(nguon ? batNguon : tatNguon, width: 50),
                    //           ),
                    //           Text(
                    //             nguon ? nguonBat : nguonTat,
                    //             style: TextStyle(
                    //               fontSize: 15,
                    //             ),
                    //           )
                    //         ],
                    //       )),
                    //     ),
                    //   ),
                    // ),
                    Card(
                      margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        color: Colors.white12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(Utils.titleSanGara,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(Utils.titleDen,
                                              style: TextStyle(
                                                fontSize: 15,
                                              )),
                                          Text(
                                              Utils.denSan
                                                  ? Utils.titleBat
                                                  : Utils.titleTat,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Utils.denSan
                                                      ? Colors.green
                                                      : Colors.red)),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text('',
                                              style: TextStyle(
                                                fontSize: 15,
                                              )),
                                          Text("",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(Utils.titlePhongKhach,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(Utils.titleDen,
                                              style: TextStyle(
                                                fontSize: 15,
                                              )),
                                          Text(
                                              Utils.denKhach
                                                  ? Utils.titleBat
                                                  : Utils.titleTat,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Utils.denKhach
                                                      ? Colors.green
                                                      : Colors.red)),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(Utils.titleQuat,
                                              style: TextStyle(
                                                fontSize: 15,
                                              )),
                                          Text(
                                              Utils.quatKhach
                                                  ? Utils.titleBat
                                                  : Utils.titleTat,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Utils.quatKhach
                                                      ? Colors.green
                                                      : Colors.red)),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(Utils.titlePhongNgu,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(Utils.titleDen,
                                              style: TextStyle(
                                                fontSize: 15,
                                              )),
                                          Text(
                                              Utils.denNgu
                                                  ? Utils.titleBat
                                                  : Utils.titleTat,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Utils.denNgu
                                                      ? Colors.green
                                                      : Colors.red)),
                                        ],
                                      ),
                                      // Row(
                                      //   children: <Widget>[
                                      //     Text(Utils.titleQuat,
                                      //         style: TextStyle(
                                      //           fontSize: 15,
                                      //         )),
                                      //     Text(
                                      //         Utils.quatNgu
                                      //             ? Utils.titleBat
                                      //             : Utils.titleTat,
                                      //         style: TextStyle(
                                      //             fontSize: 15,
                                      //             fontWeight: FontWeight.bold,
                                      //             color: Utils.quatNgu
                                      //                 ? Colors.green
                                      //                 : Colors.red)),
                                      //   ],
                                      // ),

                                      Row(
                                        children: <Widget>[
                                          Text('',
                                              style: TextStyle(
                                                fontSize: 15,
                                              )),
                                          Text("",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            //   child: Column(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceEvenly,
                            //     children: <Widget>[
                            //       Text(Utils.titlePhongBep,
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontWeight: FontWeight.bold)),
                            //       Container(
                            //         child: Column(
                            //           children: <Widget>[
                            //             Row(
                            //               children: <Widget>[
                            //                 Text(Utils.titleDen,
                            //                     style: TextStyle(
                            //                       fontSize: 15,
                            //                     )),
                            //                 Text(
                            //                     Utils.denBep
                            //                         ? Utils.titleBat
                            //                         : Utils.titleTat,
                            //                     style: TextStyle(
                            //                         fontSize: 15,
                            //                         fontWeight: FontWeight.bold,
                            //                         color: Utils.denBep
                            //                             ? Colors.green
                            //                             : Colors.red)),
                            //               ],
                            //             ),
                            //             Row(
                            //               children: <Widget>[
                            //                 Text(Utils.titleQuat,
                            //                     style: TextStyle(
                            //                       fontSize: 15,
                            //                     )),
                            //                 Text(
                            //                     Utils.quatBep
                            //                         ? Utils.titleBat
                            //                         : Utils.titleTat,
                            //                     style: TextStyle(
                            //                         fontSize: 15,
                            //                         fontWeight: FontWeight.bold,
                            //                         color: Utils.quatBep
                            //                             ? Colors.green
                            //                             : Colors.red)),
                            //               ],
                            //             )
                            //           ],
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                            //   child: Column(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceEvenly,
                            //     children: <Widget>[
                            //       Text(Utils.titlePhongTam,
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontWeight: FontWeight.bold)),
                            //       Container(
                            //         child: Column(
                            //           children: <Widget>[
                            //             Row(
                            //               children: <Widget>[
                            //                 Text(Utils.titleDen,
                            //                     style: TextStyle(
                            //                       fontSize: 15,
                            //                     )),
                            //                 Text(
                            //                     Utils.denTam
                            //                         ? Utils.titleBat
                            //                         : Utils.titleTat,
                            //                     style: TextStyle(
                            //                         fontSize: 15,
                            //                         fontWeight: FontWeight.bold,
                            //                         color: Utils.denTam
                            //                             ? Colors.green
                            //                             : Colors.red)),
                            //               ],
                            //             ),
                            //             Row(
                            //               children: <Widget>[
                            //                 Text('',
                            //                     style: TextStyle(
                            //                       fontSize: 15,
                            //                     )),
                            //                 Text("",
                            //                     style: TextStyle(
                            //                         fontSize: 15,
                            //                         fontWeight: FontWeight.bold,
                            //                         color: Colors.green)),
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(13, 10, 13, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.white12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(Utils.titleNhietDo,
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                Text(Utils.nhietDo,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(Utils.titleDoAm,
                                    style: TextStyle(fontSize: 15)),
                                Text(Utils.doAm,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(Utils.titleKhiGas,
                                    style: TextStyle(fontSize: 15)),
                                Text(Utils.khiGas,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple))
                              ],
                            ),
                          ],
                        ),
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
