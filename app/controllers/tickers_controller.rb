class TickersController < ApplicationController
  before_action :set_ticker, only: [:show, :edit, :update, :destroy], ignore: [:load_tickers]

  # GET /tickers
  # GET /tickers.json
  def index
    @tickers = Ticker.all
  end

  # GET /tickers/1
  # GET /tickers/1.json
  def show
  end

  def load_tickers
    @allTickers = ["AAPL","PIH","FLWS","FCCY","SRCE","VNET","TWOU","JOBS","CAFD","EGHT","AVHI","SHLM","AAON","ABAX","ABEO","ABIL","ABMD","AXAS","ACIA","ACTG",
                  "ACHC","ACAD","AXDX","XLRN","ANCX","ARAY","ACRX","ACET","AKAO","ACHN","ACIW","ACRS","ACNB","ACOR","ACTS","ACPW","ATVI","ACTA","ACUR","ACXM",
                  "ADMS","ADMP","ADAP","ADUS","AEY","IOTS","ADMA","ADBE","ADTN","ADRO","AAAP","AEIS","AMD","ADXS","ADVM","AEGR","AEGN","AGLE","AEHR","AMTX",
                  "AEPI","AERI","AVAV","AEZS","AEMD","AFMD","AGEN","AGRX","AGYS","AGIO","AGFS","AIMT","AIRM","ATSG","AMCN","AIXG","AKAM","AKBA","AKER","AKRX",
                  "ALRM","ALSK","AMRI","ABDC","ADHD","ALDR","ALDX","ALXN","ALCO","ALGN","ALIM","ALKS","ABTX","ALGT","AIQ","AHGP","ARLP","AMOT","ALQA","ALLT",
                  "MDRX","AFAM","ALNY","AOSL","GOOG","GOOGL","ATEC","ASPS","AIMC","AMAG","AMRN","AMRK","AYA","AMZN","AMBC","AMBCW","AMBA","AMCX","DOX","AMDA",
                  "AMED","UHAL","ATAX","AMOV","AAL","AGNC","AGNCB","AGNCP","MTGE","MTGEP","ACSF","ACAS","AMIC","AMNB","ANAT","APEI","ARII","ASEI","AMSWA","AMSC",
                  "AMWD","CRMT","ABCB","AMSF","ASRV","ATLO","AMGN","FOLD","AMKR","AMPH","IBUY","AMSG","ASYS","AFSI","AMRS","ADI","ALOG","AVXL","ANCB","ANGI",
                  "ANGO","ANIP","ANIK","ANSS","ATRS","ANTH","ABAC","APIC","APOG","APOL","AINV","APPF","ARCI","APDN","AGTC","AMAT","AMCC","AAOI","AREX","APRI",
                  "APTO","AQMS","AQXP","ARDM","ARLZ","PETX","ABUS","ARCW","ABIO","RKDA","ARCB","ACGL","APLP","ACAT","ARDX","ARNA","ARCC","AGII","AGIIL","ARGS",
                  "ARIS","ARIA","ARKR","ARMH","ARTX","ARQL","ARRY","ARRS","AROW","ARWR","ARTNA","ASNA","ASND","ASCMA","APWC","ASML","AZPN","ASMB","ASFI","ASTE",
                  "ATRO","ASTC","ATAI","ATRA","ATHN","ATHX","AAME","ACBI","ACFC","ABY","ATLC","AAWW","AFH","TEAM","ATNI","ATOS","ATRC","ATRI","ATTU","LIFE",
                  "AUDC","AUPH","EARS","ABTL","ADSK","ADP","AVEO","AVXS","AVNW","AVID","AVGR","AVIR","CAR","AWRE","ACLS","AXGN","AXSM","AXTI","BCOM","RILY",
                  "BOSC","BEAV","BIDU","BCPC","BWINB","BLDP","BANF","BKMU","BOCH","BMRC","OZRK","BFIN","BWFG","BANR","BZUN","BBSI","BSET","BYBK","BV","BBCN",
                  "BCBP","BECN","BSF","BBGI","BEBE","BBBY","BGNE","BELFB","BLPH","BLCM","BNCL","BNFT","BGCP","BGFV","BIND","ORPN","BIOC","BCRX","BIOD","BDSI",
                  "BIIB","BIOL","BLRX","BMRN","BPTH","BIOS","BBC","BBP","BSTC","BSTG","BSPM","TECH","BEAT","BJRI","BBOX","BDE","BLKB","BBRY","HAWK","BKCC",
                  "BLMN","BCOR","BLBD","BUFF","BHBK","NILE","BLUE","BKEP","BPMC","ITEQ","BMCH","BNCN","BOBE","BOFI","BOFIL","WIFI","BOJA","BOKF","BNSO","BPFH",
                  "EPAY","BCLI","BBRG","BDGE","BLIN","BCOV","AVGO","BSFT","BWEN","BRCD","BRKL","BRKS","BRKR","BMTC","BLMT","BSQR","BWLD","BLDR","BUR","CFFI",
                  "CHRW","CA","CCMP","CDNS","CDZI","CACQ","CZR","CSTE","PRSS","CLBS","CLMS","CHY","CHI","CCD","CHW","CGO","CSQ","CAMP","CVGW","CFNB",
                  "CALA","CALD","CALM","CLMT","ABCD","CAC","CAMT","CSIQ","CGIX","CPLA","CBF","CCBG","CPLP","CSWC","CPTA","CFFN","CAPN","CAPR","CPST","CARA",
                  "CARB","CBYL","CFNL","CRME","CSII","CATM","CDNA","CECO","CTRE","CKEC","CARO","CRZO","TAST","CASM","CACB","CASC","CWST","CASY","CASI","CASS",
                  "CATB","CBIO","CPRX","CATY","CVCO","CAVM","CBFV","CBOE","CDK","CDW","CECE","CPXX","CELG","CLDX","CLRB","CLLS","CBMG","CLSN","CYAD","CEMP",
                  "CETX","CSFL","CETV","CFBK","CENT","CENTA","CVCY","CENX","CNBKA","CNTY","CPHD","CRNT","CERC","CERCZ","CERE","CERN","CERU","CERS","KOOL","CEVA",
                  "CFCOU","CSBR","CYOU","HOTR","CTHR","GTLS","CHTR","CHFN","CHKP","CHEK","CEMI","CHFC","CCXI","CHMG","CHKE","CHMA","PLCE","CMRX","CALI","CAAS",
                  "CBAK","CBPO","CCCL","CCCR","CCRC","JRJC","HGSH","CNIT","CJJD","HTHT","CREG","CNTF","CXDC","CCIH","CNET","IMOS","CDXC","CHSCL","CHSCM","CHSCN",
                  "CHSCO","CHSCP","CHDN","CHUY","CDTX","CIFC","CMCT","CMPR","CINF","CIDM","CTAS","CPHR","CRUS","CSCO","CTRN","CZNC","CZWI","CTXS","CHCO","CIVB",
                  "CDTI","CLNE","CLNT","CLFD","CLSD","CLIR","CBLI","CSBK","CLVS","CMFN","CME","CCNE","CISG","CNV","COBZ","COKE","CDXS","CVLY","JVA","CCOI",
                  "CGNT","CGNX","CTSH","COHR","CHRS","COHU","CLCT","COLL","CIGI","CLCD","COLB","COLM","CMCO","CBMX","CMCSA","CBSH","CBSHP","CVGI","COMM","CSAL",
                  "JCS","ESXB","CYHHZ","CTBI","COB","CVLT","CGEN","CPSI","CTG","SCOR","CMTL","CNAT","CNCE","CXRX","CCUR","CFMS","CNFR","CNMD","CTWS","CNOB",
                  "CNXR","CONN","CNSL","CWCO","CPSS","CFRX","CTRV","CTRL","CPRT","COYN","COYNW","CRBP","CORT","BVA","CORE","CORI","CSOD","CRVL","CRVS","COSI",
                  "CSGP","COST","ICBK","CVTI","COVS","COWN","COWNL","PMTS","CRAI","CBRL","BREW","CRAY","CACC","CREE","CRESY","CRTO","CROX","CCRN","XRDC","CRDS",
                  "CRWS","CYRX","CSGS","CCLP","CSPI","CSWI","CSX","CTIC","CTIB","CTRP","CUNB","CUI","CPIX","CMLS","CRIS","CUTR","CVBF","CVV","CYBR","CYBE",
                  "CYCC","CBAY","CYNA","CYNO","CY","CYRN","CONE","CYTK","CTMX","CYTX","CTSO","CYTR","DAKT","DTLK","DRAM","DWCH","PLAY","DTEA","DWSN","DBVT",
                  "DHRM","DFRG","TACO","DCTH","DGAS","DENN","XRAY","DEPO","DSCI","DERM","DEST","DXLG","DTRM","DXCM","DXTR","DHIL","FANG","DCIX","DRNA","DFBG",
                  "DGII","DMRC","DRAD","DGLY","APPS","DCOM","DMTX","DIOD","DPRX","DISCA","DISCK","DISH","SAUC","DLHC","DLTR","DGICA","DMLP","DORM","DRWI","DRWIW",
                  "DWA","DRYS","DSPG","CADTW","DTSI","DLTH","DNKN","DRRX","DXPE","BOOM","DYSL","DVAX","ETFC","EGBN","EGLE","EGRX","ELNK","EWBC","EML","EVBS",
                  "EVGBC","EVSTC","EVLMC","EBAY","EBAYL","EBIX","ELON","ECHO","ECTE","SATS","EDAP","EDGE","EDGW","EDIT","EDUC","EFUT","EGAN","EGLT","EHTH","EIGR",
                  "LOCO","EMITF","ESLT","ERI","ELRC","ESIO","EA","EFII","EBIO","RDEN","ELTK","EMCI","EMKR","EMMS","NYNY","ERS","ENTA","ECPG","WIRE","ENDP",
                  "ECYT","ELGX","EIGI","WATT","EFOI","ERII","ENOC","ENG","ENPH","ESGR","ENTG","ENTL","ETRM","EBTC","EFSC","ENZY","EPIQ","EPRS","EPZM","PLUS",
                  "EQIX","EQBK","EAC","ERIC","ERIE","ESCA","ESPR","ESSA","ESND","ETSY","EEFT","EVEP","EVLV","EVOK","EVOL","EXA","EXAS","EXAC","EXEL","EXFO",
                  "EXLS","EXPE","EXPD","EXPO","ESRX","EXTR","EYEG","EZPW","FFIV","FB","FCS","FRP","FALC","DAVE","FARM","FFKT","FMNB","FARO","FAST","FATE",
                  "FBRC","FDML","FNHC","FEIC","FHCO","FENX","GSM","FCSC","FGEN","LION","FDUS","FRGI","FSAM","FSC","FSCFL","FSFR","FITB","FITBI","FNGN","FISI",
                  "FNSR","FNJN","FNTC","FNTCW","FEYE","FBNC","FNLC","FRBA","BUSE","FBIZ","FCFS","FCNCA","FCBC","FCFP","FBNK","FDEF","FFBC","FFIN","THFF","FFNW",
                  "FFWM","INBK","FIBK","FRME","FMBH","FMBI","FNBC","FNFG","FNWB","FSLR","FSBK","FVC","CIBR","RFDI","FUNC","SVVC","FMER","FSV","FISV","FIVE",
                  "FPRX","FIVN","FLML","FLKS","FLXN","FLXS","FLEX","FLIR","FLDM","FFIC","FOMX","FOGO","FONR","FES","FH","FORM","FORR","FTNT","FBIO","FWRD",
                  "FORD","FWP","FOSL","FMI","FOXF","FRAN","FELE","FRED","RAIL","FEIM","FRPT","FTR","FTRPR","FRPH","FSBW","FTD","FTEK","FCEL","FORK","FULL",
                  "FLL","FULT","FNCX","FSNN","FFHL","GK","GAIA","GLPG","GALT","GALE","GLMD","GLPI","GRMN","GGACR","GGACW","GARS","GENC","GNCMA","GFNSL","GENE",
                  "GNMK","GNCA","GHDX","GNTX","THRM","GNVC","GEOS","GABC","GERN","GEVO","ROCK","GIGM","GIGA","GIII","GILD","GBCI","GLAD","GLADO","GOOD","GOODM",
                  "GOODN","GOODP","GAIN","GAINN","GAINP","LAND","GBT","ENT","GBLI","GBLIZ","SELF","GSOL","GWRS","GBIM","GLBS","GLRI","GLUU","GLYC","GOGO","GLNG",
                  "GMLP","GLDC","GDEN","GOGL","GBDC","GTIM","GPRO","GMAN","LOPE","GBSN","GEC","GLDD","GSBC","GNBC","GRBK","GPP","GPRE","GCBC","GLRE","GRIF",
                  "GRFS","GRPN","OMAB","GGAL","GSIT","GSVC","GTXI","GBNK","GUID","GIFI","GURE","GPOR","GWPH","GWGH","GYRO","HEES","HNRG","HALL","HALO","HMPR",
                  "HBHC","HBHCL","HNH","HAFC","HNSN","HQCL","HDNG","HLIT","TINY","HBIO","HCAP","HAS","HA","HCOM","HWKN","HAYN","HDS","HIIQ","HCSG","HQY",
                  "HSTM","HWAY","HTLD","HTLF","HTWR","HTBX","HSII","HELE","HMNY","HMTV","HNNA","HCACW","HSIC","HTBK","HFWA","HEOP","HCCI","MLHR","HRTX","HSKA",
                  "HIBB","HPJ","HIMX","HSGX","HMSY","HOLI","HOLX","HBCP","HOMB","HMST","HTBI","CETC","HOFT","HFBC","HBNC","HZNP","HRZN","HDP","HMHC","HWCC",
                  "HOVNP","HBMD","HSNI","HTGM","HUBG","HSON","HDSN","HBAN","HBANO","HBANP","HURC","HURN","HTCH","HCM","HBP","HYGS","IAC","IKGH","IBKC","IBKCO",
                  "IBKCP","ICAD","IEP","ICFI","ICLR","ICON","ICUI","IPWR","INVE","IDRA","IDXX","DSKY","IESC","IRG","RXDX","IIVI","KANG","ILMN","IMMR","ICCC",
                  "IMDZ","IMNP","IMGN","IMMU","IPXL","IMMY","INCR","SAAS","INCY","INDB","IBCP","IBTX","IDSA","INFN","INFI","IPCC","III","IFON","IMKTA","INWK",
                  "INNL","INOD","IPHS","IOSP","INVA","INGN","ITEK","INOV","INO","NSIT","INSM","IIIN","PODD","INSY","NTEC","IART","IDTI","INTC","IQNT","NTLA",
                  "IPCI","IPAR","IBKR","ININ","ICPT","ICLD","IDCC","TILE","IMI","INAP","IBOC","ISCA","IGLD","XENT","INTX","ISIL","IILG","IVAC","INTL","INTLL",
                  "ITCI","IIN","INTU","ISRG","INVT","SNAK","ISBC","ITIC","NVIV","IVTY","IONS","IPAS","IPGP","IRMD","IRIX","IRDM","IRBT","IRWD","ISLE","ITI",
                  "ITRI","ITRN","ITUS","XXIA","IXYS","JJSF","JBHT","JCOM","JASO","JKHY","JACK","JAGX","JAKK","JMBA","JRVR","JASN","JAZZ","JD","JSYNU","JBLU",
                  "JIVE","JBSS","JOUT","JNP","JUNO","KTWO","KALU","KNDI","KPTI","KCAP","KRNY","KELYA","KMPH","KERX","KEQU","KTEC","KTCC","KFRC","KE","KBAL",
                  "KIN","KGJI","KINS","KIRK","KITE","KTOV","KTOVW","KLAC","KLXI","KONA","KZ","KOPN","KRNT","KTOS","KUTV","KLIC","KURA","KVHI","FSTR","LJPC",
                  "DRIO","LSBG","LBAI","LKFN","LAKE","LRCX","LAMR","LANC","LNDC","LMRK","LMRKP","LE","LSTR","LNTH","LPSB","LSCC","LAWS","LAYN","LCNB","LDRH",
                  "LBIX","LGCY","LGCYO","LGCYP","LTXB","LVHD","LMAT","TREE","LXRX","LGIH","LHCG","LBRDA","LBRDK","LBTYA","LBTYK","LILA","LILAK","LVNTA","QVCA","BATRA",
                  "BATRK","LMCA","LMCK","LSXMA","LSXMK","TAX","LTRPA","LPNT","LCUT","LFVN","LWAY","LGND","LTBR","LPTH","LLNW","LMNR","LINC","LECO","LIND","LINDW",
                  "LLTC","LBIO","LIOX","LPCN","LQDT","LFUS","LIVN","LOB","LIVE","LPSN","LKQ","LMFA","LMIA","LOGI","LOGM","EVAR","CNCR","LORL","LOXO","LPTN",
                  "LPLA","LRAD","LYTS","LULU","LITE","LMNX","LMOS","LUNA","MBTF","MCBC","MTSI","MCUR","MGNX","MAGS","MGLN","MPET","MGIC","CALL","MNGA","MHLD",
                  "MSFG","COOL","MMYT","MBUU","MANH","LOAN","MNTX","MTEX","MNKD","MANT","MARA","MCHX","MRNS","MKTX","MKTO","MRKT","MRLN","MAR","MBII","MRTN",
                  "MMLP","MRVL","MASI","MTCH","MATN","MTLS","MTRX","MAT","MATR","MATW","MFRM","MXIM","MXWL","MZOR","MBFI","MCFT","MGRC","MDCA","MFIN","MNOV",
                  "MDSO","MDVN","MDWD","MDVX","MEET","MEIP","MPEL","MLNX","MEMP","MRD","MENT","MELI","MBWM","MERC","MBVT","MRCY","EBSB","VIVO","MMSI","MACK",
                  "MRUS","MLAB","MESO","CASH","MBLX","MEOH","MFRI","MGEE","MGPI","MCHP","MU","MSCC","MSFT","MSTR","MVIS","MPB","MTP","MCEP","MBRG","MSEX",
                  "MSBI","MOFG","MIME","MDXG","MNDO","MB","NERV","MRTX","MIRN","MSON","MIND","MITK","MITL","MKSI","MMAC","MINI","MOBL","MLNK","MBRX","MNTA",
                  "MOMO","MCRI","MDLZ","MGI","MPWR","TYPE","MNRO","MRCC","MNST","MHGC","MORN","MOSY","MPAA","MDM","MRVC","MTSC","LABL","MFLX","MFSF","MYL",
                  "MYOK","MYOS","MYRG","MYGN","NBRV","NANO","NSTG","NH","NK","NSSC","NDAQ","NTRA","NATH","NKSH","FIZZ","NCMI","NCOM","NGHC","NGHCO","NGHCZ",
                  "NHLD","NATI","NATL","NRCIA","NRCIB","NWLI","NAII","NHTC","NATR","BABY","NAVI","NBTB","NCIT","NKTR","NEOG","NEO","NEON","NEOS","NEOT","NVCN",
                  "NEPT","UEPS","NETE","NTAP","NTES","NFLX","NTGR","NLST","NTCT","NTWK","CUR","NBIX","NDRM","NURO","NYMT","NYMTO","NYMTP","NLNK","NWS","NWSA",
                  "NEWS","NEWT","NXEO","NXEOW","NXST","NVET","EGOV","NICE","NCBS","NIHD","NVLS","NMIH","NNBR","NDLS","NDSN","NTK","NTRS","NTRSP","NFBK","NRIM",
                  "NWBI","NWBO","NWPX","NCLH","NVFY","NVMI","NVDQ","NOVT","MIFI","NVAX","NVCR","NVGN","NUAN","NMRX","NUTR","NTRI","NUVA","NVTR","QQQX","NVEE",
                  "NVEC","NVDA","NXPI","NXTM","NXTD","NYMX","OIIM","OPTT","ORIG","OSHC","OCFC","OCRX","OCLR","OCUL","OCLS","OCLSW","OMEX","ODP","OFS","OHAI",
                  "OVBC","OHRP","ODFL","OLBK","ONB","OPOF","OSBC","OLLI","ZEUS","OFLX","OMER","OMCL","ON","OTIV","OGXI","OMED","ONTX","ONCS","OHGI","OTEX",
                  "OPXA","OPXAW","OPGN","OPHT","OPB","ORMP","OSUR","ORBC","ORBK","ORLY","OREX","SEED","OESX","ORIT","ORRF","OFIX","OSIS","OSIR","OSN","OTIC",
                  "OTTR","OUTR","OVAS","OSTK","OXFD","OXLC","OXLCN","OXLCO","PFIN","PTSI","PCAR","PACB","PCBK","PEIX","PMBC","PPBI","PCRX","PACW","PTIE","PAAS",
                  "PNRA","PANL","PZZA","FRSH","PRTK","PRXL","PCYG","PSTB","PKBK","PRKR","PKOH","PARN","PTNR","PATK","PEGI","PDCO","PTEN","PAYX","PCTY","PYDS",
                  "PYPL","PCCC","PCMI","PCTI","PDCE","PDFS","PDLI","PDVW","SKIS","PGC","PEGA","PCO","PENN","PFLT","PNNT","PWOD","PTXP","PEBO","PFIS","PBCT",
                  "PUB","PRCP","PPHM","PPHMP","PRFT","PFMT","PERI","PESI","PTX","PERY","PGLC","PETS","PFSW","PGTI","PZRX","PHIIK","PAHC","PHMD","PLAB","PICO",
                  "PIRS","PPC","PNK","PNFP","PXLW","PLPM","PLXS","PLUG","PSTI","PNTR","PCOM","PLCM","POOL","PLKI","BPOP","BPOPM","BPOPN","PBIB","PTLA","PBPB",
                  "PCH","POWL","POWI","PSIX","DWIN","DWTR","PRAA","PRAH","PRAN","PFBC","PLPC","PFBI","PINC","PRGX","PSMT","PBMD","PRMW","PRIM","PRZM","PVTB",
                  "PVTBP","PDEX","IPDN","PFIE","PGNX","PRGS","DNAI","PFPT","PRPH","PRQR","UBIO","ZBIO","PSEC","PRTO","PTI","PRTA","PVBC","PROV","PSDV","PMD",
                  "PTC","PTCT","PULM","PLSE","PCYO","PXS","QADA","QCRH","QGEN","QIWI","QLIK","QLGC","QLTI","QRVO","QCOM","QSII","QBAK","QLYS","QRHC","QUIK",
                  "QDEL","QNST","QUMU","QUNR","QTNT","RRD","RADA","RDCM","ROIAK","RSYS","RDUS","RDNT","RDWR","RMBS","RLOG","GOLD","RPD","RPTP","RAVE","RAVN",
                  "ROLL","RICK","RCMT","RLOC","RDI","RGSE","RELY","RNWK","RP","RETA","UTES","DAX","RCON","REPH","RRGB","RRR","RDHL","REGN","RGNX","DLBS",
                  "DTYS","TAPR","RGLS","REIS","RELV","RLYP","MARK","RNST","REGI","RNVA","RCII","RTK","RGEN","RPRX","RBCAA","FRBK","REFR","RESN","REXI","RECN",
                  "ROIC","SALE","RTRX","RVNC","RVLT","RWLK","REXX","RFIL","RIBT","RELL","RIGL","NAME","RNET","RTTR","RVSB","RLJE","RMGN","FUEL","RMTI","RCKY",
                  "RMCF","RSTI","ROKA","ROSG","ROST","ROVI","RBPAA","RGLD","RPXC","RTIX","RBCN","RUSHA","RUSHB","RUTH","RXII","RYAAY","STBA","SANW","SBRA","SABR",
                  "SAEX","SAFT","SAGE","SGNT","SAIA","SALM","SAFM","SASR","SGMO","SANM","GCVRZ","SPNS","SRPT","SBAC","SCSC","SCHN","SCHL","SCLN","SGMS","SQI",
                  "SNI","SCYX","SEAC","SBCF","STX","SRSC","SHLD","SHOS","SPNE","SGEN","EYES","SCWX","SNFCA","SEIC","SCSS","SIGI","LEDS","SMTC","SENEA","SNMX",
                  "SQNM","SQBG","MCRB","SREV","SFBS","SEV","SGOC","SMED","SHEN","SHLO","SHPG","SCVL","SHBI","SHOR","SFLY","SIFI","SIEN","BSRR","SWIR","SIFY",
                  "SIGM","SGMA","SGNL","SBNY","SLGN","SILC","SGI","SLAB","SIMO","SPIL","SRAQU","SSRI","SAMG","SFNC","SLP","SINA","SBGI","SVA","SIRI","SITO",
                  "SZMK","SKUL","SKYS","SKLN","MOBI","SPU","SKYW","SWKS","ISM","JSM","OSM","SLM","SLMAP","SMT","SWHC","SMSI","SMTX","LNCE","SODA","SOHU",
                  "SLRC","SUNS","SCTY","SEDG","SONC","SONS","SPHS","SORL","SRNE","SOHO","SSB","SFST","SMBC","SONA","SBSI","OKSB","SP","SPKE","ONCE","SPAR",
                  "SPTN","DWFI","SPPI","ANY","SPEX","SPI","SAVE","SPLK","SPOK","SPWH","SBPH","FUND","SFM","SPSC","SSNC","STAA","STAF","STMP","STLY","SPLS",
                  "SBLK","SBUX","STRZA","STFC","STBZ","SNC","STDY","GASS","STLD","SMRT","SBOT","STEM","STML","STXS","SRCL","SRCLP","STRL","SHOO","SYBT","BANX",
                  "SGBK","SSKN","SSYS","STRT","STRS","STRA","STRM","SBBP","STB","SCMP","SUMR","SMMF","SNBC","SNHY","SEMI","SNSS","STKL","SPWR","RUN","SSH",
                  "SUNW","SMCI","SPCB","SCON","SGC","SUPN","SPRT","SGRY","SCAI","SRDX","SIVB","SYKE","SYMC","SYNC","SYNL","SYNA","SNCR","SNDX","SGYP","ELOS",
                  "SNPS","SNTA","SYNT","SYMX","SYUT","SYPR","SYRX","TROW","TTOO","TTWO","TLMR","TNDM","TLF","TNGO","TANH","TEDU","TASR","TAYD","TCPC","AMTD",
                  "TEAR","TECD","TTGT","TGLS","TNAV","TTEC","TLGT","TENX","GLBL","TERP","TVIA","TBNK","TSRO","TESO","TSLA","TESS","TSRA","TTEK","TLOG","TTPH",
                  "TCBI","TCBIL","TCBIP","TXN","TXRH","TFSL","TGTX","ABCO","ANDE","TBBK","BONT","CG","CAKE","CHEF","DSGX","DXYN","ENSG","XONE","FINL","FLIC",
                  "GT","HABT","HCKT","HAIN","CUBA","JYNT","KEYW","KHC","MDCO","MIK","MIDD","NAVG","SLIM","PCLN","PRSC","RMR","SPNC","ULTI","YORW","NCTY",
                  "TBPH","TST","TCRD","THLD","TICC","TTS","TSBK","TIPT","TITN","TTNP","TIVO","TMUS","TMUSP","TBRA","TKAI","TNXP","TISA","TRCH","TSEM","TWER",
                  "CLUB","TOWN","TCON","TSCO","TWMC","TACT","TBIO","TGA","TTHI","TZOO","TRVN","TCBK","TRIL","TRS","TRMB","TRIB","TRIP","TSC","TBK","TROV",
                  "TRUE","TRST","TRMK","TTMI","TUBE","TCX","TUES","TOUR","HEAR","TUTT","FOX","FOXA","TWIN","TRCB","USCR","PRTS","USEG","GROW","UBNT","UFPT",
                  "ULTA","UCTT","RARE","ULBI","ULTR","UTEK","UMBF","UMPQ","UNIS","UBSH","UNB","UNXL","QURE","UBCP","UBSI","UCBI","UCFC","UBNK","UFCS","UIHC",
                  "UNFI","UBFO","USBI","USLM","UTHR","UG","OLED","UEIC","UFPI","ULH","USAP","UVSP","UPLD","URRE","URBN","ECOL","USAT","USAK","USMD","UTMD",
                  "UTSI","VALX","VNDA","VIGI","VYMI","VNR","VNRAP","VNRBP","VNRCP","VRNS","VDSI","VBLT","VASC","VBIV","WOOF","VECO","APPY","VRA","VCYT","VSTM",
                  "VCEL","VRNT","VRSN","VRSK","VBTX","VRML","VSAR","VTNR","VRTX","VIA","VIAB","VSAT","VIAV","VICL","VICR","CIZ","CFO","CFA","CSF","CDC",
                  "CDL","VBND","VDTH","VRAY","VKTX","VLGEA","VIP","VNOM","VIRC","VA","VIRT","VRTS","VRTU","VTGN","VTAE","VTL","VIVE","VVUS","VOD","VLTC",
                  "VOXX","VYGR","VSEC","VTVT","VUZI","VWR","WGBS","WBA","WAFD","WASH","WFBI","WSBF","WVE","WSTG","WDFC","WEB","WBMD","WB","WEN","WERN",
                  "WSBC","WTBA","WSTC","WMAR","WABC","WBB","WSTL","WDC","WFD","WLB","WPRT","WEYS","WHLR","WHF","WFM","WILN","WVVI","WLDN","WLFC","WLTW",
                  "WIBC","WIN","WINT","WING","WINA","WINS","WTFC","WTFCM","WETF","WIX","WMIH","WWD","WKHS","WRLD","WPCS","WPPGY","WMGI","WSFS","WYNN","XBIT",
                  "XCRA","XNCR","XENE","XGTI","XLNX","XOMA","XPLR","XCOM","XNET","MESG","YHOO","YNDX","YIN","YOD","YCB","YRCW","YECO","YY","ZFGN","ZAGG",
                  "ZAIS","ZBRA","ZLTQ","ZHNE","Z","ZG","ZN","ZION","ZIOP","ZIXI","ZGNX","ZSAN","ZUMZ","ZYNE","ZNGA"]
    for symbol in @allTickers
      @ticker = Ticker.new
      @ticker.ticker = symbol
      @ticker.save
    end

    redirect_to tickers_path
  end

  # GET /tickers/new
  def new
    @ticker = Ticker.new
  end

  # GET /tickers/1/edit
  def edit
  end

  # POST /tickers
  # POST /tickers.json
  def create
    @ticker = Ticker.new(ticker_params)

    respond_to do |format|
      if @ticker.save
        format.html { redirect_to @ticker, notice: 'Ticker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticker }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickers/1
  # PATCH/PUT /tickers/1.json
  def update
    respond_to do |format|
      if @ticker.update(ticker_params)
        format.html { redirect_to @ticker, notice: 'Ticker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickers/1
  # DELETE /tickers/1.json
  def destroy
    @ticker.destroy
    respond_to do |format|
      format.html { redirect_to tickers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticker
      @ticker = Ticker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticker_params
      params.require(:ticker).permit(:ticker)
    end
end
