class Device {
  final String vin;
  final int year;
  final String make;
  final String model;
  final bool isConnected;

  const Device({
    required this.vin,
    required this.year,
    required this.make,
    required this.model,
    required this.isConnected,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Device &&
          runtimeType == other.runtimeType &&
          vin == other.vin &&
          year == other.year &&
          make == other.make &&
          model == other.model &&
          isConnected == other.isConnected);

  @override
  int get hashCode =>
      vin.hashCode ^
      year.hashCode ^
      make.hashCode ^
      model.hashCode ^
      isConnected.hashCode;

  @override
  String toString() {
    return 'Device{' +
        ' vin: $vin,' +
        ' year: $year,' +
        ' make: $make,' +
        ' model: $model,' +
        ' isConnected: $isConnected,' +
        '}';
  }

  Device copyWith({
    String? vin,
    int? year,
    String? make,
    String? model,
    bool? isConnected,
  }) {
    return Device(
      vin: vin ?? this.vin,
      year: year ?? this.year,
      make: make ?? this.make,
      model: model ?? this.model,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vin': this.vin,
      'year': this.year,
      'make': this.make,
      'model': this.model,
      'isConnected': this.isConnected,
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      vin: map['vin'] as String,
      year: map['year'] as int,
      make: map['make'] as String,
      model: map['model'] as String,
      isConnected: map['isConnected'] as bool,
    );
  }
}

var devices = <Device>[
  const Device(
    vin: 'ASDWQEQW3445',
    year: 2022,
    make: 'Honda',
    model: 'Civic',
    isConnected: true,
  ),
  const Device(
    vin: 'ASDFG54322345',
    year: 2020,
    make: 'Audi',
    model: 'A4',
    isConnected: true,
  ),
  const Device(
    vin: 'ASDVFR42345',
    year: 2019,
    make: 'Kia',
    model: '206',
    isConnected: true,
  ),
  const Device(
    vin: '23ED354322345',
    year: 2015,
    make: 'Toyota',
    model: 'Supra',
    isConnected: true,
  ),
  const Device(
    vin: 'ACDFRG54322345',
    year: 2015,
    make: 'Ford',
    model: 'F-150',
    isConnected: true,
  ),
  const Device(
    vin: 'AXCXEQ4322345',
    year: 2020,
    make: 'Lamborgini',
    model: 'Diablo',
    isConnected: true,
  ),
  const Device(
    vin: '12FG543DDDDDD',
    year: 2022,
    make: 'Lada',
    model: '2101',
    isConnected: true,
  ),
];
