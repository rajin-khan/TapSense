class LocationCoordinates {
  final Map<String, String> _locations = {
    // Historical and Cultural Places
    'LALBAGH FORT': '23.7196, 90.3881',
    'AHSAN MANZIL': '23.7086, 90.4060',
    'BANGLADESH NATIONAL MUSEUM': '23.7385, 90.3946',
    'SHAHID MINAR': '23.7278, 90.4007',
    'CURZON HALL': '23.7296, 90.3960',
    'RAMNA PARK': '23.7371, 90.4016',

    // Religious Sites
    'BAITUL MUKARRAM MOSQUE': '23.7274, 90.4126',
    'STAR MOSQUE': '23.7105, 90.4018',
    'DHAKESHWARI TEMPLE': '23.7212, 90.3924',
    'HOLY ROSARY CHURCH': '23.7368, 90.4040',
    'ARMENIAN CHURCH': '23.7086, 90.4063',

    // Parks and Recreational Spots
    'HATIRJHEEL': '23.7514, 90.4034',
    'GULSHAN LAKE PARK': '23.7910, 90.4192',
    'BALDHA GARDEN': '23.7104, 90.4238',
    'BOTANICAL GARDEN AND ZOO': '23.8151, 90.3563',
    'SHYAMOLI CHILDREN’S PARK': '23.7760, 90.3692',

    // Shopping and Commercial Areas
    'BASHUNDHARA CITY SHOPPING MALL': '23.7504, 90.3907',
    'JAMUNA FUTURE PARK': '23.8145, 90.4252',
    'NEW MARKET': '23.7339, 90.3854',
    'POLICE PLAZA CONCORD': '23.7916, 90.4184',
    'PINK CITY SHOPPING MALL': '23.7958, 90.4147',

    // Popular Restaurants and Cafes
    'STAR KABAB & RESTAURANT': '23.7435, 90.3732',
    'GALITO\'S': '23.7971, 90.4193',
    'SULTAN\'S DINE': '23.7382, 90.3769',
    'BFC': '23.7490, 90.3860',
    'PURNIMA RESTAURANT': '23.7075, 90.4087',
    'IZUMI': '23.7980, 90.4168',
    'HOLEY ARTISAN BAKERY': '23.7948, 90.4182',
    'ARISTOCRAT COFFEE': '23.7912, 90.4119',

    // Universities and Institutions
    'DHAKA UNIVERSITY': '23.7337, 90.3928',
    'BUET': '23.7271, 90.3927',
    'NORTH SOUTH UNIVERSITY': '23.8156, 90.4274',
    'BRAC UNIVERSITY': '23.7802, 90.4077',
    'IBA': '23.7396, 90.3887',

    // Other Popular Locations
    'NATIONAL PARLIAMENT HOUSE': '23.7629, 90.3783',
    'SUHRAWARDY UDYAN': '23.7323, 90.4002',
    'TSC': '23.7333, 90.3920',
    'HATIRPOOL': '23.7418, 90.3850',
    'SHYAMOLI SQUARE MARKET': '23.7683, 90.3752',

    // Cinema Halls
    'STAR CINEPLEX': '23.7504, 90.3907',
    'BLOCKBUSTER CINEMAS': '23.8145, 90.4252',
    'BALAKA CINEMA HALL': '23.7281, 90.4102',

    // Hotels and Resorts
    'PAN PACIFIC SONARGAON DHAKA': '23.7525, 90.3940',
    'THE WESTIN DHAKA': '23.7946, 90.4174',
    'RADISSON BLU DHAKA WATER GARDEN': '23.8193, 90.4116',
    'LE MÉRIDIEN DHAKA': '23.8311, 90.4107',

    // Recreational Clubs
    'GULSHAN CLUB': '23.7954, 90.4186',
    'DHAKA CLUB': '23.7359, 90.4014',
    'UTTARA CLUB': '23.8687, 90.3981'
  };

  String getCoordinates(String location) {
    return _locations[location] ?? 'Coordinates not found';
  }

  List<String> getLocationNames() {
    return _locations.keys.toList();
  }
}