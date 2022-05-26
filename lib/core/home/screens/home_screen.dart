import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:finances_app/core/home/widgets/bottom_sheet_item.dart';
import 'package:finances_app/core/home/widgets/details_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Finanças',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      letterSpacing: 2,
                      fontFamily: GoogleFonts.concertOne().fontFamily,
                    ),
              ),
              Card(
                elevation: 2,
                color: Theme.of(context).colorScheme.primaryContainer,
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => {
                    // Navigator.of(context).pushNamed('/expenses/new');
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: BottomSheetItem(
                                    icon: const Icon(Icons.credit_card),
                                    label: "Lorem ipsum",
                                    onTap: () {},
                                  ),
                                ),
                                Expanded(
                                  child: BottomSheetItem(
                                    icon: const Icon(Icons.savings),
                                    label: "Receita",
                                    onTap: () {},
                                  ),
                                ),
                                Expanded(
                                  child: BottomSheetItem(
                                    icon: const Icon(Icons.payments),
                                    label: "Despesa",
                                    onTap: () {
                                      Navigator.of(context)
                                          .pop();
                                      Navigator.of(context)
                                          .pushNamed('/expenses/new');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 40,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 3),
              const DetailsCard(
                text: "Lorem ipsum",
                imageProvider: AssetImage(
                  'assets/images/expenses.jpg',
                ),
              ),
              const DetailsCard(
                text: "Lorem ipsum",
                imageProvider: AssetImage(
                  'assets/images/chart.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
