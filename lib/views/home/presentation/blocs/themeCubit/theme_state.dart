part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class LightThemeState extends ThemeState {}

class DarkThemeState extends ThemeState {}