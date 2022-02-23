class ReservedTableModel {
  ReservedTableModel({
    this.id,
    this.customerId,
    this.customerName,
    this.customerMobile,
    this.date,
    this.start,
    this.end,
    this.contractorId,
    this.contractor,
    this.tableId,
    this.tableName,
    this.tableCapacity,
    this.tableNumber,
    this.tableDetails,
    this.tablePrice,
  });

  int? id;
  int? customerId;
  String? customerName;
  String? customerMobile;
  String? date;
  String? start;
  String? end;
  int? contractorId;
  String? contractor;
  int? tableId;
  String? tableName;
  int? tableCapacity;
  int? tableNumber;
  String? tableDetails;
  int? tablePrice;

  factory ReservedTableModel.fromJson(Map<String, dynamic> json) => ReservedTableModel(
    id: json["id"],
    customerId: json["customer_id"],
    customerName: json["customer_name"],
    customerMobile: json["customer_mobile"],
    date: json["date"],
    start: json["start"],
    end: json["end"],
    contractorId: json["contractor_id"],
    contractor: json["contractor"],
    tableId: json["table_id"],
    tableName: json["table_name"],
    tableCapacity: json["table_capacity"],
    tableNumber: json["table_number"],
    tableDetails: json["table_details"],
    tablePrice: json["table_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "customer_name": customerName,
    "customer_mobile": customerMobile,
    "date": date,
    "start": start,
    "end": end,
    "contractor_id": contractorId,
    "contractor": contractor,
    "table_id": tableId,
    "table_name": tableName,
    "table_capacity": tableCapacity,
    "table_number": tableNumber,
    "table_details": tableDetails,
    "table_price": tablePrice,
  };
}
