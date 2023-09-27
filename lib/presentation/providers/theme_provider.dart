import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Estado para manejar darkmode
final isDarkModeProvider = StateProvider((ref) => false);

//Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Un simple int, para el color seleccionado
final selectedColorProvider = StateProvider((ref) => 0);

