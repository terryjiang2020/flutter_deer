import 'package:flutter/material.dart';
import 'package:flutter_deer/main.dart';
import 'package:flutter_deer/order/page/order_page.dart';
import 'package:flutter_deer/res/constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

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

  final screenSize = Size(390, 844);

  group('订单部分：', () {

    Constant.isDriverTest = true;

    tearDown(() {
      debugPrint('< Success');
    });

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

    testWidgets('订单页测试，带滚动',(WidgetTester tester) async {
      runApp(MyApp(home: const OrderPage()));
      await tester.pumpAndSettle();

      expect(find.text('接单'), findsAtLeastNWidgets(3));
      expect(find.text('拒单'), findsAtLeastNWidgets(3));
      expect(find.text('联系客户'), findsAtLeastNWidgets(3));

      await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

      await tester.pumpAndSettle();
      
      await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

      await tester.pumpAndSettle();
      
      await tester.tap(find.text('待配送'));
      await tester.pumpAndSettle();

      // Wait for 3 seconds, specifying the completed value type (void)
      // await Future.delayed(const Duration(seconds: 3), () {});
      expect(find.text('开始配送'), findsAtLeastNWidgets(3));
      expect(find.text('拒单'), findsAtLeastNWidgets(3));
      expect(find.text('联系客户'), findsAtLeastNWidgets(3));

      await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

      await tester.pumpAndSettle();
      
      await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

      await tester.pumpAndSettle();
      

      await tester.tap(find.text('待完成'));
      await tester.pumpAndSettle();
      
      expect(find.text('完成'), findsAtLeastNWidgets(3));
      expect(find.text('订单跟踪'), findsAtLeastNWidgets(3));
      expect(find.text('联系客户'), findsAtLeastNWidgets(3));
      
      // Wait for 3 seconds, specifying the completed value type (void)
      // await Future.delayed(const Duration(seconds: 3), () {});
      await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

      await tester.pumpAndSettle();
      
      await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

      await tester.pumpAndSettle();
      
      await tester.tap(find.text('已完成'));
      await tester.pumpAndSettle();
      
      // Wait for 3 seconds, specifying the completed value type (void)
      // await Future.delayed(const Duration(seconds: 3), () {});
      expect(find.text('订单跟踪'), findsAtLeastNWidgets(3));
      expect(find.text('联系客户'), findsAtLeastNWidgets(3));

      await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

      await tester.pumpAndSettle();
      
      await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

      await tester.pumpAndSettle();
      

      await tester.tap(find.text('已取消'));
      await tester.pumpAndSettle();
      
      // Wait for 3 seconds, specifying the completed value type (void)
      // await Future.delayed(const Duration(seconds: 3), () {});
      await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

      await tester.pumpAndSettle();
      
      await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

      await tester.pumpAndSettle();
      
      expect(find.text('订单跟踪'), findsAtLeastNWidgets(3));
      expect(find.text('联系客户'), findsAtLeastNWidgets(3));

      await tester.tap(find.text('新订单'));
      await tester.pumpAndSettle();
      
      // Wait for 3 seconds, specifying the completed value type (void)
      // await Future.delayed(const Duration(seconds: 3), () {});
      expect(find.text('接单'), findsAtLeastNWidgets(3));
      expect(find.text('拒单'), findsAtLeastNWidgets(3));
      expect(find.text('联系客户'), findsAtLeastNWidgets(3));
      await tester.dragFrom(const Offset(250, 350), const Offset(0, 500));

      await tester.pumpAndSettle();
      
      await tester.dragFrom(const Offset(250, 450), const Offset(0, -500));

      await tester.pumpAndSettle();
    });

  });
}
