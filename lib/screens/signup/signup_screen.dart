import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_clone/repositories/repositories.dart';
import 'package:flutter_instagram_clone/screens/signup/cubit/signup_cubit.dart';
import 'package:flutter_instagram_clone/widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/signup';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (BuildContext context) {
          return BlocProvider<SignupCubit>(
              create: (_) =>
                  SignupCubit(authRepository: context.read<AuthRepository>()),
              child: SignupScreen());
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
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state.status == SignupStatus.error) {
              showDialog(
                  context: context,
                  builder: (context) =>
                      ErrorDialog(content: state.failure.message));
            }
          },
          builder: (context, state) {
            return Scaffold(
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
                              'Ratstagram',
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12.0),
                            TextFormField(
                              decoration: InputDecoration(hintText: 'username'),
                              onChanged: (value) {
                                return context
                                    .read<SignupCubit>()
                                    .usernameChanged(value);
                              },
                              validator: (value) {
                                return (value.length < 3) ||
                                        (value.contains(' '))
                                    ? 'Must be at least be 3 characters with no spaces.'
                                    : null;
                              },
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              decoration: InputDecoration(hintText: 'email'),
                              onChanged: (value) {
                                return context
                                    .read<SignupCubit>()
                                    .emailChanged(value);
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
                              obscureText: true,
                              onChanged: (value) {
                                return context
                                    .read<SignupCubit>()
                                    .passwordChanged(value);
                              },
                              validator: (value) {
                                return value.length < 6
                                    ? 'Must be at least 6 characters.'
                                    : null;
                              },
                            ),
                            const SizedBox(height: 28.0),
                            ElevatedButton(
                              onPressed: () => _submitForm(
                                context,
                                state.status == SignupStatus.submitting,
                              ),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                elevation: 1.0,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                'Back to Login',
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
            );
          },
        ),
      ),
    );
  }

  void _submitForm(BuildContext context, bool isSubmitting) {
    if (_formKey.currentState.validate() && !isSubmitting) {
      context.read<SignupCubit>().signUpWithCredentials();
    }
  }
}
