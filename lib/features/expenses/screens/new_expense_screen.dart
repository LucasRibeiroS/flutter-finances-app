import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:finances_app/common_widgets/custom_app_bar.dart';
import 'package:finances_app/common_widgets/custom_text_field.dart';
import 'package:finances_app/common_widgets/custom_button.dart';
import 'package:finances_app/common_widgets/custom_dropdown.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({Key? key}) : super(key: key);

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  final _formKey = GlobalKey<FormState>();

  final _valueController = MoneyMaskedTextController(leftSymbol: "R\$");
  final _dateController = TextEditingController(
    text: DateFormat("dd/MM/yyyy").format(DateTime.now()),
  );
  String? _categoryValue;
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _valueController.dispose();
    _dateController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Nova Despesa",
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverToBoxAdapter(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _valueController,
                              labelText: "Valor",
                              hintText: "R\$10,00",
                              prefixIcon: const Icon(Icons.attach_money),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty || _valueController.numberValue < 0.1) {
                                  return 'Digite um valor válido';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              controller: _dateController,
                              labelText: "Data",
                              hintText: "dd/mm/yyyy",
                              prefixIcon: const Icon(Icons.today),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                DateTime? date = await showDatePicker(
                                  context: context,
                                  locale: const Locale("pt", "BR"),
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now().subtract(
                                    const Duration(days: 365),
                                  ),
                                  lastDate: DateTime.now().add(
                                    const Duration(days: 365),
                                  ),
                                );

                                if (date != null) {
                                  _dateController.text =
                                      DateFormat('dd/MM/yyyy').format(date);
                                }
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Selecione uma data';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomDropdown(
                        labelText: "Categoria",
                        hintText: "Selecione uma categoria",
                        value: _categoryValue,
                        options: const <String>[
                          'Pessoal',
                          'Presente',
                          'Casa',
                          'Carro'
                        ],
                        getLabel: (String value) => value,
                        onChanged: (String? newValue) {
                          if (newValue != null && newValue != _categoryValue) {
                            setState(() => _categoryValue = newValue);
                          }
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Selecione uma categoria';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _descriptionController,
                        labelText: "Descrição",
                        hintText: "Lorem ipsum sit dolot amet",
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 20.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Salvar",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
