class FormValidator {
  static String? validateEmail(String? value) {
    if (value == null) {
      return "Please enter an email address.";
    } else if (value.isEmpty) {
      return 'Please enter an email address.';
    } else if (!RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null) {
      return 'Please enter a password.';
    } else if (value.isEmpty) {
      return 'Please enter a password.';
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value)) {
      return 'Password must be at least 8 characters long and contain at least one letter and one digit.';
    }
    return null;
  }

  static String? validateCPassword({String? value, required String password}) {
    if (value == null) {
      return 'Please enter a confirm password.';
    } else if (value.isEmpty) {
      return 'Please enter a confirm password.';
    } else if (value != password) {
      return 'Password should be same as confirm password.';
    }
    return null;
  }

  static String? emptyFieldValidator({String? value, String? fieldName}) {
    if (value == null) {
      return '${fieldName ?? "this"} Field is required.';
    } else if (value.isEmpty) {
      return '${fieldName ?? "this"} Field is required.';
    }
    return null;
  }

  static String? validateLinkedInUrl({String? value}) {
    if (value == null) {
      return 'LinkedIn Field is required.';
    } else if (value.isEmpty) {
      return 'LinkedIn Field is required.';
    }else if(!isValidLinkedInURL(value)){
      return "Please enter valid linked url";
    }
    return null;
  }

  static String? validateWebsiteUrl({String? value}) {
    if (value == null) {
      return 'Website Field is required.';
    } else if (value.isEmpty) {
      return 'Website Field is required.';
    }else if(!isValidWebsiteURL(value)){
      return "Please enter valid website url";
    }
    return null;
  }

  static String? emptyListValidator({List<dynamic>? value, String? fieldName}) {
    if (value == null) {
      return '${fieldName ?? "this"} Field is required.';
    } else if (value.isEmpty) {
      return '${fieldName ?? "this"} Field is required.';
    }
    return null;
  }

  static bool isValidLinkedInURL(String url) {
    RegExp regex = RegExp(
      r'^https:\/\/(www\.)?linkedin\.com\/in\/[a-zA-Z0-9_-]+\/?$',
    );
    return regex.hasMatch(url);
  }

  static bool isValidWebsiteURL(String url) {
    RegExp regex = RegExp(
      r'^(https?:\/\/)?(www\.)?[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})(\/\S*)?$',
    );
    return regex.hasMatch(url);
  }

  String? emptyAndLimitFieldValidator({
    required int minChar,
    required int maxChar,
    String? value,
    String? fieldName,
  }) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? "This"} field is required.';
    } else if (value.length < minChar) {
      return '${fieldName ?? "This"} field must be at least $minChar characters long.';
    } else if (value.length > maxChar) {
      return '${fieldName ?? "This"} field cannot exceed $maxChar characters.';
    }
    return null;
  }
  
}
