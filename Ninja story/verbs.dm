mob
	verb
		Send_File(mob/m in view(usr),F as file)

			switch(alert(m,"[usr] is trying to send you [F].  Do you accept the file?","**File Transfer**","Yes","No"))
				if("Yes")
					alert(usr,"[m] accepted the file","**File Accepted**")
					m<<ftp(F)
				if("No")
					alert(usr,"[m] declined the file","**File Declined**")

mob/verb/whisper(mob/M in oview(),msg as text)

	set name = "Whisper"
	set desc = "Talk to someone on your screen(only the person you choose will hear you)."
	if(src.testing==1||src.muted == 1)
		src<<"Not right now!"
		return
	else
		msg=cuttext(msg)
		M<<"<font size=2>[usr] whispers-[msg]"
		usr<<"<font size=2>You whisper to [M]-[msg]"

var
	Bugs = null//The var for the logging
	Sug = null

mob
	verb
		Villagewho()

			usr<<"<font color=blue>Online [usr.Village] Village Members -"
			for(var/mob/M in world)
				if(M.Village == usr.Village){usr<<"<font color=green>[M]"}
mob/hokage
	verb
		MakeJounin(mob/M in world)
			set category = "Kage"
			if(M.Village == usr.Village)
				M<<"You have been promoted to the rank of Jounin by the kage!"
				world<<"[M] is now a jounin"
				M.rank = "Jounin"
				M.cap = Jcap
				var/obj/Jouninsuit/B = new/obj/Jouninsuit
				B.loc = M
			else
				usr<<"You can not edit some one's rank from another villages."
		MakeANBU(mob/M in world)
			set category = "Kage"
			if(M.Village == usr.Village)
				M<<"You have been promoted to the rank of ANBU by the kage!"
				world<<"[M] is now a ANBU"
				M.rank = "ANBU"
				M.cap = Acap
				M.random = rand(1,3)
				if(M:random == 1)
					var/obj/Banbu/B = new/obj/Banbu
					B.loc = usr
				if(M:random == 2)
					var/obj/Ranbu/R = new/obj/Ranbu
					R.loc = usr
				if(M:random == 3)
					var/obj/Ganbu/G = new/obj/Ganbu
					G.loc = usr
			else
				usr<<"You can not edit some one's rank from another villages."
		MakeChuunin(mob/M in world)
			set category = "Kage"
			if(M.Village == usr.Village)
				M<<"You have been promoted to the rank of chuunin by the kage!"
				world<<"[M] is now a Chuunin"
				M.rank = "Chuunin"
				M.cap = Ccap
				if(M.Village =="Leaf")
					var/obj/ChuuninVest/B = new/obj/ChuuninVest
					B.loc = M
				if(M.Village =="Sand")
					var/obj/SChuuninVest/S = new/obj/SChuuninVest
					S.loc = M
				if(M.Village =="Earth")
					var/obj/EChuuninVest/E = new/obj/EChuuninVest
					E.loc = M
				if(M.Village =="Water")
					var/obj/WChuuninVest/W = new/obj/WChuuninVest
					W.loc = M
				if(M.Village =="Cloud")
					var/obj/LChuuninVest/L = new/obj/LChuuninVest
					L.loc = M
				if(M.Village == "Grass")
					var/obj/GChuuninVest/G = new/obj/GChuuninVest
					G.loc = M
				if(M.Village == "Sound")
					var/obj/SoundChuuninVest/G = new/obj/SoundChuuninVest
					G.loc = M
			else
				usr<<"You can not edit some one's rank from another villages."
		MakeGenin(mob/M in world)
			set category = "Kage"
			if(M.Village == usr.Village)
				M<<"You have been promoted to the rank of genin by the kage!"
				world<<"[M] is now a genin"
				M.rank = "Genin"
				M.cap = Gcap
				var/obj/Headband/B = new/obj/Headband
				B.loc = usr
				var/obj/KagebunshinS/F = new/obj/KagebunshinS
				F.loc = usr
			else
				usr<<"You can not edit some one's rank from another villages."
mob/verb
	Give_Cash(mob/M in oview(5))

		var/give = input("How much Yen do you wish to give [M]?")as num
		if(M==usr)
			usr<<"You cannot do that"
			return
		if(M.client)
			if(give>usr.Yen)
				usr<<"You don't have that much to give"
				return
			if(give<=0)
				usr<<"You cannot do that."
				return
			if(usr.client.address == M.client.address)
				usr<<"Nice try, Cannot give Yen to yourself."
				M<<"Nice try, Cannot give Yen to yourself."
				return
			if(give<usr.Yen)
				usr.Yen-=give
				M.Yen+=give
				usr<<"Successful transaction"
				M<<"[usr] gives you [give] Yen"
				give=0
			M.SaveK()
			usr.SaveK()
			return
var
	inwar = 0
	war1 = 0
	war2 = 0
	enemy = ""
	alli = ""
/*mob/hokage/verb/Declare_War()//a declare war verb
	var/list/villagew=list("Sand","Leaf","Sound","Grass")
	var/war = input("Which village would you like to declare war on?")in villagew
	switch(alert(src,"Are you sure you want to declare war on [war]?",,"Yes","No"))
		if("Yes")//they did so...
			if(war == src.Village)
				src << "You can't declare war upon your own village."
				return()// send em back
			else//otherwise
				world << "<b><font size = 2><font color = red>Announcement! [src.Village] has declared war on [war]"
				enemy = "[war]"
				alli = "[src.Village]"
				inwar = 1
				usr.loc = locate(97,50,11)
				war2 += 1
				usr.inwar2 = 1
				usr<<"OK you have joined the war!"
				for(var/mob/M in world)
					if(M.Village == "[war]")
						alert(M,"Go to war against [src.Village]?",,"Yes","No")
						if("Yes")
							M.loc = locate(6,55,11)
							war1 += 1
							M.inwar1 = 1
							M<<"OK you have joined the war!"
							return()
						if("No")
							usr<<"OK"
							return()
					if(M.Village == usr.Village)
						alert(M,"Go to war against [war]?",,"Yes","No")
						if("Yes")
							M.loc = locate(97,50,11)
							war2 += 1
							M.inwar2 = 1
							M<<"OK you have joined the war!"
							return()
						if("No")
							usr<<"OK"
							return()
					warcheck()
mob
	proc
		warcheck()
			sleep(100)
			for(var/mob/M in world)
				if(war1 == 0&&war2==0)
					return
				if(war1 == 0)
					world<<"<b><font size = 2><font color = red>Announcement! [alli] has defeated [enemy]!!"
					if(M.inwar2 == 1)
						M.Yen += rand(5000,6000)
						M.inwar2 = 0
						M.loc = locate(48,47,1)
					else if(M.inwar1 == 1)
						M.inwar1 = 0
						M.loc = locate(48,47,1)
						if(M.Yen >= 2000)
							M.Yen -= rand(1000,2000)
						else
							M.Yen = 0
				if(war2 == 0)
					world<<"<b><font size = 2><font color = red>Announcement! [enemy] has defeated [alli]!!"
					if(M.inwar1 == 1)
						M.Yen += rand(5000,6000)
						M.inwar1 = 0
					else if(M.inwar2 == 1)
						M.inwar2 = 0
						M.loc = locate(48,47,1)
						if(M.Yen >= 2000)
							M.Yen -= rand(1000,2000)
						else
							M.Yen = 0
				warcheck()
				*/

proc
	cuttext(msg as text)
		if(msg)
			if(length(msg)>400)
				msg = copytext(msg,1,400) + "...."
		return msg

mob
	verb
		Waterwalk()
			set category="Jutsus"
			set name = "Water Walk"
			if(usr.waterwalk==0||usr.waterwalk==null)
				usr.waterwalk=1
				usr<<"You are now able to walk on water"
			else
				usr.waterwalk=0
				usr<<"You are now incapable of walking on water"
mob/verb/Help()

	set name ="Options"
	switch(input("What do you need?","Options",) in list("Credits","Training","Jutsus","Fix Me!","Server Information","Huds","Screen Size","Go AFK","Cancel"))
		if("Training")
			switch(input("What do you need help on?","Help",) in list("Ninjutsu","Genjutsu","Taijutsu","Cancel"))
				if("Ninjutsu")
					usr.Ninjutsu()
				if("Genjutsu")
					usr.Genjutsu()
				if("Taijutsu")
					usr.Taijutsu()
		if("Jutsus")
			usr.Techniques()
		if("Credits")
			usr.Credits()
		if("Fix Me!")
			switch(input("What do you need to be Fixed?","Help",) in list("Black Screen!","Icon is Messed!","Cancel"))
				if("Black Screen!")
					if(usr.loc==null)
						usr.loc=locate(6,29,2)
						usr<<"Fixed"
					else
						usr<< "You don't have a Black Screen"
				if("Icon is Messed!")
					usr.overlays = null
					usr.icon_state = ""
					usr.underlays = null
					switch(input("Which base icon do you want?","Help",) in list("Pale","Tan"))
						if("Pale")
							usr.icon='Base white.dmi'
						if("Tan")
							usr.icon='BaseT.dmi'
		if("Server Information")
			var/calcLag = abs(world.cpu - 100)
			usr << "<strong>Server Hosted On: [world.system_type]</strong>"
			usr << "<strong>Server Efficiency: [calcLag]%</strong>"
			usr << "<strong>Server Port: [world.port]</strong>"
		if("Huds")
			switch(input("Do you want to turn on/off the Menus in your game screen","Menus Options",) in list("ON","OFF"))
				if("ON")
					if(usr.menus==1)
						alert("Sorry it´s already on...")
						return
					usr.menus=1
					usr.menu()
				if("OFF")
					if(usr.menus==0)
						alert("Sorry it´s already off...")
						return
					usr.menus=0
					usr.menu2()
		if("Screen Size")
			alert("Your current view is [client.view]. The default view is 5.")//**NOTE**:'5' is the closest to the default view as you can get, IF you don't want to get into fractions.
			switch(input("What Screen size do you want?","Choose your screen size!",) in list("1","2","3","4","5","6","7","8","9","10","Cancel"))
				if("1")
					if(client.view == 1)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 1
						usr.view=1
				if("2")
					if(client.view == 2)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 2
						usr.view=2
				if("3")
					if(client.view == 3)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 3
						usr.view=3
				if("4")
					if(client.view == 4)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 4
						usr.view=4
				if("5")
					if(client.view == 5)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 5
						usr.view=5
				if("6")
					if(client.view == 6)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 6
						usr.view=6
				if("7")
					if(client.view == 7)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 7
						usr.view=7
				if("8")
					if(client.view == 8)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 8
						usr.view=8
				if("9")
					if(client.view == 9)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 9
						usr.view=9
				if("10")
					if(client.view == 10)
						usr << "You are on this size ([client.view]) already..."
					else
						client.view = 10
						usr.view=10
				if("Cancel")
					return()
		if("Go AFK")
			if(src.AFK)
				world << "[src] Is Back."
				src.AFK = 0
				src.overlays -= 'AFK.dmi'
			else
				world << "[src] Is Now AFK."
				src.AFK = 1
				src.overlays += 'AFK.dmi'
//--------------------------------------------------------------------------------------------------------
mob/proc/Credits()
	var/credittext = {"
		<html>
		<head>
		<title>Naruto: Way of the Shinobi</title>
		</head>
		<body bgcolor=#000000 text=#DDDDDD>
		<center><h2>Naruto:Way of the Shinobi</h2></center><hr>
		<p><strong>Owners:</strong> Axerob/Destroior<br>
		<strong>Old Owners:</strong> Sven90/Bustercannon<br>
		<p>
		<br>
		</body>
		</html>
		"}
	usr << browse(credittext)
//--------------------------------------------------------------------------------------------------------
mob/proc/Taijutsu()
	var/helptext = {"
		<html>
		<STYLE>BODY {font-family: Verdana}</STYLE>
		<head>
		<title>Training</title>
		</head>
		<body bgcolor=#f5f5f5 text=#000000>
		<center><h2>Taijutsu</h2></center><hr>
		<p><strong>Logs:</strong> Logs are scattered about, You lose Stamina per log hit and gain Taijutsu randomly, New! - Shuriken and Kunai can be thrown at logs as a Taijutsu and Ninjutsu training method, Also to increase your Shuriken Skill or Kunai skill to learn a Jutsu for that weapon.<br>
		<strong>Mountain Climbing:</strong> This is a form of Stamina and Taijutsu training.<br>
		<strong>Level Up:</strong> Trains All Stats a bit.<br>
		<p>
		<br>
		</body>
		</html>
		"}
	usr << browse(helptext)
//--------------------------------------------------------------------------------------------------------
mob/proc/Genjutsu()
	var/helptext = {"
		<html>
		<STYLE>BODY {font-family: Verdana}</STYLE>
		<head>
		<title>Training</title>
		</head>
		<body bgcolor=#f5f5f5 text=#000000>
		<center><h2>Genjutsu</h2></center><hr>
		<p><strong>Using your Genjutsu Jutsus:</strong> Easy gaining of Genjutsu would be solid use of Genjutsu Jutsus.<br>
		<strong>Level Up:</strong> Trains All Stats a bit.<br>
		<p>
		<br>
		</body>
		</html>
		"}
	usr << browse(helptext)
//--------------------------------------------------------------------------------------------------------
mob/proc/Ninjutsu()
	var/helptext = {"
		<html>
		<STYLE>BODY {font-family: Verdana}</STYLE>
		<head>
		<title>Training</title>
		</head>
		<body bgcolor=#f5f5f5 text=#000000>
		<center><h2>Ninjutsu</h2></center><hr>
		<p><strong>Using your Ninjutsu Jutsus:</strong> Easy gaining of Ninjutsu would be solid use of Ninjutsu Jutsus.  New! - Shuriken and Kunai can be thrown at logs as a Taijutsu and Ninjutsu training method, Also to increase your Shuriken Skill or Kunai skill to learn a Jutsu for that weapon.<br>
		<strong>Level Up:</strong> Trains All Stats a bit.<br>
		<p>
		<br>
		</body>
		</html>
		"}
	usr << browse(helptext)
//--------------------------------------------------------------------------------------------------------
mob/proc/Techniques()
	var/helptext = {"
		<html>
		<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
		<head>
		<BODY>
		<title>Techniques</title>
		</head>
		<body bgcolor=#000000 text=#f5f5f5>
		<center><h2>Techniques<br></h2>
		<p>(A new Jutsu is triggered by a level up if you have the required Nin, Gen, and Tai And Note: If I a Jutsu is hidden, Don't go asking for the requirement.) Clans:<br>

		<center><h2>Uchiha Info-</h2>

		Katon Goukakyuu No Jutsu - 100 Ninjutsu<br>
		Phoenix Flower Jutsu - 150 Ninjutsu<br>
		Katon Ryuuka No Jutsu - 230 Ninjutsu<br>
		Katon Karyuu Endan - 350<br>
		Sharingan - 200 Nin+Gen<br>
		Sharingan level 2 - 500 Ninjutsu<br>
		Sharingan level 3 - Hidden<br>
		Mangekyou Sharingan - Hidden<br>

		<center><h2>Hyuuga Info-<br></h2>

		Jyuuken - 200 Taijutsu, Talk to Neji in Hyuuga house.<br>
		Hakke Kuushou - 500 Taijutsu, Talk to Neji in Hyuuga house.<br>
		Hakkeshou Kaiten - 500 Ninjutsu<br>
		Byakugan - 250 Nin+Tai<br>
		Hakke Rokujuu Yonshou - Byakugan<br>
		Byakugan 2 - 500 Nin+Tai<br>
		Hakke Hyaku Nijuha Chishou - Byakugan 2<br>

		<center><h2>Haku Info-<br></h2>

		Sensatsu Suishou - 50 Nin+Tai<br>
		Kirigakure - 100 Ninjutsu<br>
		Makyou Hyoushou - Hidden<br>

		<center><h2>Akimichi Info-<br></h2>

		Baika No Jutsu - 60 Ninjutsu<br>
		Nikudan Sensha - 100 Taijutsu<br>
		Nikudan Hari Sensha - 300 Taijutsu<br>
		Bubun Baika No Jutsu - Hidden<br>

		<center><h2>Nara Info-<br></h2>

		Kage Shibari No Jutsu - 100 Genjutsu<br>
		Kage Kubi Shibaru - 350 Genjutsu, 400 Ninjutsu<br>

		<center><h2>Kaguya-<br></h2>

		Yanagi No Mai(Dance one) - 60 Taijutsu<br>
		Tsubaki No Mai(Dance two) - 150 Taijutsu<br>
		Karamatsu No Mai(Dance three) - 300 Taijutsu<br>
		Teshi Sendan - 180 Taijutsu, 100 Ninjutsu<br>
		Tessenka No Mai(Dance four) - Hidden<br>
		Sawarabi No Mai(Dance five) - Hidden<br>

		<center><h2>Aburame Info-<br></h2>

		Summon Konchuu - 30 Ninjutsu<br>
		Place Konchuu - 30 Ninjutsu<br>
		Destroy Konchuu - 30 Ninjutsu<br>
		Exploding Konchuu - 200 Nin+Gen<br>
		Kekkai Bunshin No Jutsu - Hidden<br>

		<center><h2>Inuzuka Info-<br></h2>

		Juujin Bunshin No Jutsu <br>
		Tsuuga - 100 Taijutsu<br>
		Gatsuuga - 300 Taijutsu<br>
		Soutourou - 300 Nin+Tai<br>
		Garouga - Hidden<br>

		<center><h2>Rock Lee-<br></h2>

		Konoha Renpuu - 50 Taijutsu<br>
		Konoha Senpuu - 100 Taijutsu<br>
		Omote Renge - 300 Taijutsu<br>
		Ura Renge - 400 Taijutsu<br>
		Lotus - Hidden<br>
		Konoha Genuriki Senpuu - Hidden<br>

		<center><h2>Gaara-<br></h2>

		Suna Shuriken - 60 Ninjutsu<br>
		Suna Shushin - 30 Kawarimi Uses, 100 Ninjutsu<br>
		Sand Sphere - 300 Ninjutsu<br>
		Suna Bunshin No Jutsu - 200 Ninjutsu<br>
		Sabaku Kyuu - Hidden<br>
		Sabaku Sousou - Hidden<br>

		<center><h2>Village:<br></h2>

		Leaf, Grass-<br>

		Katon Goukakyuu No Jutsu - 150 Ninjutsu<br>
		Katon Housenka No Jutsu - 200 Ninjutsu<br>
		Katon Karyuu Endan - Hidden<br></h2>

		Mist, Rain, Waterfall-<br>

		Suiton Suiryuudan No Jutsu - 250 Ninjutsu<br>
		Suiton Daibakufu No Jutsu - 300 Ninjutsu<br>
		Suiton Suikoudan No Jutsu - Hidden<br>

		Earth-<br>

		Doton Doryo Dango - 160 Taijutsu<br>
		Doton Doryuuheki - 350 Taijutsu<br>
		Doton Doryuudan - Hidden<br>

		Sand-<br>

		Fuuton Kaze Dangan No Jutsu - 100 Ninjutsu<br>
		Fuuton Renkuudan No Jutsu - 200 Ninjutsu<br>
		Fuuton Daitoppa No Jutsu - Hidden<br>

		Lightning-<br>

		Raikyuu No Jutsu - 120 Ninjutsu<br>
		Rairyuu No Tatsumaki - 200 Ninjutsu<br>
		Ikazuchi No Kiba - Hidden<br>

		Everyone-<br>

		Sennen Goroshi - 50 Taijutsu<br>
		Kage Shuriken No Jutsu - 10 Shuriken Skill<br>
		Shushin No Jutsu - 100 Kawarimi Uses, 100 Ninjutsu<br>
		Mei Mei No Jutsu - 100 Henge Uses, 100 Genjutsu<br>
		<p>
		<br>
		</body>
		</html>
		"}
	usr << browse(helptext)
//--------------------------------------------------------------------------------------------------------
mob
	proc
		WATER()
			if(src.onwater)
				if(prob(25))
					src.Mchakra += rand(1,5)
					src << "Your Chakra Raised."
				if(prob(10) && src.ChakraC < 100)
					src.ChakraC += 1
					src << "You Can Control Your Chakra Better."

var
	worldC=1
mob/var/OOC=0
mob/verb/OOC(msg as text)

	set desc = "Say something to everyone in the game"
	var/list/L
	L = list("font size","font color")
	for(var/H in L)
		if(findtext(msg,H))
			alert("No HTML in text!")
			return
	if(!usr.OOC)
		alert("You are muted!")
		return
	if(!worldC)
		alert("An admin has turned off world chat.")
		return
	if(length(msg) >= 400)
		alert("Message is too long")
		return
	if(filterr(msg,tags) == TRUE)	 //if the msg has profanity in it
		usr.html() // call the proc
		return
	if(filterr(msg,profane) == TRUE)	 //if the msg has profanity in it
		usr.profane() // call the proc
		return //stop it from sending
	if(filterr(msg,bannedwords) == TRUE) // if the msg has banned words in it
		usr.bannedwords() //call the proc
		return
	else //if it checks out
		if(spamcheck == TRUE)//if the player is spamming
			usr << "Spam rate exceeded please wait a moment and try again!"//tell him to wait for a second
			return //stop it from sending
		else//if the message is ok to send
			usr.spamcheck()//check for spam
			msg=cuttext(msg)
			if(log)//if logging is turned on
				text2file("(((((OOC)))))[time2text(world.realtime)]:[usr] says, [msg]","log.txt") // add it to the log
	for(var/mob/M in world)
		if(M.OOC)
			M << "<font size=1><font face=verdana><B><font color=silver>([usr.Village])-[usr]<font color=red>: [msg]"
mob/verb/VillageSay(msg as text)

	set desc = "Say something to everyone in your village"
	var/list/L
	L = list("font size","font color")
	for(var/H in L)
		if(findtext(msg,H))
			alert("No HTML in text!")
			return
	if(!usr.OOC)
		alert("You are muted!")
		return
	if(!worldC)
		alert("An admin has turned off world chat.")
		return
	if(length(msg) >= 400)
		alert("Message is too long")
		return
	for(var/mob/M in world)
		if(usr.Village == M.Village)
			M << "<font size=1><font face=verdana><B><font color=white>(Village Say)([usr.Clan]}-[usr]<font color=yellow>: [msg]"
mob
	verb
		Say(msg as text)

			if(!usr.OOC)
				return
			if(!worldC)
				return
			if(usr.testing)
				usr<<"Not right now!"
				return
			if(filterr(msg,tags) == TRUE)	 //if the msg has profanity in it
				usr.html() // call the proc
				return
			if(filterr(msg,profane) == TRUE)	 //if the msg has profanity in it
				usr.profane() // call the proc
				return //stop it from sending
			if(filterr(msg,bannedwords) == TRUE) // if the msg has banned words in it
				usr.bannedwords() //call the proc
				return
			else //if it checks out
				if(spamcheck == TRUE)//if the player is spamming
					usr << "Spam rate exceeded please wait a moment and try again!"//tell him to wait for a second
					return //stop it from sending
				else//if the message is ok to send
					usr.spamcheck()//check for spam
					msg=cuttext(msg)
					view(usr) << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: [msg]"
					if(log)//if logging is turned on
						text2file("[time2text(world.realtime)]:[usr] says, [msg]","log.txt") // add it to the log
mob
	verb
		Emote(msg as text)

			if(!usr.OOC)
				return
			if(!worldC)
				return
			if(usr.testing)
				usr<<"Not right now!"
				return
			if(filterr(msg,tags) == TRUE)	 //if the msg has profanity in it
				usr.html() // call the proc
				return
			if(filterr(msg,profane) == TRUE)	 //if the msg has profanity in it
				usr.profane() // call the proc
				return //stop it from sending
			if(filterr(msg,bannedwords) == TRUE) // if the msg has banned words in it
				usr.bannedwords() //call the proc
				return
			else //if it checks out
				if(spamcheck == TRUE)//if the player is spamming
					usr << "Spam rate exceeded please wait a moment and try again!"//tell him to wait for a second
					return //stop it from sending
				else//if the message is ok to send
					usr.spamcheck()//check for spam
					msg=cuttext(msg)
					view(usr) << "<font color=yellow>*<font color=red> [usr] [msg] <font color=yellow>*"
					if(log)//if logging is turned on
						text2file("[time2text(world.realtime)]:[usr] says, [msg]","log.txt") // add it to the log
mob/verb/Who()

	var/tmp/C = 0
	for(var/mob/M in world)
		if(M.client)
			C += 1
			usr << "<font size=1><b><font color=silver>[M.name]: <font color=green>(Key: [M.key]) Rank:[M.rank] Village: [M.Village]"
			if(M.GM)
				usr << "<font size=1><b><font color=yellow>[M.name] (Key: [M.key]) (GM)"
	usr << "<font size=1>[C] Players Online!"
mob/var/wartoggle=1
mob
	verb
		War_Toggle()
			set hidden =1

			if(usr.wartoggle)
				usr.wartoggle=0
				usr<<"You turn off village warring"
			else
				usr.wartoggle=1
				usr<<"You turn on village warring"