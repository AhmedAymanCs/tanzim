// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tanzim`
  String get title {
    return Intl.message('Tanzim', name: 'title', desc: '', args: []);
  }

  /// `Your Personal Organizer`
  String get subTitle {
    return Intl.message(
      'Your Personal Organizer',
      name: 'subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Organize your tasks easily`
  String get onboardingTitle1 {
    return Intl.message(
      'Organize your tasks easily',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Manage your daily activities with ease and efficiency.`
  String get onboardingSubTitle1 {
    return Intl.message(
      'Manage your daily activities with ease and efficiency.',
      name: 'onboardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Save your notes`
  String get onboardingTitle2 {
    return Intl.message(
      'Save your notes',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Save your important ideas and notes in an organized and tidy way.`
  String get onboardingSubTitle2 {
    return Intl.message(
      'Save your important ideas and notes in an organized and tidy way.',
      name: 'onboardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Comprehensive Reports`
  String get onboardingTitle3 {
    return Intl.message(
      'Comprehensive Reports',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Track your progress and get detailed statistics on your tasks and notes.`
  String get onboardingSubTitle3 {
    return Intl.message(
      'Track your progress and get detailed statistics on your tasks and notes.',
      name: 'onboardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get next {
    return Intl.message('Continue', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
