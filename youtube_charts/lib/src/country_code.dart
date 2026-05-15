enum YouTubeChartsCountry {
  global,
  ar,
  au,
  at,
  be,
  bo,
  br,
  ca,
  cl,
  co,
  cr,
  cz,
  dk,
  ec,
  eg,
  sv,
  ee,
  fi,
  fr,
  de,
  gt,
  hn,
  hk,
  hu,
  id,
  ie,
  il,
  it,
  jp,
  ke,
  lu,
  my,
  mx,
  nl,
  nz,
  ni,
  ng,
  no,
  pa,
  py,
  pe,
  ph,
  pl,
  pt,
  ro,
  ru,
  sa,
  rs,
  sg,
  za,
  kr,
  es,
  se,
  ch,
  tw,
  tz,
  th,
  tr,
  ug,
  ua,
  ae,
  gb,
  us,
  uy,
  vn,
  zw,
}

extension YouTubeChartsCountryExtension on YouTubeChartsCountry {
  String get code {
    switch (this) {
      case YouTubeChartsCountry.$do:
        return 'do';
      case YouTubeChartsCountry.is_:
        return 'is';
      case YouTubeChartsCountry.$in:
        return 'in';
      default:
        return name;
    }
  }

  String get displayName {
    switch (this) {
      case YouTubeChartsCountry.global: return 'Global';
      case YouTubeChartsCountry.ar: return 'Argentina';
      case YouTubeChartsCountry.au: return 'Australia';
      case YouTubeChartsCountry.at: return 'Austria';
      case YouTubeChartsCountry.be: return 'Belgium';
      case YouTubeChartsCountry.bo: return 'Bolivia';
      case YouTubeChartsCountry.br: return 'Brazil';
      case YouTubeChartsCountry.ca: return 'Canada';
      case YouTubeChartsCountry.cl: return 'Chile';
      case YouTubeChartsCountry.co: return 'Colombia';
      case YouTubeChartsCountry.cr: return 'Costa Rica';
      case YouTubeChartsCountry.cz: return 'Czechia';
      case YouTubeChartsCountry.dk: return 'Denmark';
      case YouTubeChartsCountry.$do: return 'Dominican Republic';
      case YouTubeChartsCountry.ec: return 'Ecuador';
      case YouTubeChartsCountry.eg: return 'Egypt';
      case YouTubeChartsCountry.sv: return 'El Salvador';
      case YouTubeChartsCountry.ee: return 'Estonia';
      case YouTubeChartsCountry.fi: return 'Finland';
      case YouTubeChartsCountry.fr: return 'France';
      case YouTubeChartsCountry.de: return 'Germany';
      case YouTubeChartsCountry.gt: return 'Guatemala';
      case YouTubeChartsCountry.hn: return 'Honduras';
      case YouTubeChartsCountry.hk: return 'Hong Kong';
      case YouTubeChartsCountry.hu: return 'Hungary';
      case YouTubeChartsCountry.is_: return 'Iceland';
      case YouTubeChartsCountry.$in: return 'India';
      case YouTubeChartsCountry.id: return 'Indonesia';
      case YouTubeChartsCountry.ie: return 'Ireland';
      case YouTubeChartsCountry.il: return 'Israel';
      case YouTubeChartsCountry.it: return 'Italy';
      case YouTubeChartsCountry.jp: return 'Japan';
      case YouTubeChartsCountry.ke: return 'Kenya';
      case YouTubeChartsCountry.lu: return 'Luxembourg';
      case YouTubeChartsCountry.my: return 'Malaysia';
      case YouTubeChartsCountry.mx: return 'Mexico';
      case YouTubeChartsCountry.nl: return 'Netherlands';
      case YouTubeChartsCountry.nz: return 'New Zealand';
      case YouTubeChartsCountry.ni: return 'Nicaragua';
      case YouTubeChartsCountry.ng: return 'Nigeria';
      case YouTubeChartsCountry.no: return 'Norway';
      case YouTubeChartsCountry.pa: return 'Panama';
      case YouTubeChartsCountry.py: return 'Paraguay';
      case YouTubeChartsCountry.pe: return 'Peru';
      case YouTubeChartsCountry.ph: return 'Philippines';
      case YouTubeChartsCountry.pl: return 'Poland';
      case YouTubeChartsCountry.pt: return 'Portugal';
      case YouTubeChartsCountry.ro: return 'Romania';
      case YouTubeChartsCountry.ru: return 'Russia';
      case YouTubeChartsCountry.sa: return 'Saudi Arabia';
      case YouTubeChartsCountry.rs: return 'Serbia';
      case YouTubeChartsCountry.sg: return 'Singapore';
      case YouTubeChartsCountry.za: return 'South Africa';
      case YouTubeChartsCountry.kr: return 'South Korea';
      case YouTubeChartsCountry.es: return 'Spain';
      case YouTubeChartsCountry.se: return 'Sweden';
      case YouTubeChartsCountry.ch: return 'Switzerland';
      case YouTubeChartsCountry.tw: return 'Taiwan';
      case YouTubeChartsCountry.tz: return 'Tanzania';
      case YouTubeChartsCountry.th: return 'Thailand';
      case YouTubeChartsCountry.tr: return 'Turkey';
      case YouTubeChartsCountry.ug: return 'Uganda';
      case YouTubeChartsCountry.ua: return 'Ukraine';
      case YouTubeChartsCountry.ae: return 'United Arab Emirates';
      case YouTubeChartsCountry.gb: return 'United Kingdom';
      case YouTubeChartsCountry.us: return 'United States';
      case YouTubeChartsCountry.uy: return 'Uruguay';
      case YouTubeChartsCountry.vn: return 'Vietnam';
      case YouTubeChartsCountry.zw: return 'Zimbabwe';
    }
  }
}
