import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voters/core/theme/app_colors.dart';
import 'package:voters/core/widgets/app_back_button.dart';
import 'package:voters/core/widgets/green_header.dart';
import 'package:voters/features/voter_search/data/mock_search_result.dart';
import 'package:voters/features/voter_search/voter_result_screen.dart';
import 'package:voters/features/voter_search/utils/mobile_number_formatter.dart';
import 'package:voters/features/voter_search/utils/voter_search_validators.dart';
import 'package:voters/features/voter_search/widgets/search_notice_card.dart';
import 'package:voters/features/voter_search/widgets/search_text_field.dart';

class VoterSearchScreen extends StatefulWidget {
  const VoterSearchScreen({super.key});

  static Route<void> route() =>
      MaterialPageRoute<void>(builder: (_) => const VoterSearchScreen());

  @override
  State<VoterSearchScreen> createState() => _VoterSearchScreenState();
}

class _VoterSearchScreenState extends State<VoterSearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final _personalNumber = TextEditingController();
  final _surname = TextEditingController();
  final _mobile = TextEditingController();
  var _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _personalNumber.dispose();
    _surname.dispose();
    _mobile.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      setState(() => _autovalidateMode = AutovalidateMode.onUserInteraction);
      return;
    }
    Navigator.of(context).push(VoterResultScreen.route(mockSearchResult));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const GreenHeader(
            title: 'ამომრჩევლის ძიება',
            leading: AppBackButton(),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                primary: false,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SearchNoticeCard(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 28, 16, 24),
                      child: Form(
                        key: _formKey,
                        autovalidateMode: _autovalidateMode,
                        child: AutofillGroup(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SearchTextField(
                                controller: _personalNumber,
                                icon: Icons.badge,
                                hint: 'პირადი ნომერი',
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(11),
                                ],
                                validator: VoterSearchValidators.personalNumber,
                              ),
                              const SizedBox(height: 20),
                              SearchTextField(
                                controller: _surname,
                                icon: Icons.person_outline,
                                hint: 'ამომრჩევლის გვარი',
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                autofillHints: const [AutofillHints.familyName],
                                validator: VoterSearchValidators.surname,
                              ),
                              const SizedBox(height: 20),
                              SearchTextField(
                                controller: _mobile,
                                icon: Icons.phone_android_outlined,
                                hint: '5##-##-##-##',
                                hintWeight: FontWeight.w600,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.search,
                                inputFormatters: const [
                                  MobileNumberFormatter(),
                                ],
                                autofillHints: const [
                                  AutofillHints.telephoneNumberNational,
                                ],
                                validator: VoterSearchValidators.mobile,
                                onSubmitted: (_) => _submit(),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'მიუთითეთ მობილურის ნომერი რომელზეც გსურთ ერთჯერადი კოდის მიღება',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.helperGreen,
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 24),
                              FilledButton(
                                onPressed: _submit,
                                child: const Text('ძებნა'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
