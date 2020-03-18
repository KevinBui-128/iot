import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.keyboard_voice),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            color: Colors.blue[50],
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  Padding(
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
                              'Trạng thái chung',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              children: <Widget>[
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/lighton.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                    child: Container(
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
                              'Sân nhà và Gara',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              children: <Widget>[
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/lighton.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                    child: Container(
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
                              'Phòng khách',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Divider(),
                         Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              children: <Widget>[
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/lighton.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                    child: Container(
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
                              'Phòng ngủ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Divider(),
                         Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              children: <Widget>[
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/lighton.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                    child: Container(
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
                              'Phòng bếp',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              children: <Widget>[
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/lighton.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                    child: Container(
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
                              'Phòng tắm',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              children: <Widget>[
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/lighton.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset('assets/fanon.png',
                                            width: 50),
                                        Text(
                                          'Home',
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
                  ),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
