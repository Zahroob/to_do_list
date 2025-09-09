import 'package:analog_clock/analog_clock.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/CarddViewTasks.dart';
import 'package:to_do_list/widgets/gradient_Background.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required String message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: const BoxDecoration(color: Color(0xFFCF7751)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Image.asset(
                      'assets/image/undraw_mobile_ux_o0e11.png',
                      height: 80,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black45,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 11),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(getGreetingMessage(), style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(height: 23),
              _getAnalogClock(),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Tasks List', style: TextStyle(fontSize: 12)),
                    Spacer(),
                    IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.logout),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              TasksCard(),
            ],
          ),
        ),
      ),
    );
  }

  AnalogClock _getAnalogClock() {
    return AnalogClock(
      decoration: BoxDecoration(
        color: Color(0XFFFFECE4),
        shape: BoxShape.circle,
      ),
      hourHandColor: Color(0XFFD36232),
      minuteHandColor: Color(0XFFBCB9B9),
      secondHandColor: Color(0XFFFAA27C),
      numberColor: Color(0XFFBE4713),
      showTicks: false,
      showDigitalClock: false,
      height: 120,
      width: 120,
    );
  }
}

String getGreetingMessage() {
  final hour = DateTime.now().hour;

  if (hour >= 5 && hour < 12) {
    return 'Good Morning';
  } else if (hour >= 12 && hour < 17) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
