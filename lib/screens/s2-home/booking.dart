import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String email = '';
  String roomType = '';
  DateTime? arriveDate;
  DateTime bookingDate = DateTime.now();
  String specialRequest = '';

  final List<String> roomTypes = ['Single', 'Double', 'Suite'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showDialog(context: context, builder: (context) => _buildPaymentDialog());
    }
  }

  Widget _buildPaymentDialog() {
    String formattedDate =
        arriveDate != null
            ? DateFormat("dd MMM yyyy").format(arriveDate!)
            : "N/A";
    String formattedTime = DateFormat("hh:mm a").format(bookingDate);
    String fullName = "$firstName $lastName";
    String code = "Code-${firstName.toLowerCase()}-${roomType.toLowerCase()}";

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF24C7B0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Text(
              code,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name      : $fullName"),
                      Text("Email     : $email"),
                      Text("Room      : $roomType"),
                      Text("Arrive    : $formattedDate"),
                      Text("Booking   : $formattedTime"),
                      const SizedBox(height: 8),
                      Text(
                        "Request   : ${specialRequest.isEmpty ? "None" : specialRequest}",
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text("Scan QR"),
                    const SizedBox(height: 4),
                    Image.asset(
                      "assets/images/qr.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF24C7B0),
                side: const BorderSide(color: Color(0xFF24C7B0)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text("Confirm"),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickArriveDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: arriveDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => arriveDate = picked);
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Color(0xFF24C7B0),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF24C7B0)),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF24C7B0)),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF24C7B0)),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildInput(String label, void Function(String) onSaved) {
    return TextFormField(
      decoration: _inputDecoration(label),
      onSaved: (val) => onSaved(val ?? ''),
      validator: (val) => val == null || val.isEmpty ? "Required" : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 0,
  automaticallyImplyLeading: false,
  titleSpacing: 0,
  title: Row(
    children: [
      IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      const Text(
        "Your Booking",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ),
),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("Name", style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              _buildInput("Firstname", (val) => firstName = val),
              const SizedBox(height: 8),
              _buildInput("Lastname", (val) => lastName = val),
              const SizedBox(height: 16),
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildInput("Email", (val) => email = val),
              const SizedBox(height: 16),
              const Text(
                "Room Type",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: _inputDecoration("Select room type"),
                items:
                    roomTypes
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
                onChanged: (val) => roomType = val ?? '',
                validator:
                    (val) =>
                        val == null || val.isEmpty ? "Select a room" : null,
              ),
              const SizedBox(height: 16),
              const Text(
                "Arrive Date",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickArriveDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: _inputDecoration(
                      "Choose date you arrive",
                    ).copyWith(suffixIcon: const Icon(Icons.calendar_today)),
                    controller: TextEditingController(
                      text:
                          arriveDate == null
                              ? ''
                              : DateFormat("dd/MM/yyyy").format(arriveDate!),
                    ),
                    validator: (_) => arriveDate == null ? "Pick a date" : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Booking Date",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                readOnly: true,
                decoration: _inputDecoration(
                  "Today's date",
                ).copyWith(suffixIcon: const Icon(Icons.calendar_today)),
                initialValue: DateFormat("dd/MM/yyyy").format(bookingDate),
              ),
              const SizedBox(height: 16),
              const Text(
                "Special Request",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 4,
                decoration: _inputDecoration(""),
                onSaved: (val) => specialRequest = val ?? '',
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF24C7B0),
                    side: const BorderSide(color: Color(0xFF24C7B0)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size.fromHeight(50), // full-width
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
