import 'package:flutter/material.dart';

class PaymentGatewayPage extends StatefulWidget {
  const PaymentGatewayPage({super.key});

  @override
  State<PaymentGatewayPage> createState() => _PaymentGatewayPageState();
}

class _PaymentGatewayPageState extends State<PaymentGatewayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Razor Pay",
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30.0, left: 20, right: 20, bottom: 5),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Amount",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                color: Colors.blue,
                width: 130,
                child: const Center(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
