import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/core/utils/georgian_date.dart';
import 'package:voters/features/voter_search/models/voter.dart';
import 'package:voters/features/voter_search/widgets/info_row.dart';
import 'package:voters/features/voter_search/widgets/labeled_value.dart';
import 'package:voters/features/voter_search/widgets/section_divider.dart';

/// Name heading, personal / registration rows and addresses of one voter.
class VoterDetails extends StatelessWidget {
  const VoterDetails({super.key, required this.voter});

  final Voter voter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'ამომრჩეველი:',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.fieldIcon, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Semantics(
          header: true,
          child: Text(
            voter.fullName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SectionDivider(),
        InfoRow(label: 'გვარი', value: voter.lastName),
        InfoRow(label: 'სახელი', value: voter.firstName),
        InfoRow(
          label: 'დაბ.თარიღი',
          value: GeorgianDate.numeric(voter.birthDate),
        ),
        InfoRow(
          label: 'ოლქი/უბანი',
          value: '${voter.district}/${voter.precinct}',
        ),
        InfoRow(
          label: 'ამომრჩევლის ერთიან სიაში რიგითი ნომერი',
          value: '${voter.listNumber}',
        ),
        InfoRow(label: 'საარჩევნო უბანი', value: voter.precinctType),
        const SectionDivider(),
        LabeledValue(label: 'იურიდიული მისამართი', value: voter.legalAddress),
        LabeledValue(
          label: 'ფაქტობრივი საცხოვრებელი ადგილი',
          value: voter.actualAddress,
        ),
        LabeledValue(
          label: 'ფაქტობრივი მდგომარეობა',
          value: voter.actualStatus,
        ),
      ],
    );
  }
}
