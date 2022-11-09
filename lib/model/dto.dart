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

class Organization {
  final String name;

  const Organization({
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Organization &&
          runtimeType == other.runtimeType &&
          name == other.name);

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'Organization{' + ' name: $name,' + '}';
  }

  Organization copyWith({
    String? name,
  }) {
    return Organization(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
    };
  }

  factory Organization.fromMap(Map<String, dynamic> map) {
    return Organization(
      name: map['name'] as String,
    );
  }
}

var organizations = <Organization>[
  const Organization(name: '360 Complete Calibration - Concord'),
  const Organization(name: '3M Center'),
  const Organization(name: '518 Collision'),
  const Organization(name: 'A-1 Body & Frame (DCF Collision Repair LLC)'),
  const Organization(name: 'A Auto Body'),
  const Organization(name: 'Absolute Collision Center-Monkey Junction'),
  const Organization(name: 'BETA - ProCare - AMM Menchaca #1'),
];

class Notification {
  final String title;
  final String subtitle;

  const Notification({
    required this.title,
    required this.subtitle,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notification &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          subtitle == other.subtitle);

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode;

  @override
  String toString() {
    return 'Notification{' + ' title: $title,' + ' subtitle: $subtitle,' + '}';
  }

  Notification copyWith({
    String? title,
    String? subtitle,
  }) {
    return Notification(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'subtitle': this.subtitle,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
    );
  }
}

var notifications = <Notification>[
  const Notification(
    title: 'Notification Title 1',
    subtitle: 'Subtitle 1 of Notification',
  ),
  const Notification(
    title: 'Notification Title 2',
    subtitle: 'Subtitle 3 of Notification',
  ),
  const Notification(
    title: 'Notification Title 3',
    subtitle: 'Subtitle 3 of Notification',
  ),
  const Notification(
    title: 'Notification Title 4',
    subtitle: 'Subtitle 4 of Notification',
  ),
  const Notification(
    title: 'Notification Title 5',
    subtitle: 'Subtitle 5 of Notification',
  ),
  const Notification(
    title: 'Notification Title 6',
    subtitle: 'Subtitle 6 of Notification',
  ),
  const Notification(
    title: 'Notification Title 7',
    subtitle: 'Subtitle 7 of Notification',
  ),
];
