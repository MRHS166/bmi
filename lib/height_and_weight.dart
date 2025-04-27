import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CHAT_BOT/data/user_data.dart';


class HeightAndWeightPage extends StatefulWidget {
  @override
  _HeightAndWeightPageState createState() => _HeightAndWeightPageState();
}

class _HeightAndWeightPageState extends State<HeightAndWeightPage> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  String? _validateFloat(String? value, String label, double min, double max) {
    if (value == null || value.isEmpty) return '$label is required';
    final parsed = double.tryParse(value);
    if (parsed == null) return 'Enter a valid number';
    if (parsed < min || parsed > max) {
      return '$label must be between $min and $max';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Height & Weight',
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Enter your height (cm):',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'e.g. 170.5',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: (val) => _validateFloat(val, "Height", 50.0, 300.0),
              ),

              const SizedBox(height: 24),
              const Text(
                'Enter your weight (kg):',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'e.g. 68.2',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: (val) => _validateFloat(val, "Weight", 10.0, 300.0),
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    UserData.height = _heightController.text;
                    UserData.weight = _weightController.text;
                    Navigator.pushNamed(context, '/name'); // ✅ GO TO NAME SCREEN
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
