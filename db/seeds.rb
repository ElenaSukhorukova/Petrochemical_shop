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
  Zimbabwe
].each do |country_name|
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
  'Yamalo-Nenets Autonomous Okrug': 3599
}.each do |region_name, distance|   
    unless Region.find_by(region_name: region_name)
      Region.create(country_id: 145, region_name: region_name, 
        distance_from_moscow_to_center_region: distance)
    end
  end

%w[Acetate Simple\ ether Petroleum\ solvent].each do |name_kind|
  unless Kind.find_by(name_kind: name_kind)
    Kind.create(name_kind: name_kind)
  end
end

{'Acetone': ['Molecular Formula C3H6O or CH3-CO-CH3 or CH3COCH3 Synonyms acetone, 2-propanone, 67-64-1, propanone, Dimethyl ketone', 1, 2],
  'Cyclohexanone': ['Molecular Formula: C6H10O\nSynonyms: 108-94-1, Ketohexamethylene, Pimelic ketone, Sextone', 1, 2],
  'Ethyl Acetate': ['Molecular Formula: C4H8O2 or CH3COOC2H5\nSynonyms: 141-78-6, Ethyl ethanoate, Acetic acid ethyl ester, Acetoxyethanee', 3, 2],
  'Methyl Acetate': ['Molecular Formula:  C3H6O2 or CH3COOCH3\nSynonyms: 79-20-9, Methyl ethanoate, Acetic acid, methyl ester, Tereton', 3, 2],
  'Butyl Acetate': ['Molecular Formula: C6H12O2 or CH3COO(CH2)3CH3\nSynonyms: N-BUTYL ACETATE, 123-86-4, Acetic acid, butyl ester, Butyl ethanoate', 3, 2],
  'Ethylcellosolv': ['Molecular Formula: С2Н5ОСН2СН2ОН\nSynonyms: 2-Ethoxyethanol', 4, 2],
  'Ethylene Glycol': ['Molecular Formula: C2H6O2 or HOCH2CH2OH or CH2OHCH2OH\nSynonyms: Ethane-1,2-diol, 1,2-ethanediol, 107-21-1, glycol', 4, 2],
  'Diethylene Glycol': ['Molecular Formula: C4H10O3 or (CH2CH2OH)2O\nSynonyms: 111-46-6, 2,2\'-Oxydiethanol, Diglycol, 2,2\'-Oxybisethanol', 4, 2],
  'Orthoxylene': ['Molecular Formula: С8Н10\nSynonyms: o-xylene,1,2-xylene', 2, 2],
  'Toluene': ['Molecular Formula: C7H8 or C6H5CH3\nSynonyms: methylbenzene, toluol, 108-88-3, Phenylmethane', 2, 2],
  'Bensene-solvent S2-80/120 (BR-2)': ['A mixture of gasoline oil fractions and aromatic hydrocarbons', 5, 2],
  'Petroleum distillate S4 155/200': ['Mixture of aliphatic fractions of hydrocarbons from C7 to C12', 5, 2]
}.each do |name, info|   
  unless Product.find_by(name: name)
    Product.create(name: name, description: info[0], kind_id: info[1], department_ids: [info[2]])
  end
end

{'Metal barrel 216.5': [0.89, 0.56, 0.56, 18, 
  'It is used to transport liquid products and substances that do not actively act on steel. To prevent active interaction of the substance with the material of the barrel, a system of internal polymer coatings (based on varnishes) is used, which guarantees the invariance of the characteristics of the packaged products.'],
  'Cubic capacity 1000': [1.16, 1.2, 1.0, 65,
  'Fill hole diameter: 150, Drain hole diameter: 50. It is used for transportation and storage of: liquid chemical and food products (large volumes), including isopropyl alcohol; acids; alkalis; vegetable oil; acetic acid; 96% drinking ethyl alcohol and other products.'],
  'kilogram': [0, 0, 0, 0]
}.each do |name_container, info|   
  unless Container.find_by(name_container: name_container)
    Container.create(name_container: name_container, height: info[0], length: info[1], width: info[2], weight: info[3], description: info[4])
  end
end

{"LLC 'Sibur petrol'": ['006421150406', '421222740', '7135782202058', '0688888864', '43.37', 'Petrov Petor Petrovich', 
                        '61228346385', 'sibur@sibur.com', 'Supplier of acetone', true,
                        ['38726221856736177015', 1],
                        ['123456', 145, 77, 'Moscow', 'Pskovskaya', '147'],
                        ['123456', 145, 77, 'Moscow', 'Pskovskaya', '147']],
  "JSC 'KNPZ'": ['777402438441', '621872062', '3553834857766', '2038523600', '38.66', 'Sergeev Semen Semenovich', 
                  '88876118330', 'knpz@knpz.com', 'Supplier of toluol', true,
                  ['18680254388102586618', 1],
                  ['636963', 145, 2, 'Ufa', 'Soldatskaya', '7'],
                  ['636963', 145, 2, 'Ufa', 'Soldatskaya', '7']],
  "JSC 'LUKOIL-Volgogradneftepererabotka'": ['051825522731', '756377437', '6706547067870', '8306386660', '25.17', 'Timurov Ivan Ivanovich', 
                                              '28372132584', 'lukoil@lukoil.com', 'Supplier of cyclohexanon', true,
                                              ['54134402880778021461', 1],
                                              ['999666', 145, 35, 'Vologda', 'Moscowskaya', '45 Litera 5'],
                                              ['459634', 145, 35, 'Vologda', 'Moscowskaya', '45 Litera 5']],
  "JSC 'Omsk Oil Refinery'": ['502560158562', '153484106', '4751582135262', '0608644343', '23.62', 'Totorkov Petr Petrovich', 
                                '28047106627', 'omsknpz@omsknpz.com', 'Supplier of cyclohexanon', true,
                                ['67458630145183702285', 1],
                                ['856396', 145, 55, 'Omsk', 'Popova', '78'],
                                ['856396', 145, 55, 'Omsk', 'Popova', '75']]
}.each do |legal_name_company, info|   
  unless Supplier.find_by(legal_name_company: legal_name_company)
    Supplier.create(legal_name_company: legal_name_company, inn: info[0], 
        kpp: info[1], ogrn: info[2], okpo: info[3], okved: info[4], 
        full_name_director: info[5], phone_number: info[6], email: info[7], 
        description: info[8], resident: info[9]
      )
  end
  unless AccountNumber.find_by(company_id: Supplier.last.id)
    AccountNumber.create(account_number: info[10][0], bank_id: info[10][1], company_id: Supplier.last.id)
  end
  unless LegalAddress.find_by(company_id: Supplier.last.id)
    LegalAddress.create(post_number: info[11][0], country_id: info[11][1], region_id: info[11][2], 
                        town: info[11][3], street: info[11][4], number_building: info[11][5],
                        company_id: Supplier.last.id)
  end
  unless PostAddress.find_by(company_id: Supplier.last.id)
    PostAddress.create(post_number: info[12][0], country_id: info[12][1], region_id: info[12][2], 
                        town: info[12][3], street: info[12][4], number_building: info[12][5], 
                        company_id: Supplier.last.id)
  end 
end
