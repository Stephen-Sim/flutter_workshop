class Employee {
  final String name;
  final String email;
  final String address;
  final String department;
  final int id;

  Employee(
      {required this.name,
      required this.email,
      required this.address,
      required this.department,
      required this.id});

  // Create json to object transformer
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        name: json["name"],
        email: json["email"],
        address: json["address"],
        department: json["department"],
        id: json["id"]);
  }

  static List<Employee> employeesFromJson(dynamic json) {
    var searchResult = json["sheet1"]; // the name of array
    List<Employee> results = List.empty(growable: true);

    if (searchResult != null) {
      searchResult.forEach((v) => {results.add(Employee.fromJson(v))});
      return results;
    }
    return results;
  }
}
