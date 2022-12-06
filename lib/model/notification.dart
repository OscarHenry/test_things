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
