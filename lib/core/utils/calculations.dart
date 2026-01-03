class CalculationUtils {
  static double commission(int qty, double ratePerKg) {
    return qty * 20;
  }

  static double totalAmount(int qty, double rate) {
    return qty * rate;
  }

  static double pending(double total, double paid) {
    return total - paid;
  }
}
