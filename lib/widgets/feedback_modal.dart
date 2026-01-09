import 'package:flutter/material.dart';

class FeedbackModal extends StatelessWidget {
  const FeedbackModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const Text("FeedBack", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),

          const SizedBox(height: 10),

          const Text("Rate Your Experience", style: TextStyle(fontWeight: FontWeight.bold)),
          const Text("Are you Satisfied with the Service?", style: TextStyle(fontSize: 12, color: Colors.grey)),

          const SizedBox(height: 10),

          // Stars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (_) => const Icon(Icons.star_border, size: 30)),
          ),

          const SizedBox(height: 20),

          // Chips section
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Tell us what can be Improved?", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _chip("Overall Service", selected: true),
              _chip("Customer Support"),
              _chip("Speed and Efficiency"),
              _chip("Repair Quality"),
              _chip("Pickup and Delivery Service"),
              _chip("Transparency"),
            ],
          ),

          const SizedBox(height: 20),

          // Feedback box
          TextField(
            maxLines: 6,
            decoration: InputDecoration(
              hintText: "Tell us on how can we improve more",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.teal),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Submit", style: TextStyle(color: Colors.teal)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF4ECDC4) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: selected ? Colors.white : Colors.black87),
      ),
    );
  }
}
