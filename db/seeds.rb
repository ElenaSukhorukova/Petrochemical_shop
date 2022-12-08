%w[Afghanistan Albania Algeria Andorra Angola Antigua\ and\ Barbuda Argentina Armenia Australia
  Austria Azerbaijan The\ Bahamas Bahrain Bangladesh Barbados Belarus Belgium Belize Benin
  Bhutan Bolivia Bosnia\ and\ Herzegovina Botswana Brazil Brunei Bulgaria Burkina\ Faso
  Burundi Cabo\ Verde Cambodia Cameroon Canada Central\ African\ Republic Chad
  Chile China Colombia Comoros Republic\ of\ the\ Congo Costa\ Rica Côte\ d'Ivoire
  Croatia Cuba Cyprus Czech\ Republic Denmark Democratic\ Republic\ of\ the\ Congo
  Djibouti Dominica Dominican\ Republic East\ Timor\ (Timor-Leste) Ecuador Egypt El\ Salvador
  Equatorial\ Guinea Eritrea Estonia Eswatini Ethiopia Fiji Finland France Gabon The\ Gambia
  Georgia Germany Ghana Greece Grenada Guatemala Guinea Guinea-Bissau Guyana Haiti Honduras
  Hungary Iceland India Indonesia Iran Iraq Ireland Israel Italy Jamaica Japan Jordan
  Kazakhstan Kenya Kiribati Korea\ North Korea\ South Kosovo Kuwait Kyrgyzstan Laos Latvia
  Lebanon Lesotho Liberia Libya Liechtenstein Lithuania Luxembourg Madagascar Malawi
  Malaysia Maldives Mali Malta Marshall\ Islands Mauritania Mauritius Mexico Micronesia,\ Federated\ States\ of
  Moldova Monaco Mongolia Montenegro Morocco Mozambique Myanmar\ (Burma) Namibia Nauru
  Nepal Netherlands New\ Zealand Nicaragua Niger Nigeria North\ Macedonia Norway Oman
  Pakistan Palau Panama Papua\ New\ Guinea Paraguay Peru Philippines Poland Portugal
  Qatar Romania Russia Rwanda Saint\ Kitts\ and\ Nevis Saint\ Lucia Saint\ Vincent\ and\ the\ Grenadines
  Samoa San\ Marino Sao\ Tome\ and\ Principe Saudi\ Arabia Senegal Serbia Seychelles
  Sierra\ Leone Singapore Slovakia Slovenia Solomon Islands Somalia South\ Africa
  Spain Sri\ Lanka Sudan Sudan,\ South Suriname Sweden Switzerland Syria Taiwan
  Tajikistan Tanzania Thailand Togo Tonga Trinidad\ and\ Tobago Tunisia Turkey Turkmenistan
  Tuvalu Uganda Ukraine United\ Arab\ Emirates United\ Kingdom United\ States
  Uruguay Uzbekistan Vanuatu Vatican\ City Venezuela Vietnam Yemen Zambia
  Zimbabwe].each do |country_name|
    unless Country.find_by(country_name: country_name)
      Country.create(country_name: country_name)
    end
  end

{'Republic of Adygea (Adygea)': 1411, 'Republic of Bashkortostan': 1291, 'Republic of Buryatia': 5654, 
  'Altai Republic': 3581, 'Republic of Dagestan': 1770, 'Republic of Ingushetia': 1770,
  'Kabardino-Balkarian Republic': 1642, 'Republic of Kalmykia': 1230, 'Karachay-Cherkess Republic': 1527, 
  'Republic of Karelia': 997, 'Komi Republic': 1422, 'Republic of Mari El': 750,
  'Republic of Mordovia': 633, 'Republic of Sakha (Yakutia)': 7938, 'Republic of North Ossetia — Alania': 1800,
  'Republic of Tatarstan (Tatarstan)': 822, 'Republic of Tyva': 4612, 'Udmurt Republic': 1199,
  'Republic of Khakassia': 4250, 'Chechen Republic': 1735, 'Chuvash Republic — Chuvashia': 664,
  'Krasnodar Territory': 1360, 'Krasnoyarsk Territory': 4200, 'Primorsky Krai': 9180,
  'Stavropol Territory': 1421, 'Khabarovsk Territory': 8357, 'Amur region': 1714, 'Arkhangelsk region': 1243, 
  'Astrakhan region': 1371, 'Belgorod region': 669, 'Bryansk region': 382, 'Vladimir region': 179, 
  'Volgograd region': 970, 'Vologda region': 461, 'Voronezh region': 527, 'Ivanovo region': 294,
  'Irkutsk region': 5206, 'Kaliningrad region': 1200, 'Kaluga region': 175, 'Kamchatka Krai': 6780,
  'Kemerovo Region — Kuzbass': 3628, 'Kirov region': 989, 'Kostroma region': 345, 'Kurgan region': 1971,
  'Kursk region': 540, 'Leningrad region': 711, 'Lipetsk region': 417, 'Magadan region': 5907,
  'Moscow region': 0, 'Murmansk region': 1904, 'Nizhny Novgorod region': 450, 'Novgorod region': 534,
  'Novosibirsk region': 3580, 'Omsk region': 2701, 'Orenburg region': 1441, 'Oryol region': 361,
  'Penza region': 635, 'Perm Region': 1510, 'Pskov region': 731, 'Rostov region': 1090,
  'Ryazan region': 187, 'Samara region': 1054, 'Saratov region': 832, 'Sakhalin region': 6644,
  'Sverdlovsk region': 1810, 'Smolensk region': 390, 'Tambov region': 467, 'Tver region': 176,
  'Tomsk region': 3638, 'Tula region': 181, 'Tyumen region': 2132, 'Ulyanovsk region': 950,
  'Chelyabinsk region': 1763, 'Trans-Baikal Territory': 6700, 'Yaroslavl region': 266,
  'Moscow': 0, 'Saint Petersburg': 711, 'Jewish Autonomous Region': 8200, 'Nenets Autonomous Okrug': 3599,
  'Khanty-Mansi Autonomous Okrug — Yugra': 3127, 'Chukotka Autonomous Okrug': 6187,
  'Yamalo-Nenets Autonomous Okrug': 3599}.each do |region_name, distance|   
    unless Region.find_by(region_name: region_name)
      Region.create(country_id: 145, region_name: region_name, 
        distance_from_moscow_to_center_region: distance)
    end
  end