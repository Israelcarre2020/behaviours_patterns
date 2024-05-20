//Observer

abstract class IObserver {
  void update(Product product);
}

class Product {
  String name;
  double price;
  int stock;

  Product(this.name, this.price, this.stock);
}

class Publisher {
  List<IObserver> _observers = [];
  Product _product;

  Publisher(this._product);

  void subscribe(IObserver observer) {
    _observers.add(observer);
  }

  void unsubscribe(IObserver observer) {
    _observers.remove(observer);
  }

  void notifyObservers() {
    for (var observer in _observers) {
      observer.update(_product);
    }
  }

  void changeProductPrice(double newPrice) {
    _product.price = newPrice;
    notifyObservers();
  }

  void changeProductStock(int newStock) {
    _product.stock = newStock;
    notifyObservers();
  }
}

class PriceDisplay implements IObserver {
  void update(Product product) {
    print("New price for ${product.name}: ${product.price}");
  }
}

class StockDisplay implements IObserver {
  void update(Product product) {
    print("New stock for ${product.name}: ${product.stock}");
  }
}

void main() {
  var product = Product('Smartphone', 999.99, 10);
  var publisher = Publisher(product);

  var priceDisplay = PriceDisplay();
  var stockDisplay = StockDisplay();

  publisher.subscribe(priceDisplay);
  publisher.subscribe(stockDisplay);

  publisher.changeProductPrice(799.99); // Trigger updates
  publisher.changeProductStock(5); // Trigger updates
}
