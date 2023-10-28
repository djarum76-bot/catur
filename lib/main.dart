import 'package:catur/features/chess/bloc/chess_bloc.dart';
import 'package:catur/utils/app_routes.dart';
import 'package:catur/utils/app_theme.dart';
import 'package:catur/utils/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectorSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark
        )
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return BlocProvider(
      create: (context) => injector<ChessBloc>(),
      child: ResponsiveSizer(
        builder: (context, orientation, screenType){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme.theme(),
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            initialRoute: AppRoutes.chess,
          );
        },
      ),
    );
  }
}
