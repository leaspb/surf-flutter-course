void main(List<String> arguments) {
  final machineries = [];

  mapBefore2010.values.forEach((terrirories) =>
  {
    terrirories.forEach((territory) =>
    { territory.machineries.forEach((m) {
      if (!machineries.contains(m)) {
        machineries.add(m);
      }
    })})
  });

  mapAfter2010.values.forEach((terrirories) =>
  {
    terrirories.forEach((territory) =>
    { territory.machineries.forEach((m) {
      if (!machineries.contains(m)) {
        machineries.add(m);
      }
    })})
  });

  final int currentYear = DateTime.now().year;

  var averageAges = machineries.map((e) => currentYear - e.releaseDate.year).toList();
  var totalAge = averageAges.reduce((i, j) => i + j);
  var totalCount = averageAges.length;
  var averageAge = (totalAge / totalCount).round();

  averageAges.sort((b, a) => a.compareTo(b));

  var oldestCount = (totalCount / 2).truncate();
  var oldestAverageAges = averageAges.take(oldestCount).toList();
  var oldestTotalAge = oldestAverageAges.reduce((i, j) => i + j);
  var averageAgeOfOldestHalf = (oldestTotalAge / oldestCount).round();

  print('Средний возраст техники: $averageAge');
  print('Средний возраст старейшей половины техники: $averageAgeOfOldestHalf');
}

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  int areaInHectare;
  List<String> crops;
  List<AgriculturalMachinery> machineries;

  Territory(
      this.areaInHectare,
      this.crops,
      this.machineries,
      );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
      this.id,
      this.releaseDate,
      );

  // Переопределяем оператор "==", что бы сравнивать объекты по значению
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};
