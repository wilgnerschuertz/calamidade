class {{name.pascalCase()}}Adapter {
  static Map<String, dynamic> toJson({{name.pascalCase()}}Entity register) {
  
    return {
      'name': name,     
    };
  }
}
