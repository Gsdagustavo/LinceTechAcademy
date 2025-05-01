/// This class contains simple methods for validation
abstract class Validator {
  ///  Name validation
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Nome inválido';
    }

    return null;
  }

  ///  Email validation
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty || !email.contains('@')) {
      return 'Email inválido';
    }

    return null;
  }

  ///  Phone number validation
  static String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Telefone inválido';
    }

    return null;
  }

  ///  Github link validation
  static String? validateGithubLink(String? github) {
    if (github == null || github.isEmpty || !github.contains('https://github.com/')) {
      return 'Link Github inválido';
    }

    return null;
  }
}
