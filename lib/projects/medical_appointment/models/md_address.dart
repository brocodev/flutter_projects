class MdAddress {
  const MdAddress({
    this.state,
    this.city,
    this.street,
    this.numberStreet,
    this.postalCode,
  });

  final String? city;
  final String? state;
  final String? street;
  final String? numberStreet;
  final String? postalCode;

  String getLongAddress() {
    return '$numberStreet $street, $city $postalCode';
  }

  static const sanFransisco = MdAddress(
    state: 'California',
    city: 'San Fransisco, CA',
    numberStreet: '1000',
    street: 'Commercial Street',
    postalCode: '94016',
  );
  static const springfield = MdAddress(
    state: 'Ohio',
    city: 'Springfield, OH',
    street: 'High Street',
    numberStreet: '501',
    postalCode: '45506',
  );
  static const rothschild = MdAddress(
    state: 'Wisconsin',
    city: 'Rothschild, WI',
    street: 'Imperial Ave',
    numberStreet: '501',
    postalCode: '54474',
  );
  static const midwestCity = MdAddress(
    state: 'Oklahoma',
    city: 'Midwest City, OK',
    street: 'National Ave',
    numberStreet: '8121',
    postalCode: '73110',
  );
  static const socorro = MdAddress(
    state: 'Nuevo Mexico',
    city: 'Socorro, NM',
    street: 'National Ave',
    numberStreet: '1202',
    postalCode: '87801',
  );
  static const brownwood = MdAddress(
    state: 'Texas',
    city: 'Brownwood, TX',
    street: 'Burnett Rd',
    numberStreet: '1501',
    postalCode: '76801',
  );
}
