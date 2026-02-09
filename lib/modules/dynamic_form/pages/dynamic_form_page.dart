import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/controllers/dynamic_form_controller.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/models/form_block_models.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/alert_widget.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/chart_widget.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/cron_field_widget.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/stat_card_widget.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/switch_field_widget.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/table_widget.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/text_area_widget.dart';
import 'package:moviepilot_mobile/modules/dynamic_form/widgets/text_field_widget.dart';
import 'package:moviepilot_mobile/utils/toast_util.dart';

/// 展示项：单个区块 或 统计卡片网格（2x2）
sealed class _DisplayItem {}

class _DisplaySingle extends _DisplayItem {
  _DisplaySingle(this.block);
  final FormBlock block;
}

class _DisplayStatCardGrid extends _DisplayItem {
  _DisplayStatCardGrid(this.cards);
  final List<StatCardBlock> cards;
}

class DynamicFormPage extends GetView<DynamicFormController> {
  const DynamicFormPage({super.key});

  static const double _horizontalPadding = 16;
  static const double _cardSpacing = 12;
  static const double _statCardGridSpacing = 8;

  List<_DisplayItem> _toDisplayItems(List<FormBlock> blocks) {
    final result = <_DisplayItem>[];
    var i = 0;
    while (i < blocks.length) {
      final block = blocks[i];
      if (block is StatCardBlock) {
        final cards = <StatCardBlock>[];
        while (i < blocks.length && blocks[i] is StatCardBlock) {
          cards.add(blocks[i] as StatCardBlock);
          i++;
        }
        result.add(_DisplayStatCardGrid(cards));
      } else {
        result.add(_DisplaySingle(block));
        i++;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.pageTitle ?? '动态表单'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.refresh),
            tooltip: '刷新',
            onPressed: controller.load,
          ),
          Obx(() {
            if (controller.hasFormModel) {
              if (controller.isLoading.value) {
                return CupertinoActivityIndicator();
              }
              return IconButton(
                icon: Icon(
                  Icons.save,
                  color: Theme.of(context).colorScheme.primary,
                ),
                tooltip: '保存',
                onPressed: () async {
                  final success = await controller.save();
                  if (success) {
                    Get.back();
                    Future.delayed(const Duration(seconds: 1), () {
                      ToastUtil.success('保存成功');
                    });
                  } else {
                    ToastUtil.error('保存失败');
                  }
                },
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
      body: Obx(() {
        final loading = controller.isLoading.value;
        final error = controller.errorText.value;
        final blocks = controller.blocks;

        if (loading && blocks.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
        if (error != null && blocks.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(error, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  CupertinoButton.filled(
                    onPressed: controller.load,
                    child: const Text('重试'),
                  ),
                ],
              ),
            ),
          );
        }
        if (blocks.isEmpty) {
          return Center(
            child: Text(
              '暂无数据',
              style: TextStyle(
                color: CupertinoDynamicColor.resolve(
                  CupertinoColors.secondaryLabel,
                  context,
                ),
              ),
            ),
          );
        }

        final items = _toDisplayItems(blocks);
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(
            _horizontalPadding,
            12,
            _horizontalPadding,
            80,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < items.length - 1 ? _cardSpacing : 0,
              ),
              child: _buildItem(context, item),
            );
          },
        );
      }),
    );
  }

  Widget _buildItem(BuildContext context, _DisplayItem item) {
    return switch (item) {
      _DisplaySingle(:final block) => _buildBlock(context, block),
      _DisplayStatCardGrid(:final cards) => _buildStatCardGrid(context, cards),
    };
  }

  Widget _buildStatCardGrid(BuildContext context, List<StatCardBlock> cards) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossCount = 2;
        final childWidth =
            (constraints.maxWidth - _statCardGridSpacing * (crossCount - 1)) /
            crossCount;
        return Wrap(
          spacing: _statCardGridSpacing,
          runSpacing: _statCardGridSpacing,
          children: cards
              .map(
                (b) => SizedBox(
                  width: childWidth,
                  child: StatCardWidget(block: b),
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildBlock(BuildContext context, FormBlock block) {
    return block.map(
      statCard: (b) => StatCardWidget(block: b),
      chart: (b) => ChartWidget(block: b),
      table: (b) => TableWidget(block: b),
      switchField: (b) => Obx(
        () => SwitchFieldWidget(
          block: b,
          value: controller.hasFormModel
              ? controller.getBoolValue(b.name)
              : null,
          onChanged: b.name != null
              ? (v) => controller.updateField(b.name, v)
              : null,
        ),
      ),
      cronField: (b) => Obx(
        () => CronFieldWidget(
          block: b,
          value: controller.getValue(b.name)?.toString(),
          onChanged: b.name != null
              ? (v) => controller.updateField(b.name, v)
              : null,
        ),
      ),
      textField: (b) => Obx(
        () => TextFieldBlockWidget(
          block: b,
          value: controller.getValue(b.name)?.toString(),
          onChanged: b.name != null
              ? (v) => controller.updateField(b.name, v)
              : null,
        ),
      ),
      textArea: (b) => Obx(
        () => TextAreaFieldWidget(
          block: b,
          value: controller.getValue(b.name)?.toString(),
          onChanged: b.name != null
              ? (v) => controller.updateField(b.name, v)
              : null,
        ),
      ),
      alert: (b) => AlertWidget(block: b),
    );
  }
}
