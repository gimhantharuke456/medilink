import 'package:medilink/models/medicine.model.dart';
import 'package:medilink/models/user.model.dart';

class OrderMedicine {
  final int medicineId;
  final int quantity;
  final Medicine? medicine;

  OrderMedicine({
    required this.medicineId,
    required this.quantity,
    this.medicine,
  });

  // Convert OrderMedicine object to a Map
  Map<String, dynamic> toMap() {
    return {
      'medicineId': medicineId,
      'quantity': quantity,
    };
  }

  // Create OrderMedicine object from a Map
  factory OrderMedicine.fromMap(Map<String, dynamic> map) {
    return OrderMedicine(
        medicineId: map['medicineId'],
        quantity: map['quantity'],
        medicine: Medicine.fromMap(map['medicine']));
  }
}

class Order {
  final int? id; // Optional for creation, required for updates
  final int userId;
  final int pharmacyId;
  String status;
  final String paymentMethod;
  final String deliveryOption;
  final List<OrderMedicine> medicines;
  final int prescriptionId;
  final User? user;
  Order({
    this.id,
    required this.userId,
    required this.pharmacyId,
    this.status = 'pending',
    required this.paymentMethod,
    required this.deliveryOption,
    required this.medicines,
    required this.prescriptionId,
    this.user,
  });

  // Convert Order object to a Map
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'pharmacyId': pharmacyId,
      'status': status,
      'paymentMethod': paymentMethod,
      'deliveryOption': deliveryOption,
      'prescriptionId': prescriptionId,
    };
  }

  // Create Order object from a Map
  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
        id: map['id'],
        userId: map['userId'],
        pharmacyId: map['pharmacyId'],
        status: map['status'],
        paymentMethod: map['paymentMethod'],
        deliveryOption: map['deliveryOption'],
        medicines: (map['orderMedicines'] as List)
            .map((medicine) => OrderMedicine.fromMap(medicine))
            .toList(),
        prescriptionId: map['prescriptionId'] ?? 1,
        user: User.fromMap(map['user']));
  }
}
