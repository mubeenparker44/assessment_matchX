# assessment_matchX

- 2 Widget test scenario are covered in group test in widget_test.dart

- Test 1: User gets an error message when country value is not entered and user tas submit button
- Test 2: User is displayed data processing message when all fields are filled and clicks on Submit button

Functions used to test widgets
  - pumpWidget() - Renders the UI from the given widget
  - pumpAndSettle() - Refreshes the widget after an action is taken
  - pump() - Refreshes the frame after an action is taken
  - enterText - used to enter value in the fields
  - find.byKey - Used to find required widget (skipOffStage is used to locate out of frame widgets)
  - expect - Used to determine presence of widget
  - tap - used to click on widget
  - find.text - Used to verify the message displayed on widget

Few enhancements made to main.dart for warnings thrown by complier
- RaisedButton changed to ElevatedButton
- Scaffold changed ScaffoldMessenger