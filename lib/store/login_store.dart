import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((r) {
      print("e:$email");
      print(password);
      print(isLoading);
      print(visiblePassword);
    });
  }
  
  @observable
  bool isLogged = false;

  @observable
  String email = "";
  
  @observable
  String password = "";
  
  @observable
  bool isLoading = false;
  
  @observable
  bool visiblePassword = false;
  
  @action
  void changeVisibilty(){
  	visiblePassword = !visiblePassword;
  }

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isValid => isEmailValid && isPasswordValid;

  @action
  void updateEmail(String newEmail) => email = newEmail;

  @action
  void updatePassword(String newPassword) => password = newPassword;
  
  @action
  Future<void> login() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading = !true;
    
    isLogged = true;
  }
  
  @computed
  Function get loginPressed => (isValid &&  !isLoading)? login : null;
  
  
}
