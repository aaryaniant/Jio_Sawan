// class TopPlayListModel {
// 	String ?id;
// 	String ?title;
// 	String ?subtitle;
// 	String ?headerDesc;
// 	String ?type;
// 	String ?permaUrl;
// 	String ?image;
// 	String ?language;
// 	String ?year;
// 	String ?playCount;
// 	String ?explicitContent;
// 	String ?listCount;
// 	String ?listType;
// 	List<List> list;
// 	MoreInfo ?moreInfo;
// 	Modules ?modules;

// 	TopPlayListModel({this.id, this.title, this.subtitle, this.headerDesc, this.type, this.permaUrl, this.image, this.language, this.year, this.playCount, this.explicitContent, this.listCount, this.listType, this.list, this.moreInfo, this.modules});

// 	TopPlayListModel.fromJson(Map<String, dynamic> json) {
// 		id = json['id'];
// 		title = json['title'];
// 		subtitle = json['subtitle'];
// 		headerDesc = json['header_desc'];
// 		type = json['type'];
// 		permaUrl = json['perma_url'];
// 		image = json['image'];
// 		language = json['language'];
// 		year = json['year'];
// 		playCount = json['play_count'];
// 		explicitContent = json['explicit_content'];
// 		listCount = json['list_count'];
// 		listType = json['list_type'];
// 		if (json['list'] != null) {
// 			list = new List<List>();
// 			json['list'].forEach((v) { list.add(new List.fromJson(v)); });
// 		}
// 		moreInfo = json['more_info'] != null ? new MoreInfo.fromJson(json['more_info']) : null;
// 		modules = json['modules'] != null ? new Modules.fromJson(json['modules']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['id'] = this.id;
// 		data['title'] = this.title;
// 		data['subtitle'] = this.subtitle;
// 		data['header_desc'] = this.headerDesc;
// 		data['type'] = this.type;
// 		data['perma_url'] = this.permaUrl;
// 		data['image'] = this.image;
// 		data['language'] = this.language;
// 		data['year'] = this.year;
// 		data['play_count'] = this.playCount;
// 		data['explicit_content'] = this.explicitContent;
// 		data['list_count'] = this.listCount;
// 		data['list_type'] = this.listType;
// 		if (this.list != null) {
//       data['list'] = this.list.map((v) => v.toJson()).toList();
//     }
// 		if (this.moreInfo != null) {
//       data['more_info'] = this.moreInfo.toJson();
//     }
// 		if (this.modules != null) {
//       data['modules'] = this.modules.toJson();
//     }
// 		return data;
// 	}
// }

// class List {
// 	String ?id;
// 	String ?title;
// 	String ?shershaah;
// 	String ?subtitle;
// 	String ?headerDesc;
// 	String ?type;
// 	String ?permaUrl;
// 	String ?image;
// 	String ?language;
// 	String ?year;
// 	String ?playCount;
// 	String ?explicitContent;
// 	String ?listCount;
// 	String ?listType;
// 	String ?list;
// 	MoreInfo? moreInfo;

// 	List({this.id, this.title, this.shershaah, this.subtitle, this.headerDesc, this.type, this.permaUrl, this.image, this.language, this.year, this.playCount, this.explicitContent, this.listCount, this.listType, this.list, this.moreInfo});

// 	List.fromJson(Map<String, dynamic> json) {
// 		id = json['id'];
// 		title = json['title'];
// 		shershaah = json['Shershaah'];
// 		subtitle = json['subtitle'];
// 		headerDesc = json['header_desc'];
// 		type = json['type'];
// 		permaUrl = json['perma_url'];
// 		image = json['image'];
// 		language = json['language'];
// 		year = json['year'];
// 		playCount = json['play_count'];
// 		explicitContent = json['explicit_content'];
// 		listCount = json['list_count'];
// 		listType = json['list_type'];
// 		list = json['list'];
// 		moreInfo = json['more_info'] != null ? new MoreInfo.fromJson(json['more_info']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['id'] = this.id;
// 		data['title'] = this.title;
// 		data['Shershaah'] = this.shershaah;
// 		data['subtitle'] = this.subtitle;
// 		data['header_desc'] = this.headerDesc;
// 		data['type'] = this.type;
// 		data['perma_url'] = this.permaUrl;
// 		data['image'] = this.image;
// 		data['language'] = this.language;
// 		data['year'] = this.year;
// 		data['play_count'] = this.playCount;
// 		data['explicit_content'] = this.explicitContent;
// 		data['list_count'] = this.listCount;
// 		data['list_type'] = this.listType;
// 		data['list'] = this.list;
// 		if (this.moreInfo != null) {
//       data['more_info'] = this.moreInfo.toJson();
//     }
// 		return data;
// 	}
// }

// class MoreInfo {
// 	String music;
// 	String albumId;
// 	String album;
// 	String shershaah;
// 	String label;
// 	String origin;
// 	bool isDolbyContent;
// 	String s320kbps;
// 	String encryptedMediaUrl;
// 	String encryptedCacheUrl;
// 	String albumUrl;
// 	String duration;
// 	Rights rights;
// 	String cacheState;
// 	String hasLyrics;
// 	String lyricsSnippet;
// 	String starred;
// 	String copyrightText;
// 	ArtistMap artistMap;
// 	String releaseDate;
// 	String labelUrl;
// 	String vcode;
// 	String vlink;
// 	bool trillerAvailable;
// 	String lyricsId;

// 	MoreInfo({this.music, this.albumId, this.album, this.shershaah, this.label, this.origin, this.isDolbyContent, this.s320kbps, this.encryptedMediaUrl, this.encryptedCacheUrl, this.albumUrl, this.duration, this.rights, this.cacheState, this.hasLyrics, this.lyricsSnippet, this.starred, this.copyrightText, this.artistMap, this.releaseDate, this.labelUrl, this.vcode, this.vlink, this.trillerAvailable, this.lyricsId});

// 	MoreInfo.fromJson(Map<String, dynamic> json) {
// 		music = json['music'];
// 		albumId = json['album_id'];
// 		album = json['album'];
// 		shershaah = json['Shershaah'];
// 		label = json['label'];
// 		origin = json['origin'];
// 		isDolbyContent = json['is_dolby_content'];
// 		s320kbps = json['320kbps'];
// 		encryptedMediaUrl = json['encrypted_media_url'];
// 		encryptedCacheUrl = json['encrypted_cache_url'];
// 		albumUrl = json['album_url'];
// 		duration = json['duration'];
// 		rights = json['rights'] != null ? new Rights.fromJson(json['rights']) : null;
// 		cacheState = json['cache_state'];
// 		hasLyrics = json['has_lyrics'];
// 		lyricsSnippet = json['lyrics_snippet'];
// 		starred = json['starred'];
// 		copyrightText = json['copyright_text'];
// 		artistMap = json['artistMap'] != null ? new ArtistMap.fromJson(json['artistMap']) : null;
// 		releaseDate = json['release_date'];
// 		labelUrl = json['label_url'];
// 		vcode = json['vcode'];
// 		vlink = json['vlink'];
// 		trillerAvailable = json['triller_available'];
// 		lyricsId = json['lyrics_id'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['music'] = this.music;
// 		data['album_id'] = this.albumId;
// 		data['album'] = this.album;
// 		data['Shershaah'] = this.shershaah;
// 		data['label'] = this.label;
// 		data['origin'] = this.origin;
// 		data['is_dolby_content'] = this.isDolbyContent;
// 		data['320kbps'] = this.s320kbps;
// 		data['encrypted_media_url'] = this.encryptedMediaUrl;
// 		data['encrypted_cache_url'] = this.encryptedCacheUrl;
// 		data['album_url'] = this.albumUrl;
// 		data['duration'] = this.duration;
// 		if (this.rights != null) {
//       data['rights'] = this.rights.toJson();
//     }
// 		data['cache_state'] = this.cacheState;
// 		data['has_lyrics'] = this.hasLyrics;
// 		data['lyrics_snippet'] = this.lyricsSnippet;
// 		data['starred'] = this.starred;
// 		data['copyright_text'] = this.copyrightText;
// 		if (this.artistMap != null) {
//       data['artistMap'] = this.artistMap.toJson();
//     }
// 		data['release_date'] = this.releaseDate;
// 		data['label_url'] = this.labelUrl;
// 		data['vcode'] = this.vcode;
// 		data['vlink'] = this.vlink;
// 		data['triller_available'] = this.trillerAvailable;
// 		data['lyrics_id'] = this.lyricsId;
// 		return data;
// 	}
// }

// class Rights {
// 	String code;
// 	String cacheable;
// 	String deleteCachedObject;
// 	String reason;

// 	Rights({this.code, this.cacheable, this.deleteCachedObject, this.reason});

// 	Rights.fromJson(Map<String, dynamic> json) {
// 		code = json['code'];
// 		cacheable = json['cacheable'];
// 		deleteCachedObject = json['delete_cached_object'];
// 		reason = json['reason'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['code'] = this.code;
// 		data['cacheable'] = this.cacheable;
// 		data['delete_cached_object'] = this.deleteCachedObject;
// 		data['reason'] = this.reason;
// 		return data;
// 	}
// }

// class ArtistMap {
// 	List<PrimaryArtists> primaryArtists;
// 	List<FeaturedArtists> featuredArtists;
// 	List<Artists> artists;

// 	ArtistMap({this.primaryArtists, this.featuredArtists, this.artists});

// 	ArtistMap.fromJson(Map<String, dynamic> json) {
// 		if (json['primary_artists'] != null) {
// 			primaryArtists = new List<PrimaryArtists>();
// 			json['primary_artists'].forEach((v) { primaryArtists.add(new PrimaryArtists.fromJson(v)); });
// 		}
// 		if (json['featured_artists'] != null) {
// 			featuredArtists = new List<FeaturedArtists>();
// 			json['featured_artists'].forEach((v) { featuredArtists.add(new FeaturedArtists.fromJson(v)); });
// 		}
// 		if (json['artists'] != null) {
// 			artists = new List<Artists>();
// 			json['artists'].forEach((v) { artists.add(new Artists.fromJson(v)); });
// 		}
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.primaryArtists != null) {
//       data['primary_artists'] = this.primaryArtists.map((v) => v.toJson()).toList();
//     }
// 		if (this.featuredArtists != null) {
//       data['featured_artists'] = this.featuredArtists.map((v) => v.toJson()).toList();
//     }
// 		if (this.artists != null) {
//       data['artists'] = this.artists.map((v) => v.toJson()).toList();
//     }
// 		return data;
// 	}
// }

// class PrimaryArtists {
// 	String id;
// 	String name;
// 	String role;
// 	String image;
// 	String type;
// 	String permaUrl;

// 	PrimaryArtists({this.id, this.name, this.role, this.image, this.type, this.permaUrl});

// 	PrimaryArtists.fromJson(Map<String, dynamic> json) {
// 		id = json['id'];
// 		name = json['name'];
// 		role = json['role'];
// 		image = json['image'];
// 		type = json['type'];
// 		permaUrl = json['perma_url'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['id'] = this.id;
// 		data['name'] = this.name;
// 		data['role'] = this.role;
// 		data['image'] = this.image;
// 		data['type'] = this.type;
// 		data['perma_url'] = this.permaUrl;
// 		return data;
// 	}
// }

// class MoreInfo {
// 	String uid;
// 	bool isDolbyContent;
// 	List<Null> subtype;
// 	String lastUpdated;
// 	String username;
// 	String firstname;
// 	String lastname;
// 	String isFollowed;
// 	bool isFY;
// 	String followerCount;
// 	String fanCount;
// 	String playlistType;
// 	String share;
// 	List<Null> subTypes;
// 	List<Null> images;
// 	String h2;
// 	Null subheading;
// 	String videoCount;

// 	MoreInfo({this.uid, this.isDolbyContent, this.subtype, this.lastUpdated, this.username, this.firstname, this.lastname, this.isFollowed, this.isFY, this.followerCount, this.fanCount, this.playlistType, this.share, this.subTypes, this.images, this.h2, this.subheading, this.videoCount});

// 	MoreInfo.fromJson(Map<String, dynamic> json) {
// 		uid = json['uid'];
// 		isDolbyContent = json['is_dolby_content'];
// 		if (json['subtype'] != null) {
// 			subtype = new List<Null>();
// 			json['subtype'].forEach((v) { subtype.add(new Null.fromJson(v)); });
// 		}
// 		lastUpdated = json['last_updated'];
// 		username = json['username'];
// 		firstname = json['firstname'];
// 		lastname = json['lastname'];
// 		isFollowed = json['is_followed'];
// 		isFY = json['isFY'];
// 		followerCount = json['follower_count'];
// 		fanCount = json['fan_count'];
// 		playlistType = json['playlist_type'];
// 		share = json['share'];
// 		if (json['sub_types'] != null) {
// 			subTypes = new List<Null>();
// 			json['sub_types'].forEach((v) { subTypes.add(new Null.fromJson(v)); });
// 		}
// 		if (json['images'] != null) {
// 			images = new List<Null>();
// 			json['images'].forEach((v) { images.add(new Null.fromJson(v)); });
// 		}
// 		h2 = json['H2'];
// 		subheading = json['subheading'];
// 		videoCount = json['video_count'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['uid'] = this.uid;
// 		data['is_dolby_content'] = this.isDolbyContent;
// 		if (this.subtype != null) {
//       data['subtype'] = this.subtype.map((v) => v.toJson()).toList();
//     }
// 		data['last_updated'] = this.lastUpdated;
// 		data['username'] = this.username;
// 		data['firstname'] = this.firstname;
// 		data['lastname'] = this.lastname;
// 		data['is_followed'] = this.isFollowed;
// 		data['isFY'] = this.isFY;
// 		data['follower_count'] = this.followerCount;
// 		data['fan_count'] = this.fanCount;
// 		data['playlist_type'] = this.playlistType;
// 		data['share'] = this.share;
// 		if (this.subTypes != null) {
//       data['sub_types'] = this.subTypes.map((v) => v.toJson()).toList();
//     }
// 		if (this.images != null) {
//       data['images'] = this.images.map((v) => v.toJson()).toList();
//     }
// 		data['H2'] = this.h2;
// 		data['subheading'] = this.subheading;
// 		data['video_count'] = this.videoCount;
// 		return data;
// 	}
// }

// class Modules {
// 	List ?list;

// 	Modules({this.list});

// 	Modules.fromJson(Map<String, dynamic> json) {
// 		if (json['list'] != null) {
// 			list = new List<null>[];
// 			json['list'].forEach((v) { list.add(new null.fromJson(v)); });
// 		}
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.list != null) {
//       data['list'] = this.list!.map((v) => v.toJson()).toList();
//     }
// 		return data;
// 	}
// }

// class List {


// 	List({});

// 	List.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }
