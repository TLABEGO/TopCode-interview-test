import 'package:flutter/material.dart';
import 'package:topcode_interview_test/services/services.dart';
import 'package:topcode_interview_test/views/accountDetails.dart';

class AccountList extends StatefulWidget {
  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {

  Services accountServices = Services();

  bool _isLoading = false;


  @override
  void initState() {
    fetchAccount();
    super.initState();
  }

  fetchAccount() async {
    setState(() {
      _isLoading = true;
    });

    accountServices.getAccountList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Account List')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AccountDetails()))
                .then((_) {
              fetchAccount();
            });
          },
          child: Icon(Icons.add),
        ),
        body: Builder(
          builder: (_) {
            if (_isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: Colors.green),
              itemBuilder: (context, index) {
                return ;
              },
            );
          },
        ));
  }
}