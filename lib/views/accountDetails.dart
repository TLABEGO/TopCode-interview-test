import 'package:flutter/material.dart';
import 'package:topcode_interview_test/model/accountModel.dart';
import 'package:topcode_interview_test/services/services.dart';

class AccountDetails extends StatefulWidget {

  final String id;
  AccountDetails({this.id});

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  bool get isEditing => widget.id != null;

  TextEditingController _accountNameController = TextEditingController();
  TextEditingController _balanceController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      Services().getAccountById(widget.id)
          .then((response) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit account' : 'Create new account')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : Column(
          children: <Widget>[
            TextField(
              controller: _accountNameController,
              decoration: InputDecoration(
                  hintText: 'Account name'
              ),
            ),

            Container(height: 8),

            TextField(
              controller: _accountNameController,
              decoration: InputDecoration(
                  hintText: 'Account name'
              ),
            ),

            Container(height: 16),

            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  if (isEditing) {
                    setState(() {
                      _isLoading = true;
                    });
                    final note = Account(
                        name: _accountNameController.text,
                        balance: double.parse(_balanceController.text)
                    );

                    setState(() {
                      _isLoading = false;
                    });

                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}