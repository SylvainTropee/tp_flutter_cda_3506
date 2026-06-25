class Validators {

  static String? required(String? value){
    if(value == null || value.trim().isEmpty){
      return "Le champ est obligatoire !";
    }
    return null;
  }

}