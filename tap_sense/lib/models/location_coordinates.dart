class LocationCoordinates {
  final Map<String, String> _locations = {
    // Historical and Cultural Places
    'LALBAGH FORT': '23.7196, 90.3881',
    'AHSAN MANZIL': '23.7086, 90.4060',
    'BANGLADESH NATIONAL MUSEUM': '23.7385, 90.3946',
    'SHAHID MINAR': '23.7278, 90.4007',
    'RAMNA PARK': '23.7371, 90.4016',

    // Religious Sites
    'STAR MOSQUE': '23.7105, 90.4018',
    'DHAKESHWARI TEMPLE': '23.7212, 90.3924',
    'ARMENIAN CHURCH': '23.7086, 90.4063',

    // Parks and Recreational Spots
    'GULSHAN LAKE PARK': '23.7910, 90.4192',
    'BOTANICAL GARDEN AND ZOO': '23.8151, 90.3563',

    // Shopping and Commercial Areas
    'RIFLE\'S SQUARE': '23.738396955473505, 90.37724402546665',
    'BASHUNDHARA CITY SHOPPING MALL': '23.7504, 90.3907',
    'JAMUNA FUTURE PARK': '23.8145, 90.4252',
    'NEW MARKET': '23.7339, 90.3854',
    'PINK CITY SHOPPING MALL': '23.7958, 90.4147',

    // Popular Restaurants and Cafes
    'NORTH END COFFEE': '23.79409127170401, 90.40644158562134',
    'STAR KABAB & RESTAURANT': '23.7435, 90.3732',
    'GALITO\'S': '23.800458211871184, 90.41226311164925',
    'SULTAN\'S DINE': '23.7382, 90.3769',
    'BFC': '23.7490, 90.3860',
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
    'TSC': '23.7333, 90.3920',

    // Cinema Halls
    'STAR CINEPLEX': '23.7504, 90.3907',
    'BLOCKBUSTER CINEMAS': '23.8145, 90.4252',
    'BALAKA CINEMA HALL': '23.7281, 90.4102',

    // Hotels and Resorts
    'PAN PACIFIC DHAKA': '23.7525, 90.3940',
    'THE WESTIN DHAKA': '23.7946, 90.4174',
    'RADISSON BLU DHAKA WATER GARDEN': '23.8193, 90.4116',

    // Recreational Clubs
    'GULSHAN CLUB': '23.7954, 90.4186',
    'DHAKA CLUB': '23.7359, 90.4014',
  };

  String getCoordinates(String location) {
    return _locations[location] ?? 'Coordinates not found';
  }

  List<String> getLocationNames() {
    return _locations.keys.toList();
  }
}