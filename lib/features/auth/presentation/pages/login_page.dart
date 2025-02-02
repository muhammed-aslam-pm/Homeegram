import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:homeegram/core/constants/icons.dart';
import 'package:homeegram/core/navigation/navigation_extensions.dart';
import 'package:homeegram/core/shared/animations/transformAnimation.dart';
import 'package:homeegram/core/shared/widgets/app_logo_with_text.dart';
import 'package:homeegram/core/config/theme/app_colors.dart';
import 'package:homeegram/core/utils/validators.dart';
import 'package:homeegram/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_back_page_layout.dart';
import 'package:homeegram/features/auth/presentation/widgets/login_button.dart';
import 'package:homeegram/features/auth/presentation/widgets/text_form_field.dart';
import 'package:homeegram/service_locator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpSent) {
          context.pushOtpVerification(
              phoneNumber: _phoneController.text.trim());
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return BaseAuthPageScaffold(
          topSection: _buildTopSection(context),
          bottomSection: _buildBottomSection(context, state),
          isScrollable: false,
        );
      },
    );
  }

  Widget _buildBottomSection(BuildContext context, AuthState state) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final localization = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.09,
        vertical: screenHeight * 0.048,
      ),
      child: AnimatedWrapper(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppLogoWithText(height: screenHeight * 0.07),
              const Spacer(),
              CustomTextFormField(
                controller: _phoneController,
                hintText: localization!.mobileHint,
                prefixIcon: const SizedBox(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: Text("🇮🇳", style: TextStyle(fontSize: 20)),
                  ),
                ),
                prefixText: "+91",
                validator: (value) => Validators.validatePhoneNumber(value),
              ),
              SizedBox(height: screenHeight * 0.03),
              LoginButton(
                text: localization.getOtpButton,
                onPressed: state is AuthLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          final phone = _phoneController.text.trim();
                          if (phone.isNotEmpty) {
                            context.read<AuthBloc>().add(SendOtpEvent(phone));
                          }
                        }
                      },
                height: screenHeight * 0.06,
                isLoading: state is AuthLoading,
              ),
              const SizedBox(height: 20),
              const Spacer(),
              _buildOrDivider(localization: localization),
              const Spacer(),
              _buildGoogleButton(localization: localization),
              const Spacer(),
              _buildTermsAndConditions(localization: localization),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AnimatedWrapper(
      direction: AnimationDirection.top,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.07,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.07),
            Text(
              localization!.loginWelcome,
              style: TextStyle(
                  fontSize: 28,
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w500,
                  height: 2),
              textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: true,
                applyHeightToLastDescent: false,
              ),
            ),
            Text(
              localization!.loginSubtitle1,
              style: TextStyle(
                  fontSize: 34,
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w500,
                  height: 2),
              textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: false,
                applyHeightToLastDescent: false,
              ),
            ),
            FittedBox(
              child: Text(
                localization!.loginSubtitle2,
                style: TextStyle(
                    fontSize: 26,
                    color: AppColors.lightTextPrimary,
                    fontWeight: FontWeight.w400,
                    height: 2),
                textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions({required AppLocalizations? localization}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 26,
          width: 26,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.done,
                size: 12,
                color: AppColors.textWhite,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.success.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          // Use Flexible or Expanded
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              localization!.agreeTerms,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.grey1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleButton({required AppLocalizations? localization}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.grey1, width: 3),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppIcons.googleIcon,
            height: 21,
            width: 21,
          ),
          const SizedBox(width: 5),
          Text(
            "Google",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildOrDivider({required AppLocalizations? localization}) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            color: AppColors.lightTextPrimary,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          localization!.orContinueWith,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 2,
            color: AppColors.lightTextPrimary,
          ),
        ),
      ],
    );
  }
}
