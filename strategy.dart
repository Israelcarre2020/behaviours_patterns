// Patrón Strategy

abstract class DiscountStrategy {
  double applyDiscount(double originalPrice);
}

class VIPDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double originalPrice) {
    return originalPrice * 0.8; // 20% discount
  }
}

class SeasonalDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double originalPrice) {
    return originalPrice * 0.9; // 10% discount
  }
}

class LaunchDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double originalPrice) {
    return originalPrice * 0.85; // 15% discount
  }
}

class Context {
  DiscountStrategy _strategy;

  Context(this._strategy);

  void setStrategy(DiscountStrategy strategy) {
    _strategy = strategy;
  }

  double calculateDiscountedPrice(double originalPrice) {
    return _strategy.applyDiscount(originalPrice);
  }
}

void main() {
  var context = Context(VIPDiscount());
  print('Price after VIP discount: \$${context.calculateDiscountedPrice(100)}');

  context.setStrategy(SeasonalDiscount());
  print(
      'Price after seasonal discount: \$${context.calculateDiscountedPrice(100)}');

  context.setStrategy(LaunchDiscount());
  print(
      'Price after launch discount: \$${context.calculateDiscountedPrice(100)}');
}
