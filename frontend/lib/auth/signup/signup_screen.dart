import 'package:astro/auth/signup/bloc/signup_bloc.dart';
import 'package:astro/core/widgets/custom_button.dart';
import 'package:astro/core/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _shopAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _buildFirstPage(context),
          _buildSecondPage(context),
        ],
      ),
    );
  }

  Widget _buildFirstPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Create Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          LoginTextField(
            controller: _firstNameController,
            labelText: 'First Name',
          ),
          SizedBox(height: 10),
          LoginTextField(
            controller: _middleNameController,
            labelText: 'Middle Name',
          ),
          SizedBox(height: 10),
          LoginTextField(
            controller: _lastNameController,
            labelText: 'Last Name',
          ),
          SizedBox(height: 10),
          LoginTextField(
            controller: _emailController,
            labelText: 'Email',
          ),
          SizedBox(height: 10),
          LoginTextField(
            controller: _phoneController,
            labelText: 'Phone Number',
          ),
          SizedBox(height: 10),
          LoginTextField(
            controller: _passwordController,
            labelText: 'Password',
            obscureText: true,
          ),
          SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            text: 'Next',
          ),
        ],
      ),
    );
  }

  Widget _buildSecondPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Shop Details',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          LoginTextField(
            controller: _shopNameController,
            labelText: 'Shop Name',
          ),
          SizedBox(height: 10),
          LoginTextField(
            controller: _shopAddressController,
            labelText: 'Shop Address',
          ),
          SizedBox(height: 10),
          CustomButton(
            onPressed: () {
              // Handle GPS location fetching here
            },
            text: 'Get Location',
          ),
          SizedBox(height: 20),
          BlocConsumer<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is SignupFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              } else if (state is SignupSuccess) {
                context.go('/home');
              }
            },
            builder: (context, state) {
              if (state is SignupLoading) {
                return CircularProgressIndicator();
              }
              return CustomButton(
                onPressed: () {
                  context.read<SignupBloc>().add(
                        SignupButtonPressed(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                },
                text: 'Sign Up',
              );
            },
          ),
        ],
      ),
    );
  }
}
