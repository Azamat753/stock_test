import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/stock_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final cubit = StockCubit()..getStocks();
  final textController = TextEditingController();
  final complientNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        cubit.searchStocks(value);
                      },
                    ),
                  ),
                  Text('Complient'),
                  ValueListenableBuilder(
                    builder: (context, value, child) => Switch(
                        value: complientNotifier.value,
                        onChanged: (value) {
                          complientNotifier.value = value;
                          cubit.showComplient(value);
                        }),
                    valueListenable: complientNotifier,
                  ),
                ],
              ),
            ),
            BlocBuilder<StockCubit, StockState>(
              bloc: cubit,
              builder: (context, state) {
                if (state is StockLoaded) {
                  final list = state.list;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final item = list[index];
                            return Row(
                              children: [
                                Row(
                                  spacing: 16,
                                  children: [
                                    Image.network(
                                      item.logo,
                                      height: 24,
                                      width: 24,
                                    ),
                                    Text(item.companyName),
                                  ],
                                ),
                                Spacer(),
                                Text('${item.price.price ?? item.price.currentPrice} ${item.currency}')
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: list.length),
                    ),
                  );
                } else {
                  return Text('error');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
