final List<Map<String, String>> features = [
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
  {'icon': 'assets/icons/View.svg', 'label': 'River view'},
  {'icon': 'assets/icons/Kitchen.svg', 'label': 'Kitchen'},
  {'icon': 'assets/icons/Wifi.svg', 'label': 'Wifi'},
  {'icon': 'assets/icons/Car.svg', 'label': 'Free parking on premises'},
  {
    'icon': 'assets/icons/Arctic.svg',
    'label': 'AC - split type ductless system',
  },
];

class FeatureModel {
  final String icon;
  final String label;

  FeatureModel({required this.icon, required this.label});

  @override
  String toString() {
    return 'FeatureModel(icon: $icon, label: $label)';
  }

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      icon: json['icon'] as String,
      label: json['label'] as String,
    );
  }
}
