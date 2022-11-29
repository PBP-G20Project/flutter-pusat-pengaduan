part of 'constant.dart';

var kRubik = GoogleFonts.rubik();
var kRubikBold = GoogleFonts.rubik(fontWeight: FontWeight.bold);
var kRubikItalic = GoogleFonts.rubik(fontStyle: FontStyle.italic);
var kRubikBoldItalic = GoogleFonts.rubik(
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
);

var kMerriweather = GoogleFonts.merriweather();
var kMerriweatherBold = GoogleFonts.merriweather(fontWeight: FontWeight.bold);
var kMerriweatherItalic = GoogleFonts.merriweather(fontStyle: FontStyle.italic);
var kMerriweatherBoldItalic = GoogleFonts.merriweather(
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
);

// copy new style
var kExampleFont = kRubik.copyWith(
  fontSize: 18,
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
);
