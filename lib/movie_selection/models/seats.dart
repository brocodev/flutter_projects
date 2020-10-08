class SeatsRowData {
  final int seats;
  final List<int> occupiedSeats;

  SeatsRowData({this.seats, this.occupiedSeats});

  static final seatsList = [
    SeatsRowData(seats: 8, occupiedSeats: [5]),
    SeatsRowData(seats: 10, occupiedSeats: []),
    SeatsRowData(seats: 10, occupiedSeats: [6]),
    SeatsRowData(seats: 10, occupiedSeats: [1, 2]),
    SeatsRowData(seats: 12, occupiedSeats: [3, 12]),
    SeatsRowData(seats: 12, occupiedSeats: [11, 12]),
    SeatsRowData(seats: 12, occupiedSeats: []),
    SeatsRowData(seats: 12, occupiedSeats: [12]),
  ];

  static final firstSeatsList = [
    SeatsRowData(seats: 2, occupiedSeats: []),
    SeatsRowData(seats: 2, occupiedSeats: []),
    SeatsRowData(seats: 2, occupiedSeats: []),
    SeatsRowData(seats: 2, occupiedSeats: [1, 2]),
  ];
}
