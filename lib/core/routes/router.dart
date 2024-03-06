import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_path.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/navigation/navigation.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/account_screen/account_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/activity_screen/activity_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/history_screen/history_screen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/screen/home_screen/home_screen.dart';

final router = [
  StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) {
        return canvas(
            child: Navigation(
              navigationShell: navigationShell,
            ),
            state: state);
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              path: RoutePath.home,
              name: RouteName.home,
              pageBuilder: (context, state) {
                return canvas(
                  child: const HomeScreen(),
                  state: state,
                );
              }),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: RoutePath.history,
              name: RouteName.history,
              pageBuilder: (context, state) {
                return canvas(
                  child: const HistoryScreen(),
                  state: state,
                );
              }),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: RoutePath.activity,
              name: RouteName.activity,
              pageBuilder: (context, state) {
                return canvas(
                  child: const ActivityScreen(),
                  state: state,
                );
              }),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: RoutePath.account,
              name: RouteName.account,
              pageBuilder: (context, state) {
                return canvas(
                  child: const AccountScreen(),
                  state: state,
                );
              }),
        ]),
      ])
];

Page canvas({
  required Widget child,
  required GoRouterState state,
}) {
  if (Platform.isAndroid) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
  return CupertinoPage(
    key: state.pageKey,
    child: child,
  );
}
