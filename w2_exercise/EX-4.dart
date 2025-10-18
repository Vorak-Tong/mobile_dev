enum DeliveryMethod {Delivery, Pickup}

class Product{
  final String _id;
  final String _name;
  final double _price;

  Product(
    {
      required String id,
      required String name,
      required double price
    }
  ) : _id = id,
      _name = name,
      _price = price;

  String get id => _id;
  String get name => _name;
  double get price => _price;
}

class OrderItem{
  final Product _product;
  final int _quantity;

  OrderItem(
    {
      required Product product,
      required int quantity
    }
  ) : _product = product,
      _quantity = quantity;

  Product get product => _product;
  int get quantity => _quantity;

  double subTotal() => _product.price * _quantity;
}

class Address{
  final String _street;
  final String _homeNo;
  final String _district;
  final String _commune;
  final String _cityProvince;

  Address(
    {
      required String street,
      required String homeNo,
      required String district,
      required String commune,
      required String cityProvince,
    }
  ) : _street = street,
      _homeNo = homeNo,
      _district = district,
      _commune = commune,
      _cityProvince = cityProvince;

  String get street => _street;
  String get homeNo => _homeNo;
  String get district => _district;
  String get commune => _commune;
  String get cityProvince => _cityProvince;

    @override
  String toString() {
    return '$_street, $_homeNo, $_district, $_commune, $cityProvince';
  }
}

class Customer{
  final String _name;
  final String _phone;
  final Address _address;

  Customer(
    {
      required String name,
      required String phone,
      required Address address,
    }
  ) : _name = name,
      _phone = phone,
      _address = address;

  String get name => _name;
  String get phone => _phone;
  Address get address => _address;
}

class Order{
  final List<OrderItem> _items = [];
  final Customer _customer;
  final DeliveryMethod _deliveryMethod;

  Order(
    {
      required Customer customer,
      required DeliveryMethod deliveryMethod,
    }
  ) : _customer = customer,
      _deliveryMethod = deliveryMethod;

  List<OrderItem> get items => List.unmodifiable(_items);
  Customer get customer => _customer;
  DeliveryMethod get deliveryMethod => _deliveryMethod;

  void addItem(Product product, int quantity){
    _items.add(OrderItem(product: product, quantity: quantity));
  }

  double get totalAmount{
    double amount = 0;
    for(var item in _items){
      amount += item.subTotal();
    }
    if(_deliveryMethod == DeliveryMethod.Delivery){
      amount += 1.5;
    }
    return amount;
  }

  void printReciept(){
    print('=======================================');
    print('               Reciept');
    print('=======================================');
    print('Customer: ${_customer._name}');
    print('Phone: ${_customer._phone}');
    print('Delivery Method: ${_deliveryMethod.name}');
    if(_deliveryMethod == DeliveryMethod.Delivery){
      print('Delivery Address: ${_customer._address}');
    }
    print('---------------------------------------');
    for(var item in _items){
      print('${item.product.name} x ${item.quantity} = \$${item.subTotal().toStringAsFixed(2)}');
    }
    print('---------------------------------------');
    print('Total: \$${totalAmount.toStringAsFixed(2)}');
    print('=======================================');
  }
}

void main() {
  var laptop = Product(id: 'P1', name: 'Laptop', price: 1000);
  var mouse = Product(id: 'P2', name: 'Mouse', price: 25);
  var keyboard = Product(id: 'P3', name: 'Keyboard', price: 50);

  var address = Address(
    street: '101',
    homeNo: '82E',
    district: 'Kakab',
    commune: 'Posenchey',
    cityProvince: 'Phnom Penh',
  );

  var customer = Customer(
    name: 'Vorak',
    phone: '012345678',
    address: address,
  );

  var order = Order(
    customer: customer,
    deliveryMethod: DeliveryMethod.Delivery,
  );

  order.addItem(laptop, 1);
  order.addItem(mouse, 2);
  order.addItem(keyboard, 1);

  order.printReciept();
}
