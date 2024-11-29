class PokemonModel {
  final String id;
  final String name;
  final String supertype;
  final List<String> subtypes;
  final String hp;
  final List<String> types;
  final String? evolvesFrom;
  final List<Attack> attacks;
  final List<Weakness> weaknesses;
  final List<Resistance> resistances;
  final List<String> retreatCost;
  final int convertedRetreatCost;
  final CardSet set;
  final String number;
  final String artist;
  final String rarity;
  final String? flavorText;
  final List<int> nationalPokedexNumbers;
  final Legalities legalities;
  final CardImages images;
  final Market tcgplayer;
  final Market cardmarket;

  PokemonModel({
    this.id = "",
    this.name = "",
    this.supertype = "",
    this.subtypes = const [],
    this.hp = "0",
    this.types = const [],
    this.evolvesFrom,
    this.attacks = const [],
    this.weaknesses = const [],
    this.resistances = const [],
    this.retreatCost = const [],
    this.convertedRetreatCost = 0,
    required this.set,
    this.number = "0",
    this.artist = "Unknown",
    this.rarity = "Unknown",
    this.flavorText,
    this.nationalPokedexNumbers = const [],
    required this.legalities,
    required this.images,
    required this.tcgplayer,
    required this.cardmarket,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'] ?? "unknown",
      name: json['name'] ?? "unknown",
      supertype: json['supertype'] ?? "unknown",
      subtypes: List<String>.from(json['subtypes'] ?? []),
      hp: json['hp'] ?? "0",
      types: List<String>.from(json['types'] ?? []),
      evolvesFrom: json['evolvesFrom'],
      attacks: (json['attacks'] as List<dynamic>?)
              ?.map((attack) => Attack.fromJson(attack))
              .toList() ??
          [],
      weaknesses: (json['weaknesses'] as List<dynamic>?)
              ?.map((weakness) => Weakness.fromJson(weakness))
              .toList() ??
          [],
      resistances: (json['resistances'] as List<dynamic>?)
              ?.map((resistance) => Resistance.fromJson(resistance))
              .toList() ??
          [],
      retreatCost: List<String>.from(json['retreatCost'] ?? []),
      convertedRetreatCost: json['convertedRetreatCost'] ?? 0,
      set: CardSet.fromJson(json['set'] ?? {}),
      number: json['number'] ?? "0",
      artist: json['artist'] ?? "Unknown",
      rarity: json['rarity'] ?? "Unknown",
      flavorText: json['flavorText'],
      nationalPokedexNumbers:
          List<int>.from(json['nationalPokedexNumbers'] ?? []),
      legalities: Legalities.fromJson(json['legalities'] ?? {}),
      images: CardImages.fromJson(json['images'] ?? {}),
      tcgplayer: Market.fromJson(json['tcgplayer'] ?? {}),
      cardmarket: Market.fromJson(json['cardmarket'] ?? {}),
    );
  }
}

class Attack {
  final String name;
  final List<String> cost;
  final int convertedEnergyCost;
  final String damage;
  final String text;

  Attack({
    required this.name,
    this.cost = const [],
    this.convertedEnergyCost = 0,
    this.damage = "0",
    this.text = "No description",
  });

  factory Attack.fromJson(Map<String, dynamic> json) {
    return Attack(
      name: json['name'] ?? "unknown",
      cost: List<String>.from(json['cost'] ?? []),
      convertedEnergyCost: json['convertedEnergyCost'] ?? 0,
      damage: json['damage'] ?? "0",
      text: json['text'] ?? "No description",
    );
  }
}

class Weakness {
  final String type;
  final String value;

  Weakness({this.type = "unknown", this.value = "unknown"});

  factory Weakness.fromJson(Map<String, dynamic> json) {
    return Weakness(
      type: json['type'] ?? "unknown",
      value: json['value'] ?? "unknown",
    );
  }
}

class Resistance {
  final String type;
  final String value;

  Resistance({this.type = "unknown", this.value = "unknown"});

  factory Resistance.fromJson(Map<String, dynamic> json) {
    return Resistance(
      type: json['type'] ?? "unknown",
      value: json['value'] ?? "unknown",
    );
  }
}

class CardSet {
  final String id;
  final String name;
  final String series;
  final String releaseDate;
  final CardImages images;

  CardSet({
    this.id = "unknown",
    this.name = "unknown",
    this.series = "unknown",
    this.releaseDate = "unknown",
    required this.images,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) {
    return CardSet(
      id: json['id'] ?? "unknown",
      name: json['name'] ?? "unknown",
      series: json['series'] ?? "unknown",
      releaseDate: json['releaseDate'] ?? "unknown",
      images: CardImages.fromJson(json['images'] ?? {}),
    );
  }
}

class Legalities {
  final String unlimited;

  Legalities({this.unlimited = "unknown"});

  factory Legalities.fromJson(Map<String, dynamic> json) {
    return Legalities(unlimited: json['unlimited'] ?? "unknown");
  }
}

class CardImages {
  final String small;
  final String large;

  CardImages({this.small = "", this.large = ""});

  factory CardImages.fromJson(Map<String, dynamic> json) {
    return CardImages(
      small: json['small'] ?? "",
      large: json['large'] ?? "",
    );
  }
}

class Market {
  final String url;

  Market({this.url = ""});

  factory Market.fromJson(Map<String, dynamic> json) {
    return Market(url: json['url'] ?? "");
  }
}
