%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           --- LEE2AERO ---                              %
% Opensource machine learning based tool for assessing blade performance  % 
%          impairment due to general leading edge degradation             %                      
%                           ----------------                              %
%                              Software by:                               %
%        Alessio Castorrini, Andrea Ortolani, Edmondo Minisci,            %
%                         M. Sergio Campobasso                            %
%                                                                         %
%                          Reference article:                             %
% Opensource machine learning metamodels for assessing blade performance  %
% impairment due to general leading edge degradation, Journal of Physics: % 
% Conference Series, Vol. xxxx, no.x, ref. xxxxxx, June 2024. DOI: xxxxxxxxx.
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Y,Xf,Af] = ANN_CL(X,~,~)
%ANN_CL neural network simulation function.
%
% Auto-generated by MATLAB, 13-Jan-2024 10:26:17.
% 
% [Y] = myNNF_Cl_R_80(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 14xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.02;-0.02;0.0005;-10;-0.0008;-0.00015;-0.4;-0.00015;-0.4;-0.075;1e-06;1e-06;2.5e-07;0];
x1_step1.gain = [33.3333333333333;33.3333333333333;285.714285714286;0.0769230769230769;833.333333333333;4444.44444444444;1.92307692307692;4444.44444444444;1.92307692307692;10.2564102564103;1250.78173858662;1250.78173858662;35714.2857142857;0.0078125];
x1_step1.ymin = -1;

% Layer 1
b1 = [-0.84422026759776613858;14.821414874442659482;-2.319587908753461214;1.8105294190876972671;6.6827293653304735699;6.8523656580407950045;1.4421373069300504888;12.841539134471771533;21.380697793751654245;0.84767049357081591943;-21.636048335872889226;3.5118996756818741112;-2.8276764701018799464;-2.0573473885867237243;-17.25998363069636099;-0.98250204582115174823;2.7473595265820378586;1.2626480689554686609;-0.75940417125099624052;-1.1605301256412223765;-2.1527609405973877621;-3.3020118951069235003;-0.53921331332868571717;-2.3757067051854812156;-4.6933571984429125479;1.9733253912666093299;0.76672947101174271367;14.852045752318238314;-2.7523298822012094433;-1.0167849638433754667;-0.6411894783077343174;-3.1235454816173020554;1.0029307356707606314;0.75006157145636487282;5.0663315227142451391;-0.1443681826701200821;1.3088409403281615617;0.85950701522273709188;2.7642530571265235828;-1.1409380917433680214;-3.2763217375615201199;0.97005879371006165091;-2.0077080530723088181;5.3344506856664928307;3.1409435270233689863;0.23475635309052053645;7.0351041814523593843;-0.6893638937232864361;-2.2689493503357858195;-1.1783308087397792452;3.318425498144544683;-0.30845861482065306536;2.5638423987550300609;0.61331014993244714617;-1.5536802561624289964;1.0872418113606350243;-8.5401303866527005226;-0.96689781105879779588;-1.2601536100359644887;-8.5626985620023372547;-2.5248783153717075933;3.9492260086078547765;-0.67046158440231096165;-1.0495759542110536522;-17.643671510288804427;1.0407711575660314463;-0.30505981935009129913;-4.802130326835613694;2.9755643425430142734;-13.195227800812821428;-3.8244724140121690859;0.41915561415054919392;1.7237144548642961972;2.9515839153253451421;2.4779761259554318187;-1.9810834321015524662;0.81165937903264151476;-9.0348807744627919192;-3.4351342015767141191;-3.5828087395711540886];
IW1_1 = [0.73544138999710539917 -0.84353163515723861288 1.3763168976874124994 -0.25828052072675611317 0.37526796482650731646 -0.8921461852945267168 0.68338968374839537123 -0.902678729535655755 1.8572841696466422245 0.61212389744021100668 -0.099396593267280314299 0.078542673909493404549 -0.22574309322995653182 -0.30212677841975255078;-1.095279202527199347 -2.4081015386776485343 1.1885568154525643081 0.63515264930025894241 0.96990511890943020834 -1.9533066862420169763 -0.49895083032482873131 -4.9636551843419152164 1.5712287410477436822 1.0836237845313498873 0.47442173978242824228 2.4949660160010465049 9.7976788552841203028 -0.58353267183228429982;-0.79181999271448721966 0.73084214261625579656 -0.15715621543235117064 1.3665039193287389363 -0.88875216001933521337 1.1502402812826626466 0.33311554082754490924 0.12950983880984742735 -0.34688083878455278075 0.042830093611599270864 -0.82301130993928350854 -0.068201779585979505072 -0.2111781217975316205 -0.3957308845182637147;0.10585880678164809321 0.52112012821930564499 -0.053942202221471773071 -0.24919830964002762097 0.49053040755045351773 -0.28111929668409607608 -0.11104121459949840844 -0.46653858100319384183 -0.33990654485311844191 -0.049435315046790898053 0.21824093305070052518 0.38115251349058720809 0.32594072744971441802 -0.11805303613670767304;-0.20803286470897233706 -0.74344693828714736306 2.1627550920871501106 -2.2519442062249859227 3.9856301137285248259 -0.6012991479244145232 -2.3646708471653745676 -3.8147394621307051388 -0.71334580624247823089 3.4028286007433314886 2.2826069894507021729 0.57878763364504837163 0.071392441456171143455 0.15395610149075017459;-2.9000070779473183791 -6.9579196168522621235 3.0965552807113523315 -0.17496172080938704463 1.576533232054912359 -2.1432341556960730067 0.93590506113269511523 -4.5117646394911039565 1.6843269123990274316 -3.1043859530195230256 1.0426674267277031838 4.7809905210420726718 -0.15548532633783379575 -1.7902683344843894897;-3.0766188919035406535 -2.8278733702562242058 1.7726174416341544671 0.16416619844295074482 0.089951103167924567616 0.95739241795847607186 2.8931547311806640188 2.1470605967912912426 0.886640921032271212 -2.4247701609335372552 0.62402581215352437294 0.24135660725064417287 -1.3977046393723677742 0.15381800581719393128;17.146276614919596426 22.682912188883690874 -10.921851467153686599 0.16597410149941976831 -0.10465047461417847918 -12.592426128640775929 -20.259796035732435371 -11.886019529873685485 -24.798373114857330535 6.9769235213386684435 4.103263055640425705 3.6955969155608903165 7.8023196864690991248 -4.6051085382046625938;-8.0979327831176508568 -15.836101264913994058 0.39272503711610523558 -1.0898569480144271182 5.7469247554043842996 -6.0356689752209069511 3.4490339690438145404 -0.21954896026689457722 8.3893684934297017008 0.21923114195473486498 8.3967253518055304795 10.678860421279249948 0.44679884707703648727 -2.3196338841537298414;-0.88186753580251076023 1.0896215418414627596 0.097216533960568202177 -0.17590027615329112409 -0.38910509939997928175 0.91409707385561689286 -0.74767647244694857012 -0.057652728929727434237 -1.7210251565665566353 -1.2097979809701198128 0.039576961831193017971 0.48428251039001901646 -0.11581622870465729802 1.0832800617020115208;8.1608788158928593504 15.932594183150914802 -0.40521192678470424609 1.2146462848333188234 -5.910917447668389002 6.1264299058810181009 -3.6759386519593166831 0.27934420076848703873 -8.6506151738868108936 -0.11124897318867663087 -8.4859593086656328609 -10.777206462399005815 -0.449250268661126273 2.2955949345438901865;-2.8143869362360174335 -3.1615449135036359785 0.87627853961576263053 -0.80858337237911404038 1.6005947197580185914 -0.66361681100848357584 0.27839095475978692384 -1.9990553224287377354 -2.2324483671257673301 1.0644173281015296695 0.96110442063834189419 2.0246491312077825597 0.015825298760878018373 1.3616372944664703049;2.9437200478252250058 -0.44751646641176573427 1.9744798289120306656 1.6598991033598762268 -0.031366672063483910793 0.39606227690613488024 -0.29870201345184455022 0.14246799369467613716 1.2943000925980794324 -0.85456834004458004372 -0.96568469829671699234 -0.053985208175168039602 -1.0330302420700181454 0.51285337121333518517;0.73600706758716749611 2.9536558551751994628 0.55400549524231867959 1.3055485091627585525 -0.52735907814376881131 0.98997508892659202839 -1.4484674892684934466 1.2774501859540361437 -2.8032327953981210911 -0.43748801730510977759 -0.77471187672835828408 -0.68958778716886404148 -0.75579226752250827648 0.66222874114424590264;-2.5609763241726337668 -1.1846244728903168042 -0.46773303360583062815 2.1484496039665170741 -3.2570709397502581872 5.0587688692612058361 -10.752076383223855061 8.7262569633652322665 -14.945307400462105818 -4.5815322761134797958 -2.3904069337757256619 -5.3032799303056528117 -2.9579477135569698376 1.8371720941353728573;0.268837043862693581 -0.12066729477666006398 -0.46662268885270047347 0.036472467048472900775 -0.26446854379960627046 0.31786962333888957311 -0.47669294367605369311 0.011065125336132783374 -0.052612380702562452917 0.79637828004675781379 0.0022541282113867910919 -0.45673874813357656643 0.1353473285293629591 0.28855316394919022782;-3.09350648468915157 -9.7828740114327583655 6.5148384640215670771 -0.60272571869847435533 -2.5822104073347573738 -0.23040268600278313027 -4.5315096991541086169 -1.0868091602219995817 -4.2340900173954105767 -1.0613107168320967677 2.0596241164318471739 1.7597868987338014524 -2.6322059133827324651 0.71132294300957688016;-2.1524836340811113189 -6.2629182862394641162 2.1593306307205657468 1.738913227545207496 -6.1810291499421730066 -3.8629127942329386514 11.528496072302473863 4.8427265415798741444 1.8830593205537700108 -6.1612741478777381943 0.18225706690847862101 0.025951128080563320294 -2.5362760857627653088 0.56890838677097210763;0.55066819154004542636 1.5819589291184152913 -0.52024987299650060635 -0.49359320604930434495 -0.22383627415162887786 0.84352916609790684621 -0.054146384070299674596 -0.21378516427672814015 0.24553878976770404652 0.9091453789913390704 -0.1686443028191103588 -0.046161729793475610173 0.078539318008770467316 0.21602917514716524217;1.8456870454438150109 1.1920038088629609785 -0.13452372109555094104 0.49660265761935423745 -0.4183387398233311405 -0.10583775885788009041 -0.1763500565260846531 -0.16556984488346632167 -0.0026566346697141250341 -0.61103906466905222317 -0.61632153068577755217 -0.34768685584246744602 -0.19571613730076384274 -0.050598747140375849307;0.70603491579346056017 3.0596439358601283942 0.56259458656620442429 1.4581544116305547032 -0.5115881750579728271 0.99665789847941177459 -1.3719997769859109127 1.1701334064345187969 -2.9636246448212171245 -0.47598830481287429661 -0.7556457889876213585 -0.7063168800589244567 -0.74862443076106921502 0.59252255297305189696;-3.7182946981276558951 -4.3194253061658614001 2.3102083369284436287 0.20038624814982022859 1.1547033408336879745 2.7483695340700533549 -3.854519275536508971 2.0890487684448215688 -4.5703418359643572799 2.2757906064789019673 0.068118313669250890596 -1.4970013794353342895 -2.2788732642061040323 -0.18494193704973163617;-0.11342936982032807147 -0.74848067234152271254 0.4748940145647118638 -0.95097574638778958889 -0.3407631207756588454 1.4359544282280440886 0.76031191020638799749 2.0772352802323919008 -0.53043025893679585092 0.8418264586329136101 -0.63953318701810124569 -0.037107889603587899952 -1.0305163154129917125 1.2195034180197634743;3.3664190541348704144 3.0482108950675721459 -1.5589389779547897508 -0.65072740734593070844 -2.3777479814423023718 0.79214143679043513835 0.6535335988855950351 0.16199214991887692094 -0.81381436276051599688 -0.40161203957227631367 -1.0676379212178708222 -1.1697237571187790728 0.35308489100867695987 0.5707017765220958605;1.1046021729478843199 -0.29711645558399918388 0.49790445829966573088 -0.96279439460563320807 -1.8162357022771680182 1.0744716603055890491 -0.31217105199294858942 0.13092809967455196207 -4.3700208400905173889 1.633987715374329408 -0.57702158374882506209 -2.4909449310858118309 -0.65502596179460981229 0.64150793486374280139;-1.5668656094154427283 -1.0224313957167014966 1.3033089823273289465 0.00038765199184466426693 1.785557147944729417 -0.88986914064613453768 0.077825785116638832029 -1.2165758207531829349 0.73022599668547083507 -0.78660753481246736829 0.47989377001500410636 0.20776905975588880193 0.045514219417237836152 0.60101221053640807579;-0.65004516063679063098 -1.3326721432810690882 0.98583187491924373358 -0.37747914964293460827 0.22189946958063802573 0.061444526116514727732 -0.28148390959555874558 -0.34500520147459479148 -0.91590573042668343984 0.012671810478652569334 0.00014782520069663127212 0.25187983210537062684 -0.25931194710292071459 0.46023126123493923734;-2.5978857001071218313 -5.6948325232391017181 -6.3053222183403567769 6.5474000110434253941 0.66586293972015431208 -1.3330065980277818749 -1.4879123293033442721 -15.629910080539266559 4.370488120877102034 -5.1543101186271558234 0.82274260062176240993 7.7233021146349631891 10.014621889985454217 -7.5050855904934206109;3.0621461604607880247 9.7325509403368286598 -6.5067135029822100734 0.57615022305366270228 2.5143534825405060573 0.35224515877982082168 4.4705412436404650123 1.2252749090132553089 4.0700103683038806324 1.1996068657747773756 -2.0563412394473230549 -1.784754989109355483 2.5737360762289536176 -0.64676887686228390351;1.3847574447508381734 0.96495563150034258104 -1.1150980810934723042 0.4585715931501036513 -0.67317944149464192805 0.090359458490620048199 0.1895172608036851114 0.25145727116100619059 -0.47471905013769388759 -2.0038650801609598773 -0.43571370978056528367 -0.14859762369368670343 0.57568080288997247607 0.092287329472986234791;-0.41326878506745023945 0.87811532452489349243 -0.22585450159767220257 -0.27461534959934896793 0.8967860843962149886 -1.2306848166722319515 -0.67663297124730015231 -2.9145767409149474503 -0.43162023514369712851 1.5613312205877019068 -0.075626703209029838559 0.65100842622861765374 0.43881497963838467236 -0.76911487876952444598;8.0450600568791905687 3.7806068230765603744 -0.7254591316110007293 -0.26450990476181412969 -0.23321343207363440242 -1.7349511394249175211 -4.1860536721630037249 -1.5055194054494016598 -3.0730792551556591619 0.54887114335182385361 -2.7730399816867907781 -1.1292884948536727752 1.3362896035261933037 2.354368957345918556;4.165575290168812117 1.6265047325604853334 -1.8394307518503192345 -0.32754279307534717169 0.79336650283903187297 3.1543205299719536683 -1.7461161367298934088 -0.24821195165157294849 -1.7170301968235834877 2.6474037247909789627 -0.68179615501799972765 -0.024401411134670088904 0.76751948215089527139 -0.099882649749377244719;-4.9596772212640800603 -5.8613075976121704613 2.4677430923336176605 1.0346898869024703238 -2.1246422915265483766 1.5503298090521424601 2.6969323667865241489 2.2546401469866821365 0.25047064810886915387 -0.2600357764922929249 0.98616783332880419977 -0.52791814910217327306 -1.5605783208029877507 -0.12274191603029654951;5.6623379670179696532 3.764723762285340225 -0.6638432901443280798 -1.4954846654134439365 0.48870877102255089186 9.7054883643146467875 -5.3669326111052075845 -4.3743771135868527722 -1.3393321566768114916 4.7509527974637260073 0.030216596704492323933 -0.25633107500453561345 1.9177786952785327301 1.4948858056272904538;0.030232221493681172425 -0.74192445428605080515 0.82565887004908955493 0.08387632938672760774 0.11336375263348448528 0.78967967672227368237 0.29013463810182732461 0.88338273934376165819 1.0205573556679992109 -0.24911540950583457854 -0.17039863807318253452 -0.22385999308361217985 -0.70444955395725128433 0.61409772791590055974;4.0415576880335857268 1.5590720216675433285 -1.8285090531256134039 -0.32466489603573478462 0.95431835574403356404 3.1055734915111310457 -1.4940381835222875662 -0.2222695535857587279 -1.5658724223519717711 2.5882356523783802693 -0.42544145477558115154 -0.04325585995004670864 0.76565819240442911653 -0.13108281271732050155;-2.6643653153802779876 -2.3309341809774113408 1.5880338796205843988 0.39526277741811288724 -0.31950042124680316791 1.0042167123036587206 1.7196330936184773819 1.6274613134483519872 0.34594510658435845274 -1.9156674116492407034 0.51476191093408252275 0.28500766552254663821 -1.0509621917918807732 0.0492622347808412131;-3.0379708596164571865 -9.7037628482182292089 6.5162528201219913626 -0.54945203072212356332 -2.4503414847070756899 -0.47982024709481574387 -4.4192450031533505594 -1.3723552598360688748 -3.9188314188052641995 -1.3411852582292556058 2.0586864251431928885 1.81500356499870108 -2.5205836684723030849 0.58345544648037228619;-0.13121942827938484766 1.9087155971719251824 -0.35636113201294922215 0.066367656547964976044 -0.67538390935208614252 -0.77668655734293345905 0.63944440093928811564 0.21166345040775497166 -0.17448293100520759213 -0.06281231661613964623 0.4903175531942323695 -0.58606821291191835144 0.16361118463439275339 -0.33170771188078718161;-5.0931641928860598156 -3.5601038637599575765 3.6709867735247581066 -0.38772409005478170041 -3.7127774733428662302 1.5586821477406425096 -1.2097841476441983932 2.1681975072019499251 -3.6822596039672652601 2.5085893268696612957 0.71659954224191080296 -2.5095498358332695155 -2.5181242271638670793 0.58019867711648864805;-0.27838588996401292253 0.1212909446588093243 0.62187517550856186155 -0.078843488327379182556 0.3655405695885992623 -0.30253026568579249878 0.51898224978203577606 -0.061689708840413186308 0.31681139779679562407 -0.95261389760285497541 -0.02666945277197579553 0.50820704901924362851 -0.21647890159524732501 -0.32907093273186810434;5.0770453077691701793 3.4858903897768347413 -0.58609413310782987327 -0.89795002660918099568 2.5541026942364286612 -2.2066685129443990299 -3.1928392648130445863 0.32679024963469471832 -0.82070619877175510215 3.6231828773801262322 -1.1410217436498899524 -1.7376504225195334996 0.45946517443203399589 2.269893928634090674;5.5461198365630410834 3.7240932497757186503 -0.65308989179822629634 -1.5117160208717224101 0.69427527510296216384 9.8694528937353442899 -5.3153460113683621557 -4.4455933154766578141 -1.2506399885531496174 4.8705361439106678034 0.18252533360750047842 -0.22071219135363009944 1.9126451389610186204 1.4218649813125296966;-6.8467392739608783359 -6.6129616022957486976 3.7627036644911515673 1.3568385782600447254 1.12027690629007326 0.81675711855825605667 -0.41690589976420383556 -1.450261614084229933 -0.8892788211188146219 -0.20620439610337765179 1.6478894193464284079 2.8045732726728842543 -2.3595110223037538688 -0.31625709330662055141;1.355559435468943974 0.23583861546301115863 0.38155747840356757372 -1.7756240853769365007 -0.83270075013117539342 0.24096972446883935248 -0.40655377358395872189 -0.18756143788380183479 -0.27563689519901107827 2.2293586582524418382 -0.41387646078306222774 -0.16803516972905829796 -0.49893811024026707424 0.64830686432368589411;-8.5541205522490120217 -8.6587657646415401302 -0.50675307314946937964 1.451289421819199621 2.0157339845824893132 -0.60502772797536641392 -0.86702529268374395333 -0.18978350400470944681 0.52901196912446835086 -0.044762667599322070178 3.354203340222031926 3.3249326002759498344 0.37769978629404338255 -4.1344118368519406914;0.244791220917357083 -0.76505138488342283587 1.1647076477931834759 -1.064081534693100739 -0.14272513220673771484 0.96711922858738508246 1.0363786692291532265 -0.0024612786815050068448 0.4085236644724823396 0.094403272739810084602 -1.0835552763331668391 0.27001692172599162101 -0.60350002203635244591 1.1030129722086867705;0.68810005079736002997 3.2028126879858338505 0.56967006180616941435 1.6357856743714143111 -0.50021853749998679284 1.0146880283707360171 -1.3058215342205459208 1.0570204162307859086 -3.1599107723142836335 -0.52733110112758441179 -0.74633829593877520914 -0.73253411367008103294 -0.73988499169342092365 0.52851073244193547129;0.42268517330289939737 -1.7265440262986178066 0.86958891235247115503 0.95812031341182135602 -0.24846685979292909563 -0.8422954482108829799 -1.5515553103005381708 1.1536460885626194095 -2.4425276076823854154 0.14317387473864512382 -0.20216407792821339262 0.6763315931998081787 -0.97445512590285576771 -1.0780560336452302828;-0.37166047124223888787 -1.1137030183332952138 -1.2320292316591479054 4.0431566840285402264 -0.23391687215614953566 -0.069502854164129934667 -0.4332901291204472316 0.046935123002180390017 -0.22261397236661831234 -1.2714212988472906041 0.0009549981788274097827 0.79024843028531099876 0.83000956499799971589 0.44017456414324784841;0.63897452405120613861 -0.17908581701558068389 0.27672357003302411327 -1.3909186344684780767 -1.3323534196201898272 -0.026028707695172154102 1.290624050968935288 1.3777738276948503504 1.6800034809834376581 0.020519736151701519627 -0.038987346906313766204 -0.80331782630815129487 -0.085780664323199848353 0.56267009644212206965;1.9574857374707064217 0.39626738445296244562 -0.033371460728396550033 -0.74338377701108415696 2.1842398119001855683 0.1926542898643792967 -1.4894127194620512267 -1.5509745023269587705 1.2008849286120788502 -0.16936975972304438298 -0.18244262421534196417 0.67810507602939984473 0.38365749674462096275 0.55231209853325724524;0.81171022658556735152 1.3136298200570488692 -1.8022859597552824962 0.048188987287454312924 0.31932349994632375223 -2.157842176081793184 -1.0815418220123436122 -1.088101769229529614 -0.92405190487532196109 1.0488762388101575684 1.0465650420456831249 -0.1944593875101670033 1.1540752710205250953 -1.3093036952055476796;1.0714582841405484448 1.7896723525550384259 0.025957827516852466365 0.92303184411270378096 -1.3287758216260403543 -0.037720104249718708345 -1.5899224752931566673 1.4954523285799525834 -1.6540055641462962921 -0.69358472875448284878 0.20526854969698693498 -0.43350462602937694934 -0.33011316328177681134 -0.59708376052246703303;0.84435472778642783886 0.48734631038912396006 -2.0301049906283616941 2.1294782337805386874 0.88966368494017689095 -1.7493437833628671108 -1.2658490164146884993 -0.49608086117529015535 -1.1077463792957804589 -0.72770244814232554198 0.76984003812624957064 0.013997449876156912996 1.4721940621818578876 -0.96937301165026135141;-3.8765936763908901419 -4.7203644662010368904 3.600705161353076722 -0.081243962613805884021 -8.5369123467208165579 5.9415148151842984703 0.44638008482005492317 5.6469818634856379092 -4.1713544645181812598 1.9033461071333885872 -0.95648386132710816465 -5.407956435937740558 -3.9540402721307517098 0.28915004099497382262;-1.655425754760119883 -0.76883051310039218773 0.19716838794567628779 1.5974451448346023152 -0.24540029648033681586 0.54502810127930279016 -0.71372166172205175894 -0.65418027706426506995 0.090347142792143939061 -0.8576635224002873148 -0.38300332522678054437 0.49349974840654697861 0.064287967700014186923 -0.50502722527905907768;2.1634906085717928725 6.2566080059922049017 -2.1560850226361423232 -1.735871894753743927 6.1646765911133227789 3.8523513272283964604 -11.508337161321719577 -4.832875488582328849 -1.9005865330911670963 6.1482738959486500363 -0.18697245495422898376 -0.017428923308715822682 2.5338484225628894464 -0.56277520222150345663;-3.9152664833952917078 -4.7615655726613086429 3.6376895243652325185 -0.10094079310211427625 -8.569913927109691798 6.0018856430594276219 0.47731075569099717937 5.6871120130897985234 -4.1898486239317351831 1.9237272971712551239 -0.96301051448205610139 -5.4342848456693468862 -3.9992566674445297892 0.30443522161362240874;6.5565288134228323358 4.0431571367733534217 -2.1597603793363795432 -1.2987767201962370223 -1.6547873222184406039 0.7494210396693520293 -1.3257489165161233657 -0.20960829922088874966 -0.9092332196321717408 1.5794973026463179355 -2.7018542395412530333 -0.95021199694136071479 1.0636519195105100799 0.4567277106624125782;7.2184301235198669033 3.5580216235013044646 -3.4309416703234281165 1.9783102134719794396 0.42699142208233520357 -5.4210731297890841773 -7.5477581477113542263 -3.5049952990913699757 -3.5063623685630465054 -1.6238757370540259917 1.7126111098586251913 0.7142126783074639329 3.8074455800595057298 -2.1441865844469845115;-0.41768252912645720265 0.85356810298787910707 -0.21791857544716797257 -0.17804121720060425704 0.87963029372449719201 -1.2196709192696475466 -0.64738640393161395181 -2.8925946465876477554 -0.44341826707368903193 1.4255532000831732109 -0.062557646379219011834 0.6477635906213614625 0.44717520792105519556 -0.8298446003819770489;0.039711298272112269259 2.0360020360263524353 -0.71454680544847060109 0.064742861540579385582 -0.26342091292493680088 -0.71711760821951719969 -0.12234139094509034751 -0.10227366217532696258 -0.40418396059711586554 -0.46191276268658226778 0.27299539065471428723 -0.65163736467566624189 0.51423232558928311242 0.1436087639773800384;-2.4651773358346327214 -0.98503293854958851039 -0.47749514992312469541 2.1759814013901221941 -3.3915024650398342132 5.2191751132724295559 -10.830298802071011366 8.8895338699910624314 -15.119082476520707914 -4.7681505707163198693 -2.5064629690619621982 -5.4639341782731660757 -3.0399761335198935974 1.9756412390146720348;-0.57676307977163732144 -0.70543278998356551135 -0.0093848336985200911387 0.41191478811926307557 0.26017432230279713412 0.16864816484050143552 0.02271848272973230054 0.23347550429786259607 0.36163634854680276609 -0.57552526252104352356 0.096237647600231096545 0.32007086400517437141 0.018858265847191257175 -0.1188866575712357182;2.4711911300984370499 -3.5296940768390872023 1.6277396375583323973 0.12055444613466791137 -2.7901382333382849232 0.8805469863782938722 -1.4176527679259758319 0.6804814286956546443 0.58816339027655883953 0.29216361429353110424 -0.91861414942769015202 1.6744169743174104337 -2.0862926378878774436 -0.68968061653082213258;-5.7974628996066019937 -3.8152916879049438847 0.67383754395319328534 1.4839137157666746347 -0.27879033133638631003 -9.5705045034108700008 5.4480646681469782067 4.3190245628943273459 1.4354727184050921629 -4.6474797469547581841 0.12847053783677520045 0.29013878145921967455 -1.9266419545361437304 -1.570789273930953911;5.3495934210297111377 3.589039954894667428 -2.7220413344835439062 0.25726095773619839235 4.1552446247399270618 -2.4206175562614293817 -2.3229264513937262215 -4.2002392241016757168 0.36737060532883930586 -0.38988404512542079727 -0.10396463211118553427 2.80038152755775549 2.5187889223076096457 -0.48754561834725101965;-6.9403958985432323558 -0.55005825213315806543 1.7107913701770225412 -1.0823716403171101952 -5.0016965347643589368 3.1795709705128993861 -1.1026630796383634081 4.7013285543132683486 -1.7257270305471497096 0.32690796479720446444 -6.1804938592390321617 -1.7154987117157654009 -1.9942419127093278242 1.0907923820307359186;0.51660193997152281664 0.66813914796902995619 0.62354021920532054502 0.52617521800002320376 -0.88274123780763225078 0.55790999476654157263 -0.75164725064473669747 1.5152399797345219579 0.36356981415714323402 0.15323758558897279669 -0.26243405007497055959 -1.4276141250764446955 -0.8193031292328311066 -0.36347423124617139756;-2.4024323150118163106 -1.5679604902835357905 0.405139630129673467 -0.0166307999358943151 0.12002666480403793858 0.34623277862695628349 0.42221245904091020407 0.065893975494828366246 0.066231148533639455644 -0.020187375844092275701 0.12620896968086162127 0.25812064329168921128 -0.14340829016139533536 0.21024265818942100559;-0.2024138247970205251 -0.62484340433413165794 0.14092551544984369127 0.78347864422737878431 -0.017123540560166385094 -0.066811132237850762161 0.02964044119978182304 0.0099735905633750159688 0.21864004598352462794 -0.62637134323736776143 0.050201754750843208264 0.25587247473994406688 0.16385125445916648435 0.21226195679784259918;0.78666521243741294178 -1.7977563619979535225 0.31739169190652666286 1.0867839301467177027 0.58486507599686532455 -1.2014722351591722305 -1.7738295579131460045 -3.9405543683762433993 -2.2076637907551330819 0.51208749936111574996 0.39978238776583346903 3.5403874929143457351 0.39292352251649892425 -0.81868863082626297523;1.843623698259848176 2.5311516567690808266 -1.3714824851103093462 0.34244143450780228921 0.043922973314599267347 -0.40003334679571145305 0.8102666756063160447 -0.89608008391371007928 2.9691878929058570513 -1.480113545871402092 -0.51836796647727223508 2.1247071361570024628 1.5527412967016316347 -0.62121657777970018532;0.44586550407888086989 0.89843217929559882062 -0.62123543117616775167 -0.78115700490858597238 -1.2190630776853832451 1.0930692971087072607 1.0806338739147767214 0.91141011192456022894 1.4326524790159294032 -1.2344619423946676662 -0.22332223600581715961 -0.74809812852081847279 -0.13102704562181488601 0.10406491792978402045;-4.0993759855591562768 -3.7082798534110876787 1.2401465688540900256 1.6418833073742760131 2.9957119636144819985 -1.8029353010435231752 -0.096075048743575711119 -0.074936688906173748448 -0.98104396261189630302 -1.984960224005591467 1.91397002885804568 1.2259766728698830995 -0.11883207797079529955 -1.531189368935398365;0.32515576160211223655 2.1056147658538244549 -3.53859174026639689 -3.5567256044769064438 1.2720684103623309813 -0.4178583127980481926 0.24804981257628069824 13.227373598527972121 -1.8567220388644141149 7.0240004664156687753 -0.36880703513478746425 -2.4911916923298869087 -5.6741187354231943374 -0.033781368742164558094;-0.90671803226248193219 1.6155175605028069263 1.3151205835608823502 0.1373153426527124743 -1.5989920626975777651 2.1314955855184076761 0.66000197682817229872 2.5908499846992079085 -1.5510611621910739277 0.035486260198820770984 -0.19860120707594625111 -1.8872170156431626875 -1.5888455545983346529 0.89171490472369918656;2.8605293497275772197 3.2442328293441367038 -0.91157194940626329327 0.79355842045058722078 -1.663244829147390913 0.70551364141503025706 -0.30490091316576084512 2.0484742066343066824 2.3012719718026781734 -1.0731347976949063838 -0.96961075171131161365 -2.0590372222139703418 -0.020837712398022303906 -1.3764786476462358422];

% Layer 2
b2 = 1.7976378830173966872;
LW2_1 = [0.2655856073101017234 5.3878985978602349505 -0.69227302035102067368 -7.435576099278292439 -0.072147617082736037464 -0.056662164945141160755 0.17513839056183372334 0.064356813609482504956 -2.7094426580514827663 0.10027896799556376695 -2.6872904820112228919 1.3519151317595499151 0.15240183779266291975 -3.2634608457948233173 1.0239178900972367714 -3.7619153563978136035 -4.0558490263458137903 -1.6111914422662680924 0.51928084245993755275 -0.64373994486971963802 6.3884362148907820611 -0.07276753735794450062 -0.16661159573635059283 -0.091126006149489624519 0.074296930957053641809 0.22449862792310606996 -0.66078645279265035839 0.034611337194609417822 -8.1120995800609758675 -0.21701735797256332949 1.5780331735122159476 -0.018858663176791308491 1.1294025680653940746 0.025274833058201551239 12.520422269192199138 -0.9063453303087887214 -1.1185912839292579957 -0.27642736418366659068 -4.0523891016091662109 -0.416095887114882379 0.038315446258310091598 -2.1860643137471629238 -0.012539988688437503361 -6.2265626863383145562 -0.031566809311561049023 0.24427035599426014101 -0.011047358040240302587 -0.27891353314893824189 -3.1041422593727254764 -0.035885148963266763622 0.25052536611077258488 -0.30895316948220041819 -0.12496798791631909264 -0.12148459074183298734 0.11213865386773493038 -0.21168400287036534535 2.1789084254605342039 0.35221413100473697444 -1.6143418209650262085 -2.1309726872765093475 -0.067826596075208744896 0.044882308535599012289 -1.6796473660816804152 0.58957873114405223713 -0.96670373549978960703 -3.7783035782781464462 0.016282041790801188991 6.2862354363293251325 0.046627175596695949467 -0.063282899131552772243 4.8034527274214910975 -0.50596886704437316062 6.2734649220811400383 0.19038338067829796429 -0.067323630087444699677 1.1523163426525069308 -0.037172353990556301906 0.069275821403711468349 -0.2852236437253706236 1.3139420237946155545];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.869252664368073;
y1_step1.xoffset = -0.725601;

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end
