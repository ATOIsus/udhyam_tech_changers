class OrderInfo {
  String status;
  String contact;
  String Location;

  OrderInfo(
      {required this.status, required this.contact, required this.Location});
}

class Order {
  var orders = <OrderInfo>[
    OrderInfo(
        status: 'ongoing', contact: '9484754838', Location: 'Balaju,Kathmandu'),
    OrderInfo(
        status: 'Completed', contact: '9484754839', Location: 'Gurko,Lalitpur'),
    OrderInfo(
        status: 'Declined',
        contact: '9484754830',
        Location: 'Lolang,Kathmandu'),
    OrderInfo(
        status: 'Pending',
        contact: '9484754831',
        Location: 'Samakhusi,Kathmandu')
  ];
}
