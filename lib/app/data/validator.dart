mixin Validator {
  String? emailValidation(String value) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == '') {
      return 'Please enter email.';
    } else if (regExp.hasMatch(value)) {
      return null;
    } else {
      return 'Enter valid email.';
    }
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  String? validatePasswordSameOrNot(String password, String reEnterPassword) {
    if (password == reEnterPassword) {
      return null;
    } else {
      return 'Password does not match!';
    }
  }

  String? emptyValidation(String value, String key) {
    if (value.isEmpty) {
      return '$key can not be empty';
    } else {
      return null;
    }
  }
}
