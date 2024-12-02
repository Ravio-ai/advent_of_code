import 'dart:io';

bool isSafe(List<int> levels) {
  bool checkSafety(List<int> levels) {
    bool isIncreasing = true;
    bool isDecreasing = true;

    for (int i = 0; i < levels.length - 1; i++) {
      int diff = (levels[i + 1] - levels[i]).abs();

      if (diff < 1 || diff > 3) {
        return false;
      }

      if (levels[i] >= levels[i + 1]) {
        isIncreasing = false;
      }

      if (levels[i] <= levels[i + 1]) {
        isDecreasing = false;
      }
    }

    return isIncreasing || isDecreasing;
  }

  if (checkSafety(levels)) {
    return true;
  }

  for (int i = 0; i < levels.length; i++) {
    List<int> modifiedLevels = [];
    for (int j = 0; j < levels.length; j++) {
      if (i != j) {
        modifiedLevels.add(levels[j]);
      }
    }

    if (checkSafety(modifiedLevels)) {
      return true;
    }
  }

  return false;
}

void main() {
  final filePath = 'example.txt';

  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    int safeCount = 0;
    for (final line in lines) {
      final levels = line.split(' ').map(int.parse).toList();
      if (isSafe(levels)) {
        safeCount++;
      }
    }

    print('Number of safe levels: $safeCount');
  } catch (e) {
    print('Error: $e');
  }
}



/* part one
import 'dart:io';

bool isSafeLevel(List<int> levels) {
  bool isIncreasing = true;
  bool isDecreasing = true;

  for (int i = 0; i < levels.length - 1; i++) {
    int diff = (levels[i + 1] - levels[i]).abs();

    if (diff < 1 || diff > 3) {
      return false;
    }

    if (levels[i] >= levels[i + 1]) {
      isIncreasing = false;
    }

    if (levels[i] <= levels[i + 1]) {
      isDecreasing = false;
    }
  }

  return isIncreasing || isDecreasing;
}

void main() {
  final filePath = 'example.txt';

  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    int safeCount = 0;
    for (final line in lines) {
      final levels = line.split(' ').map(int.parse).toList();
      if (isSafeLevel(levels)) {
        safeCount++;
      }
    }

    print('Number of safe levels: $safeCount');
  } catch (e) {
    print('Error: $e');
  }
} */