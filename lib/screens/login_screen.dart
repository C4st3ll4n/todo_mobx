import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todomobx/store/login_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore _loginStore = LoginStore();
  ReactionDisposer reactionDisposer;
  @override
  void didChangeDependencies() {
    
    super.didChangeDependencies();
    
      //FORMA 1
      /*
    autorun((r){
      print("Tem gente ? ${_loginStore.isLogged}");
      
      
      if(_loginStore.isLogged){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ListScreen()));
      }
    });
      */

    reactionDisposer = reaction((_)=>_loginStore.isLogged, (logged){
      logged?Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ListScreen())):null;
    });
  }
  
  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      name: "email",
                      builder: (_) => CustomTextField(
                        hint: 'E-mail',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged:(newEmail)=> _loginStore.updateEmail(newEmail),
                        enabled: !_loginStore.isLoading,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      name: "Senha",
                      builder: (_) => CustomTextField(
                        hint: 'Senha',
                        prefix: Icon(Icons.lock),
                        obscure: _loginStore.visiblePassword,
                        onChanged: _loginStore.updatePassword,
                        enabled: !_loginStore.isLoading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: _loginStore.visiblePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onTap: _loginStore.changeVisibilty,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      name: "Login",
                      builder: (_) => SizedBox(
                        height: 44,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: _loginStore.isLoading
                              ? CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                )
                              : Text('Login'),
                          color: Theme.of(context).primaryColor,
                          disabledColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                          textColor: Colors.white,
                          onPressed: _loginStore.loginPressed,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
