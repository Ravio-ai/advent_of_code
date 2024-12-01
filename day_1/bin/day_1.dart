import 'dart:io';

void main() {
  final List<int> leftList = [];
  final List<int> rightList = [];

  final filePath = 'input.txt'; // Replace with your file path

  try {
    final file = File(filePath);
    if (!file.existsSync()) {
      print('File not found: $filePath');
      return;
    }

    final lines = file.readAsLinesSync();

    for (final line in lines) {
      final parts = line.trim().split(' ');
      // [31594, , , 93577]
      final filteredParts = parts.where((part) => part.isNotEmpty).toList();
      if (filteredParts.length == 2) {
        try {
          final leftValue = int.parse(filteredParts[0]);
          final rightValue = int.parse(filteredParts[1]);
          leftList.add(leftValue);
          rightList.add(rightValue);
        } catch (e) {
          print('Error parsing line: $line');
        }
      } else {
        print('Invalid line format: $line');
      }
    }
  } catch (e) {
    print('Error reading file: $e');
  }

  // part One

  leftList.sort();
  rightList.sort();
  int totalDistance = 0;
  for (int i = 0; i < leftList.length; i++) {
    totalDistance += (leftList[i] - rightList[i]).abs();
  }
  print(totalDistance);

  // Part Two

  Map<int, int> rightCount = {};
  for (final num in rightList) {
    rightCount[num] = (rightCount[num] ?? 0) + 1;
  }
  
  int score = 0;

  for (final num in leftList) {
     score += (rightCount[num]?? 0) * num;
  }
  print(score);

}
