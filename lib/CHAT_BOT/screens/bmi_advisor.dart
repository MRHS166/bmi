import 'package:bmi_project/CHAT_BOT/data/user_data.dart';
import 'package:flutter/material.dart';
import '../services/gemini_service.dart';

class BmiAdvisorScreen extends StatefulWidget {
  const BmiAdvisorScreen({Key? key}) : super(key: key);

  @override
  State<BmiAdvisorScreen> createState() => _BmiAdvisorScreenState();
}

class _BmiAdvisorScreenState extends State<BmiAdvisorScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = []; // Stores chat messages
  bool _isLoading = false;

  Future<void> _sendQuery() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({'sender': 'user', 'text': userMessage});
      _isLoading = true;
    });

    _controller.clear();

    final result = await GeminiService.sendQuery(
      data: [
        {
          "fullName": UserData.fullName,
          "age": UserData.age,
          "gender": UserData.gender,
          "weight": UserData.weight,
          "height": UserData.height,
          "bmi": UserData.bmi,
        }
      ],
      userQuery: userMessage,
      systemContext: '''
You are an experienced physician specializing in obesity.
1. Start by analyzing the data based on height, weight, BMI, age, and gender.
2. Then, recommend the patient's diet and exercise regimens.
3. Gather all the information and ultimately arrive at a preliminary diagnosis.
4. Estimate the percentage of obesity-related risk factors.
5.make your answer concise and briefly responds 
''',
      responseFormat: '',
    );

    setState(() {
      _isLoading = false;
      _messages.add({'sender': 'bot', 'text': result ?? 'No response received.'});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('BMI Advisor', style: TextStyle(color: Colors.yellow)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['sender'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.yellow : Colors.grey[800],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      message['text'] ?? '',
                      style: TextStyle(
                        color: isUser ? Colors.black : Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Type your question...',
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.black),
                    onPressed: _isLoading ? null : _sendQuery,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
