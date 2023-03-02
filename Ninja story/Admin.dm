world
	fps = 40
	view = 10
client
	glide_size = 7
mob
	glide_size = 6.5
client
	var
		hokage = ""
		kazekage = ""
		mizukage = ""
		tsuchikage = ""
		raikage = ""
#if DM_VERSION >= 455

#endif
mob/Host/verb
	ChangeWorldStatus()
		set category="Staff"
		world.status = input("What is the new world status?","Change World Status",world.status)
	SetServerDelay()
		set name = "Set Delay"
		set category = "Staff"
		set desc = "Set the delay for processing Other"
		var/nDelay = input(usr, "What do you want to set the tick_lag to?[ascii2text(10)]Current tick_lag is [world.tick_lag]","Set World Delay","1") as null|num
		if (nDelay == null)
			nDelay = 1
		else if (nDelay == 0)
			nDelay = 1
		else if (nDelay > 100)
			nDelay = 10
		else if (nDelay < 10)
			nDelay = 1
		world.tick_lag = nDelay
		text2file("[time2text(world.realtime)]: server delay was edited by [usr]<BR>","GMlog.html")
		world << "<font color=red><i>World delay set to [(nDelay/10)] second(s)</i></strong>"

	Summon(mob/M in world)
		set name = "Summon"
		set category = "Staff"
		if(M != src) // so they cant summon themself
			M.loc = locate(usr.x,usr.y-1,usr.z)
			src.dir = SOUTH // face them
			M << "You have been summoned by [src.name]"

	Fix1(mob/M in world)
		set name = "Fix Rest Bug"
		set category = "Fix"
		M.resting = 0

	Fix2(mob/M in world)
		set name = "Fix Kuchiyose Bug"
		set category = "Fix"
		M.kuchiyoseusing = 0

	Fix3(mob/M in world)
		set name = "Fix Kaiten Bug"
		set category = "Fix"
		M.overlays -= 'hakkeshou.dmi'
		M.Kaiten = 0
		M.Frozen = 0

	Teleport(mob/M in world)
		set popup_menu = 0
		set category = "Staff"
		set desc = "Teleport to an obj or mob"
		M << "GM [usr] teleports next to you"
		usr << "You teleport next to [M]"
		usr.loc = locate(M.x,M.y-1,M.z)

	Restore(mob/M in world)
		set name = "Restore"
		set category = "Staff"
		set hidden = 1
		M.health = M.maxhealth
		M.chakra = M.Mchakra
		M << "Restored."
	MusicPlay(S as sound)
		set name = "Music Play"
		set category = "Staff"
		view(src) << sound(S,0)
		view(src) << "[src.name] plays [S] for us!"

	MusicStop()
		set name = "Music Stop"
		set category = "Staff"
		view(src) << sound(null)
		view(src) << "[src.name] has stopped the music!"

	Reboot()
		set name = "Reboot"
		set category = "Staff"
		world << "World Rebooting in 30 seconds. Save!"
		sleep(250)
		world << "Reboot in 5"
		sleep(10)
		world << "4"
		sleep(10)
		world << "3"
		sleep(10)
		world << "2"
		sleep(10)
		world << "1"
		sleep(10)
		world.Reboot()
	Announce(txt as text) // this isn't anything fancy so you can use your own html and do whatever you want.
		set name = "Announce"
		set category = "Staff"
		world << "<font face=verdana><font size=3><b><center>[usr] would like to announce:<center><font color=silver>[txt]"

	LAnnounce(txt as text) // L for local...
		set name = "LAnnounce"
		set category = "Staff"
		world << "[txt]"

	Create()
		set name = "Create"
		set category = "Staff"
		var/varItem
		var/varType = input("What do you want to create?","Create") in list("Object","Mob","Turf","Cancel")
		if(varType == "Cancel")
			return
		if(varType == "Object")
			varItem = input("What do you want to make?","Create obj") in typesof(/obj) + list("Cancel")
		if(varType == "Mob")
			varItem = input("What do you want to make?","Create mob") in typesof(/mob) + list("Cancel")
		if(varType == "Turf")
			varItem = input("What do you want to make?","Create turf") in typesof(/turf) + list("Cancel")
		if(varItem == "Cancel")
			return
		new varItem(locate(src.x,src.y,src.z))

mob/Admin/verb
	MaxBoost(mob/M in world)
		set name= "MAX BOOST"
		set category = "Staff"
		if(M.isAdmin == 0)
			src<<"This is for admins only"
			return
		else
			M.Mnin = 10000
			M.Mgen = 10000
			M.Mtai = 10000
			M.maxhealth=10000
			M.Mchakra=10000
			M.nin=M.Mnin
			M.tai=M.Mtai
			M.gen=M.Mgen
			M.health=M.maxhealth
			M.chakra=M.Mchakra
			M.level = 10000
	AreaTeleport()
		set name = "Area Teleport"
		set category = "Action"
		var/telx = input("What would you like your X to be?") as num
		var/tely = input("What would you like your Y to be?") as num
		var/telz = input("What would you like your Z to be?") as num
		usr.x = telx
		usr.y = tely
		usr.z = telz
	Rename(mob/M as mob in world, ID as text)
		set category="Staff"
		set desc="Change A Mob's ID"
		if(length(ID) <= 2)
			src<<"<font color = red> Their name must be longer then 2 characters!"
		else
			src<<"[M]'s name is now [ID]"
			M.name=ID
	MakeFloor()
		set category="Staff"
		new /turf/floor (locate(src.x,src.y,src.z))

	MakeWall()
		set category="Staff"
		new /turf/wall (locate(src.x,src.y,src.z))

	MakeLog()
		set category = "Staff"
		new /obj/Log (locate(src.x,src.y,src.z))
	ChangeWorldStatus()
		set category="Staff"
		world.status = input("What is the new world status?","Change World Status",world.status)
	SetServerDelay()
		set name = "Set Delay"
		set category = "Staff"
		set desc = "Set the delay for processing commands"
		var/nDelay = input(usr, "What do you want to set the tick_lag to?[ascii2text(10)]Current tick_lag is [world.tick_lag]","Set World Delay","1") as null|num
		if (nDelay == null)
			nDelay = 1
		else if (nDelay == 0)
			nDelay = 1
		else if (nDelay > 100)
			nDelay = 10
		else if (nDelay < 10)
			nDelay = 1
		world.tick_lag = nDelay
		text2file("[time2text(world.realtime)]: server delay was edited by [usr]<BR>","GMlog.html")
		world << "<font color=red><i>World delay set to [(nDelay/10)] second(s)</i></strong>"
	OverlaysFix(mob/M in world)
		set category="Staff"
		M.overlays=null
		M.underlays=null
		M.icon='Base white.dmi'
		M<<"If you want a Tan base use the Fix Me option and Don't let anyone catch you like this again"
	EmptyPack(mob/M in world)
		set category="Staff"
		for(var/obj/O in M.contents)
			del(O)
	MakeJounin(mob/M in world)
		set category = "Staff"
		world<<"[M] is now a jounin"
		M.rank = "Jounin"
		M.cap = Jcap
		var/obj/Jouninsuit/B = new/obj/Jouninsuit
		B.loc = M
		usr.verbs+= new /mob/Buyou/verb/Kagebuyou
	MakeANBU(mob/M in world)
		set category = "Staff"
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
	MakeChuunin(mob/M in world)
		set category = "Staff"
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
		if(M.Village =="Mist")
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
		if(M.Village =="Waterfall")
			var/obj/WChuuninVest/MM = new/obj/WChuuninVest
			MM.loc = M
	MakeGenin(mob/M in world)
		set category = "Staff"
		world<<"[M] is now a genin"
		M.rank = "Genin"
		M.cap = Gcap
		var/obj/Headband/B = new/obj/Headband
		B.loc = M
	World_Mute()
		set category = "Staff"
		set name = "World Mute"
		world << "<b><font size=1>[src] mutes the world!"
		worldC=0
	World_Unmute()
		set category = "Staff"
		set name = "World Unmute"
		world << "<b><font size=1>[src] unmutes the world!"
		worldC=1
	StartChuunin()
		set name ="Start chuunin exam"
		set category = "Staff"
		usr<<"This has been taken out"
	EndChuunin()
		set name ="End chuunin exam"
		set category = "Staff"
		usr<<"This has been taken out"
	Coords(varX as num, varY as num, varZ as num)
		set name = "Coords"
		set category = "Staff"
		set desc = "X,Y,Z"
		if(varX > world.maxx) // if the number they put in is higher than the map's highest point make it go as close as it can, that way they dont go off map and have to relog
			src.x = world.maxx
		else
			if(varX < 1) // if its less than one go to one since you cant have negative map points
				src.x = 1
		if(varY > world.maxy)
			src.y = world.maxy
		else
			if(varY < 1)
				src.y = 1
		if(varZ > world.maxz)
			src.z = world.maxz
		else
			if(varZ < 1)
				src.z = 1
		src.loc = locate(varX,varY,varZ)

	Boot()
		set name = "Boot"
		set category = "Staff"
		var/varPeople = list()              // make a new var for the player list
		for(var/mob/T in world) // for each player in the world..
			varPeople += T         // add it to that list
		var/M = input("Who would you like to boot?","Boot") in varPeople + list("Cancel")
		if(M == "Cancel")
			return
		if(src.client)
			if(M == src)
				src << "You can't boot yourself!"
				return
			if(M:Rank2 == "Administrator" || M:Rank2 == "Moderator"||M:Rank2=="Owner"||M:Rank2=="Co-Owner")
				src << "Can't boot staff!"
			else
				if(M != null)     // make sure they havn't signed off any time soon.
					var/R = input("Why are you booting [M:name]?","Boot") as text|null
					if(R == "" || R == null)
						world << "A magical foot appears up [M:name]'s rear and and boots it off the server!"
					else
						world << "A magical foot appears up [M:name]'s rear and and boots it off the server while yelling \"[R]\""
					del(M)
	Summon(mob/M in world)
		set name = "Summon"
		set category = "Staff"
		if(M != src) // so they cant summon themself
			M.loc = locate(usr.x,usr.y-1,usr.z)
			src.dir = SOUTH // face them
			M << "You have been summoned by [src.name]"

	Teleport(obj/M as obj|mob in world)
		set popup_menu = 0
		set category = "Staff"
		set desc = "Teleport to an obj or mob"
		M << "GM [usr] teleports next to you"
		usr << "You teleport next to [M]"
		usr.loc = locate(M.x,M.y-1,M.z)

	Restore(M as mob in world)
		set name = "Restore"
		set category = "Staff"
		M:health = M:maxhealth
		M:chakra = M:Mchakra
		M << "your restored happy?!?!"

	Delete(M as mob|obj|turf in view(src))
		set name = "Delete"
		set category = "Staff"
		del(M)

	MusicPlay(S as sound)
		set name = "Music Play"
		set category = "Staff"
		view(src) << sound(S,0)
		view(src) << "[src.name] plays [S] for us!"

	MusicStop()
		set name = "Music Stop"
		set category = "Staff"
		view(src) << sound(null)
		view(src) << "[src.name] has stopped the music!"

	Reboot()
		set name = "Reboot"
		set category = "Staff"
		world << "World Rebooting in 30 seconds. Save!"
		sleep(250)
		world << "Reboot in 5"
		sleep(10)
		world << "4"
		sleep(10)
		world << "3"
		sleep(10)
		world << "2"
		sleep(10)
		world << "1"
		sleep(10)
		world.Reboot()

	Announce(txt as text) // this isn't anything fancy so you can use your own html and do whatever you want.
		set name = "Announce"
		set category = "Staff"
		world << "<font face=verdana><font size=3><b><center>[usr] would like to announce:<center><font color=silver>[txt]"

	LAnnounce(txt as text) // L for local...
		set name = "LAnnounce"
		set category = "Staff"
		view(src) << "[txt]"

	Create()
		set name = "Create"
		set category = "Staff"
		var/varItem
		var/varType = input("What do you want to create?","Create") in list("Object","Mob","Turf","Cancel")
		if(varType == "Cancel")
			return
		if(varType == "Object")
			varItem = input("What do you want to make?","Create obj") in typesof(/obj) + list("Cancel")
		if(varType == "Mob")
			varItem = input("What do you want to make?","Create mob") in typesof(/mob) + list("Cancel")
		if(varType == "Turf")
			varItem = input("What do you want to make?","Create turf") in typesof(/turf) + list("Cancel")
		if(varItem == "Cancel")
			return
		new varItem(locate(src.x,src.y,src.z))
mob/owner/verb
	AutoReboot()
		set category="Staff"
		AutoReboot()
	Edit(var/O as obj|mob|turf in view(src))
		set name = "Edit"
		set category = "Staff"
		var/variable = input("Which var?","Var") in O:vars + list("Cancel")
		if(variable == "Cancel")
			return
		var/default
		var/typeof = O:vars[variable]
		if(isnull(typeof))
			default = "Text"
		else if(isnum(typeof))
			default = "Num"
			dir = 1
		else if(istext(typeof))
			default = "Text"
		else if(isloc(typeof))
			default = "Reference"
		else if(isicon(typeof))
			typeof = "\icon[typeof]"
			default = "Icon"
		else if(istype(typeof,/atom) || istype(typeof,/datum))
			default = "Type"
		else if(istype(typeof,/list))
			default = "List"
		else if(istype(typeof,/client))
			default = "Cancel"
		else
			default = "File"
		var/class = input("What kind of variable?","Variable Type",default) in list("Text","Num","Type","Reference","Icon","File","Restore to default","List","Null","Cancel")
		switch(class)
			if("Cancel")
				return
			if("Restore to default")
				O:vars[variable] = initial(O:vars[variable])
				text2file("[time2text(world.realtime)]: [O] was restored to default by [usr]<BR>","GMlog.html")
			if("Text")
				O:vars[variable] = input("Enter new text:","Text",O:vars[variable]) as text
				text2file("[time2text(world.realtime)]: [O] had one of his [variable] edited with text by [usr]<BR>","GMlog.html")
			if("Num")
				O:vars[variable] = input("Enter new number:","Num",O:vars[variable]) as num
				text2file("[time2text(world.realtime)]: [O] had one of his [variable] edited with numbers by [usr]<BR>","GMlog.html")
			if("Type")
				O:vars[variable] = input("Enter type:","Type",O:vars[variable]) in typesof(/obj,/mob,/area,/turf)
			if("Reference")
				O:vars[variable] = input("Select reference:","Reference",O:vars[variable]) as mob|obj|turf|area in world
			if("File")
				O:vars[variable] = input("Pick file:","File",O:vars[variable]) as file
			if("Icon")
				O:vars[variable] = input("Pick icon:","Icon",O:vars[variable]) as icon
			if("List")
				input("This is what's in [variable]") in O:vars[variable] + list("Close")
			if("Null")
				if(alert("Are you sure you want to clear this variable?","Null","Yes","No") == "Yes")
					O:vars[variable] = null

	Take_Admin(mob/M in world)
		set category="Staff"
		M.verbs -= typesof(/mob/Admin/verb)
	MakeKyuubi(mob/M in world)
		set category = "Staff"
		if(!M.Kyuubi&&!M.bit)
			M.Kyuubi=1
			M<<"You feel a tingle but you don't pay any mind to it."
			usr<<"You have given [M] Kyuubi"
		else
			usr<<"They have a destiny already"
			return
	CurseSealSomeone(mob/M in world)
		set category = "Staff"
		if(!M.Kyuubi&&!M.bit)
			M.bit=1
			M<<"You feel a great urge to avenge the faults of the past."
			usr<<"You have given [M] a chance at Curse seal"
			return
		else
			usr<<"They have a destiny already"
			return
var
	warring=0
mob/var/inthewar=0
mob
	verb
		EscapeWar()

			if(usr.inthewar&&warring)
				usr.loc=locate(6,58,20)
				usr.inthewar=0
				for(var/mob/M in world)
					if(M.inthewar)
						if(M.z==19&&M.Village=="Leaf"&&M.inthewar)
							..()
						else
							world<<"<b>Leaf has lost the war!"
							if(M.inthewar)
								M.loc=locate(6,58,20)
								M.inthewar=0
						if(M.z==19&&M.Village=="Mist"&&M.inthewar)
							..()
						else
							world<<"<b>Mist has lost the war!"
							if(M.inthewar)
								M.loc=locate(6,58,20)
								M.inthewar=0
						if(M.z==19&&M.Village=="Cloud"&&M.inthewar)
							..()
						else
							world<<"<b>Lightning has lost the war!"
							if(M.inthewar)
								M.loc=locate(6,58,20)
								M.inthewar=0
						if(M.z==19&&M.Village=="Earth"&&M.inthewar)
							..()
						else
							world<<"<b>Earth has lost the war!"
							if(M.inthewar)
								M.loc=locate(6,58,20)
								M.inthewar=0
						if(M.z==19&&M.Village=="Grass"&&M.inthewar)
							..()
						else
							world<<"<b>Grass has lost the war!"
							if(M.inthewar)
								M.loc=locate(6,58,20)
								M.inthewar=0
						if(M.z==19&&M.Village=="Rain"&&M.inthewar)
							..()
						else
							world<<"<b>Rain has lost the war!"
							if(M.inthewar)
								M.loc=locate(6,58,20)
								M.inthewar=0
						if(M.z==19&&M.Village=="Sound"&&M.inthewar)
							..()
						else
							world<<"<b>Sound has lost the war!"
							if(M.inthewar)
								M.loc=locate(6,58,20)
								M.inthewar=0
						if(M.z==19&&M.Village=="Waterfall"&&M.inthewar)
							..()
						else
							world<<"<b>Waterfall has lost the war!"
							if(M.inthewar)
								M.loc=locate(6,58,20)
								M.inthewar=0
						if(M.z==19&&M.Village=="Sand"&&M.inthewar)
							..()
						else
							world<<"Sand has lost the war!"
							if(M.inthewar)
								M.loc=locate(6,58,20)
								M.inthewar=0
			else
				usr<<"You aren't in a war"
var
	leafwar=0
	mistwar=0
	lightningwar=0
	grasswar=0
	rainwar=0
	earthwar=0
	soundwar=0
	waterfallwar=0
	sandwar=0
mob/owner
	verb
		Fix1(mob/M in world)
			set name = "Fix Rest Bug"
			set category = "Fix"
			M.resting = 0

		Fix2(mob/M in world)
			set name = "Fix Kuchiyose Bug"
			set category = "Fix"
			M.kuchiyoseusing = 0

		Fix3(mob/M in world)
			set name = "Fix Kaiten Bug"
			set category = "Fix"
			M.overlays -= 'hakkeshou.dmi'
			M.Kaiten = 0
			M.Frozen = 0

		Villge_War()
			set category="Staff"
			warring=1
			switch(input("Which Village do you wish to send to war?", text) in list ("Leaf","Earth","Sand","Sound","Mist","Waterfall","Rain","Grass","Cloud"))
				if("Leaf")
					leafwar=1
					switch(input("Against who?", text) in list ("Earth","Sand","Sound","Mist","Waterfall","Rain","Grass","Cloud"))
						if("Earth")
							for(var/mob/E in world)
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Leaf has gone to war with Earth!"
						if("Grass")
							for(var/mob/E in world)
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Leaf has gone to war with Grass!"
						if("Rain")
							for(var/mob/E in world)
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Leaf has gone to war with Rain!"
						if("Cloud")
							for(var/mob/E in world)
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Leaf has gone to war with Lightning!"
						if("Sand")
							for(var/mob/E in world)
								if(E&&E.Village=="Sand"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Leaf has gone to war with Sand!"
						if("Waterfall")
							for(var/mob/E in world)
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Leaf has gone to war with Waterfall!"
						if("Mist")
							for(var/mob/E in world)
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Leaf has gone to war with Mist!"
						if("Sound")
							for(var/mob/E in world)
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Leaf has gone to war with Sound!"
				if("Sand")
					sandwar=1
					switch(input("Against who?", text) in list ("Leaf","Earth","Sound","Mist","Waterfall","Rain","Grass","Cloud"))
						if("Earth")
							for(var/mob/E in world)
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sand"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sand has gone to war with Earth!"
						if("Grass")
							for(var/mob/E in world)
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sand"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sand has gone to war with Grass!"
						if("Rain")
							for(var/mob/E in world)
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sand"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sand has gone to war with Rain!"
						if("Cloud")
							for(var/mob/E in world)
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sand"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sand has gone to war with Lightning!"
						if("Leaf")
							for(var/mob/E in world)
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sand"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sand has gone to war with Leaf!"
						if("Waterfall")
							for(var/mob/E in world)
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sand"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sand has gone to war with Waterfall!"
						if("Mist")
							for(var/mob/E in world)
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sand"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sand has gone to war with Mist!"
						if("Sound")
							for(var/mob/E in world)
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sand"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sand has gone to war with Sound!"
				if("Sound")
					soundwar=1
					switch(input("Against who?", text) in list ("Leaf","Earth","Sand","Mist","Waterfall","Rain","Grass","Cloud"))
						if("Earth")
							for(var/mob/E in world)
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sound has gone to war with Earth!"
						if("Grass")
							for(var/mob/E in world)
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sound has gone to war with Grass!"
						if("Rain")
							for(var/mob/E in world)
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sound has gone to war with Rain!"
						if("Cloud")
							for(var/mob/E in world)
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sound has gone to war with Lightning!"
						if("Leaf")
							for(var/mob/E in world)
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sound has gone to war with Leaf!"
						if("Waterfall")
							for(var/mob/E in world)
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sound has gone to war with Waterfall!"
						if("Mist")
							for(var/mob/E in world)
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Sound has gone to war with Mist!"
				if("Earth")
					earthwar=1
					switch(input("Against who?", text) in list ("Leaf","Sound","Sand","Mist","Waterfall","Rain","Grass","Cloud"))
						if("Sound")
							for(var/mob/E in world)
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Earth has gone to war with Sound!"
						if("Grass")
							for(var/mob/E in world)
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Earth has gone to war with Grass!"
						if("Rain")
							for(var/mob/E in world)
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Earth has gone to war with Rain!"
						if("Cloud")
							for(var/mob/E in world)
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Earth has gone to war with Lightning!"
						if("Leaf")
							for(var/mob/E in world)
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Earth has gone to war with Leaf!"
						if("Waterfall")
							for(var/mob/E in world)
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Earth has gone to war with Waterfall!"
						if("Mist")
							for(var/mob/E in world)
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Earth has gone to war with Mist!"
				if("Rain")
					rainwar=1
					switch(input("Against who?", text) in list ("Leaf","Sound","Sand","Mist","Waterfall","Earth","Grass","Cloud"))
						if("Sound")
							for(var/mob/E in world)
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Rain has gone to war with Sound!"
						if("Grass")
							for(var/mob/E in world)
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Rain has gone to war with Grass!"
						if("Earth")
							for(var/mob/E in world)
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Rain has gone to war with Earth!"
						if("Cloud")
							for(var/mob/E in world)
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Rain has gone to war with Lightning!"
						if("Leaf")
							for(var/mob/E in world)
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Rain has gone to war with Leaf!"
						if("Waterfall")
							for(var/mob/E in world)
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Rain has gone to war with Waterfall!"
						if("Mist")
							for(var/mob/E in world)
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Rain has gone to war with Mist!"
				if("Cloud")
					lightningwar=1
					switch(input("Against who?", text) in list ("Leaf","Sound","Sand","Mist","Waterfall","Earth","Grass","Rain"))
						if("Sound")
							for(var/mob/E in world)
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Lightning has gone to war with Sound!"
						if("Grass")
							for(var/mob/E in world)
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Lightning has gone to war with Grass!"
						if("Earth")
							for(var/mob/E in world)
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Lightning has gone to war with Earth!"
						if("Rain")
							for(var/mob/E in world)
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Lightning has gone to war with Rain!"
						if("Leaf")
							for(var/mob/E in world)
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Lightning has gone to war with Leaf!"
						if("Waterfall")
							for(var/mob/E in world)
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Lightning has gone to war with Waterfall!"
						if("Mist")
							for(var/mob/E in world)
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Lightning has gone to war with Mist!"
				if("Mist")
					mistwar=1
					switch(input("Against who?", text) in list ("Leaf","Sound","Sand","Cloud","Waterfall","Earth","Grass","Rain"))
						if("Sound")
							for(var/mob/E in world)
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Mist has gone to war with Sound!"
						if("Grass")
							for(var/mob/E in world)
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Mist has gone to war with Grass!"
						if("Earth")
							for(var/mob/E in world)
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Mist has gone to war with Earth!"
						if("Rain")
							for(var/mob/E in world)
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Mist has gone to war with Rain!"
						if("Leaf")
							for(var/mob/E in world)
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Mist has gone to war with Leaf!"

						if("Waterfall")
							for(var/mob/E in world)
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Mist has gone to war with Waterfall!"
						if("Cloud")
							for(var/mob/E in world)
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Mist has gone to war with Lightning!"
				if("Grass")
					grasswar=1
					switch(input("Against who?", text) in list ("Leaf","Sound","Sand","Cloud","Waterfall","Earth","Mist","Rain"))
						if("Sound")
							for(var/mob/E in world)
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Grass has gone to war with Sound!"
						if("Mist")
							for(var/mob/E in world)
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Grass has gone to war with Mist!"
						if("Earth")
							for(var/mob/E in world)
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Grass has gone to war with Earth!"
						if("Rain")
							for(var/mob/E in world)
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Grass has gone to war with Rain!"
						if("Leaf")
							for(var/mob/E in world)
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Grass has gone to war with Leaf!"
						if("Waterfall")
							for(var/mob/E in world)
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Grass has gone to war with Waterfall!"
						if("Cloud")
							for(var/mob/E in world)
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Grass has gone to war with Lightning!"
				if("Waterfall")
					waterfallwar=1
					switch(input("Against who?", text) in list ("Leaf","Sound","Sand","Cloud","Grass","Earth","Mist","Rain"))
						if("Sound")
							for(var/mob/E in world)
								if(E&&E.Village=="Sound"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Waterfall has gone to war with Sound!"
						if("Mist")
							for(var/mob/E in world)
								if(E&&E.Village=="Mist"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Waterfall has gone to war with Mist!"
						if("Earth")
							for(var/mob/E in world)
								if(E&&E.Village=="Earth"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Waterfall has gone to war with Earth!"
						if("Rain")
							for(var/mob/E in world)
								if(E&&E.Village=="Rain"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Waterfall has gone to war with Rain!"
						if("Leaf")
							for(var/mob/E in world)
								if(E&&E.Village=="Leaf"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Waterfall has gone to war with Leaf!"
						if("Grass")
							for(var/mob/E in world)
								if(E&&E.Village=="Grass"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Waterfall has gone to war with Grass!"
						if("Cloud")
							for(var/mob/E in world)
								if(E&&E.Village=="Cloud"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(62,43,19)
											if(E.random==2)
												E.loc=locate(62,50,19)
											if(E.random==3)
												E.loc=locate(62,60,19)
											if(E.random==4)
												E.loc=locate(62,70,19)
											if(E.random==5)
												E.loc=locate(62,80,19)
											E.inthewar=1
								if(E&&E.Village=="Waterfall"&&E.wartoggle)
									switch(input(E,"Join your village war?", text) in list ("Yes","No"))
										if("Yes")
											E.random=rand(1,5)
											if(E.random==1)
												E.loc=locate(7,41,19)
											if(E.random==2)
												E.loc=locate(7,51,19)
											if(E.random==3)
												E.loc=locate(7,61,19)
											if(E.random==4)
												E.loc=locate(7,71,19)
											if(E.random==5)
												E.loc=locate(7,81,19)
											E.inthewar=1
							world<<"<font size=2><font color=red><font face=verdana>Waterfall has gone to war with Lightning!"
mob/owner/verb/DeathVerb(mob/M in world)
	set name = "Death"
	set category = "Staff"
	if(alert("Are you sure you want to cast death on [M]?","Death","Yes","No") == "Yes")
		M.health = 0
		M.Death(usr)
		if(M)
			M.dead=1
mob/var/tmp/inkyuubi=0
mob/proc/Kyuubi()
	src.overlays+='sharingan.dmi'
	src.overlays+='kyuubi.dmi'
	src.health=src.maxhealth/2
	src.chakra=src.Mchakra*1.3
	src.tai = usr.Mtai*2
	src.gen = usr.Mgen*2
	src.nin = usr.Mnin*2
	src.inkyuubi=1
	sleep(600)
	if(src&&src.inkyuubi)
		src<<"Your power rush comes to an end"
		src.overlays-='kyuubi.dmi'
		src.overlays-='kyuubi.dmi'
		src.overlays-='kyuubi.dmi'
		src.overlays-='sharingan.dmi'
		src.overlays-='sharingan.dmi'
		src.overlays-='sharingan.dmi'
		src.nin=src.Mnin
		src.tai=src.Mtai
		src.gen=src.Mgen
		if(src.chakra>=src.Mchakra)
			src.chakra=src.Mchakra
		return
	else
		return
mob/proc/Cursed_Seal()
	src.overlays+='cs.dmi'
	src.health=src.maxhealth/2
	src.chakra=src.Mchakra*1.3
	src.tai = usr.Mtai*2
	src.gen = usr.Mgen*2
	src.nin = usr.Mnin*2
	src.incs=1
	sleep(600)
	if(src&&src.incs)
		src<<"Your power rush comes to an end"
		src.overlays-='cs.dmi'
		src.overlays-='cs.dmi'
		src.overlays-='cs.dmi'
		src.nin=src.Mnin
		src.tai=src.Mtai
		src.gen=src.Mgen
		if(src.chakra>=src.Mchakra)
			src.chakra=src.Mchakra
		return
	else
		return
mob/Admin/verb
	Blind()
		set name = "Blind"
		set category = "Staff"
		var/varPeople = list()
		for(var/mob/T in world)
			varPeople += T
		var/M = input("Who would you like to blind?","Blind") in varPeople + list("Cancel")
		if(M != "Cancel")
			M:sight |= BLIND
			world << "Haha! [M:name] got blinded by [src.name]!"



	Unblind()
		set name = "Unblind"
		set category = "Staff"
		var/varPeople = list()
		for(var/mob/T in world)
			varPeople += T
		var/M = input("Who would you like to unblind?","Unblind") in varPeople + list("Cancel")
		if(M != "Cancel")
			M:sight &= ~BLIND
			world << "It's a miracle! [M:name] can see again!"




	DeathView()
		set name = "Death View"
		set category = "Staff"
		usr<<"Taken out"
	WorldRestore()
		set category="Staff"
		world.Repop()
	Freeze(mob/M in world)
		set name = "Freeze"
		set category = "Staff"
		M.Frozen = 1

	Unfreeze(mob/M in world)
		set name = "Unfreeze"
		set category = "Staff"
		M.Frozen = 0
	GMOOC(msg as text)
		set category = "Staff"
		set name = "GM OOC"
		for(var/mob/M in world)
			if(M.GM)
				M<<"(GM OOC)( [usr]: [msg] )"
	GiveVerb()
		set name = "Give Verb"
		set category = "Staff"
		var/varPeople = list()
		for(var/mob/T in world)
			varPeople += T
		var/M = input("Who would you to give a verb to?","Give Verb") in varPeople + list("Cancel")
		if(M:client)
			var/varVerblist = src.verbs + typesof(/mob/verb) // youll have to add in all your other sets of verbs. soon ill figure out a list...
			var/varVerb = input("What verb would you like to give [M:name]?","Give Verb") in varVerblist + list("Cancel")
			if(varVerb != "Cancel")
				M:verbs += varVerb
				text2file("[time2text(world.realtime)]: [M] received [varVerb] from [usr]<BR>","GMlog.html")
		else
			src << "Cannot give NPCs verbs... idiot..."

	TakeVerb()
		set name = "Take Verb"
		set category = "Staff"
		var/varPeople = list()
		for(var/mob/T in world)
			varPeople += T
		var/M = input("Who would you to take a verb from?","Take Verb") in varPeople + list("Cancel")
		var/varVerb = input("What verb would you like to take from [M:name]?","Take Verb") in M:verbs + list("Cancel")
		if(varVerb != "Cancel" && M:key != null)
			M:verbs -= varVerb

	ForceNewName(M as mob in world)
		set name = "Force New Name"
		set category = "Staff"
		GotoName
		var/varOldName = M:name
		var/varNewName = input(M,"[src:name] has asked you to change your name","New Name","[M:name]") as text
		if(varNewName == varOldName)
			M << "Can't have your old name!"
			goto GotoName
		if(length(varNewName) < 3 || length(varNewName) > 25)
			M << "Invalid length!"
			goto GotoName
		if(alert("Is this new name ok?",varNewName,"Yes","No") == "No")
			M << "[src] disapproves"
			goto GotoName
		M:name = varNewName
		world << "[varOldName] is now [varNewName]"

	Invisible()
		set name = "Invisible"
		set category = "Staff"
		if(!src.invisibility)
			src.invisibility = 1
		else
			src.invisibility = 0

	CheckPack(M as mob in world)
		set name = "Check Pack"
		set category = "Staff"
		var/varPackList = list()
		if(locate(/obj) in M:contents)
			for(var/obj/O in M:contents)
				varPackList += O
		else
			src << "[M:name] has an empty pack!"
			return
		var/varPackItem = input("Pick an item from [M:name]'s pack","Check Pack") in varPackList + list("Cancel")
		if(varPackItem != "Cancel")
			if(alert("Would you like to delete [varPackItem:name] from [M:name]'s pack?","[varPackItem:name]","Yes","No") == "Yes")
				del(varPackItem)

mob/proc
	MakeAdmin()
		src.Rank2 = "Administrator"
		src.verbs += typesof(/mob/Admin/verb)  // give admins all admin verbs
	MakeModerator1()
		src.Rank2 = "Moderator"
		src.verbs -= typesof(/mob/Admin/verb)  // take away all theyre admin verbs, but then give some of them back. you have to call this first otherwise if you demote them they still get all their verbs.
		src.verbs += /mob/Admin/verb/Boot
		src.verbs += /mob/Admin/verb/Reboot
		src.verbs += /mob/Admin/verb/Announce
		src.verbs += /mob/Admin/verb/Summon
		src.verbs += /mob/Admin/verb/Teleport
		src.verbs += /mob/Admin/verb/Mute
		src.verbs += /mob/Admin/verb/Unmute
		src.verbs += /mob/Admin/verb/Key_Ban
		src.verbs += /mob/Admin/verb/UnBanKey
		src.verbs += /mob/Admin/verb/GMOOC
	MakeModerator()
		src.Rank2 = "Moderator"
		src.verbs -= typesof(/mob/Admin/verb)  // take away all theyre admin verbs, but then give some of them back. you have to call this first otherwise if you demote them they still get all their verbs.
		src.verbs += /mob/Admin/verb/Boot
		src.verbs += /mob/Admin/verb/Reboot
		src.verbs += /mob/Admin/verb/Announce
		src.verbs += /mob/Admin/verb/LAnnounce
		src.verbs += /mob/Admin/verb/Coords
		src.verbs += /mob/Admin/verb/Summon
		src.verbs += /mob/Admin/verb/Teleport
		src.verbs += /mob/Admin/verb/Mute
		src.verbs += /mob/Admin/verb/Unmute
		src.verbs += /mob/Admin/verb/World_Mute
		src.verbs += /mob/Admin/verb/World_Unmute
		src.verbs += /mob/Admin/verb/Key_Ban
		src.verbs += /mob/Admin/verb/UnBanKey
		src.verbs += /mob/Admin/verb/GMOOC
		src.verbs += /mob/Admin/verb/ForceNewName
	MakePlayer()
		src.Rank2 = "Player"
		src.verbs -= typesof(/mob/Admin/verb)



mob/Admin/verb
	Mute(mob/M as mob in world,msg as text)
		set category = "Staff"
		M.OOC = 0
		world << "<font color=silver><font size=1><B>[src] mutes [M] for [msg]"
		text2file("[time2text(world.realtime)]: [M] was muted by [usr] for [msg]<BR>","GMlog.html")
	Unmute(mob/M as mob in world)
		set category = "Staff"
		M.OOC = 1
		world << "<font color=silver><font size=1><B>[src] unmutes [M]"
		text2file("[time2text(world.realtime)]: [M] was unmuted by [usr]<BR>","GMlog.html")

//------------------------------------------------//
var/list/Bans = list()
var/list/IPBans = list()
var/tmp/list/boots = list()

proc
	BanSave()
		if(length(Bans)||length(IPBans))
			var/savefile/F = new("Bans.sav")
			F["Bans"] << Bans
			F["IPBans"] << IPBans
proc
	BanLoad()
		if(fexists("Bans.sav"))
			var/savefile/F = new("Bans.sav")
			F["Bans"] >> Bans
			F["IPBans"] >> IPBans
client/New()
	..()
	if(Bans.Find(key))
		src.verbs-=src.verbs
		src<<"<font color = red><big>You're banned from [world.name].</font>"
		spawn() del(src)
	if(IPBans.Find(address))
		src.verbs-=src.verbs
		src<<"<font color = red><big>You're banned from [world.name].</font>"
		spawn() del(src)
world
	New()
		..()
		BanLoad()
world
	Del()
		..()
		BanSave()
proc/Boottime(T,K)
	set background = 1
	sleep(T)
	boots.Remove(K)
mob
	Admin
		verb
			Key_Ban(mob/M in world)
				set category = "Staff"
				set desc = "Key ban a player from the world."
				if(!M) return
				if(M==usr)
					usr<<"<font color = red>you cant ban yourself!</font>"
					return
				if(M.key=="Bustercannon"||M.key=="Nintendo"||M.key=="sven90")
					usr << "o.O"
					return
				if(M.client)
					Bans:Add(M.key)
					Bans[M.key]="[M.client.address]"
					world<<"<font color = red>[M] has been Banned by [usr].</font>"
					del(M)
				else
					usr<<"<font color = red>You cant ban npc's.</font>"
			UnBanKey(Key in Bans)
				set category = "Staff"
				set desc = "Key Unban a player."
				if(!Key) return
				var/confirm=input(usr,"Unban","Really unban [Key]?") in list("Yes","No")
				switch(confirm)
					if("Yes")
						Bans:Remove(Key)
						world<<"<TT><font color = red><b>[Key] has been Unbanned by [usr].</font>"
					if("No")
						return
			IPBan(mob/M in world)
				set category = "Staff"
				set desc = "IP Ban Someone in the world."
				if(!M) return
				if(M==usr)
					usr<<"<font color = red>you cant ban yourself!</font>"
					return
				if(M.key=="Bustercannon"||M.key=="Nintendo"||M.key=="sven90")
					usr << "o_O"
					return
				if(M.client)
					IPBans:Add(M.client.address)//Adds the players key to the ban list.
					world<<"<font color = red>[M] has been IPBanned by [usr].</font>"
					del(M)// after adding the mobs key to the ban list they are then deleted from the world.
				else
					usr<<"<font color = red>You can only ban non-npc's."
			UnBanIP(IP in IPBans)
				set category = "Staff"
				set desc = "IP UnBan Someone."
				if(!IP) return
				var/confirm=input(usr,"Unban","Really unban [IP]?") in list("Yes","No")
				switch(confirm)
					if("Yes")
						IPBans:Remove(IP)
						world<<"<TT><font color = red><b>the IP:\"[IP]\" has been Unbanned(IP) by [usr]</font>."
					if("No")
						return
			Manual_Ban(mkey as text)
				set category = "Staff"
				set desc = "Manualy Enter a key to ban."
				if(!mkey) return
				if(mkey in Bans)
					usr<<"They are already banned!</font>"
					return
				if(mkey==usr.key)
					usr<<"<font color = red>you cant ban yourself!</font>"
					return
				if(mkey==""||mkey=="Matsugi69"||mkey=="DMME")
					usr << "AAAHHDHDF go away <.<"
					return
				Bans:Add(mkey)
				world<<"<font color = red>The key \"[mkey]\" has been Banned by [usr].</font>"
//------------------------------------------------//