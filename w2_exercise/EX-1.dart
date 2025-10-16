enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);

  @override
  String toString() {
    return '$street, $city. $zipCode';
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

  Employee.mobileDeveloper(
    String name,
    Address address,
    int years,
  ) : _name = name,
      _baseSalary = 40000,
      _skills = [Skill.FLUTTER, Skill.DART],
      _address = address,
      _yearsOfExperience = years;

  // Getter
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary(){
    double salary = _baseSalary;
    salary += _yearsOfExperience * 2000;

    for(var skill in _skills){
      if(skill == Skill.FLUTTER){
        salary += 5000;
      }
      else if(skill == Skill.DART){
        salary += 3000;
      }
      else{
        salary += 1000;
      }
    }
    return salary;
  }

  void printDetails() {
    print('---------------------------------------');
    print('Name: $_name');
    print('Base Salary: \$$_baseSalary');
    print('Year of Experience: $_yearsOfExperience');
    print('Address: $_address');
    print('Skill: ${_skills.map((s) => s.name).join(', ')}');
    print('Total Salary: \$${computeSalary()}');
    print('---------------------------------------');
  }
}

void main() {
  var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.FLUTTER, Skill.OTHER],
    Address('123 St', 'Phnom Penh', '12000'),
    3,
  );

  var emp2 = Employee.mobileDeveloper(
    'Ronan',
    Address('456 Ave', 'Siem Reap', '17000'),
    5,
  );

  emp1.printDetails();
  emp2.printDetails();
}