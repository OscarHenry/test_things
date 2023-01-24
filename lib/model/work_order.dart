class WorkOrder {
  WorkOrder({
    required this.woId,
    required this.ro,
    required this.year,
    required this.make,
    required this.model,
    required this.serviceRequest,
    required this.status,
    required this.date,
    this.isSelected = false,
  });

  final String woId;
  final String ro;
  final String year;
  final String make;
  final String model;
  final ServiceRequest serviceRequest;
  final Status status;
  final DateTime date;
  bool isSelected;
}

var wOrders = List.generate(
  100,
  (index) => WorkOrder(
    woId: '$index',
    ro: 'ro$index',
    year: 'year${index.clamp(0, 10)}',
    make: 'make${index.clamp(0, 10)}',
    model: 'model${index.clamp(0, 10)}',
    serviceRequest: ServiceRequest.values.getRandom(),
    status: Status.values.getRandom(),
    date: DateTime.now().add(Duration(days: index)),
  ),
);

enum ServiceRequest {
  adasThink,
  postRepairScan,
  preRepairScan,
  calibration;
}

enum Status {
  completed,
  submitted,
  voided,
}

extension ListExt<T> on List<T> {
  T getRandom() {
    toList().shuffle();
    return first;
  }
}
