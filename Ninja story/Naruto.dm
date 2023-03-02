world
	New()
		..()
//		spawn() AutoReboot()
		spawn(100) Geninexam()
		spawn(5000) world.Repop()
world
	hub = "Ozz34.NarutoANinjaStory"
	name = "Naruto: Great Beginning"
	status = "Looking for 24/7 host"
	view = 10
	mob = /mob/newplayer
	hub_password = "owner"
	loop_checks=0
mob
	newplayer
obj
	Log
		icon = 'Landscapes.dmi'
		icon_state = "tree stump"
		density = 1
		New()
			var/type = rand(1,3)
			if(type == 1)
				src.tai = 1
				src.nin = 0
				src.gen = 0
				src.name = "Taijutsu Log"
			if(type == 2)
				src.tai = 0
				src.nin = 1
				src.gen = 0
				src.name = "Ninjutsu Log"
				src.icon_state = "nin stump"
			if(type == 3)
				src.tai = 0
				src.nin = 0
				src.gen = 1
				src.name = "Genjutsu Log"
				src.icon_state = "gen stump"
			..()
		verb
			Punch()
				set name = "Log Train"
				set category = "Taijutsu"
				set src in oview(1)
				if (usr.resting)
					usr<<"Cant train when your resting"
					return
				if (usr.meditating)
					usr<<"Cant train when your meditating"
					return
				if(usr.health<5)
					usr<<"Cant train too tired - Rest."
					return
				if(!usr.doing&&usr.health >= 1)
					if(usr && src.tai && !src.nin && !src.gen)
						usr.taiexp += rand(10,15)
						usr<<"You kick the log."
						flick("Attack",usr)
						usr.taiup()
						usr.makeJounin()
						usr.makeHunter()
						usr.makeMissing()
						usr.exp += rand(10,15)
						usr.Levelup()
						usr.health -= rand(1,5)
						usr.doing = 1
						usr.Skills()
						usr.makeJounin()
						usr.makeHunter()
						usr.makeMissing()
						sleep(3)
						if(usr)
							usr.doing = 0
						else
							return
					if(usr && src.nin && !src.tai && !src.gen)
						usr.ninexp += rand(10,15)
						usr<<"You karawimi the log."
						src.icon_state = "smoke2"
						spawn(5)
							src.icon_state = "nin stump"
						usr.ninup()
						usr.makeJounin()
						usr.makeHunter()
						usr.makeMissing()
						usr.exp += rand(10,15)
						usr.Levelup()
						usr.chakra -= rand(1,5)
						usr.health -= rand(1,5)
						usr.doing = 1
						usr.Skills()
						usr.makeJounin()
						usr.makeHunter()
						usr.makeMissing()
						sleep(3)
						if(usr)
							usr.doing = 0
						else
							return
					if(usr && !src.tai && !src.nin && src.gen)
						usr.genexp += rand(10,15)
						usr<<"You kick the log."
						flick("Attack",usr)
						usr.taiup()
						usr.makeJounin()
						usr.makeHunter()
						usr.makeMissing()
						usr.exp += rand(10,15)
						usr.Levelup()
						usr.health -= rand(1,5)
						usr.doing = 1
						usr.Skills()
						usr.makeJounin()
						usr.makeHunter()
						usr.makeMissing()
						sleep(3)
						if(usr)
							usr.doing = 0
						else
							return


mob
	Move()
		if(src.Moveing || src.Frozen )
			return
		else
			src.Moveing = 1
			..()
			if(src.onwater)
				src.WATER()
			sleep(src.Move_Delay)
			src.Moveing = 0
			if(!src.Mountain)
				if(src.Weights)
					src.taiexp += rand(1,5)
					src.taiup()
mob/var/Kyuubiget=0

mob
	var{L2=0;L3=0;L4=0;L5=0;L6=0;L7=0;L8=0;L9=0;L10=0;L11=0;L12=0;L13=0;L14=0;L15=0;L16=0;L17=0;L18=0;L19=0;L20=0;L21=0;L22=0;L23=0;L24=0;L25=0;L26=0;L27=0;L28=0;L29=0;L30=0;L31=0;L32=0;L33=0;L34=0;L35=0;L36=0;L37=0;L38=0;L39=0;L40=0;L41=0;L42=0;L43=0;L44=0;L45=0;L46=0;L47=0;L48=0;L49=0;L50=0;L51=0;L52=0;L53=0;L54=0;L55=0;L56=0;L57=0;L58=0;L59=0;L60=0;L61=0;L62=0;L63=0;L64=0;L65=0;L66=0;L67=0;L68=0;L69=0;L70=0;L71=0;L72=0;L73=0}
	proc
		Skills()
			src.SE()
			src.HK()
			src.SH()
			src.GA()
			src.SY()
			src.KG()
			src.SD()
			src.NS()
			src.KG()
			src.KH()
			src.KK()
			src.KR()
			src.JU()
			src.SO()
			src.GAR()
			src.Bya()
			src.LOT()
			src.SEN()
			src.REP()
			src.OMO()
			src.URA()
			src.SHUS()
			src.MEI()
			src.SBONE()
			src.WBONE()
			src.YANAG()
			src.TSUBA()
			src.KARAMA()
			src.TESSEN()
			src.BULLETS()
			src.KEKKAI()
			src.SUNASHR()
			src.SUNASHU()
			src.SPHERE()
			src.SUNABUN()
			src.BAIKA()
			src.HARISEN()
			src.DANGO()
			src.HEKI()
			src.DORYDAN()
			src.HEAL()
			src.SCALPEL()
			src.RAIK()
			src.RAIR()
			src.FUU1()
			src.FUU2()
			src.FUU3()
			src.SUIKO()
			src.KIBA()
			src.SOUND1()
			src.SOUND2()
			src.SOUND3()
			src.CHI()
			src.RAS()
			src.SENSAT()
			src.KIRI()
			src.KONCHUU()
			src.KONCHEX()
			src.NARA1()
			src.NARA2()
			src.SAWA()
			src.KYUU()
			src.GATSUUGA()
			src.MAKYOU()
			src.SOUSOU()
			src.BABUN()
			src.MANGE()
			src.GENURIKI()
			src.TAMEDOG()
			src.KAGESHURIKEN()
			src.KYUUBIGET()
		SE()
			if(!src.L2)
				if(src.Mtai >=50)
					src << "<B><font color = brown>You learned Sennen Goroshi!"
					src.verbs += new /mob/pain/verb/SennenGoroshi()
					src.L2 = 1
			else ..()
		SH()
			if(!src.L3)
				if(src.Clan=="Uchiha"&&src.Mnin >=200&&src.Mgen >= 100)
					src << "<B><font color = brown>Your sharingan has activated!!";src.verbs += new /mob/uchiha/verb/Sharingan()
					src.L3 = 1
			else ..()
		HK()
			if(!src.L4)
				if(src.Clan=="Hyuuga"&&src.Mnin >=400)
					src << "<B><font color = brown>You learned Hakkeshou Kaiten!!";src.verbs += new /mob/Hyuuga/verb/HakkeshouKaiten()
					src.L4 = 1
			else ..()
		SY()
			if(!src.L5)
				if(src.Mnin >=250&&src.Village == "Mist"||src.Mnin >=250&&src.Village == "Rain"||src.Mnin >=250&&src.Village == "Waterfall")
					src << "<B><font color = brown>You learned Suiton Suiryuudan no Jutsu!!";src.verbs += new /mob/Suiton/verb/SuitonSuiryuudannoJutsu()
					src.L5 = 1
			else ..()
		NS()
			if(!src.L6)
				if(src.Clan=="Akimichi"&&src.Mtai >=100)
					src << "<B><font color = brown>You learned Nikudan Sensha!!";src.verbs += new /mob/Akimichi/verb/NikudanSensha()
					src.L6 = 1
			else ..()
		SD()
			if(!src.L7)
				if(src.Mnin >=300&&src.Village == "Mist"||src.Mnin >=300&&src.Village == "Rain"||src.Mnin >=300&&src.Village == "Waterfall")
					src << "<B><font color = brown>You learned Suiton Daibakufu no Jutsu!!";src.verbs += new /mob/Suiton/verb/SuitonDaibakufunoJutsu()
					src.L7 = 1
			else ..()
		KG()
			if(!src.L8)
				if(src.Clan=="Uchiha"&&src.Mnin >=100)
					src << "<B><font color = brown>You learned Katon Goukakyuu!!";src.verbs += new /mob/katon/verb/KatonGoukakyuu()
					src.L8 = 1
				if(src.Mnin >=150&&src.Village == "Leaf")
					src << "<B><font color = brown>You learned Katon Goukakyuu!!";src.verbs += new /mob/katon/verb/KatonGoukakyuu()
					src.L8 = 1
				if(src.Mnin >=150&&src.Village == "Grass")
					src << "<B><font color = brown>You learned Katon Goukakyuu!!";src.verbs += new /mob/katon/verb/KatonGoukakyuu()
					src.L8 = 1
				else ..()
			else ..()
		KH()
			if(!src.L9)
				if(src.Clan=="Uchiha"&&src.Mnin >=150)
					src << "<B><font color = brown>You learned Katon Housenka no jutsu!!";src.verbs += new /mob/katon/verb/KatonHousenka()
					src.L9 = 1
				if(src.Mnin >=200&&src.Village == "Leaf")
					src << "<B><font color = brown>You learned Katon Housenka no jutsu!!";src.verbs += new /mob/katon/verb/KatonHousenka()
					src.L9 = 1
				if(src.Mnin >=200&&src.Village == "Grass")
					src << "<B><font color = brown>You learned Katon Housenka no jutsu!!";src.verbs += new /mob/katon/verb/KatonHousenka()
					src.L9 = 1
				else ..()
			else ..()
		KK()
			if(!src.L10)
				if(src.Clan=="Uchiha"&&src.Mnin >=350)
					src << "<B><font color = brown>You learned Katon Karyuu Endan!!";src.verbs += new /mob/katon/verb/KatonKaryuuEndan()
					src.L10 = 1
				if(src.Mnin >=390&&src.Village == "Leaf")
					usr << "<B><font color = brown>You learned Katon Karyuu Endan!!";src.verbs += new /mob/katon/verb/KatonKaryuuEndan()
					src.L10 = 1
				if(src.Mnin >=390&&src.Village == "Grass")
					src << "<B><font color = brown>You learned Katon Karyuu Endan!!";src.verbs += new /mob/katon/verb/KatonKaryuuEndan()
					src.L10 = 1
				else ..()
			else ..()
		KR()
			if(!src.L11)
				if(src.Clan=="Uchiha"&&src.Mnin >=129)
					src << "<B><font color = brown>You have acquired Katon Ryuuka no Jutsu!!";src.verbs += new /mob/Katon/verb/KatonRyuukanoJutsu()
					src.L11 = 1
				else ..()
			else ..()
		GA()
			if(!src.L12)
				if(src.Clan=="Inuzuka"&&src.Mtai >=100)
					src << "<B><font color = brown>You learned Tsuuga!!";src.verbs += new /mob/Inuzuka/verb/Gatsuuga()
					src.L12 = 1
			else ..()
		JU()
			if(!src.L13)
				if(src.Clan=="Inuzuka"&&src.Mnin >=25)
					src << "<B><font color = brown>You learned Juujin Bunshin!!";src.verbs += new /mob/Inuzuka/verb/JuujinBunshin()
					src.L13 = 1
			else ..()
		SO()
			if(!src.L14)
				if(src.Clan=="Inuzuka"&&src.Mtai >=300&&src.Mnin >= 300)
					src << "<B><font color = brown>You learned Soutourou!!";src.verbs += new /mob/Inuzuka/verb/Soutourou()
					src.L14 = 1
			else ..()
		GAR()
			if(!src.L15)
				if(src.Clan=="Inuzuka"&&src.Mtai >=150&&src.Mnin >= 100)
					src << "<B><font color = brown>You learned Garouga!!";src.verbs += new /mob/Inuzuka/verb/Garouga()
					src.L15 = 1
			else ..()
		Bya()
			if(!src.L16)
				if(src.Clan=="Hyuuga"&&src.Mtai >=250&&src.Mnin >= 250)
					src << "<B><font color = brown>Your byakugan has activated!!";src.verbs += new /mob/hyuuga/verb/Byakugan()
					src.L16 = 1
			else ..()
		LOT()
			if(!src.L17)
				if(src.Clan=="Lee"&&src.Mtai >=200&&src.maxhealth >= 3000)
					src << "<B><font color = brown>You learned lotus!!";src.verbs += new /mob/Lee/verb/Lotus()
					src.L17 = 1
			else ..()
		REP()
			if(!src.L18)
				if(src.Clan=="Lee"&&src.Mtai >=50)
					src << "<B><font color = brown>You learned Konoha Renpuu!!";src.verbs += new /mob/Lee/verb/KonohaReppu()
					src.L18 = 1
			else ..()
		SEN()
			if(!src.L19)
				if(src.Clan=="Lee"&&src.Mtai >=100)
					src << "<B><font color = brown>You learned Konoha Senpuu!!";src.verbs += new /mob/Lee/verb/KonohaSenpuu()
					src.L19 = 1
			else ..()
		OMO()
			if(!src.L20)
				if(src.Clan=="Lee"&&usr.Mtai >=300)
					src << "<B><font color = brown>You learned Omote Renge!!";src.verbs += new /mob/Lee/verb/OmoteRenge()
					src.L20 = 1
			else ..()
		URA()
			if(!src.L21)
				if(src.Clan=="Lee"&&src.Mtai >=400)
					src << "<B><font color = brown>You learned Ura Renge!!";src.verbs += new /mob/Lee/verb/UraRenge()
					src.L21 = 1
			else ..()
		SHUS()
			if(!src.L22)
				if(src.KawaN >= 100&&src.Mnin >=200)
					src << "<B><font color = brown>You learned Shushin No Jutsu!!";src.verbs += new /mob/jutsu/verb/ShushinNoJutsu()
					src.L22 = 1
			else ..()
		MEI()
			if(!src.L23)
				if(src.hengeN >= 100&&src.Mgen >=200)
					src << "<B><font color = brown>You learned Mei Mei No Jutsu!!";src.verbs += new /mob/jutsu/verb/MieMie()
					src.L23 = 1
			else ..()
		SBONE()
			if(!src.L24)
				if(src.Clan=="Kaguya"&&src.Mtai >=60)
					src << "<B><font color = brown>You learned how to develop a sword out of your arm bone!";usr.verbs += new /mob/kaguyajutsu/verb/CreateBoneSword()
					src.L24 = 1
			else ..()
		WBONE()
			if(!src.L25)
				if(src.Clan=="Kaguya"&&src.Mtai >=90)
					src << "<B><font color = brown>You learned how to develop a whip out of your spinal column!";src.verbs += new /mob/kaguyajutsu/verb/CreateSpineWhip()
					src.L25 = 1
			else ..()
		YANAG()
			if(!src.L26)
				if(src.Clan=="Kaguya"&&src.Mtai >=60)
					src << "<B><font color = brown>You learned Yanagi No Mai!";src.verbs += new /mob/kaguyajutsu/verb/YanagiNoMai()
					src.L26 = 1
			else ..()
		TSUBA()
			if(!src.L27)
				if(src.Clan=="Kaguya"&&src.Mtai >=150)
					src << "<B><font color = brown>You learned Tsubaki No Mai!";src.verbs += new /mob/kaguyajutsu/verb/TsubakiNoMai()
					src.L27 = 1
			else ..()
		KARAMA()
			if(!src.L28)
				if(src.Clan=="Kaguya"&&src.Mtai >=300)
					src << "<B><font color = brown>You learned Karamatsu No Mai!";src.verbs += new /mob/kaguyajutsu/verb/KaramatsuNoMai()
					src.L28 = 1
			else ..()
		TESSEN()
			if(!src.L29)
				if(src.Clan=="Kaguya"&&src.Mtai >=500)
					src << "<B><font color = brown>You learned Tessenka No Mai!";src.verbs += new /mob/kaguyajutsu/verb/TessenkaNoMai()
					src.L29 = 1
			else ..()
		BULLETS()
			if(!src.L30)
				if(src.Clan=="Kaguya"&&src.Mtai >=180&&src.Mnin>=100)
					src << "<B><font color = brown>You learned Teshi Sendan!";src.verbs += new /mob/kaguyajutsu/verb/TeshiSendan()
					src.L30 = 1
			else ..()
		KEKKAI()
			if(!src.L31)
				if(src.Clan=="Aburame"&&src.Mnin >=100)
					src << "<B><font color = brown>You learned Kekkai Konchuu Bunshin No Jutsu!";src.verbs += new /obj/bunshins/KekkaiKonchuuBunshinnoJutsu/verb/KekkaiKonchuuBunshinnoJutsu()
					src.L31 = 1
			else ..()
		SUNASHR()
			if(!src.L32)
				if(src.Clan=="Gaara"&&src.Mnin >=60)
					src << "<B><font color = blue>You learned Suna Shuriken No Jutsu!";src.verbs += new /mob/gaara/verb/SunaShuriken()
					src.L32 = 1
			else ..()
		SUNASHU()
			if(!src.L33)
				if(src.Clan=="Gaara"&&src.Mnin >=100&&src.KawaN >= 30)
					src << "<B><font color = brown>You learned Suna Shushin No Jutsu!!";src.verbs += new /mob/gaara/verb/SunaShushinNoJutsu()
					src.L33 = 1
			else ..()
		SPHERE()
			if(!src.L34)
				if(src.Clan=="Gaara"&&src.Mnin >=300)
					src << "<B><font color = brown>You learned Sand Sphere!";src.verbs += new /mob/gaara/verb/SandSphere()
					src.L34 = 1
			else ..()
		SUNABUN()
			if(!src.L35)
				if(src.Clan=="Gaara"&&src.Mnin >=200)
					src << "<B><font color = brown>You learned Suna Bunshin No Jutsu!";src.verbs += new /obj/bunshins/SunaBunshinnojutsu/verb/SunaBunshinNoJutsu()
					src.L35 = 1
			else ..()
		BAIKA()
			if(!src.L36)
				if(src.Clan=="Akimichi"&&src.Mnin >=60)
					src << "<B><font color = brown>You learned Baika No Jutsu!";src.verbs += new /mob/Akimichi/verb/BaikaNoJutsu()
					src.L36 = 1
			else ..()
		HARISEN()
			if(!src.L37)
				if(src.Clan=="Akimichi"&&src.Mtai >=300)
					src << "<B><font color = brown>You learned Nikudan Hari Sensha!";src.verbs += new /mob/Akimichi/verb/NikudanHariSensha()
					src.L37 = 1
			else ..()
		DANGO()
			if(!src.L38)
				if(src.Mtai >=160&&src.Village == "Earth")
					src << "<B><font color = brown>You have acquired Doton Doryo Dango!!";src.verbs += new /mob/doton/verb/DotonDoryoDango()
					src.L38 = 1
				else ..()
			else ..()
		HEKI()
			if(!src.L39)
				if(src.Mtai >=350&&src.Village == "Earth")
					src << "<B><font color = brown>You have acquired Doton Doryuuheki!!";src.verbs += new /mob/doton/verb/DotonDoryuuheki()
					src.L39 = 1
				else ..()
			else ..()
		DORYDAN()
			if(!src.L40)
				if(src.maxhealth >= 4000&&src.Mnin >=500&&src.Village == "Earth")
					src << "<B><font color = brown>You have acquired Doton Doryuudan!!";src.verbs += new /mob/doton/verb/DotonDoryuudan()
					src.L40 = 1
				else ..()
			else ..()
		HEAL()
			if(!src.L41)
				if(src.Medical&&src.Mnin >=200)
					src << "<B><font color = brown>You have acquired Shousen Jutsu!!";src.verbs += new /mob/medical/verb/Shousen_Jutsu()
					src.L41 = 1
				else ..()
			else ..()
		SCALPEL()
			if(!src.L42)
				if(src.Medical&&src.Mnin >=300&&src.Mtai >= 250)
					src << "<B><font color = brown>You have acquired Chakra No Mesu!!";src.verbs += new /mob/medical/verb/ChakraNoMesu()
					src.L42 = 1
				else ..()
			else ..()
		RAIK()
			if(!src.L43)
				if(src.Mnin >=120&&src.Village == "Cloud")
					src << "<B><font color = brown>You have acquired Raikyuu No Jutsu!!";src.verbs += new /mob/rai/verb/Raikyuu()
					src.L43 = 1
				else ..()
			else ..()
		RAIR()
			if(!src.L44)
				if(src.Mnin >=200&&src.Village == "Cloud")
					src << "<B><font color = brown>You have acquired Rairyuu No Tatsumaki!!";src.verbs += new /mob/rai/verb/RairyuuNoTatsumaki()
					src.L44 = 1
				else ..()
			else ..()
		FUU1()
			if(!src.L45)
				if(src.Mnin >=100&&src.Village == "Sand")
					src << "<B><font color = brown>You have acquired Fuuton: Kaze Dangan No Jutsu!!";src.verbs += new /mob/fuuton/verb/FuutonKazeDangan()
					src.L45 = 1
				else ..()
			else ..()
		FUU2()
			if(!src.L46)
				if(src.Mnin >=200&&src.Village == "Sand")
					src << "<B><font color = brown>You have acquired Fuuton: Renkuudan No Jutsu!!";src.verbs += new /mob/fuuton/verb/FuutonRenkuudan()
					src.L46 = 1
				else ..()
			else ..()
		FUU3()
			if(!src.L47)
				if(src.Mnin >=350&&src.Village == "Sand")
					src << "<B><font color = brown>You have acquired Fuuton: Daitoppa No Jutsu!!";src.verbs += new /mob/fuuton/verb/Fuuton_Daitoppa()
					src.L47 = 1
				else ..()
			else ..()
		SUIKO()
			if(!src.L48)
				if(src.Mnin >=300&&src.Village == "Mist"||src.Mnin >=300&&src.Village == "Rain"||src.Mnin >=300&&src.Village == "Waterfall")
					src << "<B><font color = brown>You learned Suiton Suikoudan no Jutsu!!";src.verbs += new /mob/Suiton/verb/SuitonSuikoudannoJutsu()
					src.L48 = 1
			else ..()
		KIBA()
			if(!src.L49)
				if(src.Mnin >=300&&src.Village == "Cloud")
					src << "<B><font color = brown>You learned Ikazuchi No Kiba!!";src.verbs += new /mob/rai/verb/Ikazuchi_No_Kiba()
					src.L49 = 1
			else ..()
		SOUND1()
			if(!src.L50)
				if(src.Mnin >=50&&src.Village == "Sound")
					src << "<B><font color = brown>You learned Zankuuha!!";src.verbs += new /mob/sound/verb/Zankuuha()
					src.L50 = 1
			else ..()
		SOUND2()
			if(!src.L51)
				if(src.Mnin >=100&&src.Village == "Sound")
					src << "<B><font color = brown>You learned Zankyokukuuha!!";src.verbs += new /mob/sound/verb/Zankyokukuuha()
					src.L51 = 1
			else ..()
		SOUND3()
			if(!src.L52)
				if(src.Mnin >=200&&src.Village == "Sound")
					src << "<B><font color = brown>You learned Kyoumeisen!!";src.verbs += new /mob/sound/verb/Kyoumeisen()
					src.L52 = 1
			else ..()
		CHI()
			if(!src.L54)
				if(src.Clan=="Uchiha"&&src.Mnin >=1000&&src.Mtai>=1000)
					src << "<B><font color = brown>You have learned Chidori!";src.verbs += new /mob/jutsu/verb/Chidori()
					src.L54 = 1
		RAS()
			if(!src.L55)
				if(src.Uzumaki&&src.Mnin >=1000&&src.Mtai>=1000)
					src<<"<b><font color=brown> You have learned Rasengan!";src.verbs += new /mob/jutsu/verb/Rasengan()
					src.L55=1

		SENSAT()
			if(!src.L56)
				if(src.Clan=="Haku"&&src.Mnin >=50&&src.Mtai>=40)
					src << "<B><font color = brown>You have learned Sensatsu Suishou!";src.verbs += new /mob/haku/verb/SensatsuSuishou()
					src.L56 = 1
		KIRI()
			if(!src.L57)
				if(src.Clan=="Haku"&&src.Mnin >=100)
					src<<"<b><font color=brown> You have learned Kirigakure!";src.verbs += new /mob/mist/verb/KirigakurenoJutsu()
					src.L57=1
		KONCHUU()
			if(!src.L58)
				if(src.Clan=="Aburame"&&src.Mnin >=30)
					src << "<B><font color = brown>You learned your Konchuu options!"
					src.verbs += new /mob/aburame/verb/summonkonchuu()
					src.verbs += new /mob/aburame/verb/Placekonchuu()
					src.verbs += new /mob/aburame/verb/DestroyKonchuu()
					src.L58 = 1
			else ..()
		KONCHEX()
			if(!src.L59)
				if(src.Clan=="Aburame"&&src.Mnin >=200&&src.Mgen>=200)
					src << "<B><font color = brown>You learned how to explode your Konchuu!";src.verbs += new /mob/aburame/verb/ExplodeKonchuu()
					src.L59 = 1
			else ..()
		NARA1()
			if(!src.L60)
				if(src.Clan=="Nara"&&src.Mgen >=100)
					src << "<B><font color = brown>You learned Kage Shibari No Jutsu!"
					src.verbs += new /mob/nara/verb/kageshibari()
					src.verbs += new /mob/nara/verb/ExtendShadow()
					src.verbs += new /mob/nara/verb/RetractShadow()
					src.L60 = 1
			else ..()
		NARA2()
			if(!src.L61)
				if(src.Clan=="Nara"&&src.Mgen >=350&&src.Mnin>=400)
					src << "<B><font color = brown>You learned Kage Kubi Shibaru!"
					src.verbs += new /mob/nara/verb/KageKubiShibaru()
					src.L61 = 1
			else ..()
		SAWA()
			if(!src.L62)
				if(src.Clan=="Kaguya"&&src.Mtai >=700&&src.Mchakra>=100&&src.rank=="Jounin")
					src << "<B><font color = brown>You learned Sawarabi No Mai!";src.verbs += new /mob/kaguyajutsu/verb/Sawarabi()
					src.L62 = 1
			else ..()
		KYUU()
			if(!src.L63)
				if(src.Clan=="Gaara"&&src.Mtai >=500&&src.Mchakra>=10000)
					src << "<B><font color = brown>You learned Sabaku Kyuu!";src.verbs += new /mob/gaara/verb/SabakuKyuu()
					src.L63 = 1
			else ..()
		GATSUUGA()
			if(!src.L64)
				if(src.Clan=="Inuzuka"&&src.Mtai >=300)
					src << "<B><font color = brown>You learned Gatsuuga!";src.verbs += new /mob/Inuzuka/verb/Gatsuuga1()
					src.L64 = 1
			else ..()
		MAKYOU()
			if(!src.L65)
				if(src.Clan=="Haku"&&src.Mtai >=700)
					src << "<B><font color = brown>You learned Makyou Hyoushou!";src.verbs += new /mob/haku/verb/MakyouHyoushou()
					src.L65 = 1
			else ..()
		SOUSOU()
			if(!src.L66)
				if(src.Clan=="Gaara"&&src.Mnin >=500&&src.Mchakra>=11000)
					src << "<B><font color = brown>You learned Sabaku Kyuu!";src.verbs += new /mob/gaara/verb/SabakuSousou()
					src.L66 = 1
			else ..()
		BABUN()
			if(!src.L67)
				if(src.Clan=="Akimichi"&&src.Mnin >=550&&src.calories>=500&&src.Mtai>=390)
					src << "<B><font color = brown>You learned Babun Baika No Jutsu!";src.verbs += new /mob/Akimichi/verb/BabunBaikaNoJutsu()
					src.L67 = 1
			else ..()
		MANGE()
			if(!src.L68)
				if(src.Clan=="Uchiha"&&src.Mnin >=1000&&src.Mgen>=700&&src.kills>=150&&src.Suses>=100)
					src << "<B><font color = brown>You learned Mangekyou Sharingan!";src.verbs += new /mob/uchiha/verb/MangekyouPrep()
					src.L68 = 1
			else ..()
		GENURIKI()
			if(!src.L69)
				if(src.Clan=="Lee"&&src.Mtai>=700)
					src << "<B><font color = brown>You learned Konoha Genkuriki Senpuu!";src.verbs += new /mob/Lee/verb/KonohaGenkurikiSenpuu()
					src.L69 = 1
			else ..()
		TAMEDOG()
			if(!src.L70)
				if(src.Mtai >=50&&src.Clan=="Inuzuka")
					src << "<B><font color = brown>You learned how to Tame Dogs!"
					src.verbs += new /mob/inuzuka/verb/Tame()
					src.L70 = 1
			else ..()
		KAGESHURIKEN()
			if(!src.L71)
				if(src.Mtai>=50&&src.Mnin>=50&&src.shurikenskill>=10)
					src << "<B><font color = brown>You learned Kage Shuriken No Jutsu!"
					src.verbs += new /mob/shurikenmove/verb/KageShuriken()
					src.L71 = 1
			else ..()
		KYUUBIGET()
			if(!src.L72)
				if(src.Mtai>=500000&&src.Mnin>=400000&&src.Mgen>=500000&&src.Kyuubi())
					src.Kyuubiget=1
					src.L72 = 1
			else ..()
mob/var/list
	V
mob
	proc
		AutoSave()
			if(src.cansave)
				src.SaveK()
				spawn(3000)
					src.AutoSave()

mob
	proc
		SaveK()
			if(src.cansave)
				var/savefile/F = new("players/[src.key].sav")
				src.V = src.verbs
				src.xco = src.x
				src.yco = src.y
				src.zco = src.z
				Write(F)
				src << "<font color=red><b>Your game has been saved!"


mob
	verb
		Savenow()
			set name ="Save"
			if(usr.cansave)
				var/savefile/F = new("players/[usr.key].sav")
				usr.V = usr.verbs
				usr.xco = usr.x
				usr.yco = usr.y
				usr.zco = usr.z
				Write(F)
				spawn(10) usr << "<font color=red><b>Your game has been saved!"
mob
	proc
		LoadPlayer()
			if(fexists("players/[src.key].sav"))
				var/savefile/F = new("players/[src.key].sav")
				Read(F)
				for(var/stuff in src.V)
					src.verbs += stuff
				world<<"<font size=1><font color=red><B>Info: <font color=white>[src]([src.key]) has logged in..."
				src.loc = locate(xco,yco,zco)
				client.view = src.view
				src.OOC = 1
				src.cansave=1
				src.Frozen = 0
				src.client.view=10
				src.AutoSave()
				src.logincrap()
mob
	verb
		GlideSize()
			set name="Set Glide"
			set category = "Glide"
			var/gliide = 6.5
			usr.glide_size = gliide
mob
	proc
		logincrap()
			if(src.hasdog)
				for(var/mob/pet/P in src.contents)
					if(P)
						P.owner=src
						if(P.owner==src)
							P.owned=1
							P.name=src.dogname
							P.tai=src.dogtai
							P.maxhealth=src.dogmaxhealth
							P.health=P.maxhealth
							P.named=1
			for(var/obj/shibari/K in world)
				if(K.owner==src)
					del(K)
			for(var/obj/shibaritrail/T in world)
				if(T.owner==src)
					del(T)
			if(src.tai>src.Mtai)
				src.tai = src.Mtai
			if(src.nin>src.Mnin)
				src.nin = src.Mnin
			if(src.gen>src.Mgen)
				src.gen = src.Mgen
			if(src.ChakraC>=100)
				src.ChakraC=100
			return
mob/var/tmp
	controling=0


client
	North()
		if(usr.controling)
			for(var/mob/puppet/P in view(25))
				if(!P.Frozen)
					step(P,NORTH)
					return
		if(!usr.Moveing)
			if(!usr.Frozen)
				if(usr.Mountain&&!usr.Weights)
					step(usr,NORTH)
				if(usr.screwed&&!usr.drunk)
					usr.random = rand(1,3)
					if(usr.random == 1)
						step(usr,EAST)
					if(usr.random == 2)
						step(usr,NORTHEAST)
					if(usr.random == 3)
						step(usr,SOUTHWEST)
				if(usr.drunk&&!usr.screwed)
					usr.random = rand(1,4)
					if(usr.random == 1)
						step(usr,NORTH)
					if(usr.random == 2)
						step(usr,NORTH)
					if(usr.random == 4)
						step(usr,NORTH)
					if(usr.random == 3)
						step(usr,NORTHWEST)
				else
					step(usr,NORTH)
			else
				..()
				return
		else
			return 0

	South()
		if(usr.controling)
			for(var/mob/puppet/P in view(25))
				if(!P.Frozen)
					step(P,SOUTH)
					return
		if(!usr.Moveing)
			if(!usr.Frozen)
				if(usr.Mountain&&!usr.Weights)
					step(usr,SOUTH)
				if(usr.screwed&&!usr.drunk)
					usr.random = rand(1,3)
					if(usr.random == 1)
						step(usr,WEST)
					if(usr.random == 2)
						step(usr,SOUTHEAST)
					if(usr.random == 3)
						step(usr,NORTHWEST)
				if(usr.drunk&&!usr.screwed)
					usr.random = rand(1,4)
					if(usr.random == 1)
						step(usr,SOUTH)
					if(usr.random == 2)
						step(usr,SOUTH)
					if(usr.random == 4)
						step(usr,SOUTH)
					if(usr.random == 3)
						step(usr,SOUTHEAST)
				else
					step(usr,SOUTH)
			else
				..()
				return
		else
			return 0
	East()
		if(usr.controling)
			for(var/mob/puppet/P in view(25))
				if(!P.Frozen)
					step(P,EAST)
					return
		if(!usr.Moveing)
			if(!usr.Frozen)
				if(usr.Mountain)
					return
				if(usr.screwed&&!usr.drunk)
					usr.random = rand(1,3)
					if(usr.random == 1)
						step(usr,WEST)
					if(usr.random == 2)
						step(usr,NORTHEAST)
					if(usr.random == 3)
						step(usr,SOUTHWEST)
				if(usr.drunk&&!usr.screwed)
					usr.random = rand(1,4)
					if(usr.random == 1)
						step(usr,EAST)
					if(usr.random == 2)
						step(usr,EAST)
					if(usr.random == 4)
						step(usr,EAST)
					if(usr.random == 3)
						step(usr,NORTHEAST)
				else
					step(usr,EAST)
			else
				..()
				return
		else
			return 0
	West()
		if(usr.controling)
			for(var/mob/puppet/P in view(25))
				if(!P.Frozen)
					step(P,WEST)
					return
		if(!usr.Moveing)
			if(!usr.Frozen)
				if(usr.Mountain&&!usr.Weights)
					return
				if(usr.screwed&&!usr.drunk)
					usr.random = rand(1,3)
					if(usr.random == 1)
						step(usr,NORTH)
					if(usr.random == 2)
						step(usr,SOUTHEAST)
					if(usr.random == 3)
						step(usr,NORTHEAST)
				if(usr.drunk&&!usr.screwed)
					usr.random = rand(1,4)
					if(usr.random == 1)
						step(usr,WEST)
					if(usr.random == 2)
						step(usr,WEST)
					if(usr.random == 4)
						step(usr,WEST)
					if(usr.random == 3)
						step(usr,SOUTHWEST)
				else
					step(usr,WEST)
			else
				..()
				return
		else
			return 0
	Northeast()
		if(usr.controling)
			for(var/mob/puppet/P in view(25))
				if(!P.Frozen)
					step(P,NORTHEAST)
					return
		if(!usr.Moveing)
			if(!usr.Frozen)
				if(usr.Mountain)
					return
				if(usr.screwed&&!usr.drunk)
					usr.random = rand(1,3)
					if(usr.random == 1)
						step(usr,EAST)
					if(usr.random == 2)
						step(usr,NORTH)
					if(usr.random == 3)
						step(usr,SOUTH)
				if(usr.drunk&&!usr.screwed)
					usr.random = rand(1,4)
					if(usr.random == 1)
						step(usr,NORTHEAST)
					if(usr.random == 2)
						step(usr,NORTHEAST)
					if(usr.random == 3)
						step(usr,NORTH)
					if(usr.random == 4)
						step(usr,NORTHEAST)
				else
					step(usr,NORTHEAST)
			else
				..()
				return
		else
			return 0
	Northwest()
		if(usr.controling)
			for(var/mob/puppet/P in view(25))
				if(!P.Frozen)
					step(P,NORTHWEST)
					return
		if(!usr.Moveing)
			if(!usr.Frozen)
				if(usr.Mountain)
					return
				if(usr.screwed&&!usr.drunk)
					usr.random = rand(1,3)
					if(usr.random == 1)
						step(usr,EAST)
					if(usr.random == 2)
						step(usr,WEST)
					if(usr.random == 3)
						step(usr,NORTH)
				if(usr.drunk&&!usr.screwed)
					usr.random = rand(1,4)
					if(usr.random == 1)
						step(usr,NORTHWEST)
					if(usr.random == 2)
						step(usr,NORTHWEST)
					if(usr.random == 4)
						step(usr,NORTHWEST)
					if(usr.random == 3)
						step(usr,WEST)
				else
					step(usr,NORTHWEST)
			else
				..()
				return
		else
			return 0
	Southeast()
		if(usr.controling)
			for(var/mob/puppet/P in view(25))
				if(!P.Frozen)
					step(P,SOUTHEAST)
					return
		if(!usr.Moveing)
			if(!usr.Frozen)
				if(usr.Mountain)
					return
				if(usr.screwed&&!usr.drunk)
					usr.random = rand(1,3)
					if(usr.random == 1)
						step(usr,EAST)
					if(usr.random == 2)
						step(usr,NORTHEAST)
					if(usr.random == 3)
						step(usr,SOUTHWEST)
				if(usr.drunk&&!usr.screwed)
					usr.random = rand(1,4)
					if(usr.random == 1)
						step(usr,SOUTHEAST)
					if(usr.random == 2)
						step(usr,SOUTHEAST)
					if(usr.random == 4)
						step(usr,SOUTHEAST)
					if(usr.random == 3)
						step(usr,SOUTH)
				else
					step(usr,SOUTHEAST)
			else
				..()
				return
		else
			return 0
	Southwest()
		if(usr.controling)
			for(var/mob/puppet/P in view(25))
				if(!P.Frozen)
					step(P,SOUTHWEST)
					return
		if(!usr.Moveing)
			if(!usr.Frozen)
				if(usr.Mountain)
					return
				if(usr.screwed&&!usr.drunk)
					usr.random = rand(1,3)
					if(usr.random == 1)
						step(usr,EAST)
					if(usr.random == 2)
						step(usr,NORTHEAST)
					if(usr.random == 3)
						step(usr,WEST)
				if(usr.drunk&&!usr.screwed)
					usr.random = rand(1,4)
					if(usr.random == 1)
						step(usr,SOUTHWEST)
					if(usr.random == 2)
						step(usr,SOUTHWEST)
					if(usr.random == 4)
						step(usr,SOUTHWEST)
					if(usr.random == 3)
						step(usr,WEST)
				else
					step(usr,SOUTHWEST)
			else
				..()
				return
		else
			return 0
world/proc
//	AutoReboot()
//		set background=1
//		spawn(45000)
//			world << "<center><b><font size=3><font color=blue>World Auto Rebooting in 30 seconds. Save!"
//			sleep(250)
//			world << "<center><b><font size=3><font color=blue>Reboot in 5"
//			sleep(10)
//			world << "<center><b><font size=3><font color=blue>4"
//			sleep(10)
//			world << "<center><b><font size=3><font color=blue>3"
//			sleep(10)
//			world << "<center><b><font size=3><font color=blue>2"
//			sleep(10)
//			world << "<center><b><font size=3><font color=blue>1"
//			sleep(10)
//			world.Reboot()