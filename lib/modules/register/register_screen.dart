import 'package:arganzwina_app/layout/shop_layout.dart';
import 'package:arganzwina_app/modules/Login/shop_login_screen.dart';
import 'package:arganzwina_app/shared/components/components.dart';
import 'package:arganzwina_app/shared/components/constants.dart';
import 'package:arganzwina_app/shared/network/local/cache_helper.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class StoreRegisterScreen extends StatelessWidget {
  var nameController =TextEditingController();
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  var phoneController =TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StoreRegisterCubit(),
      child: BlocConsumer< StoreRegisterCubit , StoreRegisterStates>(
       listener: (context,state){
         if(state is StoreRegisterSuccessState){
           if(state.registerModel.status){
             print(state.registerModel.message);
             print(state.registerModel.data.token);
             CacheHelper.saveData(key: 'token', value: state.registerModel.data.token).then((value) {
               token =state.registerModel.data.token ;
               navigateAndFinish(context, StoreLayout());
             });
           } else{
             print(state.registerModel.message);
             showToast(text: state.registerModel.message, state: ToastState.ERROR);
           }
         }
       },
       builder: (context,state){
         return Scaffold(
             appBar: AppBar(),
             body: Center(
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Form(
                     key: formKey,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text(
                           'تسجيل حساب جديد',
                           style: Theme.of(context).textTheme.headline6.copyWith(
                               color: Colors.teal, fontWeight: FontWeight.bold),
                         ),
                         SizedBox(
                           height: 20,
                         ),
                         Text(
                           'ادخل بياناتك بشكل صحيح',
                           style: Theme.of(context).textTheme.bodyText1,
                         ),
                         SizedBox(
                           height: 40,
                         ),
                         defaultFormFiled(
                           controller: emailController,
                           type: TextInputType.emailAddress,
                           label: 'ادخل البريد الاكتروني',
                           prefix: Icons.email_outlined,
                           validate: (String value) {
                             if (value.isEmpty) {
                               return 'ادخل بريدك الاكتروني الصحيح';
                             } else {
                               return null;
                             }
                           },
                         ),
                         SizedBox(
                           height: 20,
                         ),
                         defaultFormFiled(
                           controller: passwordController,
                           type: TextInputType.visiblePassword,
                           label: 'ادخل كلمه المرور',
                           isPassword: StoreRegisterCubit.get(context).isPasswordShown,

                           onSubmit: (value) {

                           },
                           suffix:  StoreRegisterCubit.get(context).suffix,
                           suffixPressed: () {
                             StoreRegisterCubit.get(context).changePasswordVisibility();
                           },
                           prefix: Icons.lock,
                           validate: (String value) {
                             if (value.isEmpty) {
                               return 'كلمه المرور غير صالحه';
                             } else {
                               return null;
                             }
                           },
                         ),
                         SizedBox(
                           height: 20,
                         ),
                         defaultFormFiled(
                           controller: passwordController,
                           type: TextInputType.visiblePassword,
                           label: 'تاكيد كلمه المرور',
                           isPassword: StoreRegisterCubit.get(context).isPasswordShown,

                           onSubmit: (value) {

                           },
                           suffix:  StoreRegisterCubit.get(context).suffix,
                           suffixPressed: () {
                             StoreRegisterCubit.get(context).changePasswordVisibility();
                           },
                           prefix: Icons.lock,
                           validate: (String value) {
                             if (value.isEmpty) {
                               return 'كلمه المرور غير صالحه';
                             } else {
                               return null;
                             }
                           },
                         ),
                         SizedBox(
                           height: 20,
                         ),
                         Container(
                           alignment: Alignment.bottomRight,
                           child: TextButton(
                             onPressed: () {
                               navigateAndFinish(context, StoreLoginScreen());
                             },
                             child: Text(
                               'تسجيل دخول ؟',
                               style: TextStyle(
                                 fontWeight: FontWeight.w900,
                                 fontSize: 16,
                                 color: Color.fromRGBO(0, 0, 255, .7),
                               ),
                             ),
                           ),
                         ),

                         ConditionalBuilder(
                           condition: state is! StoreRegisterLoadingState,
                           builder: (context) {
                             return defaultButtom(
                                 function: () {
                                   if(formKey.currentState.validate()){
                                     StoreRegisterCubit.get(context).userRegister(
                                         email: emailController.text,
                                         password: passwordController.text,
                                     );
                                   }
                                 }, text: 'دخول', isupperCase: true);
                           },
                           fallback: (context) => Center(child: CircularProgressIndicator()
                           ),),
                         SizedBox(
                           height: 15,
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
         );
       },
      ),
    );
  }
}
