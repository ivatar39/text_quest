//constants.dart
import 'encounter.dart';

//TODO: В качестве констант разместить свой текстовый квест

final Map<int, Encounter> encounters = {
  -1: Encounter(
    'Вы погибли',
    options: [Option('Начать заново🔁', 0)],
  ),
  0: Encounter(
    'Добро пожаловать!',
    options: [Option('Начать▶', 1), Option('Убежать', -1)],
  ),
  1: Encounter(
    'Вы стоите у перекрётска, куда пойдёте?',
    options: [
      Option('Налево⬅', -1),
      Option('Прямо⬆', -1),
      Option('Направо➡', 2),
    ],
  ),
  2: Encounter(
    'Вы победили!',
    options: [Option('Reset', 0)],
  ),
};
