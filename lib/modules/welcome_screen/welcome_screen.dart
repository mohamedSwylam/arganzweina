import 'package:arganzwina_app/modules/Login/shop_login_screen.dart';
import 'package:arganzwina_app/modules/register/register_screen.dart';
import 'package:arganzwina_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                  child: Image(
              image: AssetImage('assets/images/login.png'),
            ),
                )),
            Text(
              'Welcome to our Arganzwina app',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: MaterialButton(
                onPressed: () {
                  navigateAndFinish(context, StoreLoginScreen());
                },
                child: Text('LOGIN'),
                height: 50,
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: MaterialButton(
                onPressed: () {
                  navigateAndFinish(context, StoreRegisterScreen());
                },
                child: Text('SIGN UP'),
                height: 50,
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
