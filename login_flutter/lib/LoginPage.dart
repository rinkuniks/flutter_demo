import 'package:flutter/material.dart';
import 'dbmanager.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final DbManager dbmanager = new DbManager();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  User user;
  List<User> userList;
  int updateIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: new InputDecoration(labelText: 'Username'),
                    controller: _usernameController,
                    validator: (val) =>
                        val.isNotEmpty ? null : 'UserName Should Not Be empty',
                  ),
                  TextFormField(
                    decoration: new InputDecoration(labelText: 'Password'),
                    controller: _passwordController,
                    validator: (val) =>
                        val.isNotEmpty ? null : 'Password Should Not Be empty',
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    child: Container(
                        width: width * 0.9,
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () {
                      _submitUser(context);
                    },
                  ),
                  FutureBuilder(
                    future: dbmanager.getUserList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        userList = snapshot.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: userList == null ? 0 : userList.length,
                          itemBuilder: (BuildContext context, int index) {
                            User st = userList[index];
                            return Card(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: width * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Username: ${st.username}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          'Password: ${st.password}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _usernameController.text = st.username;
                                      _passwordController.text = st.password;
                                      user = st;
                                      updateIndex = index;
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      dbmanager.deleteUser(st.id);
                                      setState(() {
                                        userList.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return new CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitUser(BuildContext context) {
    if (_formKey.currentState.validate()) {
      if (User == null) {
        User st = new User(
            username: _usernameController.text,
            password: _passwordController.text);
        dbmanager.insertUsers(st).then((id) => {
              _usernameController.clear(),
              _passwordController.clear(),
              print('User Added to Db $id')
            });
      } else {
        user.username = _usernameController.text;
        user.password = _passwordController.text;

        dbmanager.updateUser(user).then((id) => {
              setState(() {
                userList[updateIndex].username = _usernameController.text;
                userList[updateIndex].password = _passwordController.text;
              }),
              _usernameController.clear(),
              _passwordController.clear(),
              user = null
            });
      }
    }
  }
}
