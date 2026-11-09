import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/features/voter_search/models/voter_search_result.dart';
import 'package:voters/features/voter_search/widgets/labeled_value.dart';
import 'package:voters/features/voter_search/widgets/polling_station_map.dart';
import 'package:voters/features/voter_search/widgets/section_divider.dart';
import 'package:voters/features/voter_search/widgets/voter_details.dart';
import 'package:voters/features/voter_search/widgets/voter_profile_header.dart';
import 'package:voters/features/voter_search/widgets/voters_at_address_button.dart';

class VoterResultScreen extends StatefulWidget {
  const VoterResultScreen({super.key, required this.result});

  final VoterSearchResult result;

  static Route<void> route(VoterSearchResult result) => MaterialPageRoute<void>(
    builder: (_) => VoterResultScreen(result: result),
  );

  @override
  State<VoterResultScreen> createState() => _VoterResultScreenState();
}

class _VoterResultScreenState extends State<VoterResultScreen> {
  bool _showVotersAtAddress = false;

  @override
  Widget build(BuildContext context) {
    final result = widget.result;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.paddingOf(context).bottom + 24,
        ),
        children: [
          const VoterProfileHeader(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                VoterDetails(voter: result.voter),
                const SectionDivider(),
                LabeledValue(
                  label: 'საარჩევნო უბნის მისამართი',
                  value: result.pollingStation.address,
                  labelColor: AppColors.green,
                ),
                const SizedBox(height: 12),
                PollingStationMap(station: result.pollingStation),
                const SizedBox(height: 20),
                VotersAtAddressButton(
                  expanded: _showVotersAtAddress,
                  onPressed: () => setState(
                    () => _showVotersAtAddress = !_showVotersAtAddress,
                  ),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  alignment: Alignment.topCenter,
                  child: _showVotersAtAddress
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for (final voter in result.votersAtAddress) ...[
                              const SizedBox(height: 24),
                              VoterDetails(voter: voter),
                            ],
                          ],
                        )
                      : const SizedBox(width: double.infinity),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
