class LocationCoordinates {

  final Map<String, String> _locations = {

    // Historical and Cultural Places
    'Lalbagh Fort': '23.7196, 90.3881',
    'Ahsan Manzil': '23.7086, 90.4060',
    'Bangladesh National Museum': '23.7385, 90.3946',
    'Shaheed Minar': '23.7278, 90.4007',
    'Curzon Hall': '23.7296, 90.3960',
    'Ramna Park': '23.7371, 90.4016',

    // Religious Sites
    'Baitul Mukarram Mosque': '23.7274, 90.4126',
    'Star Mosque': '23.7105, 90.4018',
    'Dhakeshwari Temple': '23.7212, 90.3924',
    'Holy Rosary Church': '23.7368, 90.4040',
    'Armenian Church': '23.7086, 90.4063',

    // Parks and Recreational Spots
    'Hatirjheel': '23.7514, 90.4034',
    'Gulshan Lake Park': '23.7910, 90.4192',
    'Baldha Garden': '23.7104, 90.4238',
    'Botanical Garden and Zoo': '23.8151, 90.3563',
    'Shyamoli Children’s Park': '23.7760, 90.3692',

    // Shopping and Commercial Areas
    'Bashundhara City Shopping Mall': '23.7504, 90.3907',
    'Jamuna Future Park': '23.8145, 90.4252',
    'New Market': '23.7339, 90.3854',
    'Police Plaza Concord': '23.7916, 90.4184',
    'Pink City Shopping Mall': '23.7958, 90.4147',

    // Popular Restaurants and Cafes
    'Star Kabab & Restaurant': '23.7435, 90.3732',
    'Galito\'s': '23.7971, 90.4193',
    'Sultan\'s Dine': '23.7382, 90.3769',
    'BFC': '23.7490, 90.3860',
    'Purnima Restaurant': '23.7075, 90.4087',
    'Izumi': '23.7980, 90.4168',
    'Holey Artisan Bakery': '23.7948, 90.4182',
    'Aristocrat Coffee': '23.7912, 90.4119',

    // Universities and Institutions
    'Dhaka University': '23.7337, 90.3928',
    'BUET': '23.7271, 90.3927',
    'North South University': '23.8156, 90.4274',
    'BRAC University': '23.7802, 90.4077',
    'IBA': '23.7396, 90.3887',

    // Other Popular Locations
    'National Parliament House': '23.7629, 90.3783',
    'Suhrawardy Udyan': '23.7323, 90.4002',
    'TSC': '23.7333, 90.3920',
    'Hatirpool': '23.7418, 90.3850',
    'Shyamoli Square Market': '23.7683, 90.3752',

    // Cinema Halls
    'Star Cineplex': '23.7504, 90.3907',
    'Blockbuster Cinemas': '23.8145, 90.4252',
    'Balaka Cinema Hall': '23.7281, 90.4102',

    // Hotels and Resorts
    'Pan Pacific Sonargaon Dhaka': '23.7525, 90.3940',
    'The Westin Dhaka': '23.7946, 90.4174',
    'Radisson Blu Dhaka Water Garden': '23.8193, 90.4116',
    'Le Méridien Dhaka': '23.8311, 90.4107',

    // Recreational Clubs
    'Gulshan Club': '23.7954, 90.4186',
    'Dhaka Club': '23.7359, 90.4014',
    'Uttara Club': '23.8687, 90.3981'
  };

  String getCoordinates(String location) {

    return _locations[location] ?? 'Coordinates not found';
  }
}
