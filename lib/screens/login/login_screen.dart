import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: const Duration(seconds: 0),
        pageBuilder: (BuildContext context, Animation<double> animDouble1,
            Animation<double> animDouble2) {
          return LoginScreen();
        });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
              child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Goztagram',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'email'),
                          onChanged: (value) {
                            return print(value);
                          },
                          validator: (value) {
                            return !value.contains('@')
                                ? 'Please enter a valid email.'
                                : null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'password'),
                          onChanged: (value) {
                            return print(value);
                          },
                          validator: (value) {
                            return value.length < 6
                                ? 'Must be at least 6 characters.'
                                : null;
                          },
                        ),
                        const SizedBox(height: 28.0),
                        ElevatedButton(
                          onPressed: () => print('Login'),
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            elevation: 1.0,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        ElevatedButton(
                          onPressed: () => print('Navigate to signup screen'),
                          child: Text(
                            'No account? Sign up.',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            elevation: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          )),
        ),
      ),
    );
  }
}
