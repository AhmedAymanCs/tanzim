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

  /// `Skip`
  String get onboardingSkip {
    return Intl.message('Skip', name: 'onboardingSkip', desc: '', args: []);
  }

  /// `Tasks`
  String get tasks {
    return Intl.message('Tasks', name: 'tasks', desc: '', args: []);
  }

  /// `Manage daily tasks`
  String get subTasks {
    return Intl.message(
      'Manage daily tasks',
      name: 'subTasks',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Save and organize ideas`
  String get subNotes {
    return Intl.message(
      'Save and organize ideas',
      name: 'subNotes',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message('Reports', name: 'reports', desc: '', args: []);
  }

  /// `Statistics and Reports`
  String get subReports {
    return Intl.message(
      'Statistics and Reports',
      name: 'subReports',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Select a section to start`
  String get subHome {
    return Intl.message(
      'Select a section to start',
      name: 'subHome',
      desc: '',
      args: [],
    );
  }

  /// `Active Tasks`
  String get activeTasks {
    return Intl.message(
      'Active Tasks',
      name: 'activeTasks',
      desc: '',
      args: [],
    );
  }

  /// `Completed Tasks`
  String get completedTasks {
    return Intl.message(
      'Completed Tasks',
      name: 'completedTasks',
      desc: '',
      args: [],
    );
  }

  /// `All Tasks`
  String get allTasks {
    return Intl.message('All Tasks', name: 'allTasks', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `High`
  String get high {
    return Intl.message('High', name: 'high', desc: '', args: []);
  }

  /// `medium`
  String get medium {
    return Intl.message('medium', name: 'medium', desc: '', args: []);
  }

  /// `Low`
  String get low {
    return Intl.message('Low', name: 'low', desc: '', args: []);
  }

  /// `Add Task`
  String get addTask {
    return Intl.message('Add Task', name: 'addTask', desc: '', args: []);
  }

  /// `Title`
  String get taskTitle {
    return Intl.message('Title', name: 'taskTitle', desc: '', args: []);
  }

  /// `Description`
  String get taskDescription {
    return Intl.message(
      'Description',
      name: 'taskDescription',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `This field is required`
  String get validate {
    return Intl.message(
      'This field is required',
      name: 'validate',
      desc: '',
      args: [],
    );
  }

  /// `Select Priority`
  String get priorityValidate {
    return Intl.message(
      'Select Priority',
      name: 'priorityValidate',
      desc: '',
      args: [],
    );
  }

  /// `Delete Task`
  String get deleteTaskTitle {
    return Intl.message(
      'Delete Task',
      name: 'deleteTaskTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this task?`
  String get deleteTaskConfirmation {
    return Intl.message(
      'Are you sure you want to delete this task?',
      name: 'deleteTaskConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `No Tasks yet`
  String get emptyTasks {
    return Intl.message('No Tasks yet', name: 'emptyTasks', desc: '', args: []);
  }

  /// `Priority`
  String get priority {
    return Intl.message('Priority', name: 'priority', desc: '', args: []);
  }

  /// `Please select a time in the future`
  String get notAllowedTime {
    return Intl.message(
      'Please select a time in the future',
      name: 'notAllowedTime',
      desc: '',
      args: [],
    );
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
