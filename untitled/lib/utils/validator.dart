String whiteSpacePattern = r'^(?!.*[\s])';
RegExp whiteSpaceRegex = RegExp(whiteSpacePattern);
String digitPattern = r'^(?!.*[0-9])';
RegExp digitRegex = RegExp(digitPattern);

String? validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return "enter_the_email";
  } else if (value.contains(' ')) {
    return "spaces_not_allowed";
  } else if (!regex.hasMatch(value)) {
    return "please_enter_the_valid_email_address";
  } else {
    return null;
  }
}

String? validateBio(String value) {
  if (value.isEmpty) {
    return "please_enter_a_bio";
  } else {
    if (value.length > 125) {
      return "keep_it_short_upto_125_chars";
    } else {
      return null;
    }
  }
}

String? validatePassword(String value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return "please_enter_password";
  } else if (value.contains(' ')) {
    return "space_are_not_required";
  } else {
    return null;
  }
}
String? validateOldPassword(String value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return "please_enter_old_password";
  } else if (value.contains(' ')) {
    return "space_are_not_required";
  } else {
    return null;
  }
}
String? validateNewPassword(String value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return "please_enter_New_password";
  } else if (value.contains(' ')) {
    return "space_are_not_required";
  } else {
    return null;
  }
}


bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

String? validateConfirmPassword(String password, String value) {
  String passwordPattern = r'^((?!.*[\s])([a-zA-Z0-9]).{5,15})';
  RegExp passwordRegex = RegExp(passwordPattern);
  if (value.isEmpty) {
    return "confirm_new_password";
  } else if (value.contains(' ')) {
    return "spaces_not_allowed";
  } else if (!passwordRegex.hasMatch(value)) {
    return "enter_a_valid_password";
  } else if (password != value) {
    return "enter_a_same_password";
  } else {
    return null;
  }
}

String? validateFirstName(String value) {
  String namePattern = r'^([a-zA-Zäöüß-\s]+$)';

  RegExp nameRegex = RegExp(namePattern);

  if (value.trim().isEmpty) {
    return "please_add_first_name";
  } else if (!nameRegex.hasMatch(value.trim())) {
    return "please_enter_valid_name";
  } else {
    return null;
  }
}

String? validateFeedBack(String value) {
  if (value.trim().isEmpty) {
    return "please_add_some_text";
  } else {
    return null;
  }
}


String? validateInfo({required String value, required int length}) {
  if (value.isEmpty) {
    return "please_add_some_text";
  } else if(value.length > length) {
    return "you can add only $length characters";
  }else{
    return null;
  }
}

String? validateUserName(String value) {
  String namePattern = r'^(?=.{1,20}$)(?:[a-zA-Z\d]+(?:(?:\.|-|_)[a-zA-Z\d])*)+$';
  RegExp nameRegex = RegExp(namePattern);

  if (value.trim().isEmpty) {
    return "please_add_user_name";
  } else if (!nameRegex.hasMatch(value.trim())) {
    return "please_enter_valid_user_name";
  } else {
    return null;
  }
}

String? validateText(String value) {
  if (value.trim().isEmpty) {
    return "please_add_user_name";
  } else {
    return null;
  }
}

String? validateProfession(String value) {
  if (value.trim().isEmpty) {
    return "please_add_your_profession";
  } else {
    return null;
  }
}

String? validateFeedback(String value) {
  if (value.trim().isEmpty) {
    return "please_add_feedback";
  } else {
    return null;
  }
}

String? validateRelationship(String value) {
  if (value.trim().isEmpty) {
    return "please_relationship";
  } else {
    return null;
  }
}

String? validateBirthDate(String value) {
  String datePattern =   r'^([0]?[1-9]|[1|2][0-9]|[3][0|1])[.]([0]?[1-9]|[1][0-2])[.]([0-9]{4}|[0-9]{2})$';

  RegExp nameRegex = RegExp(datePattern);

  print('--------->>>>>>>>$value');
  if (value.trim().isEmpty) {
    return "please_add_birth_date";
  } else if (!nameRegex.hasMatch(value)) {
    return "please_enter_valid_birth_date";
  } else {
    return null;
  }
}

String? validateAge(String value) {

  print('--------->>>>>>>>$value');
  if (value.trim().isEmpty) {
    return "please_add_your_age";
  } else if (int.parse(value) > 120) {
    return "please_enter_valid_age";
  } else {
    return null;
  }
}

String? validateName(String value) {
  if (value.trim().isEmpty) {
    return "please_enter_name";
  } else {
    return null;
  }
}

String? validatePhoneNumber(String value) {
  if (value.isEmpty) {
    return "_enter_your_phone_number";
  } else if (value.length < 6 || value.length > 12) {
    return "_enter_the_validate_number";
  } else {
    return null;
  }
}

