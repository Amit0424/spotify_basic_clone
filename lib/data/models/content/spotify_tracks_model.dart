class SpotifyTracks {
  final List<Track> tracks;

  SpotifyTracks({required this.tracks});

  factory SpotifyTracks.fromJson(Map<String, dynamic> json) {
    return SpotifyTracks(
      tracks:
          List<Track>.from(json['tracks'].map((item) => Track.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tracks': tracks.map((track) => track.toJson()).toList(),
    };
  }
}

class Track {
  final Album album;
  final List<Artist> artists;
  final int discNumber;
  final int durationMs;
  final bool explicit;
  final ExternalIds externalIds;
  final ExternalUrls externalUrls;
  final String id;
  final bool isLocal;
  final bool isPlayable;
  final LinkedFrom linkedFrom;
  final String name;
  final int popularity;
  final String? previewUrl;
  final int trackNumber;
  final String type;
  final String uri;

  Track({
    required this.album,
    required this.artists,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalIds,
    required this.externalUrls,
    required this.id,
    required this.isLocal,
    required this.isPlayable,
    required this.linkedFrom,
    required this.name,
    required this.popularity,
    this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      album: Album.fromJson(json['album']),
      artists: List<Artist>.from(
          json['artists'].map((item) => Artist.fromJson(item))),
      discNumber: json['disc_number'],
      durationMs: json['duration_ms'],
      explicit: json['explicit'],
      externalIds: ExternalIds.fromJson(json['external_ids']),
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      id: json['id'],
      isLocal: json['is_local'],
      isPlayable: json['is_playable'],
      linkedFrom: LinkedFrom.fromJson(json['linked_from']),
      name: json['name'],
      popularity: json['popularity'],
      previewUrl: json['preview_url'],
      trackNumber: json['track_number'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'album': album.toJson(),
      'artists': artists.map((artist) => artist.toJson()).toList(),
      'disc_number': discNumber,
      'duration_ms': durationMs,
      'explicit': explicit,
      'external_ids': externalIds.toJson(),
      'external_urls': externalUrls.toJson(),
      'id': id,
      'is_local': isLocal,
      'is_playable': isPlayable,
      'linked_from': linkedFrom.toJson(),
      'name': name,
      'popularity': popularity,
      'preview_url': previewUrl,
      'track_number': trackNumber,
      'type': type,
      'uri': uri,
    };
  }
}

class Album {
  final String albumType;
  final List<Artist> artists;
  final ExternalUrls externalUrls;
  final String id;
  final List<Image> images;
  final bool isPlayable;
  final String name;
  final String releaseDate;
  final String releaseDatePrecision;
  final int totalTracks;
  final String type;
  final String uri;

  Album({
    required this.albumType,
    required this.artists,
    required this.externalUrls,
    required this.id,
    required this.images,
    required this.isPlayable,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumType: json['album_type'],
      artists: List<Artist>.from(
          json['artists'].map((item) => Artist.fromJson(item))),
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      id: json['id'],
      images:
          List<Image>.from(json['images'].map((item) => Image.fromJson(item))),
      isPlayable: json['is_playable'],
      name: json['name'],
      releaseDate: json['release_date'],
      releaseDatePrecision: json['release_date_precision'],
      totalTracks: json['total_tracks'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'album_type': albumType,
      'artists': artists.map((artist) => artist.toJson()).toList(),
      'external_urls': externalUrls.toJson(),
      'id': id,
      'images': images.map((image) => image.toJson()).toList(),
      'is_playable': isPlayable,
      'name': name,
      'release_date': releaseDate,
      'release_date_precision': releaseDatePrecision,
      'total_tracks': totalTracks,
      'type': type,
      'uri': uri,
    };
  }
}

class Artist {
  final ExternalUrls externalUrls;
  final String id;
  final String name;
  final String type;
  final String uri;

  Artist({
    required this.externalUrls,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      id: json['id'],
      name: json['name'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'external_urls': externalUrls.toJson(),
      'id': id,
      'name': name,
      'type': type,
      'uri': uri,
    };
  }
}

class ExternalUrls {
  final String spotify;

  ExternalUrls({required this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) {
    return ExternalUrls(
      spotify: json['spotify'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'spotify': spotify,
    };
  }
}

class Image {
  final int height;
  final String url;
  final int width;

  Image({
    required this.height,
    required this.url,
    required this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      height: json['height'],
      url: json['url'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'url': url,
      'width': width,
    };
  }
}

class ExternalIds {
  final String isrc;

  ExternalIds({required this.isrc});

  factory ExternalIds.fromJson(Map<String, dynamic> json) {
    return ExternalIds(
      isrc: json['isrc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isrc': isrc,
    };
  }
}

class LinkedFrom {
  final ExternalUrls externalUrls;
  final String id;
  final String type;
  final String uri;

  LinkedFrom({
    required this.externalUrls,
    required this.id,
    required this.type,
    required this.uri,
  });

  factory LinkedFrom.fromJson(Map<String, dynamic> json) {
    return LinkedFrom(
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      id: json['id'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'external_urls': externalUrls.toJson(),
      'id': id,
      'type': type,
      'uri': uri,
    };
  }
}
