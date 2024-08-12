class SpotifyData {
  final BrowseStart browseStart;

  SpotifyData({required this.browseStart});

  factory SpotifyData.fromJson(Map<String, dynamic> json) {
    return SpotifyData(
      browseStart: BrowseStart.fromJson(json['browseStart']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'browseStart': browseStart.toJson(),
    };
  }
}

class BrowseStart {
  final String uri;
  final Sections sections;

  BrowseStart({
    required this.uri,
    required this.sections,
  });

  factory BrowseStart.fromJson(Map<String, dynamic> json) {
    return BrowseStart(
      uri: json['uri'],
      sections: Sections.fromJson(json['sections']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uri': uri,
      'sections': sections.toJson(),
    };
  }
}

class Sections {
  final List<SectionItem> items;

  Sections({required this.items});

  factory Sections.fromJson(Map<String, dynamic> json) {
    return Sections(
      items: List<SectionItem>.from(
          json['items'].map((item) => SectionItem.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class SectionItem {
  final String uri;
  final SectionData data;
  final SectionItems sectionItems;

  SectionItem({
    required this.uri,
    required this.data,
    required this.sectionItems,
  });

  factory SectionItem.fromJson(Map<String, dynamic> json) {
    return SectionItem(
      uri: json['uri'],
      data: SectionData.fromJson(json['data']),
      sectionItems: SectionItems.fromJson(json['sectionItems']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uri': uri,
      'data': data.toJson(),
      'sectionItems': sectionItems.toJson(),
    };
  }
}

class SectionData {
  final String typename;
  final Title title;

  SectionData({
    required this.typename,
    required this.title,
  });

  factory SectionData.fromJson(Map<String, dynamic> json) {
    return SectionData(
      typename: json['__typename'],
      title: Title.fromJson(json['title']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '__typename': typename,
      'title': title.toJson(),
    };
  }
}

class Title {
  final String transformedLabel;

  Title({required this.transformedLabel});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      transformedLabel: json['transformedLabel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transformedLabel': transformedLabel,
    };
  }
}

class SectionItems {
  final List<ContentItem> items;

  SectionItems({required this.items});

  factory SectionItems.fromJson(Map<String, dynamic> json) {
    return SectionItems(
      items: List<ContentItem>.from(
          json['items'].map((item) => ContentItem.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class ContentItem {
  final String uri;
  final Content content;

  ContentItem({
    required this.uri,
    required this.content,
  });

  factory ContentItem.fromJson(Map<String, dynamic> json) {
    return ContentItem(
      uri: json['uri'],
      content: Content.fromJson(json['content']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uri': uri,
      'content': content.toJson(),
    };
  }
}

class Content {
  final String typename;
  final ContentData data;

  Content({
    required this.typename,
    required this.data,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      typename: json['__typename'],
      data: ContentData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '__typename': typename,
      'data': data.toJson(),
    };
  }
}

class ContentData {
  final String typename;
  final CardRepresentation cardRepresentation;

  ContentData({
    required this.typename,
    required this.cardRepresentation,
  });

  factory ContentData.fromJson(Map<String, dynamic> json) {
    return ContentData(
      typename: json['__typename'],
      cardRepresentation:
          CardRepresentation.fromJson(json['data']['cardRepresentation']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '__typename': typename,
      'cardRepresentation': cardRepresentation.toJson(),
    };
  }
}

class CardRepresentation {
  final Title title;
  final Artwork artwork;
  final BackgroundColor backgroundColor;
  final List<IconOverlay>? iconOverlay;

  CardRepresentation({
    required this.title,
    required this.artwork,
    required this.backgroundColor,
    this.iconOverlay,
  });

  factory CardRepresentation.fromJson(Map<String, dynamic> json) {
    return CardRepresentation(
      title: Title.fromJson(json['title']),
      artwork: Artwork.fromJson(json['artwork']),
      backgroundColor: BackgroundColor.fromJson(json['backgroundColor']),
      iconOverlay: json['iconOverlay'] != null
          ? List<IconOverlay>.from(json['iconOverlay']['sources']
              .map((item) => IconOverlay.fromJson(item)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title.toJson(),
      'artwork': artwork.toJson(),
      'backgroundColor': backgroundColor.toJson(),
      'iconOverlay': iconOverlay?.map((item) => item.toJson()).toList(),
    };
  }
}

class Artwork {
  final List<ArtworkSource> sources;

  Artwork({required this.sources});

  factory Artwork.fromJson(Map<String, dynamic> json) {
    return Artwork(
      sources: List<ArtworkSource>.from(
          json['sources'].map((item) => ArtworkSource.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sources': sources.map((item) => item.toJson()).toList(),
    };
  }
}

class ArtworkSource {
  final String url;
  final int width;
  final int height;

  ArtworkSource({
    required this.url,
    required this.width,
    required this.height,
  });

  factory ArtworkSource.fromJson(Map<String, dynamic> json) {
    return ArtworkSource(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'width': width,
      'height': height,
    };
  }
}

class BackgroundColor {
  final String hex;

  BackgroundColor({required this.hex});

  factory BackgroundColor.fromJson(Map<String, dynamic> json) {
    return BackgroundColor(
      hex: json['hex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hex': hex,
    };
  }
}

class IconOverlay {
  final String url;
  final int width;
  final int height;

  IconOverlay({
    required this.url,
    required this.width,
    required this.height,
  });

  factory IconOverlay.fromJson(Map<String, dynamic> json) {
    return IconOverlay(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'width': width,
      'height': height,
    };
  }
}

// Map<String, dynamic> jsonData = jsonDecode(jsonString);
//
// SpotifyData spotifyData = SpotifyData.fromJson(jsonData['data']);
