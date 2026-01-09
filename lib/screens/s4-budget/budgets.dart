import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'budget_result.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  String selectedProvince = 'Phnom Penh';
  final TextEditingController amountController = TextEditingController();
  final List<String> provinces = [
    'Phnom Penh',
    'Siem Reap',
    'Battambang',
    'Kampot',
    'Kandal',
    'Takeo',
    'Kampong Cham',
    'Kampong Thom',
    'Kampong Speu',
    'Prey Veng',
    'Pursat',
    'Svay Rieng',
    'Ratanakiri',
    'Kratie',
    'Stung Treng',
    'Mondulkiri',
    'Preah Vihear',
    'Oudar Meanchey',
    'Koh Kong',
    'Sihanoukville',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Budget',
          style: TextStyle(color: Colors.teal, fontFamily: 'Serif'),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Color(0xFF4ECDC4)),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline, color: Color(0xFF4ECDC4)),
            onPressed: () {
              print("Saved: \$${amountController.text} for $selectedProvince");
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Budget saved!")));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'On Budget',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Text(
              'is not the problem any more',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            const SizedBox(height: 12),

            const Text('Select province:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedProvince,
                  isExpanded: true,
                  icon: const Icon(Icons.expand_more),
                  onChanged: (value) {
                    setState(() => selectedProvince = value!);
                  },
                  items:
                      provinces.map((province) {
                        return DropdownMenuItem(
                          value: province,
                          child: Text(province),
                        );
                      }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text('Input amount:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter amount',
                        prefixText: '\$',
                        prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed:
                      amountController.text.trim().isNotEmpty
                          ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => BudgetResultScreen(
                                      province: selectedProvince,
                                      amount: amountController.text.trim(),
                                    ),
                              ),
                            );
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor:
                        amountController.text.trim().isNotEmpty
                            ? const Color(0xFF4ECDC4)
                            : Colors.grey.shade400,
                  ),
                  child: const Text(
                    'GO',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Center(child: Image.asset('assets/images/folder.png', width: 160)),
          ],
        ),
      ),
    );
  }
}
