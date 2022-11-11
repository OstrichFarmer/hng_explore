class LangData {
  String? name;
  String? engName;
  bool? current;
  int? id;

  LangData({this.name, this.engName, this.current, this.id});
}

class Lang {
  static var bahasa = 1;
  static var deutsch = 2;
  static var english = 3;
  static var espanol = 4;
  static var francaise = 5;
  static var italiano = 6;
  static var portugues = 7;
  static var pycckuu = 8;
  static var svenska = 9;
  static var turkce = 10;
  static var chinese = 11;
  static var arabic = 12;
  static var bangla = 13;

  List<LangData> langData = [
    LangData(name: "Bahasa", engName: "Bahasa", current: false, id: bahasa),
    LangData(name: "Deutsch", engName: "Deutsch", current: false, id: deutsch),
    LangData(name: "English", engName: "English", current: false, id: english),
    LangData(name: "Español", engName: "Español", current: false, id: espanol),
    LangData(
        name: "Française", engName: "Française", current: false, id: francaise),
    LangData(
        name: "Italiano", engName: "Italiano", current: false, id: italiano),
    LangData(
        name: "Português", engName: "Português", current: false, id: portugues),
    LangData(
        name: "Pу́сский", engName: "Pу́сский", current: false, id: pycckuu),
    LangData(name: "Svenska", engName: "Svenska", current: false, id: svenska),
    LangData(name: "Türkçe", engName: "Türkçe", current: false, id: turkce),
    LangData(name: "普通话", engName: "普通话", current: false, id: chinese),
    LangData(name: "بالعربية", engName: "بالعربية", current: false, id: arabic),
    LangData(name: "বাঙ্গালী", engName: "বাঙ্গালী", current: false, id: bangla),
  ];
  Map<int, String> langEnglish = {
    0: "Search Country",
    1: "Filter",
    2: "Population",
    3: "Region",
    4: "Capital",
    5: "Motto",
    6: "Official Language",
    7: "Ethnic group",
    8: "Religion",
    9: "Government",
    10: "Independence",
    11: "Area",
    12: "Currency",
    13: "Time Zone",
    14: "Date formed",
    15: "Dialling code",
    16: "Driving side",
    17: "Languages",
    18: "Continent",
    19: "Reset",
    20: "Show Results",
  };

  Map<int, String> langFrench = {
    0: "Rechercher un pays",
    1: "Filtre",
    2: "Population",
    3: "Région",
    4: "Capitale",
    5: "Devise",
    6: "Langue officielle",
    7: "Groupe ethnique",
    8: 'La religion',
    9: "Gouvernement",
    10: "Indépendance",
    11: "Zone",
    12: "Devise",
    13: "Fuseau horaire",
    14: "Date de formation",
    15: "Indicatif téléphonique",
    16: "Côté conduite",
    17: "Langues",
    18: "Continent",
    19: "Réinitialiser",
    20: "Afficher les résultats",
  };

  Map<int, String> langBahasa = {
    0: "Cari Negara",
    1: "Filter",
    2: "Populasi",
    3: "Wilayah",
    4: "Modal",
    5: "Motto",
    6: "Bahasa Resmi",
    7: "Kelompok etnis",
    8: "Agama",
    9: "Pemerintah",
    10: "Kemerdekaan",
    11: "Daerah",
    12: "Mata Uang",
    13: "Zona Waktu",
    14: "Tanggal terbentuk",
    15: "Kode panggilan",
    16: "Sisi mengemudi",
    17: "Bahasa",
    18: "Benua",
    19: "Setel Ulang",
    20: "Tampilkan Hasil",
  };

  Map<int, String> langDeutsch = {
    0: "Land suchen",
    1: "Filtern",
    2: "Bevölkerung",
    3: "Region",
    4: "Hauptstadt",
    5: "Motto",
    6: "Amtssprache",
    7: "Ethnische Gruppe",
    8: "Religion",
    9: "Regierung",
    10: "Unabhängigkeit",
    11: "Bereich",
    12: "Währung",
    13: "Zeitzone",
    14: 'Gründungsdatum',
    15: 'Vorwahl',
    16: 'Fahrerseite',
    17: "Sprachen",
    18: "Kontinent",
    19: "Zurücksetzen",
    20: "Ergebnisse anzeigen",
  };

  Map<int, String> langEspanol = {
    0: "Buscar país",
    1: "Filtro",
    2: "Población",
    3: "Región",
    4: "Capital",
    5: "Lema",
    6: "Idioma oficial",
    7: "Grupo étnico",
    8: "Religión",
    9: "Gobierno",
    10: "Independencia",
    11: "Área",
    12: "Moneda",
    13: "Zona horaria",
    14: "Fecha de formación",
    15: "Código de marcación",
    16: "Lado del conductor",
    17: "Idiomas",
    18: "Continente",
    19: "Reiniciar",
    20: "Mostrar resultados",
  };
  Map<int, String> langItal = {
    0: "Cerca Paese",
    1: "Filtro",
    2: "Popolazione",
    3: "Regione",
    4: "Capitale",
    5: "Motto",
    6: "Lingua ufficiale",
    7: "Gruppo etnico",
    8: "Religione",
    9: "Governo",
    10: "Indipendenza",
    11: "Area",
    12: "Valuta",
    13: "Fuso orario",
    14: "Data di costituzione",
    15: "Prefisso",
    16: "Lato guida",
    17: "Lingue",
    18: "Continente",
    19: "Ripristino",
    20: "Mostra risultati",
  };
  Map<int, String> langPort = {
    0: "Pesquisar país",
    1: "Filtro",
    2: "População",
    3: "Região",
    4: "Capital",
    5: "Lema",
    6: "Língua Oficial",
    7: "Grupo étnico",
    8: "Religião",
    9: "Governo",
    10: "Independência",
    11: "Área",
    12: "Moeda",
    13: "Fuso Horário",
    14: "Data formada",
    15: "Código de discagem",
    16: "Lado de condução",
    17: "Idiomas",
    18: "Continente",
    19: "Redefinir",
    20: "Mostrar Resultados",
  };
  Map<int, String> langPycckuu = {
    0: "Страна поиска",
    1: "Фильтр",
    2: "Население",
    3: "Область",
    4: "Столица",
    5: "Девиз",
    6: "Официальный язык",
    7: "Этническая группа",
    8: "Религия",
    9: "Правительство",
    10: "Независимость",
    11: "Площадь",
    12: "Валюта",
    13: "Часовой пояс",
    14: "Дата образования",
    15: "Код набора",
    16: "Водительская сторона",
    17: "Языки",
    18: "Континент",
    19: "Сброс",
    20: "Показать результаты",
  };
  Map<int, String> langSven = {
    0: "Sök land",
    1: "Filter",
    2: "Befolkning",
    3: "Region",
    4: "Kapital",
    5: "Motto",
    6: "Officiellt språk",
    7: "Etnisk grupp",
    8: "Religion",
    9: "Regering",
    10: "Oberoende",
    11: "Område",
    12: "Valuta",
    13: "Tidszon",
    14: "Datum bildat",
    15: "Ringernummer",
    16: "Körsidan",
    17: "Språk",
    18: "Kontinenten",
    19: "Återställ",
    20: "Visa resultat",
  };
  Map<int, String> langTurk = {
    0: "Ülke Ara",
    1: "Filtre",
    2: "Nüfus",
    3: "Bölge",
    4: "Sermaye",
    5: "Slogan",
    6: "Resmi Dil",
    7: "Etnik grup",
    8: "Din",
    9: "Hükümet",
    10: "Bağımsızlık",
    11: "Alan",
    12: "Para Birimi",
    13: "Zaman Dilimi",
    14: "Kuruluş tarihi",
    15: "Arama kodu",
    16: "Sürüş tarafı",
    17: "Diller",
    18: "Kıta",
    19: "Sıfırla",
    20: "Sonuçları Göster",
  };
  Map<int, String> langChinese = {
    0: "Sōusuǒ guójiā",
    1: "Guòlǜ qì",
    2: "Rénkǒu",
    3: "Dìqū",
    4: "Zīběn",
    5: "Zuòyòumíng",
    6: "Guānfāng yǔyán",
    7: "Mínzú",
    8: "Zōngjiào",
    9: "Zhèngfǔ",
    10: "Dúlì",
    11: "Qūyù",
    12: "Huòbì",
    13: "Shíqū",
    14: "Chénglì rìqí",
    15: "Bōhào dàimǎ",
    16: "Jiàshǐ cè",
    17: "Yǔyán",
    18: "Dàlù",
    19: "Chóng zhì",
    20: "Xiǎnshì jiéguǒ",
  };
  Map<int, String> langArab = {
    0: "بحث البلد",
    1: "تصفية",
    2: "السكان",
    3: "المنطقة",
    4: "رأس المال",
    5: "الشعار",
    6: "اللغة الرسمية",
    7: "المجموعة العرقية",
    8: "الدين",
    9: "الحكومة",
    10: "الاستقلال",
    11: "المنطقة",
    12: "العملة",
    13: "المنطقة الزمنية",
    14: "تاريخ التشكيل",
    15: "رمز الاتصال",
    16: "جانب القيادة",
    17: "اللغات",
    18: "القارة",
    19: "إعادة تعيين",
    20: "عرض النتائج",
  };
  Map<int, String> langBangla = {
    0: "দেশ অনুসন্ধান করুন",
    1: "ফিল্টার",
    2: "জনসংখ্যা",
    3: "অঞ্চল",
    4: "পুঁজি",
    5: "মটো",
    6: "সরকারি ভাষা",
    7: "জাতিগোষ্ঠী",
    8: "ধর্ম",
    9: "সরকার",
    10: "স্বাধীনতা",
    11: "এরিয়া",
    12: "মুদ্রা",
    13: "টাইম জোন",
    14: "গঠিত তারিখ",
    15: "ডায়ালিং কোড",
    16: "ড্রাইভিং সাইড",
    17: "ভাষা",
    18: "মহাদেশ",
    19: "রিসেট",
    20: "ফলাফল দেখান",
  };

  setLang(int id) {
    if (id == english) {
      defaultLang = langEnglish;
      init = true;
    }
    if (id == francaise) {
      defaultLang = langFrench;
      init = true;
    }

    if (id == deutsch) {
      defaultLang = langDeutsch;
      init = true;
    }
    if (id == espanol) {
      defaultLang = langEspanol;
      init = true;
    }
    if (id == italiano) {
      defaultLang = langItal;
      init = true;
    }
    if (id == portugues) {
      defaultLang = langPort;
      init = true;
    }
    if (id == pycckuu) {
      defaultLang = langPycckuu;
      init = true;
    }
    if (id == svenska) {
      defaultLang = langSven;
      init = true;
    }
    if (id == turkce) {
      defaultLang = langTurk;
      init = true;
    }
    if (id == chinese) {
      defaultLang = langChinese;
      init = true;
    }
    if (id == arabic) {
      defaultLang = langArab;
      init = true;
    }
    if (id == bangla) {
      defaultLang = langBangla;
      init = true;
    }
    if (id == bahasa) {
      defaultLang = langBahasa;
      init = true;
    }
    for (var lang in langData) {
      lang.current = false;
      if (lang.id == id) lang.current = true;
    }
  }

  Map<int, String>? defaultLang;
  var init = false;

  String get(int id) {
    if (!init) return "";
    return defaultLang![id]!;
  }
}
