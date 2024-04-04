import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/onboarding/bloc/onboarding_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/otp/bloc/otp_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/presentation/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/presentation/pages/bloc/home_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/choose_doctor/bloc/choose_doctor_bloc.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/presentation/pages/clinic/bloc/clinic_bloc.dart';

class BlocProviders {
  static List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
      BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
      BlocProvider<ClinicBloc>(create: (context) => ClinicBloc()),
      BlocProvider<ChooseDoctorBloc>(create: (context) => ChooseDoctorBloc()),
      BlocProvider<OtpBloc>(create: (context) => OtpBloc()),
      BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
      BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
    ];
  }
}