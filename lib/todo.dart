class Todo{
  String details;
  DateTime createdTime, updatedTime;
  String status;

  Todo({required this.details, required this.createdTime, required this.updatedTime, this.status = 'pending'});
}
