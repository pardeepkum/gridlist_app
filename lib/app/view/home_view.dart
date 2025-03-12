import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_app/app/controller/number_controller.dart';
import '../models/highlight_rule.dart';
import '../widgets/number_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Number Grid')),
      body: Column(
        children: [
          _buildDropdown(controller),
          Expanded(child: _buildGrid(controller)),
        ],
      ),
    );
  }

  Widget _buildDropdown(NumberController controller) {
    return Obx(() => DropdownButton<HighlightRule>(
      value: controller.selectedRule.value,
      items: HighlightRule.values.map((rule) {
        return DropdownMenuItem(
          value: rule,
          child: Text(rule.name.capitalize!),
        );
      }).toList(),
      onChanged: (rule) {
        controller.updateRule(rule!);
        controller.numbers.refresh();
      },
    ));
  }


  Widget _buildGrid(NumberController controller) {
    return Obx(() => GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: controller.numbers.length,
      itemBuilder: (context, index) {
        int number = controller.numbers[index];
        bool isHighlighted = controller.isHighlighted(number);
        return NumberTile(number: number, isHighlighted: isHighlighted);
      },
    ));
  }
}
