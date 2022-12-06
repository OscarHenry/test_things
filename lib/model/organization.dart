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
