import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_crypto/net/api.dart';
import 'package:test_crypto/net/flutterfire.dart';

import 'add_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _bitcoin = 0.0;
  double _ethereum = 0.0;
  double _tether = 0.0;

  @override
  void initState() {
    getValues();
  }

  getValues() async {
    _bitcoin = await getPrice('bitcoin');
    _ethereum = await getPrice('ethereum');
    _tether = await getPrice('tether');
    setState(() {});
  }

  getValue(String id, double amount) {
    if (id == 'bitcoin') {
      return _bitcoin * amount;
    }
    if (id == 'ethereum') {
      return _ethereum * amount;
    }
    if (id == 'tether') {
      return _tether * amount;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('Coins')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueAccent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Coin: ${document.id}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                              'USD: ${getValue(document.id, document.get('Amount')).toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                              )),
                          IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () async {
                                await deleteCoin(document.id);

                              })
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddView()));
        },
        child: const Icon(Icons.add, color: Colors.white60),
      ),
    );
  }
}
