
const countries = [
  {
    "name": "Afghanistan",
    "dial_code": "+93",
    "code": "AF",
    "format": " ### ### ####",
    "format_place_holder": " 070 123 4567"
  },
  {
    "name": "Aland Islands",
    "dial_code": "+358",
    "code": "AX",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Albania",
    "dial_code": "+355",
    "code": "AL",
    "format": " ### ### ####",
    "format_place_holder": " 066 123 4567"
  },
  {
    "name": "Algeria",
    "dial_code": "+213",
    "code": "DZ",
    "format": " #### ## ## ##",
    "format_place_holder": " 0551 23 45 67"
  },
  {
    "name": "AmericanSamoa",
    "dial_code": "+1684",
    "code": "AS",
    "format": " (###) ###-####",
    "format_place_holder": " (684) 733-1234"
  },
  {
    "name": "Andorra",
    "dial_code": "+376",
    "code": "AD",
    "format": " ### ###",
    "format_place_holder": " 312 345"
  },
  {
    "name": "Angola",
    "dial_code": "+244",
    "code": "AO",
    "format": " ### ### ###",
    "format_place_holder": " 923 123 456"
  },
  {
    "name": "Anguilla",
    "dial_code": "+1264",
    "code": "AI",
    "format": " (###) ###-####",
    "format_place_holder": " (264) 235-1234"
  },
  {
    "name": "Antarctica",
    "dial_code": "+672",
    "code": "AQ",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Antigua and Barbuda",
    "dial_code": "+1268",
    "code": "AG",
    "format": " (###) ###-####",
    "format_place_holder": " (268) 464-1234"
  },
  {
    "name": "Argentina",
    "dial_code": "+54",
    "code": "AR",
    "format": " ### ##-####-####",
    "format_place_holder": " 011 15-2345-6789"
  },
  {
    "name": "Armenia",
    "dial_code": "+374",
    "code": "AM",
    "format": " ### ######",
    "format_place_holder": " 077 123456"
  },
  {
    "name": "Aruba",
    "dial_code": "+297",
    "code": "AW",
    "format": " ### ####",
    "format_place_holder": " 560 1234"
  },
  {
    "name": "Australia",
    "dial_code": "+61",
    "code": "AU",
    "format": " #### ### ###",
    "format_place_holder": " 0412 345 678"
  },
  {
    "name": "Austria",
    "dial_code": "+43",
    "code": "AT",
    "format": " #### #######",
    "format_place_holder": " 0644 1234567"
  },
  {
    "name": "Azerbaijan",
    "dial_code": "+994",
    "code": "AZ",
    "format": " ### ### ## ##",
    "format_place_holder": " 040 123 45 67"
  },
  {
    "name": "Bahamas",
    "dial_code": "+1242",
    "code": "BS",
    "format": " (###) ###-####",
    "format_place_holder": " (242) 359-1234"
  },
  {
    "name": "Bahrain",
    "dial_code": "+973",
    "code": "BH",
    "format": " #### ####",
    "format_place_holder": " 3600 1234"
  },
  {
    "name": "Bangladesh",
    "dial_code": "+880",
    "code": "BD",
    "format": " #####-######",
    "format_place_holder": " 01712-345678"
  },
  {
    "name": "Barbados",
    "dial_code": "+1246",
    "code": "BB",
    "format": " (###) ###-####",
    "format_place_holder": " (246) 250-1234"
  },
  {
    "name": "Belarus",
    "dial_code": "+375",
    "code": "BY",
    "format": " # ### ### ##-##",
    "format_place_holder": " 8 029 491-19-11"
  },
  {
    "name": "Belgium",
    "dial_code": "+32",
    "code": "BE",
    "format": " #### ## ## ##",
    "format_place_holder": " 0470 12 34 56"
  },
  {
    "name": "Belize",
    "dial_code": "+501",
    "code": "BZ",
    "format": " ###-####",
    "format_place_holder": " 622-1234"
  },
  {
    "name": "Benin",
    "dial_code": "+229",
    "code": "BJ",
    "format": " ## ## ## ##",
    "format_place_holder": " 90 01 12 34"
  },
  {
    "name": "Bermuda",
    "dial_code": "+1441",
    "code": "BM",
    "format": " (###) ###-####",
    "format_place_holder": " (441) 370-1234"
  },
  {
    "name": "Bhutan",
    "dial_code": "+975",
    "code": "BT",
    "format": " ## ## ## ##",
    "format_place_holder": " 17 12 34 56"
  },
  {
    "name": "Bolivia, Plurinational State of",
    "dial_code": "+591",
    "code": "BO",
    "format": " ########",
    "format_place_holder": " 71234567"
  },
  {
    "name": "Bosnia and Herzegovina",
    "dial_code": "+387",
    "code": "BA",
    "format": " ### ### ###",
    "format_place_holder": " 061-123 456"
  },
  {
    "name": "Botswana",
    "dial_code": "+267",
    "code": "BW",
    "format": " ## ### ### ",
    "format_place_holder": " 71 123 456"
  },
  {
    "name": "Brazil",
    "dial_code": "+55",
    "code": "BR",
    "format": " (##) #####-####",
    "format_place_holder": " (11) 96123-4567"
  },
  {
    "name": "British Indian Ocean Territory",
    "dial_code": "+246",
    "code": "IO",
    "format": " ### ####",
    "format_place_holder": " 380 1234"
  },
  {
    "name": "Brunei Darussalam",
    "dial_code": "+673",
    "code": "BN",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Bulgaria",
    "dial_code": "+359",
    "code": "BG",
    "format": " ### ####",
    "format_place_holder": " 712 3456"
  },
  {
    "name": "Burkina Faso",
    "dial_code": "+226",
    "code": "BF",
    "format": " ## ## ## ##",
    "format_place_holder": " 70 12 34 56"
  },
  {
    "name": "Burundi",
    "dial_code": "+257",
    "code": "BI",
    "format": " ## ## ## ##",
    "format_place_holder": " 79 56 12 34"
  },
  {
    "name": "Cambodia",
    "dial_code": "+855",
    "code": "KH",
    "format": " ### ### ###",
    "format_place_holder": " 091 234 567"
  },
  {
    "name": "Cameroon",
    "dial_code": "+237",
    "code": "CM",
    "format": " # ## ## ## ##",
    "format_place_holder": " 6 71 23 45 67"
  },
  {
    "name": "Canada",
    "dial_code": "+1",
    "code": "CA",
    "format": " (###) ###-####",
    "format_place_holder": " (204) 234-5678"
  },
  {
    "name": "Cape Verde",
    "dial_code": "+238",
    "code": "CV",
    "format": " ### ## ##",
    "format_place_holder": " 991 12 34"
  },
  {
    "name": "Cayman Islands",
    "dial_code": "+ 345",
    "code": "KY",
    "format": " (###) ###-####",
    "format_place_holder": " (345) 323-1234"
  },
  {
    "name": "Central African Republic",
    "dial_code": "+236",
    "code": "CF",
    "format": " ## ## ## ##",
    "format_place_holder": " 70 01 23 45"
  },
  {
    "name": "Chad",
    "dial_code": "+235",
    "code": "TD",
    "format": " ## ## ## ##",
    "format_place_holder": " 63 01 23 45"
  },
  {
    "name": "Chile",
    "dial_code": "+56",
    "code": "CL",
    "format": " # #### ####",
    "format_place_holder": " 9 6123 4567"
  },
  {
    "name": "China",
    "dial_code": "+86",
    "code": "CN",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Christmas Island",
    "dial_code": "+61",
    "code": "CX",
    "format": " ### #### ####",
    "format_place_holder": " 131 2345 6789"
  },
  {
    "name": "Cocos (Keeling) Islands",
    "dial_code": "+61",
    "code": "CC",
    "format": " #### ### ###",
    "format_place_holder": " 0412 345 678"
  },
  {
    "name": "Colombia",
    "dial_code": "+57",
    "code": "CO",
    "format": " ### #######",
    "format_place_holder": " 321 1234567"
  },
  {
    "name": "Comoros",
    "dial_code": "+269",
    "code": "KM",
    "format": " ### ## ##",
    "format_place_holder": " 321 23 45"
  },
  {
    "name": "Congo",
    "dial_code": "+242",
    "code": "CG",
    "format": " ## ### ####",
    "format_place_holder": " 06 123 4567"
  },
  {
    "name": "Congo, The Democratic Republic of the Congo",
    "dial_code": "+243",
    "code": "CD",
    "format": " #### ### ###",
    "format_place_holder": " 0991 234 567"
  },
  {
    "name": "Cook Islands",
    "dial_code": "+682",
    "code": "CK",
    "format": " ## ###",
    "format_place_holder": " 71 234"
  },
  {
    "name": "Costa Rica",
    "dial_code": "+506",
    "code": "CR",
    "format": " #### ####",
    "format_place_holder": " 8312 3456"
  },
  {
    "name": "Cote d'Ivoire",
    "dial_code": "+225",
    "code": "CI",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Croatia",
    "dial_code": "+385",
    "code": "HR",
    "format": " ### ### ####",
    "format_place_holder": " 091 234 5678"
  },
  {
    "name": "Cuba",
    "dial_code": "+53",
    "code": "CU",
    "format": " ## #######",
    "format_place_holder": " 05 1234567"
  },
  {
    "name": "Cyprus",
    "dial_code": "+357",
    "code": "CY",
    "format": " ## ######",
    "format_place_holder": " 96 123456"
  },
  {
    "name": "Czech Republic",
    "dial_code": "+420",
    "code": "CZ",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Denmark",
    "dial_code": "+45",
    "code": "DK",
    "format": " ## ## ## ## ##",
    "format_place_holder": " 20 12 34 56"
  },
  {
    "name": "Djibouti",
    "dial_code": "+253",
    "code": "DJ",
    "format": " ## ## ## ##",
    "format_place_holder": " 77 83 10 01"
  },
  {
    "name": "Dominica",
    "dial_code": "+1767",
    "code": "DM",
    "format": " (###) ###-####",
    "format_place_holder": " (767) 225-1234"
  },
  {
    "name": "Dominican Republic",
    "dial_code": "+1849",
    "code": "DO",
    "format": " (###) ###-####",
    "format_place_holder": " (809) 234-5678"
  },
  {
    "name": "Ecuador",
    "dial_code": "+593",
    "code": "EC",
    "format": " ### ### ####",
    "format_place_holder": " 099 123 4567"
  },
  {
    "name": "Egypt",
    "dial_code": "+20",
    "code": "EG",
    "format": " #### ### ####",
    "format_place_holder": " 0100 123 4567"
  },
  {
    "name": "El Salvador",
    "dial_code": "+503",
    "code": "SV",
    "format": " #### ####",
    "format_place_holder": " 7012 3456"
  },
  {
    "name": "Equatorial Guinea",
    "dial_code": "+240",
    "code": "GQ",
    "format": " ### ### ###",
    "format_place_holder": " 222 123 456"
  },
  {
    "name": "Eritrea",
    "dial_code": "+291",
    "code": "ER",
    "format": " ## ### ###",
    "format_place_holder": " 07 123 456"
  },
  {
    "name": "Estonia",
    "dial_code": "+372",
    "code": "EE",
    "format": " #### ####",
    "format_place_holder": " 5123 4567"
  },
  {
    "name": "Ethiopia",
    "dial_code": "+251",
    "code": "ET",
    "format": " ### ### ####",
    "format_place_holder": " 091 123 4567"
  },
  {
    "name": "Falkland Islands (Malvinas)",
    "dial_code": "+500",
    "code": "FK",
    "format": " #####",
    "format_place_holder": " 51234"
  },
  {
    "name": "Faroe Islands",
    "dial_code": "+298",
    "code": "FO",
    "format": " ######",
    "format_place_holder": " 211234"
  },
  {
    "name": "Fiji",
    "dial_code": "+679",
    "code": "FJ",
    "format": " ### ####",
    "format_place_holder": " 701 2345"
  },
  {
    "name": "Finland",
    "dial_code": "+358",
    "code": "FI",
    "format": " ### #######",
    "format_place_holder": " 041 2345678"
  },
  {
    "name": "France",
    "dial_code": "+33",
    "code": "FR",
    "format": " ## ## ## ## ##",
    "format_place_holder": " 06 12 34 56 78"
  },
  {
    "name": "French Guiana",
    "dial_code": "+594",
    "code": "GF",
    "format": " #### ## ## ##",
    "format_place_holder": " 0694 20 12 34"
  },
  {
    "name": "French Polynesia",
    "dial_code": "+689",
    "code": "PF",
    "format": " ## ## ## ##",
    "format_place_holder": " 87 12 34 56"
  },
  {
    "name": "Gabon",
    "dial_code": "+241",
    "code": "GA",
    "format": " ## ## ## ##",
    "format_place_holder": " 06 03 12 34"
  },
  {
    "name": "Gambia",
    "dial_code": "+220",
    "code": "GM",
    "format": " ### ####",
    "format_place_holder": " 301 2345"
  },
  {
    "name": "Georgia",
    "dial_code": "+995",
    "code": "GE",
    "format": " ### ## ## ## ",
    "format_place_holder": " 555 12 34 56"
  },
  {
    "name": "Germany",
    "dial_code": "+49",
    "code": "DE",
    "format": " ##### #######",
    "format_place_holder": " 01512 3456789"
  },
  {
    "name": "Ghana",
    "dial_code": "+233",
    "code": "GH",
    "format": " ### ### ####",
    "format_place_holder": " 023 123 4567"
  },
  {
    "name": "Gibraltar",
    "dial_code": "+350",
    "code": "GI",
    "format": " ########",
    "format_place_holder": " 57123456"
  },
  {
    "name": "Greece",
    "dial_code": "+30",
    "code": "GR",
    "format": " ### ### ####",
    "format_place_holder": " 691 234 5678"
  },
  {
    "name": "Greenland",
    "dial_code": "+299",
    "code": "GL",
    "format": " ## ## ##",
    "format_place_holder": " 22 12 34"
  },
  {
    "name": "Grenada",
    "dial_code": "+1473",
    "code": "GD",
    "format": " (###) ###-####",
    "format_place_holder": " (473) 403-1234"
  },
  {
    "name": "Guadeloupe",
    "dial_code": "+590",
    "code": "GP",
    "format": " #### ##-####",
    "format_place_holder": " 0690 30-1234"
  },
  {
    "name": "Guam",
    "dial_code": "+1671",
    "code": "GU",
    "format": " (###) ###-####",
    "format_place_holder": " (671) 300-1234"
  },
  {
    "name": "Guatemala",
    "dial_code": "+502",
    "code": "GT",
    "format": " #### ####",
    "format_place_holder": " 5123 4567"
  },
  {
    "name": "Guernsey",
    "dial_code": "+44",
    "code": "GG",
    "format": " ##### ######",
    "format_place_holder": " 07781 123456"
  },
  {
    "name": "Guinea",
    "dial_code": "+224",
    "code": "GN",
    "format": " ### ## ## ##",
    "format_place_holder": " 601 12 34 56"
  },
  {
    "name": "Guinea-Bissau",
    "dial_code": "+245",
    "code": "GW",
    "format": " ### ####",
    "format_place_holder": " 501 2345"
  },
  {
    "name": "Guyana",
    "dial_code": "+592",
    "code": "GY",
    "format": " ### ####",
    "format_place_holder": " 609 1234"
  },
  {
    "name": "Haiti",
    "dial_code": "+509",
    "code": "HT",
    "format": " ## ## ####",
    "format_place_holder": " 34 10 1234"
  },
  {
    "name": "Holy See (Vatican City State)",
    "dial_code": "+379",
    "code": "VA",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Honduras",
    "dial_code": "+504",
    "code": "HN",
    "format": " ####-####",
    "format_place_holder": " 9123-4567"
  },
  {
    "name": "Hong Kong",
    "dial_code": "+852",
    "code": "HK",
    "format": " #### ####",
    "format_place_holder": " 5123 4567"
  },
  {
    "name": "Hungary",
    "dial_code": "+36",
    "code": "HU",
    "format": " (##) ### ####",
    "format_place_holder": " (20) 123 4567"
  },
  {
    "name": "Iceland",
    "dial_code": "+354",
    "code": "IS",
    "format": " ### ####",
    "format_place_holder": " 611 1234"
  },
  {
    "name": "India",
    "dial_code": "+91",
    "code": "IN",
    "format": " ###### #####",
    "format_place_holder": " 091234 56789"
  },
  {
    "name": "Indonesia",
    "dial_code": "+62",
    "code": "ID",
    "format": " ####-###-###",
    "format_place_holder": " 0812-345-678"
  },
  {
    "name": "Iran, Islamic Republic of Persian Gulf",
    "dial_code": "+98",
    "code": "IR",
    "format": " #### ### #### ",
    "format_place_holder": " 0912 345 6789"
  },
  {
    "name": "Iraq",
    "dial_code": "+964",
    "code": "IQ",
    "format": " #### ### ####",
    "format_place_holder": " 0791 234 5678"
  },
  {
    "name": "Ireland",
    "dial_code": "+353",
    "code": "IE",
    "format": " ### ### ####",
    "format_place_holder": " 085 012 3456"
  },
  {
    "name": "Isle of Man",
    "dial_code": "+44",
    "code": "IM",
    "format": " ##### ###### ",
    "format_place_holder": " 07924 123456"
  },
  {
    "name": "Israel",
    "dial_code": "+972",
    "code": "IL",
    "format": " ###-###-####",
    "format_place_holder": " 050-123-4567"
  },
  {
    "name": "Italy",
    "dial_code": "+39",
    "code": "IT",
    "format": " ### ### ####",
    "format_place_holder": " 312 345 6789"
  },
  {
    "name": "Jamaica",
    "dial_code": "+1876",
    "code": "JM",
    "format": " (###) ###-####",
    "format_place_holder": " (876) 210-1234"
  },
  {
    "name": "Japan",
    "dial_code": "+81",
    "code": "JP",
    "format": " ################",
    "format_place_holder": " 070-1234-5678"
  },
  {
    "name": "Jersey",
    "dial_code": "+44",
    "code": "JE",
    "format": " ##### ###### ",
    "format_place_holder": " 07797 123456"
  },
  {
    "name": "Jordan",
    "dial_code": "+962",
    "code": "JO",
    "format": " ## #### ####",
    "format_place_holder": " 07 9012 3456"
  },
  {
    "name": "Kazakhstan",
    "dial_code": "+77",
    "code": "KZ",
    "format": " # (###) ### ####",
    "format_place_holder": " 8 (771) 000 9998"
  },
  {
    "name": "Kenya",
    "dial_code": "+254",
    "code": "KE",
    "format": " #### ######",
    "format_place_holder": " 0712 123456"
  },
  {
    "name": "Kiribati",
    "dial_code": "+686",
    "code": "KI",
    "format": " ########",
    "format_place_holder": " 72012345"
  },
  {
    "name": "Korea, Democratic People's Republic of Korea",
    "dial_code": "+850",
    "code": "KP",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Korea, Republic of South Korea",
    "dial_code": "+82",
    "code": "KR",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Kuwait",
    "dial_code": "+965",
    "code": "KW",
    "format": " ### #####",
    "format_place_holder": " 500 12345"
  },
  {
    "name": "Kyrgyzstan",
    "dial_code": "+996",
    "code": "KG",
    "format": " #### ### ###",
    "format_place_holder": " 0700 123 456"
  },
  {
    "name": "Laos",
    "dial_code": "+856",
    "code": "LA",
    "format": " ### ## ### ###",
    "format_place_holder": " 020 23 123 456"
  },
  {
    "name": "Latvia",
    "dial_code": "+371",
    "code": "LV",
    "format": " ## ### ###",
    "format_place_holder": " 21 234 567"
  },
  {
    "name": "Lebanon",
    "dial_code": "+961",
    "code": "LB",
    "format": " ## ### ###",
    "format_place_holder": " 71 123 456"
  },
  {
    "name": "Lesotho",
    "dial_code": "+266",
    "code": "LS",
    "format": " #### ####",
    "format_place_holder": " 5012 3456"
  },
  {
    "name": "Liberia",
    "dial_code": "+231",
    "code": "LR",
    "format": " #### ### ###",
    "format_place_holder": " 0770 123 456"
  },
  {
    "name": "Libyan Arab Jamahiriya",
    "dial_code": "+218",
    "code": "LY",
    "format": " ###-#######",
    "format_place_holder": " 091-2345678"
  },
  {
    "name": "Liechtenstein",
    "dial_code": "+423",
    "code": "LI",
    "format": " ### ### ###",
    "format_place_holder": " 661 234 567"
  },
  {
    "name": "Lithuania",
    "dial_code": "+370",
    "code": "LT",
    "format": " (#-###) #####",
    "format_place_holder": " (8-612) 34567"
  },
  {
    "name": "Luxembourg",
    "dial_code": "+352",
    "code": "LU",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Macao",
    "dial_code": "+853",
    "code": "MO",
    "format": "### ### ###",
    "format_place_holder": " 628 123 456"
  },
  {
    "name": "Macedonia",
    "dial_code": "+389",
    "code": "MK",
    "format": " ### ### ###",
    "format_place_holder": " 072 345 678"
  },
  {
    "name": "Madagascar",
    "dial_code": "+261",
    "code": "MG",
    "format": " ### ## ### ##",
    "format_place_holder": " 032 12 345 67"
  },
  {
    "name": "Malawi",
    "dial_code": "+265",
    "code": "MW",
    "format": " #### ## ## ##",
    "format_place_holder": " 0991 23 45 67"
  },
  {
    "name": "Malaysia",
    "dial_code": "+60",
    "code": "MY",
    "format": " ###-### ####",
    "format_place_holder": " 012-345 6789"
  },
  {
    "name": "Maldives",
    "dial_code": "+960",
    "code": "MV",
    "format": " ###-####",
    "format_place_holder": " 771-2345"
  },
  {
    "name": "Mali",
    "dial_code": "+223",
    "code": "ML",
    "format": " ## ## ## ##",
    "format_place_holder": " 65 01 23 45"
  },
  {
    "name": "Malta",
    "dial_code": "+356",
    "code": "MT",
    "format": " #### ####",
    "format_place_holder": " 9696 1234"
  },
  {
    "name": "Marshall Islands",
    "dial_code": "+692",
    "code": "MH",
    "format": " ###-####",
    "format_place_holder": " 235-1234"
  },
  {
    "name": "Martinique",
    "dial_code": "+596",
    "code": "MQ",
    "format": " #### ## ## ##",
    "format_place_holder": " 0696 20 12 34"
  },
  {
    "name": "Mauritania",
    "dial_code": "+222",
    "code": "MR",
    "format": " ## ## ## ##",
    "format_place_holder": " 22 12 34 56"
  },
  {
    "name": "Mauritius",
    "dial_code": "+230",
    "code": "MU",
    "format": " #### ####",
    "format_place_holder": " 5251 2345"
  },
  {
    "name": "Mayotte",
    "dial_code": "+262",
    "code": "YT",
    "format": " #### ## ## ##",
    "format_place_holder": " 0639 12 34 56"
  },
  {
    "name": "Mexico",
    "dial_code": "+52",
    "code": "MX",
    "format": " ### ### ####",
    "format_place_holder": " 222 123 4567"
  },
  {
    "name": "Micronesia, Federated States of Micronesia",
    "dial_code": "+691",
    "code": "FM",
    "format": " ### ####",
    "format_place_holder": " 350 1234"
  },
  {
    "name": "Moldova",
    "dial_code": "+373",
    "code": "MD",
    "format": " #### ## ###",
    "format_place_holder": " 0650 12 345"
  },
  {
    "name": "Monaco",
    "dial_code": "+377",
    "code": "MC",
    "format": " ## ## ## ## ##",
    "format_place_holder": " 06 12 34 56 78"
  },
  {
    "name": "Mongolia",
    "dial_code": "+976",
    "code": "MN",
    "format": " #### ####",
    "format_place_holder": "8812 3456"
  },
  {
    "name": "Montenegro",
    "dial_code": "+382",
    "code": "ME",
    "format": " ### ### ###",
    "format_place_holder": " 067 622 901"
  },
  {
    "name": "Montserrat",
    "dial_code": "+1664",
    "code": "MS",
    "format": " (###) ###-####",
    "format_place_holder": " (664) 492-3456"
  },
  {
    "name": "Morocco",
    "dial_code": "+212",
    "code": "MA",
    "format": " ####-######",
    "format_place_holder": " 0650-123456"
  },
  {
    "name": "Mozambique",
    "dial_code": "+258",
    "code": "MZ",
    "format": " ## ### ####",
    "format_place_holder": " 82 123 4567"
  },
  {
    "name": "Myanmar",
    "dial_code": "+95",
    "code": "MM",
    "format": " ## ### ####",
    "format_place_holder": " 09 212 3456"
  },
  {
    "name": "Namibia",
    "dial_code": "+264",
    "code": "NA",
    "format": " ### ### ####",
    "format_place_holder": " 081 123 4567"
  },
  {
    "name": "Nauru",
    "dial_code": "+674",
    "code": "NR",
    "format": " ### ####",
    "format_place_holder": " 555 1234"
  },
  {
    "name": "Nepal",
    "dial_code": "+977",
    "code": "NP",
    "format": " ####-#######",
    "format_place_holder": "0984-1234567"
  },
  {
    "name": "Netherlands",
    "dial_code": "+31",
    "code": "NL",
    "format": " ## ########",
    "format_place_holder": " 06 12345678"
  },
  {
    "name": "Netherlands Antilles",
    "dial_code": "+599",
    "code": "AN",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "New Caledonia",
    "dial_code": "+687",
    "code": "NC",
    "format": " ##.##.##",
    "format_place_holder": " 75.12.34"
  },
  {
    "name": "New Zealand",
    "dial_code": "+64",
    "code": "NZ",
    "format": " ### ### ####",
    "format_place_holder": " 021 123 4567"
  },
  {
    "name": "Nicaragua",
    "dial_code": "+505",
    "code": "NI",
    "format": " #### ####",
    "format_place_holder": " 8123 4567"
  },
  {
    "name": "Niger",
    "dial_code": "+227",
    "code": "NE",
    "format": " ## ## ## ##",
    "format_place_holder": " 93 12 34 56"
  },
  {
    "name": "Nigeria",
    "dial_code": "+234",
    "code": "NG",
    "format": " #### ### ####",
    "format_place_holder": " 0802 123 4567"
  },
  {
    "name": "Niue",
    "dial_code": "+683",
    "code": "NU",
    "format": " ####",
    "format_place_holder": " 1234"
  },
  {
    "name": "Norfolk Island",
    "dial_code": "+672",
    "code": "NF",
    "format": " # #####",
    "format_place_holder": " 3 81234"
  },
  {
    "name": "Northern Mariana Islands",
    "dial_code": "+1670",
    "code": "MP",
    "format": " (###) ###-####",
    "format_place_holder": " (670) 234-5678"
  },
  {
    "name": "Norway",
    "dial_code": "+47",
    "code": "NO",
    "format": " ### ## ###",
    "format_place_holder": " 406 12 345"
  },
  {
    "name": "Oman",
    "dial_code": "+968",
    "code": "OM",
    "format": " #### ####",
    "format_place_holder": " 9212 3456"
  },
  {
    "name": "Pakistan",
    "dial_code": "+92",
    "code": "PK",
    "format": " ### #######",
    "format_place_holder": " 301 2345678"
  },
  {
    "name": "Palau",
    "dial_code": "+680",
    "code": "PW",
    "format": " ### ####",
    "format_place_holder": " 620 1234"
  },
  {
    "name": "Palestinian Territory, Occupied",
    "dial_code": "+970",
    "code": "PS",
    "format": " #### ### ###",
    "format_place_holder": " 0599 123 456"
  },
  {
    "name": "Panama",
    "dial_code": "+507",
    "code": "PA",
    "format": " ####-####",
    "format_place_holder": " 6001-2345"
  },
  {
    "name": "Papua New Guinea",
    "dial_code": "+675",
    "code": "PG",
    "format": " ### ####",
    "format_place_holder": "  681 2345"
  },
  {
    "name": "Paraguay",
    "dial_code": "+595",
    "code": "PY",
    "format": " #### ###### ",
    "format_place_holder": " 0961 456789"
  },
  {
    "name": "Peru",
    "dial_code": "+51",
    "code": "PE",
    "format": " ### ### ###",
    "format_place_holder": " 912 345 678"
  },
  {
    "name": "Philippines",
    "dial_code": "+63",
    "code": "PH",
    "format": " #### ### ####",
    "format_place_holder": " 0905 123 4567"
  },
  {
    "name": "Pitcairn",
    "dial_code": "+872",
    "code": "PN",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Poland",
    "dial_code": "+48",
    "code": "PL",
    "format": " ### ### ###",
    "format_place_holder": " 512 345 678"
  },
  {
    "name": "Portugal",
    "dial_code": "+351",
    "code": "PT",
    "format": " ### ### ###",
    "format_place_holder": " 912 345 678"
  },
  {
    "name": "Puerto Rico",
    "dial_code": "+1939",
    "code": "PR",
    "format": " (###) ###-####",
    "format_place_holder": " (787) 234-5678"
  },
  {
    "name": "Qatar",
    "dial_code": "+974",
    "code": "QA",
    "format": " #### ####",
    "format_place_holder": " 3312 3456"
  },
  {
    "name": "Romania",
    "dial_code": "+40",
    "code": "RO",
    "format": " #### ### ###",
    "format_place_holder": " 0712 345 678"
  },
  {
    "name": "Russia",
    "dial_code": "+7",
    "code": "RU",
    "format": " # (###) ###-##-##",
    "format_place_holder": " 8 (912) 345-67-89"
  },
  {
    "name": "Rwanda",
    "dial_code": "+250",
    "code": "RW",
    "format": " #### ### ###",
    "format_place_holder": " 07020 123 456"
  },
  {
    "name": "Reunion",
    "dial_code": "+262",
    "code": "RE",
    "format": " ################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Saint Barthelemy",
    "dial_code": "+590",
    "code": "BL",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Saint Helena, Ascension and Tristan Da Cunha",
    "dial_code": "+290",
    "code": "SH",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Saint Kitts and Nevis",
    "dial_code": "+1869",
    "code": "KN",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Saint Lucia",
    "dial_code": "+1758",
    "code": "LC",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Saint Martin",
    "dial_code": "+590",
    "code": "MF",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Saint Pierre and Miquelon",
    "dial_code": "+508",
    "code": "PM",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Saint Vincent and the Grenadines",
    "dial_code": "+1784",
    "code": "VC",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Samoa",
    "dial_code": "+685",
    "code": "WS",
    "format": " ######",
    "format_place_holder": " 601234"
  },
  {
    "name": "San Marino",
    "dial_code": "+378",
    "code": "SM",
    "format": " ## ## ## ##",
    "format_place_holder": " 66 66 12 12"
  },
  {
    "name": "Sao Tome and Principe",
    "dial_code": "+239",
    "code": "ST",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Saudi Arabia",
    "dial_code": "+966",
    "code": "SA",
    "format": " ### ### ####",
    "format_place_holder": " 051 234 5678"
  },
  {
    "name": "Senegal",
    "dial_code": "+221",
    "code": "SN",
    "format": " ## ### ## ##",
    "format_place_holder": " 70 123 45 67"
  },
  {
    "name": "Serbia",
    "dial_code": "+381",
    "code": "RS",
    "format": " ### #######",
    "format_place_holder": " 060 1234567"
  },
  {
    "name": "Seychelles",
    "dial_code": "+248",
    "code": "SC",
    "format": " # ### ###",
    "format_place_holder": " 2 510 123"
  },
  {
    "name": "Sierra Leone",
    "dial_code": "+232",
    "code": "SL",
    "format": " (###) ######",
    "format_place_holder": " (025) 123456"
  },
  {
    "name": "Singapore",
    "dial_code": "+65",
    "code": "SG",
    "format": " #### ####",
    "format_place_holder": " 8123 4567"
  },
  {
    "name": "Slovakia",
    "dial_code": "+421",
    "code": "SK",
    "format": " #### ### ###",
    "format_place_holder": " 0912 123 456"
  },
  {
    "name": "Slovenia",
    "dial_code": "+386",
    "code": "SI",
    "format": " ### ### ###",
    "format_place_holder": " 031 234 567"
  },
  {
    "name": "Solomon Islands",
    "dial_code": "+677",
    "code": "SB",
    "format": " ## #####",
    "format_place_holder": " 74 21234"
  },
  {
    "name": "Somalia",
    "dial_code": "+252",
    "code": "SO",
    "format": " # #######",
    "format_place_holder": " 7 1123456"
  },
  {
    "name": "South Africa",
    "dial_code": "+27",
    "code": "ZA",
    "format": " ### ### ####",
    "format_place_holder": " 071 123 4567"
  },
  {
    "name": "South Sudan",
    "dial_code": "+211",
    "code": "SS",
    "format": " #### ### ###",
    "format_place_holder": " 0977 123 456"
  },
  {
    "name": "South Georgia and the South Sandwich Islands",
    "dial_code": "+500",
    "code": "GS",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Spain",
    "dial_code": "+34",
    "code": "ES",
    "format": " ### ## ## ##",
    "format_place_holder": " 612 34 56 78"
  },
  {
    "name": "Sri Lanka",
    "dial_code": "+94",
    "code": "LK",
    "format": " ### ### ####",
    "format_place_holder": " 071 234 5678"
  },
  {
    "name": "Sudan",
    "dial_code": "+249",
    "code": "SD",
    "format": " ### ### ####",
    "format_place_holder": " 091 123 1234"
  },
  {
    "name": "Suriname",
    "dial_code": "+597",
    "code": "SR",
    "format": " ###-####",
    "format_place_holder": " 741-2345"
  },
  {
    "name": "Svalbard and Jan Mayen",
    "dial_code": "+47",
    "code": "SJ",
    "format": " ### ## ###",
    "format_place_holder": " 412 34 567"
  },
  {
    "name": "Swaziland",
    "dial_code": "+268",
    "code": "SZ",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Sweden",
    "dial_code": "+46",
    "code": "SE",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Switzerland",
    "dial_code": "+41",
    "code": "CH",
    "format": " #### ####",
    "format_place_holder": " 7612 3456"
  },
  {
    "name": "Syrian Arab Republic",
    "dial_code": "+963",
    "code": "SY",
    "format": " #### ### ###",
    "format_place_holder": " 0944 567 890"
  },
  {
    "name": "Taiwan",
    "dial_code": "+886",
    "code": "TW",
    "format": " #### ### ###",
    "format_place_holder": " 0912 345 678"
  },
  {
    "name": "Tajikistan",
    "dial_code": "+992",
    "code": "TJ",
    "format": " (#) ### ## ####",
    "format_place_holder": " (8) 917 12 3456"
  },
  {
    "name": "Tanzania, United Republic of Tanzania",
    "dial_code": "+255",
    "code": "TZ",
    "format": " #### ### ###",
    "format_place_holder": " 0612 345 678"
  },
  {
    "name": "Thailand",
    "dial_code": "+66",
    "code": "TH",
    "format": " ### ### ####",
    "format_place_holder": " 081 234 5678"
  },
  {
    "name": "Timor-Leste",
    "dial_code": "+670",
    "code": "TL",
    "format": " #### ####",
    "format_place_holder": " 7721 2345"
  },
  {
    "name": "Togo",
    "dial_code": "+228",
    "code": "TG",
    "format": " ## ## ## ##",
    "format_place_holder": " 90 11 23 45"
  },
  {
    "name": "Tokelau",
    "dial_code": "+690",
    "code": "TK",
    "format": " ####",
    "format_place_holder": " 5190"
  },
  {
    "name": "Tonga",
    "dial_code": "+676",
    "code": "TO",
    "format": " ### ####",
    "format_place_holder": " 771 5123"
  },
  {
    "name": "Trinidad and Tobago",
    "dial_code": "+1868",
    "code": "TT",
    "format": " (###) ###-####",
    "format_place_holder": " (868)291-1234"
  },
  {
    "name": "Tunisia",
    "dial_code": "+216",
    "code": "TN",
    "format": " ## ### ###",
    "format_place_holder": " 20 123 456"
  },
  {
    "name": "Turkey",
    "dial_code": "+90",
    "code": "TR",
    "format": " #### ### ####",
    "format_place_holder": " 0501 234 5678"
  },
  {
    "name": "Turkmenistan",
    "dial_code": "+993",
    "code": "TM",
    "format": " # ## ######",
    "format_place_holder": " 8 66 123456"
  },
  {
    "name": "Turks and Caicos Islands",
    "dial_code": "+1649",
    "code": "TC",
    "format": " (###) ###-####",
    "format_place_holder": " (649) 231-1234"
  },
  {
    "name": "Tuvalu",
    "dial_code": "+688",
    "code": "TV",
    "format": " ######",
    "format_place_holder": " 901234"
  },
  {
    "name": "Uganda",
    "dial_code": "+256",
    "code": "UG",
    "format": " #### ######",
    "format_place_holder": " 0712 345678"
  },
  {
    "name": "Ukraine",
    "dial_code": "+380",
    "code": "UA",
    "format": " ### ### ####",
    "format_place_holder": " 039 123 4567"
  },
  {
    "name": "United Arab Emirates",
    "dial_code": "+971",
    "code": "AE",
    "format": " ### ### ####",
    "format_place_holder": "  050 123 4567"
  },
  {
    "name": "United Kingdom",
    "dial_code": "+44",
    "code": "GB",
    "format": " ##### ######",
    "format_place_holder": "07400 123456"
  },
  {
    "name": "United States",
    "dial_code": "+1",
    "code": "US",
    "format": " (###) ###-####",
    "format_place_holder": " (201) 555-5555"
  },
  {
    "name": "Uruguay",
    "dial_code": "+598",
    "code": "UY",
    "format": " ### ### ###",
    "format_place_holder": " 094 231 234"
  },
  {
    "name": "Uzbekistan",
    "dial_code": "+998",
    "code": "UZ",
    "format": " # ## ### ## ##",
    "format_place_holder": "8 91 234 56 78"
  },
  {
    "name": "Vanuatu",
    "dial_code": "+678",
    "code": "VU",
    "format": " ### ####",
    "format_place_holder": " 591 2345"
  },
  {
    "name": "Venezuela, Bolivarian Republic of Venezuela",
    "dial_code": "+58",
    "code": "VE",
    "format": " ####-#######",
    "format_place_holder": " 0412-1234567"
  },
  {
    "name": "Vietnam",
    "dial_code": "+84",
    "code": "VN",
    "format": " ### ### ## ##",
    "format_place_holder": " 091 234 56 78"
  },
  {
    "name": "Virgin Islands, British",
    "dial_code": "+1284",
    "code": "VG",
    "format": " ###############",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Virgin Islands, U.S.",
    "dial_code": "+1340",
    "code": "VI",
    "format": "################",
    "format_place_holder": " (123) 111-1111"
  },
  {
    "name": "Wallis and Futuna",
    "dial_code": "+681",
    "code": "WF",
    "format": " ## ## ##",
    "format_place_holder": " 50 12 34"
  },
  {
    "name": "Yemen",
    "dial_code": "+967",
    "code": "YE",
    "format": " #### ### ###",
    "format_place_holder": " 0712 345 678"
  },
  {
    "name": "Zambia",
    "dial_code": "+260",
    "code": "ZM",
    "format": " ### #######",
    "format_place_holder": " 095 51234567"
  },
  {
    "name": "Zimbabwe",
    "dial_code": "+263",
    "code": "ZW",
    "format": " ### ### ####",
    "format_place_holder": " 071 123 4567"
  }
];
