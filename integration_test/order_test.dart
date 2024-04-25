import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer/main.dart';
import 'package:flutter_deer/order/page/order_page.dart';
import 'package:flutter_deer/res/constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:screenshot/screenshot.dart';

import '../test_driver/tools/test_utils.dart';

///  flutter drive --driver integration_test/integration_test.dart --target integration_test/order_test.dart

/*
  Validated: The `dragFrom` function can replace `drag` function without an issue.
  TODO: Learn the distance available for scrolling, and use that in dragFrom.
*/

// // First approach: get a single scrollable widget and drag it
// final scrollable = find.byType(Scrollable);
// final screenSize = tester.getSize(scrollable);

// // Drag from top to bottom with a slight offset to ensure enough movement
// await tester.dragFrom(screenSize.centerLeft(Offset(0.0, 50.0)), screenSize.centerRight(Offset(0.0, -50.0)));
// await tester.pumpAndSettle(); // Wait for UI to rebuild after scroll

// await tester.dragFrom(const Offset(250, 400), const Offset(0, -500));

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // On iPhone: use the original resolution
  // On iPad: times the resolution by 2
  const screenSize = Size(750, 1334);

  group('订单部分：', () {

    Constant.isDriverTest = true;

    tearDown(() {
      debugPrint('< Success');
    });

    // Success
    // testWidgets('订单页测试',(WidgetTester tester) async {
    //   runApp(MyApp(home: const OrderPage()));
    //   await tester.pumpAndSettle();

    //   expect(find.text('接单'), findsAtLeastNWidgets(3));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));

    //   await tester.tap(find.text('待配送'));
    //   await tester.pumpAndSettle();

    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});

    //   expect(find.text('开始配送'), findsAtLeastNWidgets(3));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));

    //   await tester.tap(find.text('待完成'));
    //   await tester.pumpAndSettle();
      
    //   expect(find.text('完成'), findsAtLeastNWidgets(3));
    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});

    //   await tester.tap(find.text('已完成'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});

    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));

    //   await tester.tap(find.text('已取消'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});

    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));

    //   await tester.tap(find.text('新订单'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});

    //   expect(find.text('接单'), findsAtLeastNWidgets(3));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));

    //   await tester.dragFrom(const Offset(250, 400), const Offset(0, -500));
    //   await tester.pumpAndSettle();
    // });

    // Success
    // testWidgets('订单页测试，带滚动',(WidgetTester tester) async {
    //   runApp(MyApp(home: const OrderPage()));
    //   await tester.pumpAndSettle();

    //   expect(find.text('接单'), findsAtLeastNWidgets(3));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));

    //   await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

    //   await tester.pumpAndSettle();
      
    //   await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

    //   await tester.pumpAndSettle();
      
    //   await tester.tap(find.text('待配送'));
    //   await tester.pumpAndSettle();

    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   expect(find.text('开始配送'), findsAtLeastNWidgets(3));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));

    //   await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

    //   await tester.pumpAndSettle();
      
    //   await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

    //   await tester.pumpAndSettle();
      

    //   await tester.tap(find.text('待完成'));
    //   await tester.pumpAndSettle();
      
    //   expect(find.text('完成'), findsAtLeastNWidgets(3));
    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

    //   await tester.pumpAndSettle();
      
    //   await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

    //   await tester.pumpAndSettle();
      
    //   await tester.tap(find.text('已完成'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));

    //   await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

    //   await tester.pumpAndSettle();
      
    //   await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

    //   await tester.pumpAndSettle();
      

    //   await tester.tap(find.text('已取消'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

    //   await tester.pumpAndSettle();
      
    //   await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

    //   await tester.pumpAndSettle();
      
    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));

    //   await tester.tap(find.text('新订单'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   expect(find.text('接单'), findsAtLeastNWidgets(3));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(3));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(3));
    //   await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

    //   await tester.pumpAndSettle();
      
    //   await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

    //   await tester.pumpAndSettle();
    // });

    // Success
    // testWidgets('订单页测试，带本页多重滚动',(WidgetTester tester) async {
    //   runApp(MyApp(home: const OrderPage()));
    //   // tester.binding.window.physicalSizeTestValue = const Size(1440, 800);
    //   await tester.pumpAndSettle();

    //   expect(find.text('接单'), findsAtLeastNWidgets(1));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));

    //   await scrollEachItem(tester);

    //   await tester.pumpAndSettle();
      
    //   await tester.tap(find.text('待配送'));
    //   await tester.pumpAndSettle();

    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   expect(find.text('开始配送'), findsAtLeastNWidgets(1));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));

    //   await scrollEachItem(tester);

    //   await tester.pumpAndSettle();

    //   await tester.tap(find.text('待完成'));
    //   await tester.pumpAndSettle();
      
    //   expect(find.text('完成'), findsAtLeastNWidgets(1));
    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   await scrollEachItem(tester);

    //   await tester.pumpAndSettle();
      
    //   await tester.tap(find.text('已完成'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));

    //   await scrollEachItem(tester);

    //   await tester.pumpAndSettle();

    //   await tester.tap(find.text('已取消'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   await scrollEachItem(tester);

    //   await tester.pumpAndSettle();
      
    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));

    //   await tester.tap(find.text('新订单'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   expect(find.text('接单'), findsAtLeastNWidgets(1));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));

    //   await tester.pumpAndSettle();
    // });

    // Success
    // testWidgets('订单页测试，带本页多重滚动，外加客制化屏幕大小(暂定1440 * 800)',(WidgetTester tester) async {
    //   runApp(MyApp(home: const OrderPage()));
    //   tester.binding.window.physicalSizeTestValue = const Size(1440, 800);
    //   await tester.pumpAndSettle();

    //   expect(find.text('接单'), findsAtLeastNWidgets(1));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));

    //   await scrollEachItem(tester);

    //   await tester.pumpAndSettle();
      
    //   await tester.tap(find.text('待配送'));
    //   await tester.pumpAndSettle();

    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   expect(find.text('开始配送'), findsAtLeastNWidgets(1));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));

    //   await scrollEachItem(tester);

    //   await tester.pumpAndSettle();

    //   await tester.tap(find.text('待完成'));
    //   await tester.pumpAndSettle();
      
    //   expect(find.text('完成'), findsAtLeastNWidgets(1));
    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   await scrollEachItem(tester);

    //   await tester.pumpAndSettle();
      
    //   await tester.tap(find.text('已完成'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));

    //   await scrollEachItem(tester);

    //   await tester.pumpAndSettle();

    //   await tester.tap(find.text('已取消'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   await scrollEachItem(tester);

    //   await tester.pumpAndSettle();
      
    //   expect(find.text('订单跟踪'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));

    //   await tester.tap(find.text('新订单'));
    //   await tester.pumpAndSettle();
      
    //   // Wait for 3 seconds, specifying the completed value type (void)
    //   // await Future.delayed(const Duration(seconds: 3), () {});
    //   expect(find.text('接单'), findsAtLeastNWidgets(1));
    //   expect(find.text('拒单'), findsAtLeastNWidgets(1));
    //   expect(find.text('联系客户'), findsAtLeastNWidgets(1));

    //   await tester.pumpAndSettle();
    // });

    // Completed
    testWidgets('订单页测试，带本页多重滚动，外加客制化屏幕大小，再带个截图',(WidgetTester tester) async {

      final ScreenshotController screenshotController = ScreenshotController();

      num currentNo = 0;
      
      runApp(MyApp(home: 
        Screenshot(
          controller: screenshotController,
          child: const OrderPage()
        )
      ));
      // 桌面端可以在iPad上测试，但是在iPhone上不行
      tester.binding.window.physicalSizeTestValue = screenSize;
      // tester.binding.window.physicalSizeTestValue = const Size(780, 1688);
      await tester.pumpAndSettle();

      expect(find.text('接单'), findsAtLeastNWidgets(1));
      expect(find.text('拒单'), findsAtLeastNWidgets(1));
      expect(find.text('联系客户'), findsAtLeastNWidgets(1));

      currentNo = await scrollEachItem(tester, screenshotController, currentNo);

      print('currentNo: $currentNo');

      await tester.pumpAndSettle();
      
      await tester.tap(find.text('待配送'));
      await tester.pumpAndSettle();

      // Wait for 3 seconds, specifying the completed value type (void)
      // await Future.delayed(const Duration(seconds: 3), () {});
      expect(find.text('开始配送'), findsAtLeastNWidgets(1));
      expect(find.text('拒单'), findsAtLeastNWidgets(1));
      expect(find.text('联系客户'), findsAtLeastNWidgets(1));

      currentNo = await scrollEachItem(tester, screenshotController, currentNo);

      print('currentNo: $currentNo');

      await tester.pumpAndSettle();

      await tester.tap(find.text('待完成'));
      await tester.pumpAndSettle();
      
      expect(find.text('完成'), findsAtLeastNWidgets(1));
      expect(find.text('订单跟踪'), findsAtLeastNWidgets(1));
      expect(find.text('联系客户'), findsAtLeastNWidgets(1));
      
      // Wait for 3 seconds, specifying the completed value type (void)
      // await Future.delayed(const Duration(seconds: 3), () {});
      currentNo = await scrollEachItem(tester, screenshotController, currentNo);

      print('currentNo: $currentNo');

      await tester.pumpAndSettle();
      
      await tester.tap(find.text('已完成'));
      await tester.pumpAndSettle();
      
      // Wait for 3 seconds, specifying the completed value type (void)
      // await Future.delayed(const Duration(seconds: 3), () {});
      expect(find.text('订单跟踪'), findsAtLeastNWidgets(1));
      expect(find.text('联系客户'), findsAtLeastNWidgets(1));

      currentNo = await scrollEachItem(tester, screenshotController, currentNo);

      print('currentNo: $currentNo');

      await tester.pumpAndSettle();

      await tester.tap(find.text('已取消'));
      await tester.pumpAndSettle();
      
      // Wait for 3 seconds, specifying the completed value type (void)
      // await Future.delayed(const Duration(seconds: 3), () {});
      currentNo = await scrollEachItem(tester, screenshotController, currentNo);

      print('currentNo: $currentNo');

      await tester.pumpAndSettle();
      
      // expect(find.text('订单跟踪'), findsAtLeastNWidgets(1));
      // expect(find.text('联系客户'), findsAtLeastNWidgets(1));

      await tester.tap(find.text('新订单'));
      await tester.pumpAndSettle();
      
      // Wait for 3 seconds, specifying the completed value type (void)
      // await Future.delayed(const Duration(seconds: 3), () {});
      // expect(find.text('接单'), findsAtLeastNWidgets(1));
      // expect(find.text('拒单'), findsAtLeastNWidgets(1));
      // expect(find.text('联系客户'), findsAtLeastNWidgets(1));

      await tester.pumpAndSettle();
    });

  });
}

Future<num> scrollEachItem(
  WidgetTester tester,
  ScreenshotController screenshotController,
  num currentNo
) async {
  print('scrollEachItem is triggered');
  // First approach: get a single scrollable widget and drag it
  final scrollableElements = <Widget>[];

  // This will only contain the widgets that have been loaded.
  // By default, this means the widgets that are in the current viewport, due to lazy loading.
  // Which means that this would need to be re-run after each scroll to get the next set of widgets.
  final allWidgets = tester.allWidgets;

  for (final widget in allWidgets) {
    if (widget is ListView ||
        widget is ScrollView ||
        widget is SingleChildScrollView ||
        widget is CustomScrollView ||
        widget is NestedScrollView) {
      scrollableElements.add(widget);
    }
  }

  // If no scrollable element found, abort.
  if (scrollableElements.isEmpty) {
    print('scrollableElements is empty, abort');
    return currentNo;
  }
  else {
    print('scrollableElements is not empty, proceed');

    // Otherwise, start screenshoting.
    // The following tasks should be done:
    // 1. If no element exists in the current viewport, take screenshot and then scroll down.
    // 2. If any element exists in the current viewport, adjust the viewport to contain the whole element, take screenshot and then scroll down on that element until reach its bottom.
    // 3. Repeat the above steps until the bottom of the page is reached.

    for (final scrollable in scrollableElements) {

      print('Discovered scrollable type: ${scrollable.runtimeType.toString()}');

      // print('find.byWidget(scrollable): ${find.byWidget(scrollable)}');

      final scrollableFinder = find.byWidget(scrollable);

      try {
        tester.firstWidget<Widget>(scrollableFinder);
        print('Element found. Proceed.');

        final screenSize = tester.getSize(find.byWidget(scrollable));

        print('Checkpoint 1');

        final scrollableSize = screenSize.height;

        print('Checkpoint 2');

        final offset = Offset(0.0, -scrollableSize);

        print('Checkpoint 3');

        var i = 0;

        // Repeat 5 times
        while (i < 5) {
          print('Dragging: $currentNo');
          // Drag from top to bottom with a slight offset to ensure enough movement
          await tester.dragFrom(screenSize.center(Offset.zero), offset);

          print('Checkpoint W 1');

          await delayed();
          
          print('Checkpoint W 2');

          await tester.pump(); // Wait for UI to rebuild after scroll

          await delayed();
          
          print('Checkpoint W 3');

          print('Dragging $currentNo completed, proceed to screenshot taking.');

          await screenshotController
              .capture(delay: const Duration(milliseconds: 10))
              .then((capturedImage) async {
            if (capturedImage != null) {
              final base64Value = uint8ListToBase64(capturedImage);
              await Dio().post('https://testserver.pretjob.com/api/designcomp/figma/screenshot/base64', data: {
                'items': [
                  {
                    'name': 'scrollable_$currentNo',
                    'base64': 'data:image/png;base64,$base64Value',
                  }
                ]
              })
              .then((res) {
                print('Screenshot uploaded successfully.');
              });
            }
          }).catchError((onError) {
            print(onError);
          });

          print('Checkpoint W 4');

          print('Screenshot completed, proceed to next iteration.');

          i++;

          currentNo++;
          
          print('Checkpoint W 5');
        }
      }
      catch(err) {
        print('Element not found. Skip.');
      }

    }

    return currentNo;
  }
}

String uint8ListToBase64(Uint8List uint8List) {
  // Encode the uint8List to Base64
  String base64String = base64Encode(uint8List);
  return base64String;
}
