class FormValidation {
  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter e-mail';
    } else if (!regex.hasMatch(value))
      return 'Enter valid e-mail';
    else
      return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return "Password must be more than 6 characters";
    }
    return null;
  }

  String? validateFullName(String value) {
    String pattern = r'^[a-zA-Z]{3,}(?: [a-zA-Z]+){0,5}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter full name';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid name';
    } else
      return null;
  }
}
