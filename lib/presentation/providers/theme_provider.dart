import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Estado para manejar darkmode
final isDarkModeProvider = StateProvider(
    (ref) => false); //StateProvider es para mantener una pieza de estado

//Listado de colores inmutable
final colorListProvider =
    Provider((ref) => colorList); //Provider es para valores inmutables

//Un simple int, para el color seleccionado
final selectedColorProvider = StateProvider(
    (ref) => 0); //StateProvider es para mantener una pieza de estado

//Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
    (ref) =>
        ThemeNotifier()); //Este provider es para mantener un objeto mas elaborado

//Controller o Notifier le ponen al final de la clase
// y es el nombre que usualmente le suelen dar a la clase en este caso es ThemeNotifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //STATE = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
