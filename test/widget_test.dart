// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app_matchx/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {



      group("_widgetTest", () { //Creating group test for 2 scenarios
            testWidgets("When User Submits the Form by leaving 'Country' field empty, Then error message is displayed", (WidgetTester tester) async{
                  //Build widget
                  await tester.pumpWidget(MyApp());
                  await tester.pumpAndSettle();

                  //Entering all fields in form
                  await tester.enterText(find.byKey(Key('firstNameTextField')), "First"); //Entering First Name
                  await tester.enterText(find.byKey(Key('lastNameTextField')), "Last"); //Entering Last Name
                  await tester.enterText(find.byKey(Key('emailTextField')), "abc@def.com"); //Entering email Address
                  await tester.enterText(find.byKey(Key('phoneNumberTextField')), "+9199999999"); //Entering Phone Number
                  await tester.enterText(find.byKey(Key('currentCompanyTextField')), "Company"); //Entering Company Name
                  await tester.enterText(find.byKey(Key('cityTextField')), "City"); //Entering City
                  await tester.pump();
                  //await tester.enterText(find.byKey(Key('countryTextField'), skipOffstage: false), "Country"); //NOT entering Country which is OffStage
                  await tester.pump();
                  await tester.enterText(find.byKey(Key('dobTextField'), skipOffstage: false), "04/04/1991");//Entering Date of Birth which is OffStage
                  await tester.pump();


                  //locate submit button and scroll until button is visible
                  final buttonFinder = find.byKey(Key('submitButton'), skipOffstage: false);
                  await tester.scrollUntilVisible(buttonFinder, -200.0, maxScrolls: 200);
                  expect(find.byKey(Key('submitButton')), findsOneWidget);
                  await tester.tap(buttonFinder); // tap submit button
                  await tester.pump(); //Refresh frame

                  //Verify error message on country TextFormField widget
                  expect(find.text('Please enter your current residing Country'), findsOneWidget);

            });

            testWidgets("When User types in all fields and press Submit button, Then Verify expected message", (WidgetTester tester) async{
                  //Build widget
                  await tester.pumpWidget(MyApp());
                  await tester.pumpAndSettle();

                  //Entering all fields in form
                  await tester.enterText(find.byKey(Key('firstNameTextField')), "First"); //Entering First Name
                  await tester.enterText(find.byKey(Key('lastNameTextField')), "Last"); //Entering Last Name
                  await tester.enterText(find.byKey(Key('emailTextField')), "abc@def.com"); //Entering email Address
                  await tester.enterText(find.byKey(Key('phoneNumberTextField')), "+9199999999"); //Entering Phone Number
                  await tester.enterText(find.byKey(Key('currentCompanyTextField')), "Company"); //Entering Company Name
                  await tester.enterText(find.byKey(Key('cityTextField')), "City"); //Entering City
                  await tester.pump();
                  await tester.enterText(find.byKey(Key('countryTextField'), skipOffstage: false), "Country"); //Entering Country which is OffStage
                  await tester.pump();
                  await tester.enterText(find.byKey(Key('dobTextField'), skipOffstage: false), "04/04/1991");//Entering Date of Birth which is OffStage
                  await tester.pump();


                  //locate submit button and scroll until button is visible
                  final buttonFinder = find.byKey(Key('submitButton'), skipOffstage: false);
                  await tester.scrollUntilVisible(buttonFinder, -200.0, maxScrolls: 200);
                  expect(find.byKey(Key('submitButton')), findsOneWidget);
                  await tester.tap(buttonFinder); //tap submit button
                  await tester.pump(); //Refresh frame

                  //Verify error message on country TextFormField widget
                  expect(find.text('Data is in processing.'), findsOneWidget);




            });
      });

}
