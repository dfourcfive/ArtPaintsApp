class artModel {
  int _elapsedMilliseconds;
  int _count;
  CountFacets _countFacets;
  List<ArtObjects> _artObjects;

  artModel({
    int elapsedMilliseconds,
    int count,
    CountFacets countFacets,
    List<ArtObjects> artObjects,
  }) {
    this._elapsedMilliseconds = elapsedMilliseconds;
    this._count = count;
    this._countFacets = countFacets;
    this._artObjects = artObjects;
  }

  int get elapsedMilliseconds => _elapsedMilliseconds;
  set elapsedMilliseconds(int elapsedMilliseconds) =>
      _elapsedMilliseconds = elapsedMilliseconds;
  int get count => _count;
  set count(int count) => _count = count;
  CountFacets get countFacets => _countFacets;
  set countFacets(CountFacets countFacets) => _countFacets = countFacets;
  List<ArtObjects> get artObjects => _artObjects;
  set artObjects(List<ArtObjects> artObjects) => _artObjects = artObjects;

  artModel.fromJson(Map<String, dynamic> json) {
    _elapsedMilliseconds = json['elapsedMilliseconds'];
    _count = json['count'];
    _countFacets = json['countFacets'] != null
        ? new CountFacets.fromJson(json['countFacets'])
        : null;
    if (json['artObjects'] != null) {
      _artObjects = new List<ArtObjects>();
      json['artObjects'].forEach((v) {
        _artObjects.add(new ArtObjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elapsedMilliseconds'] = this._elapsedMilliseconds;
    data['count'] = this._count;
    if (this._countFacets != null) {
      data['countFacets'] = this._countFacets.toJson();
    }
    if (this._artObjects != null) {
      data['artObjects'] = this._artObjects.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class CountFacets {
  int _hasimage;
  int _ondisplay;

  CountFacets({int hasimage, int ondisplay}) {
    this._hasimage = hasimage;
    this._ondisplay = ondisplay;
  }

  int get hasimage => _hasimage;
  set hasimage(int hasimage) => _hasimage = hasimage;
  int get ondisplay => _ondisplay;
  set ondisplay(int ondisplay) => _ondisplay = ondisplay;

  CountFacets.fromJson(Map<String, dynamic> json) {
    _hasimage = json['hasimage'];
    _ondisplay = json['ondisplay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasimage'] = this._hasimage;
    data['ondisplay'] = this._ondisplay;
    return data;
  }
}

class ArtObjects {
  Links _links;
  String _id;
  String _objectNumber;
  String _title;
  bool _hasImage;
  String _principalOrFirstMaker;
  String _longTitle;
  bool _showImage;
  bool _permitDownload;
  WebImage _webImage;
  WebImage _headerImage;
  List<Null> _productionPlaces;

  ArtObjects(
      {Links links,
      String id,
      String objectNumber,
      String title,
      bool hasImage,
      String principalOrFirstMaker,
      String longTitle,
      bool showImage,
      bool permitDownload,
      WebImage webImage,
      WebImage headerImage,
      List<Null> productionPlaces}) {
    this._links = links;
    this._id = id;
    this._objectNumber = objectNumber;
    this._title = title;
    this._hasImage = hasImage;
    this._principalOrFirstMaker = principalOrFirstMaker;
    this._longTitle = longTitle;
    this._showImage = showImage;
    this._permitDownload = permitDownload;
    this._webImage = webImage;
    this._headerImage = headerImage;
    this._productionPlaces = productionPlaces;
  }

  Links get links => _links;
  set links(Links links) => _links = links;
  String get id => _id;
  set id(String id) => _id = id;
  String get objectNumber => _objectNumber;
  set objectNumber(String objectNumber) => _objectNumber = objectNumber;
  String get title => _title;
  set title(String title) => _title = title;
  bool get hasImage => _hasImage;
  set hasImage(bool hasImage) => _hasImage = hasImage;
  String get principalOrFirstMaker => _principalOrFirstMaker;
  set principalOrFirstMaker(String principalOrFirstMaker) =>
      _principalOrFirstMaker = principalOrFirstMaker;
  String get longTitle => _longTitle;
  set longTitle(String longTitle) => _longTitle = longTitle;
  bool get showImage => _showImage;
  set showImage(bool showImage) => _showImage = showImage;
  bool get permitDownload => _permitDownload;
  set permitDownload(bool permitDownload) => _permitDownload = permitDownload;
  WebImage get webImage => _webImage;
  set webImage(WebImage webImage) => _webImage = webImage;
  WebImage get headerImage => _headerImage;
  set headerImage(WebImage headerImage) => _headerImage = headerImage;
  List<Null> get productionPlaces => _productionPlaces;
  set productionPlaces(List<Null> productionPlaces) =>
      _productionPlaces = productionPlaces;

  ArtObjects.fromJson(Map<String, dynamic> json) {
    _links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    _id = json['id'];
    _objectNumber = json['objectNumber'];
    _title = json['title'];
    _hasImage = json['hasImage'];
    _principalOrFirstMaker = json['principalOrFirstMaker'];
    _longTitle = json['longTitle'];
    _showImage = json['showImage'];
    _permitDownload = json['permitDownload'];
    _webImage = json['webImage'] != null
        ? new WebImage.fromJson(json['webImage'])
        : null;
    _headerImage = json['headerImage'] != null
        ? new WebImage.fromJson(json['headerImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._links != null) {
      data['links'] = this._links.toJson();
    }
    data['id'] = this._id;
    data['objectNumber'] = this._objectNumber;
    data['title'] = this._title;
    data['hasImage'] = this._hasImage;
    data['principalOrFirstMaker'] = this._principalOrFirstMaker;
    data['longTitle'] = this._longTitle;
    data['showImage'] = this._showImage;
    data['permitDownload'] = this._permitDownload;
    if (this._webImage != null) {
      data['webImage'] = this._webImage.toJson();
    }
    if (this._headerImage != null) {
      data['headerImage'] = this._headerImage.toJson();
    }
    return data;
  }
}

class Links {
  String _self;
  String _web;

  Links({String self, String web}) {
    this._self = self;
    this._web = web;
  }

  String get self => _self;
  set self(String self) => _self = self;
  String get web => _web;
  set web(String web) => _web = web;

  Links.fromJson(Map<String, dynamic> json) {
    _self = json['self'];
    _web = json['web'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this._self;
    data['web'] = this._web;
    return data;
  }
}

class WebImage {
  String _guid;
  int _offsetPercentageX;
  int _offsetPercentageY;
  int _width;
  int _height;
  String _url;

  WebImage(
      {String guid,
      int offsetPercentageX,
      int offsetPercentageY,
      int width,
      int height,
      String url}) {
    this._guid = guid;
    this._offsetPercentageX = offsetPercentageX;
    this._offsetPercentageY = offsetPercentageY;
    this._width = width;
    this._height = height;
    this._url = url;
  }

  String get guid => _guid;
  set guid(String guid) => _guid = guid;
  int get offsetPercentageX => _offsetPercentageX;
  set offsetPercentageX(int offsetPercentageX) =>
      _offsetPercentageX = offsetPercentageX;
  int get offsetPercentageY => _offsetPercentageY;
  set offsetPercentageY(int offsetPercentageY) =>
      _offsetPercentageY = offsetPercentageY;
  int get width => _width;
  set width(int width) => _width = width;
  int get height => _height;
  set height(int height) => _height = height;
  String get url => _url;
  set url(String url) => _url = url;

  WebImage.fromJson(Map<String, dynamic> json) {
    _guid = json['guid'];
    _offsetPercentageX = json['offsetPercentageX'];
    _offsetPercentageY = json['offsetPercentageY'];
    _width = json['width'];
    _height = json['height'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this._guid;
    data['offsetPercentageX'] = this._offsetPercentageX;
    data['offsetPercentageY'] = this._offsetPercentageY;
    data['width'] = this._width;
    data['height'] = this._height;
    data['url'] = this._url;
    return data;
  }
}
