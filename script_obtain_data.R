# This file is to scrape results


# libs --------------------------------------------------------------------

library(here)
library(purrr)


# sourcing funcitons ------------------------------------------------------

source(file = "creating_funcitons.R")



# input vectors to generate url-------------------------------------------------------------------------

## Assam S03

s03_assam <- "34,ABHAYAPURI NORTH  ;35,ABHAYAPURI SOUTH  ;8,ALGAPUR   ;103,AMGURI   ;5,BADARPUR   ;45,BAGHBAR   ;20,BAITHALANGSO    ;62,BARAMA   ;72,BARCHALLA   ;87,BARHAMPUR   ;60,BARKHETRI   ;14,BARKHOLA   ;43,BARPETA   ;84,BATADROBA   ;77,BEHALI   ;41,BHABANIPUR   ;109,BIHPURIA   ;33,BIJNI   ;27,BILASIPARA EAST  ;26,BILASIPARA WEST ;76,BISWANATH   ;17,BOKAJAN   ;93,BOKAKHAT   ;48,BOKO   ;32,BONGAIGAON    ;121,CHABUA    ;63,CHAPAGURI   ;49,CHAYGAON   ;47,CHENGA   ;68,DALGAON   ;97,DERGAON   ;112,DHAKUAKHANA   ;61,DHARMAPUR   ;71,DHEKIAJULI   ;113,DHEMAJI   ;83,DHING   ;11,DHOLAI   ;23,DHUBRI   ;116,DIBRUGARH  ;123,DIGBOI   ;19,DIPHU   ;52,DISPUR   ;125,DOOM DOOMA   ;36,DUDHNAI  ;118,DULIAJAN   ;53,GAUHATI EAST    ;54,GAUHATI WEST    ;24,GAURIPUR   ;37,GOALPARA EAST    ;38,GOALPARA WEST   ;78,GOHPUR   ;95,GOLAGHAT   ;25,GOLAKGANJ ;28,GOSSAIGAON   ;16,HAFLONG;6,HAILAKANDI   ;55,HAJO   ;91,HOJAI   ;18,HOWRAGHAT   ;79,JAGIROAD   ;39,JALESWAR   ;51,JALUKBARI   ;90,JAMUNAMUKH   ;44,JANIA   ;114,JONAI   ;98,JORHAT    ;65,KALAIGAON   ;89,KALIABOR   ;56,KAMALPUR   ;3,KARIMGANJ NORTH;4,KARIMGANJ SOUTH;15,KATIGORA   ;7,KATLICHERRA ;96,KHUMTAI   ;30,KOKRAJHAR EAST;29,KOKRAJHAR WEST   ;81,LAHARIGHAT   ;117,LAHOWAL    ;111,LAKHIMPUR   ;13,LAKHIPUR   ;92,LUMDING   ;105,MAHMARA   ;70,MAJBAT   ;99,MAJULI   ;67,MANGALDOI   ;21,MANKACHAR   ;124,MARGHERITA   ;101,MARIANI   ;80,MARIGAON   ;115,MORAN   ;120,NAHARKATIA   ;59,NALBARI   ;110,NAOBOICHA   ;104,NAZIRA   ;86,NOWGONG  ;50,PALASBARI   ;64,PANERY  ;42,PATACHARKUCHI   ;2,PATHARKANDI   ;82,RAHA   ;74,RANGAPARA   ;57,RANGIA;1,RATABARI   ;85,RUPOHIHAT   ;126,SADIYA   ;22,SALMARA SOUTH;88,SAMAGURI   ;46,SARUKHETRI   ;94,SARUPATHAR   ;108,SIBSAGAR   ;31,SIDLI   ;9,SILCHAR;66,SIPAJHAR   ;10,SONAI   ;106,SONARI   ;75,SOOTEA   ;40,SORBHOG   ;58,TAMULPUR   ;102,TEOK   ;73,TEZPUR   ;107,THOWRA   ;119,TINGKHONG   ;122,TINSUKIA   ;100,TITABAR   ;69,UDALGURI   ;12,UDHARBOND"

## Kerala S11

s11_kerala <- "115,ADOOR ;104,ALAPPUZHA;60,ALATHUR;76,ALUVA;105,AMBALAPUZHA;75,ANGAMALY;113,ARANMULA;102,AROOR;136,ARUVIKKARA;128,ATTINGAL ;10,AZHIKODE;25,BALUSSERI;29,BEYPORE;122,CHADAYAMANGALAM;72,CHALAKKUDY;99,CHANGANASSERY;126,CHATHANNUR;117,CHAVARA;61,CHELAKKARA;110,CHENGANNUR;103,CHERTHALA;129,CHIRAYINKEEZHU;58,CHITTUR;88,DEVIKULAM ;12,DHARMADAM;26,ELATHUR;34,ERANAD;82,ERANAKULAM;125,ERAVIPURAM;96,ETTUMANOOR;63,GURUVAYOOR;107,HARIPAD;91,IDUKKI;9,IRIKKUR;70,IRINJALAKKUDA;94,KADUTHURUTHY;69,KAIPAMANGALAM;77,KALAMASSERY;7,KALLIASSERI;19,KALPETTA;4,KANHANGAD;100,KANJIRAPPALLY;11,KANNUR;116,KARUNAGAPPALLY;2,KASARAGOD;138,KATTAKKADA;108,KAYAMKULAM;132,KAZHAKKOOTTAM;80,KOCHI;73,KODUNGALLUR;31,KODUVALLY;124,KOLLAM;33,KONDOTTY;53,KONGAD;114,KONNI;87,KOTHAMANGALAM;46,KOTTAKKAL;119,KOTTARAKKARA;97,KOTTAYAM;139,KOVALAM;27,KOZHIKODE NORTH;28,KOZHIKODE SOUTH;123,KUNDARA;30,KUNNAMANGALAM;62,KUNNAMKULAM;84,KUNNATHUNAD ;118,KUNNATHUR ;14,KUTHUPARAMBA;106,KUTTANAD;21,KUTTIADI;55,MALAMPUZHA;40,MALAPPURAM;64,MANALUR;17,MANANTHAVADY;37,MANJERI;1,MANJESHWAR;39,MANKADA;54,MANNARKAD;15,MATTANNUR;109,MAVELIKARA ;86,MUVATTUPUZHA;22,NADAPURAM;68,NATTIKA;130,NEDUMANGAD;135,NEMOM;59,NENMARA;140,NEYYATTINKARA;35,NILAMBUR;66,OLLUR;52,OTTAPALAM;93,PALA;56,PALAKKAD;137,PARASSALA;78,PARAVUR;120,PATHANAPURAM;50,PATTAMBI;6,PAYYANNUR;92,PEERUMADE;24,PERAMBRA;16,PERAVOOR;38,PERINTHALMANNA;74,PERUMBAVOOR;85,PIRAVOM;48,PONNANI;101,POONJAR;121,PUNALUR;71,PUTHUKKAD;98,PUTHUPPALLY;23,QUILANDY;112,RANNI;51,SHORNUR;18,SULTHANBATHERY;8,TALIPARAMBA;44,TANUR;57,TARUR;13,THALASSERY;47,THAVANUR;111,THIRUVALLA;32,THIRUVAMBADY;134,THIRUVANANTHAPURAM;90,THODUPUZHA;83,THRIKKAKARA;81,THRIPUNITHURA;67,THRISSUR;49,THRITHALA;45,TIRUR;43,TIRURANGADI;5,TRIKARIPUR;3,UDMA;89,UDUMBANCHOLA;20,VADAKARA;95,VAIKOM;42,VALLIKKUNNU;131,VAMANAPURAM;127,VARKALA;133,VATTIYOORKAVU;41,VENGARA;79,VYPEN;65,WADAKKANCHERY;36,WANDOOR"

## Puducherry U07

u07_puducherry <- "19,ARIANKUPPAM;23,BAHOUR;21,EMBALAM;8,INDIRA NAGAR;7,KADIRGAMAM;12,KALAPET;10,KAMARAJ NAGAR;26,KARAIKAL NORTH;27,KARAIKAL SOUTH;11,LAWSPET;29,MAHE;20,MANAVELY;4,MANGALAM;1,MANNADIPET;18,MUDALIARPET;13,MUTHIALPET;24,NEDUNGADU;17,NELLITHOPE;28,NERAVY-T.R.PATTINAM;22,NETTAPAKKAM;16,ORLEAMPETH;15,OUPALAM;3,OUSSUDU;6,OZHUKARAI;14,RAJ BHAVAN;9,THATTANCHAVADY;2,THIRUBHUVANAI;25,THIRUNALLAR;5,VILLIANUR;30,YANAM"

## Tamil Nadu S22

s22_tamilnadu <- "28,Alandur;182,Alangudi;223,Alangulam;225,Ambasamudram;8,Ambattur;48,Ambur;44,Anaikattu;198,Andipatti;21,Anna Nagar;105,Anthiyur;38,Arakkonam;67,Arani;183,Aranthangi;134,Aravakurichi;42,Arcot;149,Ariyalur;207,Aruppukkottai;129,Athoor;82,Attur;6,Avadi;112,Avanashi;52,Bargur;104,Bhavani;107,Bhavanisagar;157,Bhuvanagiri;200,Bodinayakanur;32,Chengalpattu;62,Chengam;19,Chepauk-Thiruvallikeni;68,Cheyyar;34,Cheyyur;158,Chidambaram;118,Coimbatore (North);120,Coimbatore (South);231,Colachal;110,Coonoor;155,Cuddalore;201,Cumbum;101,Dharapuram;59,Dharmapuri;132,Dindigul;11,Dr.Radhakrishnan Nagar;86,Edappadi;16,Egmore;98,Erode (East);99,Erode (West);178,Gandarvakkottai;81,Gangavalli;70,Gingee;106,Gobichettipalayam;109,Gudalur;46,Gudiyattam;1,Gummidipoondi;18,Harbour;61,Harur;55,Hosur;150,Jayankondam;49,Jolarpet;221,Kadayanallur;65,Kalasapakkam;80,Kallakurichi;37,Kancheepuram;102,Kangayam;229,Kanniyakumari;184,Karaikudi;135,Karur;40,Katpadi;159,Kattumannarkoil;117,Kavundampalayam;234,Killiyoor;64,Kilpennathur;45,Kilvaithinankuppam;164,Kilvelur;122,Kinathukadavu;13,Kolathur;218,Kovilpatti;53,Krishnagiri;136,Krishnarayapuram;137,Kulithalai;97,Kumarapalayam;171,Kumbakonam;148,Kunnam;156,Kurinjipadi;143,Lalgudi;126,Madathukulam;9,Madavaram;193,Madurai Central;189,Madurai East;191,Madurai North;192,Madurai South;194,Madurai West;35,Madurantakam;7,Maduravoyal;71,Mailam;144,Manachanallur;187,Manamadurai;138,Manapparai;167,Mannargudi;161,Mayiladuthurai;188,Melur;111,Mettuppalayam;85,Mettur;100,Modakkurichi;212,Mudhukulathur;145,Musiri;25,Mylapore;163,Nagapattinam;230,Nagercoil;94,Namakkal;227,Nanguneri;169,Nannilam;131,Natham;153,Neyveli;130,Nilakkottai;128,Oddanchatram;84,Omalur;175,Orathanadu;217,Ottapidaram;232,Padmanabhapuram;57,Palacode;127,Palani;226,Palayamkottai;115,Palladam;30,Pallavaram;154,Panruti;172,Papanasam;60,Pappireddipatti;209,Paramakudi;95,Paramathi-Velur;176,Pattukkottai;58,Pennagaram;147,Perambalur;12,Perambur;177,Peravurani;199,Periyakulam;103,Perundurai;123,Pollachi;66,Polur;2,Ponneri;162,Poompuhar;5,Poonamallee;180,Pudukkottai;228,Radhapuram;202,Rajapalayam;211,Ramanathapuram;41,Ranipet;92,Rasipuram;78,Rishivandiyam;17,Royapuram;23,Saidapet;89,Salem (North);90,Salem (South);88,Salem (West);219,Sankarankovil;79,Sankarapuram;87,Sankari;204,Sattur;93,Senthamangalam;190,Sholavandan;39,Sholinghur;27,Shozhinganallur;121,Singanallur;160,Sirkazhi;186,Sivaganga;205,Sivakasi;29,Sriperumbudur;139,Srirangam;216,Srivaikuntam;203,Srivilliputhur;116,Sulur;31,Tambaram;222,Tenkasi;56,Thalli;174,Thanjavur;15,Thiru-Vi-Ka-Nagar;196,Thirumangalam;181,Thirumayam;195,Thiruparankundram;33,Thiruporur;166,Thiruthuraipoondi;173,Thiruvaiyaru;4,Thiruvallur;168,Thiruvarur;142,Thiruverumbur;170,Thiruvidaimarudur;10,Thiruvottiyur;24,Thiyagarayanagar;119,Thondamuthur;214,Thoothukkudi;20,Thousand Lights;146,Thuraiyur;72,Tindivanam;215,Tiruchendur;96,Tiruchengodu;141,Tiruchirappalli (East);140,Tiruchirappalli (West);208,Tiruchuli;76,Tirukkoyilur;224,Tirunelveli;50,Tirupattur;185,Tiruppattur;113,Tiruppur (North);114,Tiruppur (South);3,Tiruttani;210,Tiruvadanai;63,Tiruvannamalai;151,Tittakudi;108,Udhagamandalam;125,Udumalaipettai;77,Ulundurpettai;197,Usilampatti;51,Uthangarai;36,Uthiramerur;124,Valparai;69,Vandavasi;47,Vaniyambadi;73,Vanur;220,Vasudevanallur;165,Vedaranyam;133,Vedasandur;91,Veerapandi;26,Velachery;43,Vellore;54,Veppanahalli;75,Vikravandi;213,Vilathikulam;233,Vilavancode;14,Villivakkam;74,Villupuram;179,Viralimalai;206,Virudhunagar;22,Virugampakkam;152,Vriddhachalam;83,Yercaud"

## West Bengal S25

s25_westbengal <- "12,Alipurduars;102,Amdanga;181,Amta;200,Arambag;281,Asansol Uttar;101,Ashoknagar;280,Asnsol Dakshin;273,Ausgram;99,Baduria;94,Bagda;240,Baghmundi;180,Bagnan;72,Baharampur;54,Baisnabnagar;191,Balagarh;239,Balarampur;169,Bally;161,Ballygunge;39,Balurghat;238,Bandwan;96,Bangaon Dakshin;95,Bangaon Uttar;252,Bankura;283,Barabani;113,Baranagar;119,Barasat;253,Barjora;108,Barrackpur;140,Baruipur Paschim;137,Baruipur Purba;128,Basanti;124,Basirhat Dakshin;125,Basirhat Uttar;154,Behala Paschim;153,Behala Purba;71,Beldanga;164,Beleghata;159,Bhabanipur;62,Bhagabangola;214,Bhagabanpur;148,Bhangar;69,Bharatpur;267,Bhatar;105,Bhatpara;116,Bidhannagar;103,Bijpur;237,Binpur;146,Bishnupur;255,Bishnupur;286,Bolpur;156,Budge Budge;260,Burdwan Dakshin;266,Burdwan Uttar;67,Burwan;138,Canning Paschim;139,Canning Purba;91,Chakdaha;31,Chakulia;187,Champdani;45,Chanchal;189,Chandannagar;211,Chandipur;194,Chanditala;232,Chandrakona;82,Chapra;248,Chhatna;28,Chopra;162,Chowrangee;190,Chunchura;4,Cooch Behar Dakshin;3,COOCHBEHAR UTTAR;19,Dabgram-Fulbari;219,Dantan;23,Darjeeling;230,Daspur;229,Debra;120,Deganga;197,Dhanekhali;15,Dhupguri;143,Diamond Harbour;7,Dinhata;184,Domjur;75,Domkal;284,Dubrajpur;114,Dum Dum;110,Dum Dum Uttar;277,Durgapur Paschim;276,Durgapur Purba;218,Egra;51,Englishbazar;163,Entally;13,Falakata;144,Falta;55,Farakka;97,Gaighata;274,Galsi;41,Gangarampur;233,Garbeta;44,Gazole;231,Ghatal;30,Goalpokhar;201,Goghat;221,Gopiballavpur;127,Gosaba;43,Habibpur;100,Habra;209,Haldia;292,Hansan;73,Hariharpara;93,Haringhata;196,Haripal;42,Harirampur;46,Harischandrapur;121,Haroa;33,Hemtabad;126,Hingalganj;173,Howrah Dakshin;171,Howrah Madhya;170,Howrah Uttar;257,Indus;29,Islampur;36,Itahar;150,Jadavpur;183,Jagatballavpur;106,Jagatdal;76,Jalangi;17,Jalpaiguri;262,Jamalpur;279,Jamuria;195,Jangipara;136,Jaynagar;222,Jhargram;165,Jorasanko;241,Joypur;131,Kakdwip;11,Kalchini;34,Kaliaganj;80,Kaliganj;22,Kalimpong;264,Kalna;92,Kalyani;112,Kamarhati;68,Kandi;216,Kanthi Dakshin;213,Kanthi Uttar;32,Karandighi;77,Karimpur;149,Kasba;244,Kashipur;168,Kashipur-Belgachhia;256,Katulpur;270,Katwa;223,Keshiary;235,Keshpur;271,Ketugram;202,Khanakul;259,Khandaghosh;228,Kharagpur;224,Kharagpur Sadar;109,Khardaha;66,Khargram;215,Khejuri;158,Kolkata Port;88,Krishnaganj;85,Krishnanagar Dakshin;83,Krishnanagar Uttar;133,Kulpi;129,Kultali;282,Kulti;38,Kumarganj;10,Kumargram;24,Kurseong;37,Kushmandi;288,Labhpur;61,Lalgola;14,Madarihat;118,Madhyamgram;142,Magrahat Paschim;141,Magrahat Purba;155,Maheshtala;208,Mahishadal;20,Mal;47,Malatipur;50,Maldaha;243,Manbazar;135,Mandirbazar;49,Manikchak;167,Maniktola;2,Mathabhanga;25,Matigara-Naxalbari;16,Maynaguri;290,Mayureswar;236,Medinipur;1,Mekliganj;265,Memari;157,Metiaburuz;122,Minakhan;272,Mongalkote;263,Monteswar;52,Mothabari;206,Moyna;294,Murarai;64,Murshidabad;84,Nabadwip;65,Nabagram;21,Nagrakata;104,Naihati;81,Nakashipara;293,Nalhati;207,Nandakumar;210,Nandigram;287,Nanoor;74,Naoda;225,Narayangarh;8,Natabari;220,Nayagram;107,Noapara;254,Onda;79,Palashipara;175,Panchla;275,Pandabeswar;192,Pandua;111,Panihati;205,Panskura Paschim;204,Panskura Purba;245,Para;212,Patashpur;130,Patharpratima;27,Phansidewa;227,Pingla;268,Purbasthali Dakshin;269,Purbasthali Uttar;199,Pursurah;242,Purulia;59,RaghunathGanj;246,Raghunathpur;134,Raidighi;35,Raiganj;261,Raina;250,Raipur;117,Rajarhat  Gopalpur;115,Rajarhat New Town;18,Rajganj;217,Ramnagar;291,Rampurhat;90,Ranaghat Dakshin;87,Ranaghat Uttar Paschim;89,Ranaghat Uttar Purba;249,Ranibandh;278,Raniganj;63,Raninagar;160,Rashbehari;48,Ratua;70,Rejinagar;226,Sabang;132,Sagar;60,Sagardighi;289,Sainthia;234,Salboni;247,Saltora;123,Sandeshkhali;174,Sankrail;86,Santipur;193,Saptagram;145,Satgachhia;172,Shibpur;166,Shyampukur;179,Shyampur;26,Siliguri;188,Singur;6,Sitai;5,Sitalkuchi;258,Sonamukhi;147,Sonarpur Dakshin;151,Sonarpur Uttar;186,Sreerampur;53,Sujapur;285,Suri;57,Suti;98,Swarupnagar;251,Taldangra;203,Tamluk;40,Tapan;198,Tarakeswar;78,Tehatta;152,Tollyganj;9,Tufanganj;182,Udaynarayanpur;178,Uluberia Dakshin;176,Uluberia Purba;177,Uluberia Uttar;185,Uttarpara"


### generating URL tables

#### Assam

generate_url_eci(vec_inputs = s03_assam,
                 state_code = "S03") -> url_table_assam

#### Kerala

generate_url_eci(vec_inputs = s11_kerala,
                 state_code = "S11") -> url_table_kerala

#### Puducherry

generate_url_eci(vec_inputs = u07_puducherry,
                 state_code = "U07") -> url_table_puduchery

#### Tamil Nadu

generate_url_eci(vec_inputs = s22_tamilnadu,
                 state_code = "S22") -> url_table_tamilnadu

#### West Bengal

generate_url_eci(vec_inputs = s25_westbengal,
                 state_code = "S25") -> url_table_westbengal


##### Binding all url tables

rbind(url_table_assam,url_table_kerala,
      url_table_puduchery,url_table_tamilnadu,
      url_table_westbengal) -> complete_url_table


































