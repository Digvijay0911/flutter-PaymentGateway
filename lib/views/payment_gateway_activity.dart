import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGatewayPage extends StatefulWidget {
  const PaymentGatewayPage({super.key});

  @override
  State<PaymentGatewayPage> createState() => _PaymentGatewayPageState();
}

class _PaymentGatewayPageState extends State<PaymentGatewayPage> {
  // ----------------------------------------------------------------------------
  Razorpay? razorpay;
  TextEditingController amountController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

// __________________________________________

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();
    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }
// __________________________________________

  @override
  void dispose() {
    super.dispose();
    razorpay?.clear();
  }
// __________________________________________

  void openCheckout() {
    var options = {
      "key": "rzp_test_rQLXVovjEGxf6D",
      "amount": num.parse(amountController.text) *
          100, // convert in int and multiply by 100
      "name": "DSP SHOP",
      "description": "Payment for the product",
      "prefill": {
        "contact": "7083428118",
        "email": "dsp8118@gmail.com",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay?.open(options);
    } catch (e) {
      print("Your Exception --> ${e.toString()}");
    }
  }

// __________________________________________

  void handlerPaymentSuccess() {
    print("Payment success");
  }

  void handlerErrorFailure() {
    print("Payment error");
  }

  void handlerExternalWallet() {
    print("External wallet");
  }

  // ============================================================================
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
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: amountController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Amount";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter Amount",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    print("Validation is done");
                    openCheckout();
                  }
                },
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
      ),
    );
  }
}
