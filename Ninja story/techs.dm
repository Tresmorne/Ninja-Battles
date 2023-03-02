obj/var/tmp
	walk = 0
	walkm = 7
	Owner
	haveowner = 0
	speeding
	Move_Delay = 0


obj/Move()
	if(!src.move)
		return
	if(src.speeding <= 0)
		src.speeding = 0
		..()
		sleep(src.Move_Delay)
		src.speeding = 0
mob
	var/tmp
		target=""
		Oover
		handseals=0
mob/var
	seals=1
	sealtime=28
mob
	proc
		Handseals()
			if(src.Kaiten)
				return
			if(src.resting)
				return
			if(src.meditating)
				return
			if(src.sphere)
				return
			if(src.ingat)
				return
			if(src.firing)
				return
			if(src.handseals)
				return
			src.icon_state="Seals"
			src.firing=1
			if(prob(15))
				src.seals += rand(1,2)
			if(prob(10))
				src.sealtime --
			spawn(src.sealtime)
				src.handseals = 1
				src.firing=0
				src.icon_state=""
				return
		Chakragain()
			src.random=rand(1,5)
			if(src.random==4)
				src<<"Your base chakra rises!"
				src.Mchakra+=rand(5,10)

mob/shurikenmove
	verb
		KageShuriken()
			set category="Jutsus"
			set name = "Kage Shuriken No Jutsu"
			if(usr.firing)
				return
			if(usr.chakra<=100)
				usr<<"Not enough chakra."
				return
			for(var/obj/Shuriken/S in oview(3,usr))
				if(S.Gowner==usr)
					S.icon='kageshuriken.dmi'
					view(usr)<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Kage Shuriken No Jutsu!"
					usr.firing=1
					usr.chakra-=100
					usr.Chakragain()
					S.tai=usr.tai*2

mob/Buyou
	verb
		Kagebuyou(mob/M in view(10))
			set category = "Jutsus"
			set name = "Kage Konoha Buyou"
			if(usr.buoyu)
				return
			if(M==usr)
				return
			if(usr.resting)
				return
			if(usr.chakra<5)
				usr<<"You don´t have enough chakra."
				return
			var/nz = M.z
			var/nx = M.x
			var/ny = M.y
			usr.buoyu=1
			usr.overlays -= usr.hair
			var/turf/T=locate(nx,ny+1,nz)
			var/turf/T2=locate(nx,ny-1,nz)
			var/turf/T3=locate(nx+1,ny,nz)
			var/turf/T4=locate(nx-1,ny,nz)
			if(T&&T2&&T3&&T4&&T.density&&T2.density&&T3.density&&T4.density)
				usr<<"Sorry you can´t go neither any sides of [M]"
				return
			var/random = rand(1,10)
			if(random == 6||random==1)
				if(usr.tai<=10)
					usr.taiexp += rand(1,15)
					usr.exp += rand(1,10)
				if(usr.tai>10&&usr.tai<=30)
					usr.taiexp += rand(1,10)
					usr.exp += rand(1,7)
				if(usr.tai>30)
					usr.taiexp += rand(1,5)
					usr.exp += rand(1,5)
				usr.taiup()
				usr.Levelup()
			usr.chakra-=5
			if(M.dir==SOUTH)
				if(T.density==0)
					flick("zan",usr)
					sleep(2)
					usr.loc=locate(nx,ny+1,nz)
					if(M.dir==SOUTH)
						usr.dir=SOUTH
					if(M.dir==NORTH)
						usr.dir=NORTH
					if(M.dir==EAST)
						usr.dir=EAST
					if(M.dir==WEST)
						usr.dir=WEST
					if(M.dir==NORTHEAST)
						usr.dir=NORTHEAST
					if(M.dir==NORTHWEST)
						usr.dir=NORTHWEST
					if(M.dir==SOUTHEAST)
						usr.dir=SOUTHEAST
					if(M.dir==SOUTHWEST)
						usr.dir=SOUTHWEST
					usr.buoyu=0
					usr.overlays += usr.hair
					return
			if(M.dir==NORTH)
				if(T2.density==0)
					flick("zan",usr)
					sleep(2)
					usr.loc=locate(nx,ny-1,nz)
					if(M.dir==SOUTH)
						usr.dir=SOUTH
					if(M.dir==NORTH)
						usr.dir=NORTH
					if(M.dir==EAST)
						usr.dir=EAST
					if(M.dir==WEST)
						usr.dir=WEST
					if(M.dir==NORTHEAST)
						usr.dir=NORTHEAST
					if(M.dir==NORTHWEST)
						usr.dir=NORTHWEST
					if(M.dir==SOUTHEAST)
						usr.dir=SOUTHEAST
					if(M.dir==SOUTHWEST)
						usr.dir=SOUTHWEST
					usr.buoyu=0
					usr.overlays += usr.hair
					return
			if(M.dir==WEST)
				if(T3.density==0)
					flick("zan",usr)
					sleep(2)
					usr.loc=locate(nx+1,ny,nz)
					if(M.dir==SOUTH)
						usr.dir=SOUTH
					if(M.dir==NORTH)
						usr.dir=NORTH
					if(M.dir==EAST)
						usr.dir=EAST
					if(M.dir==WEST)
						usr.dir=WEST
					if(M.dir==NORTHEAST)
						usr.dir=NORTHEAST
					if(M.dir==NORTHWEST)
						usr.dir=NORTHWEST
					if(M.dir==SOUTHEAST)
						usr.dir=SOUTHEAST
					if(M.dir==SOUTHWEST)
						usr.dir=SOUTHWEST
					usr.buoyu=0
					usr.overlays += usr.hair
					return
			if(M.dir==WEST)
				if(T4.density==0)
					flick("zan",usr)
					sleep(2)
					usr.loc=locate(nx-1,ny,nz)
					if(M.dir==SOUTH)
						usr.dir=SOUTH
					if(M.dir==NORTH)
						usr.dir=NORTH
					if(M.dir==EAST)
						usr.dir=EAST
					if(M.dir==WEST)
						usr.dir=WEST
					if(M.dir==NORTHEAST)
						usr.dir=NORTHEAST
					if(M.dir==NORTHWEST)
						usr.dir=NORTHWEST
					if(M.dir==SOUTHEAST)
						usr.dir=SOUTHEAST
					if(M.dir==SOUTHWEST)
						usr.dir=SOUTHWEST
					usr.buoyu=0
					usr.overlays += usr.hair
					return
			if(M.dir==SOUTHWEST)
				if(T.density==0)
					flick("zan",usr)
					sleep(2)
					usr.loc=locate(nx+1,ny+1,nz)
					if(M.dir==SOUTH)
						usr.dir=SOUTH
					if(M.dir==NORTH)
						usr.dir=NORTH
					if(M.dir==EAST)
						usr.dir=EAST
					if(M.dir==WEST)
						usr.dir=WEST
					if(M.dir==NORTHEAST)
						usr.dir=NORTHEAST
					if(M.dir==NORTHWEST)
						usr.dir=NORTHWEST
					if(M.dir==SOUTHEAST)
						usr.dir=SOUTHEAST
					if(M.dir==SOUTHWEST)
						usr.dir=SOUTHWEST
					usr.buoyu=0
					usr.overlays += usr.hair
					return
			if(M.dir==SOUTHEAST)
				if(T.density==0)
					flick("zan",usr)
					sleep(2)
					usr.loc=locate(nx-1,ny+1,nz)
					if(M.dir==SOUTH)
						usr.dir=SOUTH
					if(M.dir==NORTH)
						usr.dir=NORTH
					if(M.dir==EAST)
						usr.dir=EAST
					if(M.dir==WEST)
						usr.dir=WEST
					if(M.dir==NORTHEAST)
						usr.dir=NORTHEAST
					if(M.dir==NORTHWEST)
						usr.dir=NORTHWEST
					if(M.dir==SOUTHEAST)
						usr.dir=SOUTHEAST
					if(M.dir==SOUTHWEST)
						usr.dir=SOUTHWEST
					usr.buoyu=0
					usr.overlays += usr.hair
					return
			if(M.dir==NORTHWEST)
				if(T.density==0)
					flick("zan",usr)
					sleep(2)
					usr.loc=locate(nx+1,ny-1,nz)
					if(M.dir==SOUTH)
						usr.dir=SOUTH
					if(M.dir==NORTH)
						usr.dir=NORTH
					if(M.dir==EAST)
						usr.dir=EAST
					if(M.dir==WEST)
						usr.dir=WEST
					if(M.dir==NORTHEAST)
						usr.dir=NORTHEAST
					if(M.dir==NORTHWEST)
						usr.dir=NORTHWEST
					if(M.dir==SOUTHEAST)
						usr.dir=SOUTHEAST
					if(M.dir==SOUTHWEST)
						usr.dir=SOUTHWEST
					usr.buoyu=0
					usr.overlays += usr.hair
					return
			if(M.dir==NORTHEAST)
				if(T.density==0)
					flick("zan",usr)
					sleep(2)
					usr.loc=locate(nx-1,ny-1,nz)
					if(M.dir==SOUTH)
						usr.dir=SOUTH
					if(M.dir==NORTH)
						usr.dir=NORTH
					if(M.dir==EAST)
						usr.dir=EAST
					if(M.dir==WEST)
						usr.dir=WEST
					if(M.dir==NORTHEAST)
						usr.dir=NORTHEAST
					if(M.dir==NORTHWEST)
						usr.dir=NORTHWEST
					if(M.dir==SOUTHEAST)
						usr.dir=SOUTHEAST
					if(M.dir==SOUTHWEST)
						usr.dir=SOUTHWEST
					usr.buoyu=0
					usr.overlays += usr.hair
					return
			usr.buoyu=0
			usr.overlays += usr.hair


mob
	verb
		HengeNoJutsu(mob/M in oview(6))
			set category = "Jutsus"
			set name = "Transformation Jutsu"
			usr.Handseals()
			if(usr.Henge)
				return
			if(usr.firing)
				return
			if(usr.Kaiten)
				return
			if(usr.resting)
				return
			if(usr.inso)
				return
			if(!usr.handseals)
				return
			if(M&&M.kuchiyose)
				usr<<"Cannot Henge that."
				return
			else
				if(usr.hengeN>=100)
					view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Henge!"
					var/list/O = usr.overlays.Copy()
					usr.firing = 1
					usr.move = 0
					usr.chakra -= 10
					usr.Oicon=usr.icon
					usr.Henge=1
					usr.Chakragain()
					usr.hengeN += 1
					usr.firing = 0
					usr.overlays = usr.overlays.Remove(usr.overlays)
					usr.icon = M.icon
					flick("smoke2",usr)
					usr.overlays += M.overlays
					XD
						sleep(170)
						switch(input("Do you wish to revert from Henge?","Henge",) in list("Yes","No"))
							if("Yes")
								usr.overlays = null
								usr.overlays += usr.hair
								usr.Henge = 0
								usr.firing=0
								usr.overlays = O.Copy()
								usr.icon = usr.Oicon
								usr.random = rand(1,15)
								if(random == 5||random==1)
									usr.genexp += rand(1,10)
									usr.genup()
									usr.Skills()
									return
								return
							if("No")
								usr.chakra-=20
								usr.random = rand(1,22)
								if(random == 5||random==1)
									usr.genexp += rand(1,10)
									usr.genup()
									usr.Chakragain()
									usr.Skills()
								goto XD
				else
					view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Henge!"
					var/list/O = usr.overlays.Copy()
					usr.firing = 1
					usr.move = 0
					usr.chakra -= 10
					usr.Henge=1
					usr.hengeN += 1
					usr.Oicon=usr.icon
					usr.move = 1
					usr.firing = 0
					usr.overlays = usr.overlays.Remove(usr.overlays)
					if(M)
						usr.icon = M.icon
					flick("smoke2",usr)
					usr.overlays += M.overlays
					sleep(170)
					usr.overlays = null
					usr.overlays += usr.hair
					usr.Henge = 0
					usr.overlays = O.Copy()
					usr.icon = usr.Oicon
					usr.random = rand(1,15)
					if(random == 5||random==1)
						usr.genexp += rand(1,10)
						usr.genup()
						usr.Skills()


mob/var/tmp/goingmange=0
mob/uchiha
	verb
		MangekyouPrep()
			set category="Doujutsu"
			set name = "Use Mangekyou"
			if(usr.firing)
				return
			usr.goingmange=1
			usr.sharingan3=0
			if(usr.Suses<=100)
				usr.Suses=101
			usr<<"Now use Sharingan"
			sleep(100)
			usr.goingmange=0
			usr.sharingan3=1

mob/uchiha
	verb
		Sharingan() // Verb used for firing the beam
			set category = "Doujutsu"
			set name = "Sharingan"
			if(!usr.shari&&usr.sharingan1&&!usr.ST) // If the mob's firing var is one...
				usr.overlays+='sharinganthing.dmi'
				usr.icon_state="1"
				usr.overlays += 'sharingan.dmi'
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#8b0000>S</FONT><FONT COLOR=#a0050f>h</FONT><FONT COLOR=#b40b1f>a</FONT><FONT COLOR=#c9102e>r</FONT><FONT COLOR=#dc143c>i</FONT><FONT COLOR=#ca1131>n</FONT><FONT COLOR=#b80d25>g</FONT><FONT COLOR=#a50818>a</FONT><FONT COLOR=#93040c>n</FONT><FONT COLOR=#800000>!</FONT>"
				view()<<"[usr]'s pupils dialate to form Stage 1 Sharingan"
				usr.shari=1
				usr.ST=1
				usr.Suses += 1
				usr.verbs += /mob/uchiha/verb/Sharinganilluminate
				usr.see_invisible = 1
				sleep(15)
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				if(usr.Mnin>=500&&usr.Suses>=50)
					usr.sharingan2=1
					usr.sharingan1=0
				return
			if(!usr.shari&&usr.sharingan2&&!usr.ST) // If the firing var isn't 1...
				usr.overlays+='sharinganthing.dmi'
				usr.overlays += 'sharingan.dmi'
				usr.icon_state="2"
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#8b0000>S</FONT><FONT COLOR=#a0050f>h</FONT><FONT COLOR=#b40b1f>a</FONT><FONT COLOR=#c9102e>r</FONT><FONT COLOR=#dc143c>i</FONT><FONT COLOR=#ca1131>n</FONT><FONT COLOR=#b80d25>g</FONT><FONT COLOR=#a50818>a</FONT><FONT COLOR=#93040c>n</FONT><FONT COLOR=#800000>!</FONT>"
				view()<<"[usr]'s pupils dialate to form Stage 2 Sharingan"
				usr.shari=1
				usr.ST=1
				usr.Suses += 1
				usr.verbs += /mob/uchiha/verb/Sharinganilluminate
				usr.verbs += /mob/uchiha/verb/Sharinganfreeze
				usr.see_invisible = 1
				sleep(15)
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				if(usr.Mnin>=700&&usr.Mgen>=400&&usr.Suses>=70)
					usr.sharingan3=1
					usr.sharingan2=0
				return
			if(!usr.shari&&usr.sharingan3&&!usr.ST) // If the firing var isn't 1...
				usr.overlays+='sharinganthing.dmi'
				usr.overlays += 'sharingan.dmi'
				usr.icon_state="3"
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#8b0000>S</FONT><FONT COLOR=#a0050f>h</FONT><FONT COLOR=#b40b1f>a</FONT><FONT COLOR=#c9102e>r</FONT><FONT COLOR=#dc143c>i</FONT><FONT COLOR=#ca1131>n</FONT><FONT COLOR=#b80d25>g</FONT><FONT COLOR=#a50818>a</FONT><FONT COLOR=#93040c>n</FONT><FONT COLOR=#800000>!</FONT>"
				view()<<"[usr]'s pupils dialate to form Stage 3 Sharingan"
				usr.Suses += 1
				usr.shari=1
				usr.ST=1
				usr.Move_Delay=0
				usr.nin=usr.nin*4
				usr.verbs += /mob/uchiha/verb/Sharinganilluminate
				usr.verbs += /mob/uchiha/verb/Sharinganfreeze
				usr.see_invisible = 1
				sleep(15)
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				if(usr.Mnin>=1000&&usr.Mgen>=700&&usr.Suses>=100&&usr.kills>=150)
					usr.sharingan3=0
					usr.mangekyou=1
				return
			if(!usr.shari&&usr.mangekyou&&!usr.ST&&usr.goingmange)
				usr.overlays+='sharinganthing.dmi'
				usr.overlays += 'sharingan.dmi'
				usr.icon_state="mangekyou"
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#696969>M</FONT><FONT COLOR=#766065>a</FONT><FONT COLOR=#835760>n</FONT><FONT COLOR=#904d5b>g</FONT><FONT COLOR=#9d4456>e</FONT><FONT COLOR=#a93a50>k</FONT><FONT COLOR=#b6314b>y</FONT><FONT COLOR=#c32746>o</FONT><FONT COLOR=#d01e41>u</FONT><FONT COLOR=#dc143c> </FONT><FONT COLOR=#d41337>S</FONT><FONT COLOR=#ca1131>h</FONT><FONT COLOR=#c10f2b>a</FONT><FONT COLOR=#b80d25>r</FONT><FONT COLOR=#af0b1f>i</FONT><FONT COLOR=#a50818>n</FONT><FONT COLOR=#9c0612>g</FONT><FONT COLOR=#93040c>a</FONT><FONT COLOR=#890206>n</FONT><FONT COLOR=#800000>!</FONT>"
				view()<<"[usr]'s pupils dialate to form the Legendary Mangekyou Sharingan"
				usr.Suses += 1
				usr.shari=1
				usr.gen=usr.gen*5
				usr.nin=usr.nin*5
				usr.ST=1
				usr.sharingan3=1
				usr.verbs += /mob/uchiha/verb/Sharinganilluminate
				usr.verbs += /mob/uchiha/verb/Sharinganfreeze
				usr.verbs += /mob/uchiha/verb/Amateratsu
				usr.verbs += /mob/uchiha/verb/Tsukiyomi
				usr.see_invisible = 1
				sleep(15)
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				usr.overlays-='sharinganthing.dmi'
				return
			else if(usr.shari)
				usr<<"You release your Sharingan."
				usr.overlays -= 'sharingan.dmi'
				usr.overlays -= 'sharingan.dmi'
				usr.overlays -= 'sharingan.dmi'
				usr.overlays -= 'sharingan.dmi'
				usr.see_invisible = 0
				usr.nin=usr.Mnin
				usr.gen=usr.Mgen
				usr.goingmange=0
				usr.verbs -= /mob/uchiha/verb/Sharinganilluminate
				usr.verbs -= /mob/uchiha/verb/Sharinganfreeze
				usr.verbs -= /mob/uchiha/verb/Amateratsu
				usr.verbs -= /mob/uchiha/verb/Tsukiyomi
				usr.shari = 0
				sleep(50)
				usr.ST=0
				return




mob/uchiha
	verb
		Sharinganfreeze(mob/m in oview(1)) // Verb used for firing the beam
			set category = "Doujutsu"
			set name = "Sharingan Freeze"
			if(usr.firing)
				return
			if(m)
				if(m.froze)
					usr << "Their already froze.."
					return
			if(usr.froze)
				return
			else // If the firing var isn't 1...
				m<<"Your frozen by [usr]'s Sharingan."
				usr<<"You froze [m] with your Sharingan"
				usr.froze=1
				var/Sleeptime = round(usr.gen -m.gen)
				if(Sleeptime <= 1)
					Sleeptime = 55
					m.Frozen = 1
					m.froze = 1
					sleep(Sleeptime)
					if(m)
						m.Frozen=0
						m<<"You break out of [usr]'s Sharingan freeze."
						usr<<"[m] is free from your Sharingan!"
						m.froze = 0
					sleep(8)
				else
					m.Frozen=1
					m.froze = 1
					sleep(Sleeptime)
					if(m)
						m.Frozen=0
						m<<"You break out of [usr]'s Sharingan freeze."
						usr<<"[m] is free from your Sharingan!"
						m.froze = 0
					sleep(8)
				sleep(100)
				usr.froze=0
				if(m)
					m.froze=0
mob/var/tmp/illuminating=0
mob/uchiha
	verb
		Sharinganilluminate() // Verb used for firing the beam
			set category = "Doujutsu"
			set name = "Illuminate"
			if(usr.illuminating)
				return
			usr.illuminating=1
			for(var/mob/npcs/Bunshin/B in world)
				if(usr.Mnin <= 25&&usr.Mgen <= 15&&usr.Mtai <= 20)
					usr << "Sorry not strong enough......"
					return
				else
					var/image/I = image('Bun.dmi',B,"googa")
					src << I
					usr.illu = 1
			for(var/mob/npcs/KBunshin/K in world)
				if(usr.Mnin <= 100&&usr.Mgen <= 111&&usr.Mtai <= 100)
					usr << "no......"
					return
				else
					var/image/I = image('Bun.dmi',K,"googa")
					src << I
					usr.illu = 1
			for(var/mob/M in oview(10))
				M.invisibility = 0
				if(M.kawa)
					M.overlays+='Bun.dmi'
			sleep(40)
			usr.illuminating=0

mob/proc/stoptsuki()
	hurt
		if(src.stop == 0)
			src.health -= times
			src<<"[dude] tsukiyomi does [times] damage."
			dude<<"tsukiyomi does [times]."
			sleep(20)
			goto hurt
		else
			return
//Tsukiyomi

mob/uchiha
	verb
		Tsukiyomi(mob/m in oview(1)) // Verb used for firing the beam
			set category = "Doujutsu"
			set name = "Tsukiyomi"
			if(usr.firing)
				return
			if(m.froze)
				return
			if(usr.froze)
				return
			else
				usr.froze=1
				m<<"Your frozen by [usr]'s Tsukiyomi."
				usr<<"You froze [m] with your Tsukiyomi"
				var/Sleeptime = round(usr.gen -m.gen/2)
				if(Sleeptime <= 1)
					Sleeptime = 1
					m.Frozen=1
					m.firing=1
					m.froze = 1
					sleep(Sleeptime)
					if(m)
						m.move=1
						m<<"You break out of [usr]'s Tsukiyomi."
						usr<<"[m] is free from your Tsukiyomi!"
						m.froze = 0
						m.Frozen=0
						m.firing=0
						sleep(20)
						var/damage = round(usr.gen*5)
						m.health -= damage
						view(usr)<<"[m] has recieved [damage] damage from Tsukiyomi"
						m.firing=0
						if(m.health <=0)
							m.Death(usr)
				else
					m.Frozen=1
					m.froze = 1
					sleep(Sleeptime)
					if(m)
						m<<"You break out of [usr]'s Tsukiyomi."
						usr<<"[m] is free from your Tsukiyomi!"
						m.froze = 0
						m.Frozen=0
						sleep(20)
						var/damage = round(usr.gen*5)
						m.health -= damage
						view(usr)<<"[m] has recieved [damage] damage from Tsukiyomi"
						if(m.health <=0)
							m.Death(usr)
						usr.froze = 0
				sleep(100)
				usr.froze=0
mob
	verb
		Kawariminojutsu() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Substitution Jutsu"
			usr.Handseals()
			if(usr.firing||usr.kawa||usr.Kaiten)
				return
			if(usr.inso)
				usr<<"Not while in Soutourou!"
				return
			if(!usr.handseals)

				return
			if(usr.chakra <= 5)
				usr<<"Not enough chakra."
				return
			else
				if(usr.KawaN >= 12)
					var/list/O = usr.overlays.Copy()
					usr.firing = 1
					usr.KawaN += 1
					usr.move = 0
					usr.kawa = 1
					usr.Oicon=usr.icon
					usr.chakra -= 5
					sleep(1)
					usr.move = 1
					var/mob/L=new/mob/Klog
					L.name = usr.name
					L.icon = usr.icon
					L.dir=usr.dir
					L.health=99999999999
					L.overlays = usr.overlays
					L.loc=locate(usr.x,usr.y,usr.z)
					usr.overlays = usr.overlays.Remove(usr.overlays)
					usr.icon = 'blank.dmi'
					usr.Chakragain()
					sleep(52)
					usr.icon = usr.Oicon
					usr.overlays = O.Copy()
					usr.overlays += usr.hair
					usr.overlays-='Bun.dmi'
					usr.overlays-='Bun.dmi'
					usr.overlays-='Bun.dmi'
					usr.overlays-='Bun.dmi'
					usr.overlays-='Bun.dmi'
					usr.kawa = 0
					L.overlays = L.overlays.Remove(L.overlays)
					L.icon = 'Landscapes.dmi'
					L.icon_state="Log"
					flick("smoke2",L)
					sleep(30)
					flick("smoke2",L)
					sleep(8)
					del(L)
					usr.random = rand(1,20)
					if(random == 5||random==1||random==10)
						usr.Mnin += 1
						usr.nin += 1
						usr.Skills()
						usr<<"<font color = blue>Your nin increased!"
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						var/list/O = usr.overlays.Copy()
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
						usr.move = 0
						usr.KawaN += 1
						usr.kawa = 1 // Disables the mob's movement
						usr.chakra -= 5
						sleep(1)
						usr.move = 1
						usr.Oicon=usr.icon
						var/mob/L=new/mob/Klog
						L.name = usr.name
						L.icon = usr.icon
						L.overlays = usr.overlays
						L.loc=locate(usr.x,usr.y,usr.z)
						usr.icon = 'blank.dmi' // Sets the mob's icon_state
						usr.overlays = usr.overlays.Remove(usr.overlays)
						sleep(52)
						usr.icon = usr.Oicon
						usr.overlays = O.Copy()
						usr.overlays += usr.hair
						usr.kawa = 0
						L.overlays = L.overlays.Remove(L.overlays)
						L.icon= 'Landscapes.dmi'
						L.icon_state = "Log"
						flick("smoke2",L)
						sleep(30)
						flick("smoke2",L)
						sleep(8)
						del(L)
						usr.random = rand(1,20)
						if(random == 5||random==1||random==10)
							usr.Mnin += 1
							usr.nin += 1
							usr.Skills()
							usr<<"<font color = blue>Your nin increased!"
			sleep(30)
			usr.firing =0
			usr.kawa=0
mob/var/tmp
	kawa = 0

mob
	Klog
		name = "Log"
		icon = 'Landscapes.dmi'
		icon_state= "Log"




mob
	verb/BunshinNoJutsu()
		set name = "Clone Jutsu"
		set desc = "Create a clone"
		set category = "Jutsus"
		usr.Handseals()
		if(usr.firing)
			return
		if(usr.chakra <= 10)
			usr << "Not enough chakra!"
			return
		if(usr.inso)
			return
		if(usr.Kaiten)
			return
		if(usr.meditating)
			return
		if(usr.resting)
			return
		if(usr.gate1)
			return
		if(usr.gate2)
			return
		if(usr.gate3)
			return
		if(usr.gate4)
			return
		if(usr.gate5)
			return
		if(usr.gate6)
			return
		if(usr.gate7)
			return
		if(usr.gate8)
			return
		if(!usr.handseals)

			return
		else
			if(usr.BunshinN >= 50)
				view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#c0c0c0>B</FONT><FONT COLOR=#b2b1ba>u</FONT><FONT COLOR=#a3a0b4>n</FONT><FONT COLOR=#9490ad>s</FONT><FONT COLOR=#857fa6>h</FONT><FONT COLOR=#756f9f>i</FONT><FONT COLOR=#665e99>n</FONT><FONT COLOR=#574e92> </FONT><FONT COLOR=#483d8b>N</FONT><FONT COLOR=#4d468c>o</FONT><FONT COLOR=#524e8d> </FONT><FONT COLOR=#57578d>J</FONT><FONT COLOR=#5d5f8e>u</FONT><FONT COLOR=#62688f>t</FONT><FONT COLOR=#677090>s</FONT><FONT COLOR=#6c7990>u</FONT><FONT COLOR=#708090>!</FONT>"
				usr.firing = 1
				usr.KillBunshin()
				var/mob/npcs/Bunshin/A = new /mob/npcs/Bunshin
				var/mob/npcs/Bunshin/B = new /mob/npcs/Bunshin
				var/mob/npcs/Bunshin/C = new /mob/npcs/Bunshin
				usr.BunshinN += 1
				usr.Chakragain()
				usr.bunshin += 3
				if(A)
					A.original = usr
					A.icon = usr.icon
					A.name = "[usr]"
					A.overlays += usr.overlays
					A.loc = locate(usr.x+1, usr.y, usr.z)
					flick("smoke2",A)
					A.max_exp = 2
					A.exp = 2
					A.health = 1
				sleep(5)
				if(B)
					B.original = usr
					B.icon = usr.icon
					B.name = "[usr]"
					B.overlays += usr.overlays
					B.loc = locate(usr.x+2, usr.y, usr.z)
					flick("smoke2",B)
					B.max_exp = 2
					B.exp = 2
					B.health = 1
				sleep(5)
				if(C)
					C.original = usr
					C.icon = usr.icon
					C.name = "[usr]"
					C.overlays += usr.overlays
					C.loc = locate(usr.x+3, usr.y, usr.z)
					flick("smoke2",C)
					C.max_exp = 2
					C.exp = 2
					C.health = 1
				sleep(15)
				usr.firing=0
				usr.chakra -= 10
				usr.random = rand(1,3)
				if(usr.random == 1)
					usr.genexp += rand(1,10)
					usr.Skills()
					usr.genup()
				if(usr.random == 3)
					usr.Mgen += 1
					usr.gen += 1
					usr.Skills()
					usr<<"<font color = blue>Your genjutsu increased!"
			else
				usr.random = rand (1,4)
				if(usr.random == 1||usr.random == 4)
					view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#c0c0c0>B</FONT><FONT COLOR=#b2b1ba>u</FONT><FONT COLOR=#a3a0b4>n</FONT><FONT COLOR=#9490ad>s</FONT><FONT COLOR=#857fa6>h</FONT><FONT COLOR=#756f9f>i</FONT><FONT COLOR=#665e99>n</FONT><FONT COLOR=#574e92> </FONT><FONT COLOR=#483d8b>N</FONT><FONT COLOR=#4d468c>o</FONT><FONT COLOR=#524e8d> </FONT><FONT COLOR=#57578d>J</FONT><FONT COLOR=#5d5f8e>u</FONT><FONT COLOR=#62688f>t</FONT><FONT COLOR=#677090>s</FONT><FONT COLOR=#6c7990>u</FONT><FONT COLOR=#708090>!</FONT>"
					usr.firing = 1
					var/mob/npcs/Bunshin/A = new /mob/npcs/Bunshin
					var/mob/npcs/Bunshin/B = new /mob/npcs/Bunshin
					usr.KillBunshin()
					usr.BunshinN += 1
					usr.Chakragain()
					usr.bunshin += 2
					if(A)
						A.original = usr
						A.icon = usr.icon
						A.name = "[usr]"
						A.overlays += usr.overlays
						A.loc = locate(usr.x+1, usr.y, usr.z)
						flick("smoke2",A)
						A.max_exp = 2
						A.exp = 2
						A.health = 1
					sleep(5)
					if(B)
						B.original = usr
						B.icon = usr.icon
						B.name = "[usr]"
						B.overlays += usr.overlays
						B.loc = locate(usr.x-1, usr.y, usr.z)
						flick("smoke2",B)
						B.max_exp = 2
						B.exp = 2
						B.health = 1
					sleep(15)
					usr.firing=0
					usr.chakra -= 10
					usr.random = rand(1,3)
					if(usr.random == 1)
						usr.genexp += rand(1,7)
						usr.Skills()
						usr.genup()
					if(usr.random == 2)
						usr.Mgen += 1
						usr.gen += 1
						usr.Skills()
						usr<<"<font color = blue>Your genjutsu increased!"

obj

	bunshins
		KageBunshinnojutsu//being worked on dont use
			verb/KageBunshinNoJutsu()
				set name = "Kage Bunshin no jutsu"
				set desc = "Create a clone that can attack"
				set category = "Jutsus"
				usr.Handseals()
				if(usr.firing)
					return
				if(usr.chakra <= 15)
					usr << "Not enough chakra!"
					return
				if(usr.inso)
					return
				if(usr.meditating)
					return
				if(usr.resting)
					return
				if(usr.Kaiten)
					return
				if(usr.gate1)
					return
				if(usr.gate2)
					return
				if(usr.gate3)
					return
				if(usr.gate4)
					return
				if(usr.gate5)
					return
				if(usr.gate6)
					return
				if(usr.gate7)
					return
				if(usr.gate8)
					return
				if(!usr.handseals)

					return
				else
					if(usr.KbunshinN >= 50)
						usr.firing = 1
						usr.KillBunshin()
						view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#ff4500>K</FONT><FONT COLOR=#ff4f00>a</FONT><FONT COLOR=#ff5800>g</FONT><FONT COLOR=#ff6200>e</FONT><FONT COLOR=#ff6c00> </FONT><FONT COLOR=#ff7600>B</FONT><FONT COLOR=#ff7f00>u</FONT><FONT COLOR=#ff8900>n</FONT><FONT COLOR=#ff9300>s</FONT><FONT COLOR=#ff9c00>h</FONT><FONT COLOR=#ffa500>i</FONT><FONT COLOR=#f3a30d>n</FONT><FONT COLOR=#e69f1a> </FONT><FONT COLOR=#d99c28>N</FONT><FONT COLOR=#cc9835>o</FONT><FONT COLOR=#bf9542> </FONT><FONT COLOR=#b1914f>J</FONT><FONT COLOR=#a48e5c>u</FONT><FONT COLOR=#978a69>t</FONT><FONT COLOR=#8a8777>s</FONT><FONT COLOR=#7d8384>u</FONT><FONT COLOR=#708090>!</FONT>"
						var/mob/npcs/Bunshin/K = new /mob/npcs/KBunshin
						var/mob/npcs/Bunshin/L = new /mob/npcs/KBunshin
						var/mob/npcs/Bunshin/M = new /mob/npcs/KBunshin
						var/mob/npcs/Bunshin/N = new /mob/npcs/KBunshin
						usr.KbunshinN += 1
						usr.bunshin += 4
						usr.Chakragain()
						if(K)
							K.name = "[usr.name]"
							K.original = usr
							K.icon = usr.icon
							K.overlays += usr.overlays
							K.loc = locate(usr.x-1, usr.y, usr.z)
							flick("smoke2",K)
							K.max_exp = 2
							K.exp = 2
							K.tai = usr.tai/5
							K.health = 1
						sleep(5)
						if(L)
							L.name = "[usr.name]"
							L.original = usr
							L.icon = usr.icon
							L.overlays += usr.overlays
							L.loc = locate(usr.x-2, usr.y, usr.z)
							flick("smoke2",L)
							L.max_exp = 2
							L.exp = 2
							L.tai = usr.tai/5
							L.health = 1
						sleep(5)
						if(M)
							M.name = "[usr.name]"
							M.original = usr
							M.icon = usr.icon
							M.overlays += usr.overlays
							M.loc = locate(usr.x+1, usr.y, usr.z)
							flick("smoke2",M)
							M.max_exp = 2
							M.exp = 2
							M.tai = usr.tai/5
							M.health = 1
						sleep(5)
						if(N)
							N.name = "[usr.name]"
							N.original = usr
							N.icon = usr.icon
							N.overlays += usr.overlays
							N.loc = locate(usr.x+2, usr.y, usr.z)
							flick("smoke2",N)
							N.max_exp = 2
							N.exp = 2
							N.tai = usr.tai/5
							N.health = 1
						sleep(14)
						usr.firing=0
						usr.chakra -= 15
						usr.random = rand(1,3)
						if(usr.random == 1)
							usr.ninexp += rand(1,10)
							usr.Skills()
							usr.ninup()
						if(usr.random == 3)
							usr.Mnin += 1
							usr.nin+= 1
							usr.Skills()
							usr<<"<font color = blue>Your Ninjutsu increased!"
					else
						usr.random = rand (1,4)
						if(usr.random == 1||usr.random == 4)
							view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#ff4500>K</FONT><FONT COLOR=#ff4f00>a</FONT><FONT COLOR=#ff5800>g</FONT><FONT COLOR=#ff6200>e</FONT><FONT COLOR=#ff6c00> </FONT><FONT COLOR=#ff7600>B</FONT><FONT COLOR=#ff7f00>u</FONT><FONT COLOR=#ff8900>n</FONT><FONT COLOR=#ff9300>s</FONT><FONT COLOR=#ff9c00>h</FONT><FONT COLOR=#ffa500>i</FONT><FONT COLOR=#f3a30d>n</FONT><FONT COLOR=#e69f1a> </FONT><FONT COLOR=#d99c28>N</FONT><FONT COLOR=#cc9835>o</FONT><FONT COLOR=#bf9542> </FONT><FONT COLOR=#b1914f>J</FONT><FONT COLOR=#a48e5c>u</FONT><FONT COLOR=#978a69>t</FONT><FONT COLOR=#8a8777>s</FONT><FONT COLOR=#7d8384>u</FONT><FONT COLOR=#708090>!</FONT>"
							usr.firing = 1
							usr.KillBunshin()
							var/mob/npcs/Bunshin/K = new /mob/npcs/KBunshin
							var/mob/npcs/Bunshin/M = new /mob/npcs/KBunshin
							usr.KbunshinN += 1
							usr.Chakragain()
							usr.bunshin += 2
							sleep(5)
							if(K)
								K.name = "[usr.name]"
								K.original = usr
								K.icon = usr.icon
								K.overlays += usr.overlays
								K.loc = locate(usr.x-1, usr.y, usr.z)
								flick("smoke2",K)
								K.max_exp = 2
								K.exp = 2
								K.tai = usr.tai/5
								K.health = 1
							sleep(5)
							if(M)
								M.name = "[usr.name]"
								M.original = usr
								M.icon = usr.icon
								M.overlays += usr.overlays
								M.loc = locate(usr.x+1, usr.y, usr.z)
								flick("smoke2",M)
								M.max_exp = 2
								M.exp = 2
								M.tai = usr.tai/5
								M.health = 1
							sleep(14)
							usr.firing=0
							usr.chakra -= 15
							usr.random = rand(1,3)
							if(usr.random == 1)
								usr.ninexp += rand(1,10)
								usr.Skills()
								usr.ninup()
							if(usr.random == 2)
								usr.Mnin += 1
								usr.nin+= 1
								usr.Skills()
								usr<<"<font color = blue>Your Ninjutsu increased!"


obj/var/tmp
	Gowner=""
	moved=0
	total=6
	nin=0



mob/katon
	verb
		KatonHousenka() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Phoenix Flower Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten)
				return
			if(usr.inso)
				return
			if(usr.chakra <= 20)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)
				return
			else
				if(usr.Katon2N >= 40)
					if(usr.dir==NORTHWEST)
						usr<<"You can't face a diagnol and use this move"
						return
					if(usr.dir==SOUTHWEST)
						usr<<"You can't face a diagnol and use this move"
						return
					if(usr.dir==NORTHEAST)
						usr<<"You can't face a diagnol and use this move"
						return
					if(usr.dir==SOUTHEAST)
						usr<<"You can't face a diagnol and use this move"
						return
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
					usr.Katon2N += 1
					usr.chakra -= 100
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#ff4500>K</FONT><FONT COLOR=#f44a0c>a</FONT><FONT COLOR=#e84f18>t</FONT><FONT COLOR=#dc5424>o</FONT><FONT COLOR=#d05930>n</FONT><FONT COLOR=#c45e3c>:</FONT><FONT COLOR=#b86349> </FONT><FONT COLOR=#ac6855>H</FONT><FONT COLOR=#a06d61>o</FONT><FONT COLOR=#94726d>u</FONT><FONT COLOR=#887779>s</FONT><FONT COLOR=#7c7c85>e</FONT><FONT COLOR=#708090>n</FONT><FONT COLOR=#727685>k</FONT><FONT COLOR=#756c79>a</FONT><FONT COLOR=#77616d> </FONT><FONT COLOR=#795661>N</FONT><FONT COLOR=#7c4b55>o</FONT><FONT COLOR=#7e4149> </FONT><FONT COLOR=#80363c>J</FONT><FONT COLOR=#832b30>u</FONT><FONT COLOR=#852024>t</FONT><FONT COLOR=#871618>s</FONT><FONT COLOR=#8a0b0c>u</FONT><FONT COLOR=#8b0000>!</FONT>"
					var/obj/katonG/D = new /obj/katonG
					var/obj/katonG/S = new /obj/katonG
					var/obj/katonG/K = new /obj/katonG
					var/obj/katonG/L = new /obj/katonG
					usr.Chakragain()
					var/obj/katonG/N = new /obj/katonG
					if(K)
						K.loc = usr.loc
						K.nin=usr.nin
						K.name="[usr]"
						K.Gowner=usr
						walk(K,usr.dir)
					sleep(6)
					if(D)
						D.loc = usr.loc
						if(usr.dir==NORTH)
							D.x-=1
						if(usr.dir==SOUTH)
							D.x+=1
						if(usr.dir==WEST)
							D.y+=1
						if(usr.dir==EAST)
							D.y-=1
						D.nin=usr.nin
						D.name="[usr]"
						D.Gowner=usr
						walk(D,usr.dir)
					sleep(6)
					if(L)
						L.loc = usr.loc
						if(usr.dir==NORTH)
							L.x+=1
						if(usr.dir==SOUTH)
							L.x-=1
						if(usr.dir==WEST)
							L.y-=1
						if(usr.dir==EAST)
							L.y+=1
						L.nin=usr.nin
						L.name="[usr]"
						L.Gowner=usr
						walk(L,usr.dir)
					sleep(13)
					if(S)
						S.loc = usr.loc
						if(usr.dir==NORTH)
							S.x+=1
						if(usr.dir==SOUTH)
							S.x-=1
						if(usr.dir==WEST)
							S.y-=1
						if(usr.dir==EAST)
							S.y+=1
						S.Move_Delay=1.4
						S.nin=usr.nin
						S.name="[usr]"
						S.Gowner=usr
						walk(S,usr.dir)
					sleep(5)
					if(N)
						N.loc = usr.loc
						if(usr.dir==NORTH)
							N.x-=1
						if(usr.dir==SOUTH)
							N.x+=1
						if(usr.dir==WEST)
							N.y+=1
						if(usr.dir==EAST)
							N.y-=1
						N.Move_Delay=1.4
						N.nin=usr.nin
						N.name="[usr]"
						N.Gowner=usr
						walk(N,usr.dir)
					sleep(10)
					usr.firing = 0
					sleep(21)
					del(D)
					del(S)
					del(K)
					del(L)
					del(N)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								usr.ChakraC+=ccgain
								if(usr.ChakraC>100)
									usr.ChakraC=100
								usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								usr.ChakraC+=ccgain
								if(usr.ChakraC>100)
									usr.ChakraC=100
								usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						if(usr.dir==NORTHWEST)
							usr<<"You can't face a diagnol and use this move"
							return
						if(usr.dir==SOUTHWEST)
							usr<<"You can't face a diagnol and use this move"
							return
						if(usr.dir==NORTHEAST)
							usr<<"You can't face a diagnol and use this move"
							return
						if(usr.dir==SOUTHEAST)
							usr<<"You can't face a diagnol and use this move"
							return
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
						usr.chakra -= 20
						usr.Katon2N += 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#ff4500>K</FONT><FONT COLOR=#f44a0c>a</FONT><FONT COLOR=#e84f18>t</FONT><FONT COLOR=#dc5424>o</FONT><FONT COLOR=#d05930>n</FONT><FONT COLOR=#c45e3c>:</FONT><FONT COLOR=#b86349> </FONT><FONT COLOR=#ac6855>H</FONT><FONT COLOR=#a06d61>o</FONT><FONT COLOR=#94726d>u</FONT><FONT COLOR=#887779>s</FONT><FONT COLOR=#7c7c85>e</FONT><FONT COLOR=#708090>n</FONT><FONT COLOR=#727685>k</FONT><FONT COLOR=#756c79>a</FONT><FONT COLOR=#77616d> </FONT><FONT COLOR=#795661>N</FONT><FONT COLOR=#7c4b55>o</FONT><FONT COLOR=#7e4149> </FONT><FONT COLOR=#80363c>J</FONT><FONT COLOR=#832b30>u</FONT><FONT COLOR=#852024>t</FONT><FONT COLOR=#871618>s</FONT><FONT COLOR=#8a0b0c>u</FONT><FONT COLOR=#8b0000>!</FONT>"
						var/obj/katonG/D = new /obj/katonG
						var/obj/katonG/S = new /obj/katonG
						var/obj/katonG/K = new /obj/katonG
						var/obj/katonG/L = new /obj/katonG
						usr.Chakragain()
						var/obj/katonG/N = new /obj/katonG
						if(K)
							K.loc = usr.loc
							K.nin=usr.nin
							K.name="[usr]"
							K.Move_Delay=1.4
							K.Gowner=usr
							walk(K,usr.dir)
						sleep(6)
						if(D)
							D.loc = usr.loc
							if(usr.dir==NORTH)
								D.x-=1
							if(usr.dir==SOUTH)
								D.x+=1
							if(usr.dir==WEST)
								D.y+=1
							if(usr.dir==EAST)
								D.y-=1
							D.nin=usr.nin
							D.name="[usr]"
							D.Move_Delay=1.4
							D.Gowner=usr
							walk(D,usr.dir)
						sleep(6)
						if(L)
							L.loc = usr.loc
							if(usr.dir==NORTH)
								L.x+=1
							if(usr.dir==SOUTH)
								L.x-=1
							if(usr.dir==WEST)
								L.y-=1
							if(usr.dir==EAST)
								L.y+=1
							L.Move_Delay=1.4
							L.nin=usr.nin
							L.name="[usr]"
							L.Gowner=usr
							walk(L,usr.dir)
						sleep(13)
						if(S)
							S.loc = usr.loc
							if(usr.dir==NORTH)
								S.x+=1
							if(usr.dir==SOUTH)
								S.x-=1
							if(usr.dir==WEST)
								S.y-=1
							if(usr.dir==EAST)
								S.y+=1
							S.Move_Delay=1.4
							S.nin=usr.nin
							S.name="[usr]"
							S.Gowner=usr
							walk(S,usr.dir)
						sleep(5)
						if(N)
							N.loc = usr.loc
							if(usr.dir==NORTH)
								N.x-=1
							if(usr.dir==SOUTH)
								N.x+=1
							if(usr.dir==WEST)
								N.y+=1
							if(usr.dir==EAST)
								N.y-=1
							N.Move_Delay=1.4
							N.nin=usr.nin
							N.name="[usr]"
							N.Gowner=usr
							walk(N,usr.dir)
						sleep(10)
						usr.firing = 0
						sleep(21)
						del(D)
						del(S)
						del(K)
						del(L)
						del(N)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,5)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									usr.ChakraC+=ccgain
									if(usr.ChakraC>100)
										usr.ChakraC=100
									usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
						else
							usr.random = rand(1,5)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									usr.ChakraC+=ccgain
									if(usr.ChakraC>100)
										usr.ChakraC=100
									usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
					usr<<"You failed to use Katon Housenka"


mob/hyuuga
	verb
		Jyuken()
			set category = "Jutsus"
			set name = "Jyuken"
			set desc = "The Hyuuga fighting style"
			if(!usr.Jyuken)
				usr<<"Your now useing jyuken."
				usr.Jyuken = 1
				usr.Tekken = 0
				usr.Basic = 0
				return
			if(usr.Jyuken)
				usr<<"Your already useing jyuken."
				return
mob
	verb
		Tekken()
			set category = "Taijutsu"
			set name = "Tekken"
			set desc = "A common fighting style"
			if(!usr.Tekken)
				usr<<"Your now useing tekken."
				usr.Jyuken = 0
				usr.Tekken = 1
				usr.Basic = 0
				return
			if(usr.Tekken)
				usr<<"Your already useing Tekken."
				return
mob
	verb
		Basic()
			set category = "Taijutsu"
			set name = "Basic"
			set desc = "The basic fighting style."
			if(!usr.Basic)
				usr<<"Your now useing the basic fighting style."
				usr.Jyuken = 0
				usr.Tekken = 0
				usr.Basic = 1
				return
			if(usr.Basic)
				usr<<"Your already useing the basic fighting style."
				return


mob/katon
	verb
		KatonKaryuuEndan(mob/m in oview(usr)) // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Katon Karyuu Endan"
			usr.Handseals()
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
			if(usr.chakra <= 24)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(usr.Katon3N >= 100)
					usr.firing = 24 // Sets the firing var to 1, so he cant fire another beam
					usr.Katon3N += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#8b0000>K</FONT><FONT COLOR=#980000>a</FONT><FONT COLOR=#a50000>t</FONT><FONT COLOR=#b20000>o</FONT><FONT COLOR=#bf0000>n</FONT><FONT COLOR=#cc0000>:</FONT><FONT COLOR=#d90000> </FONT><FONT COLOR=#e60000>K</FONT><FONT COLOR=#f30000>a</FONT><FONT COLOR=#ff0000>r</FONT><FONT COLOR=#fc0206>y</FONT><FONT COLOR=#f9040c>u</FONT><FONT COLOR=#f50612>u</FONT><FONT COLOR=#f20818> </FONT><FONT COLOR=#ee0b1f>E</FONT><FONT COLOR=#ea0d25>n</FONT><FONT COLOR=#e70f2b>d</FONT><FONT COLOR=#e31131>a</FONT><FONT COLOR=#e01337>n</FONT><FONT COLOR=#dc143c>!</FONT>"
					var/obj/katonEndan/K = new /obj/katonEndan
					usr.target=m
					K.loc = usr.loc
					K.nin=usr.nin
					K.name="[usr]"
					K.Gowner=usr
					usr.Chakragain()
					K.Move_Delay=2
					walk_towards(K,m)
					sleep(1)
					usr.move = 1
					sleep(10)
					usr.firing = 0
					sleep(21)
					del(K)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								usr.ChakraC+=ccgain
								if(usr.ChakraC>100)
									usr.ChakraC=100
								usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								usr.ChakraC+=ccgain
								if(usr.ChakraC>100)
									usr.ChakraC=100
								usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.firing = 24 // Sets the firing var to 1, so he cant fire another beam
						usr.Katon3N += 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#8b0000>K</FONT><FONT COLOR=#980000>a</FONT><FONT COLOR=#a50000>t</FONT><FONT COLOR=#b20000>o</FONT><FONT COLOR=#bf0000>n</FONT><FONT COLOR=#cc0000>:</FONT><FONT COLOR=#d90000> </FONT><FONT COLOR=#e60000>K</FONT><FONT COLOR=#f30000>a</FONT><FONT COLOR=#ff0000>r</FONT><FONT COLOR=#fc0206>y</FONT><FONT COLOR=#f9040c>u</FONT><FONT COLOR=#f50612>u</FONT><FONT COLOR=#f20818> </FONT><FONT COLOR=#ee0b1f>E</FONT><FONT COLOR=#ea0d25>n</FONT><FONT COLOR=#e70f2b>d</FONT><FONT COLOR=#e31131>a</FONT><FONT COLOR=#e01337>n</FONT><FONT COLOR=#dc143c>!</FONT>"
						var/obj/katonEndan/K = new /obj/katonEndan
						usr.target=m
						K.loc = usr.loc
						K.nin=usr.nin
						usr.Chakragain()
						K.name="[usr]"
						K.Move_Delay=2
						K.Gowner=usr
						walk_towards(K,m)
						sleep(1)
						sleep(10)
						usr.firing = 0
						sleep(21)
						del(K)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									usr.ChakraC+=ccgain
									if(usr.ChakraC>100)
										usr.ChakraC=100
									usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									usr.ChakraC+=ccgain
									if(usr.ChakraC>100)
										usr.ChakraC=100
									usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
					else
						usr<<"You failed to use Katon Karyuu Endan"





mob/Suiton
	verb
		SuitonDaibakufunoJutsu() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Suiton Daibakufu no Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten) // If the mob's firing var is one...
				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
				return
			if(!usr.handseals)

				return
			if(usr.chakra <= 25)
				usr<<"You dont have enough chakra!"
				return
			else // If the firing var isn't 1...
				if(SN >= 100)
					usr.chakra -= 25
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
					usr.SN += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#87ceeb>S</FONT><FONT COLOR=#90d1ec>u</FONT><FONT COLOR=#98d4ed>i</FONT><FONT COLOR=#a1d7ee>t</FONT><FONT COLOR=#a9daee>o</FONT><FONT COLOR=#b2ddef>n</FONT><FONT COLOR=#bae0f0>:</FONT><FONT COLOR=#c3e4f1> </FONT><FONT COLOR=#cbe7f2>D</FONT><FONT COLOR=#d4eaf3>a</FONT><FONT COLOR=#dcedf3>i</FONT><FONT COLOR=#e5f0f4>b</FONT><FONT COLOR=#edf3f5>a</FONT><FONT COLOR=#f5f5f5>k</FONT><FONT COLOR=#e3f6f6>u</FONT><FONT COLOR=#d0f7f7>f</FONT><FONT COLOR=#bdf8f8>u</FONT><FONT COLOR=#aaf8f8> </FONT><FONT COLOR=#97f9f9>N</FONT><FONT COLOR=#84fafa>o</FONT><FONT COLOR=#72fbfb> </FONT><FONT COLOR=#5ffcfc>J</FONT><FONT COLOR=#4cfdfd>u</FONT><FONT COLOR=#39fdfd>t</FONT><FONT COLOR=#26fefe>s</FONT><FONT COLOR=#13ffff>u</FONT><FONT COLOR=#00ffff>!</FONT>"
					var/obj/SuitonDaib/K = new /obj/SuitonDaib
					K.loc = usr.loc
					K.nin=usr.nin
					K.dir = usr.dir
					K.name="[usr]"
					K.Move_Delay=3
					K.Move_Delay=2
					usr.Chakragain()
					K.Gowner=usr
					walk(K,usr.dir)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								usr.ChakraC+=ccgain
								if(usr.ChakraC>100)
									usr.ChakraC=100
								usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								usr.ChakraC+=ccgain
								if(usr.ChakraC>100)
									usr.ChakraC=100
								usr<<"[usr] you gained [ccgain] Chakra control..."
					sleep(10)
					usr.firing = 0
					usr.Move_Delay = usr.Savedspeed
					sleep(45)
					del(K)
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 25
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
						usr.SN += 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#87ceeb>S</FONT><FONT COLOR=#90d1ec>u</FONT><FONT COLOR=#98d4ed>i</FONT><FONT COLOR=#a1d7ee>t</FONT><FONT COLOR=#a9daee>o</FONT><FONT COLOR=#b2ddef>n</FONT><FONT COLOR=#bae0f0>:</FONT><FONT COLOR=#c3e4f1> </FONT><FONT COLOR=#cbe7f2>D</FONT><FONT COLOR=#d4eaf3>a</FONT><FONT COLOR=#dcedf3>i</FONT><FONT COLOR=#e5f0f4>b</FONT><FONT COLOR=#edf3f5>a</FONT><FONT COLOR=#f5f5f5>k</FONT><FONT COLOR=#e3f6f6>u</FONT><FONT COLOR=#d0f7f7>f</FONT><FONT COLOR=#bdf8f8>u</FONT><FONT COLOR=#aaf8f8> </FONT><FONT COLOR=#97f9f9>N</FONT><FONT COLOR=#84fafa>o</FONT><FONT COLOR=#72fbfb> </FONT><FONT COLOR=#5ffcfc>J</FONT><FONT COLOR=#4cfdfd>u</FONT><FONT COLOR=#39fdfd>t</FONT><FONT COLOR=#26fefe>s</FONT><FONT COLOR=#13ffff>u</FONT><FONT COLOR=#00ffff>!</FONT>"
						var/obj/SuitonDaib/K = new /obj/SuitonDaib
						K.loc = usr.loc
						K.nin=usr.nin
						K.dir = usr.dir
						K.name="[usr]"
						usr.Chakragain()
						K.Gowner=usr
						walk(K,usr.dir)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									usr.ChakraC+=ccgain
									if(usr.ChakraC>100)
										usr.ChakraC=100
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									usr.ChakraC+=ccgain
									if(usr.ChakraC>100)
										usr.ChakraC=100
									usr<<"[usr] you gained [ccgain] Chakra control..."
						sleep(10)
						usr.firing = 0
						usr.Move_Delay = usr.Savedspeed
						sleep(45)
						del(K)
mob/Suiton
	verb
		SuitonSuiryuudannoJutsu(mob/m in oview(usr)) // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Suiton Suiryuudan no Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten) // If the mob's firing var is one...

				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
			if(usr.onwater == 0)
				usr<<"You must be on water to do this!"
				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(usr.SS >= 52)
					usr.chakra -= 15
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
					usr.move = 0 // Disables the mob's movement
					usr.SS += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#87ceeb>S</FONT><FONT COLOR=#90d1ec>u</FONT><FONT COLOR=#98d4ed>i</FONT><FONT COLOR=#a1d7ee>t</FONT><FONT COLOR=#a9daee>o</FONT><FONT COLOR=#b2ddef>n</FONT><FONT COLOR=#bae0f0>:</FONT><FONT COLOR=#c3e4f1> </FONT><FONT COLOR=#cbe7f2>Su</FONT><FONT COLOR=#d4eaf3>i</FONT><FONT COLOR=#dcedf3>r</FONT><FONT COLOR=#e5f0f4>y</FONT><FONT COLOR=#edf3f5>u</FONT><FONT COLOR=#f5f5f5>u</FONT><FONT COLOR=#e3f6f6>d</FONT><FONT COLOR=#d0f7f7>a</FONT><FONT COLOR=#bdf8f8>n</FONT><FONT COLOR=#aaf8f8> </FONT><FONT COLOR=#97f9f9>N</FONT><FONT COLOR=#84fafa>o</FONT><FONT COLOR=#72fbfb> </FONT><FONT COLOR=#5ffcfc>J</FONT><FONT COLOR=#4cfdfd>u</FONT><FONT COLOR=#39fdfd>t</FONT><FONT COLOR=#26fefe>s</FONT><FONT COLOR=#13ffff>u</FONT><FONT COLOR=#00ffff>!</FONT>"
					var/obj/Suiryedan/K = new /obj/Suiryedan
					usr.target=m
					usr.Chakragain()
					K.loc = usr.loc
					K.nin=usr.nin
					K.Move_Delay=2
					K.name="[usr]"
					K.Gowner=usr
					walk_towards(K,m)
					sleep(1)
					usr.move = 1
					sleep(8)
					usr.firing = 0
					sleep(21)
					del(K)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							if(usr.ninexp >= usr.mninexp)
								usr.Mnin += 1
								usr.nin += 1
								usr.ninexp=0
								usr<<"<font color = blue>Your ninjutsu increased!"
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 15
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
						usr.move = 0 // Disables the mob's movement
						usr.SS += 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#87ceeb>S</FONT><FONT COLOR=#90d1ec>u</FONT><FONT COLOR=#98d4ed>i</FONT><FONT COLOR=#a1d7ee>t</FONT><FONT COLOR=#a9daee>o</FONT><FONT COLOR=#b2ddef>n</FONT><FONT COLOR=#bae0f0>:</FONT><FONT COLOR=#c3e4f1> </FONT><FONT COLOR=#cbe7f2>Su</FONT><FONT COLOR=#d4eaf3>i</FONT><FONT COLOR=#dcedf3>r</FONT><FONT COLOR=#e5f0f4>y</FONT><FONT COLOR=#edf3f5>u</FONT><FONT COLOR=#f5f5f5>u</FONT><FONT COLOR=#e3f6f6>d</FONT><FONT COLOR=#d0f7f7>a</FONT><FONT COLOR=#bdf8f8>n</FONT><FONT COLOR=#aaf8f8> </FONT><FONT COLOR=#97f9f9>N</FONT><FONT COLOR=#84fafa>o</FONT><FONT COLOR=#72fbfb> </FONT><FONT COLOR=#5ffcfc>J</FONT><FONT COLOR=#4cfdfd>u</FONT><FONT COLOR=#39fdfd>t</FONT><FONT COLOR=#26fefe>s</FONT><FONT COLOR=#13ffff>u</FONT><FONT COLOR=#00ffff>!</FONT>"
						var/obj/Suiryedan/K = new /obj/Suiryedan
						usr.target=m
						K.loc = usr.loc
						K.nin=usr.nin
						K.name="[usr]"
						K.Gowner=usr
						K.Move_Delay=2
						walk_towards(K,m)
						usr.Chakragain()
						sleep(1)
						usr.move = 1
						sleep(8)
						usr.firing = 0
						sleep(21)
						del(K)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return





obj
	kriga
		icon = 'mist.dmi'//dont have a base icon so cant make weights icon!lol
		layer = 999999999999

mob/mist
	verb
		KirigakurenoJutsu(mob/M in oview(11)) // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Kirigakure no Jutsu"
			usr.Handseals()
			if(usr.firing) // If the mob's firing var is one...
				return
			if(usr.inso)
				usr<<"Not while in Soutourou!"
			if(usr.chakra <= 10)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
				M.Frozen = 1 // Disables the mob's movement
				usr.chakra -= 10
				usr.Chakragain()
				view()<<"[usr] creates a shroud of mist around [M]!"
				var/obj/kriga/F = new /obj/kriga/
				var/obj/kriga/G = new /obj/kriga/
				var/obj/kriga/H = new /obj/kriga/
				var/obj/kriga/I = new /obj/kriga/
				var/obj/kriga/J = new /obj/kriga/
				var/obj/kriga/L = new /obj/kriga/
				var/obj/kriga/A = new /obj/kriga/
				var/obj/kriga/B = new /obj/kriga/
				var/obj/kriga/M2 = new /obj/kriga/
				var/obj/kriga/N = new /obj/kriga/
				var/obj/kriga/O = new /obj/kriga/
				var/obj/kriga/P = new /obj/kriga/
				var/obj/kriga/D = new /obj/kriga/
				var/obj/kriga/E = new /obj/kriga/
				var/obj/kriga/C = new /obj/kriga/
				var/obj/kriga/K = new /obj/kriga/
				var/obj/kriga/Q = new /obj/kriga/
				var/obj/kriga/R = new /obj/kriga/
				var/obj/kriga/S = new /obj/kriga/
				var/obj/kriga/T = new /obj/kriga/
				var/obj/kriga/W = new /obj/kriga/
				var/obj/kriga/X = new /obj/kriga/
				var/obj/kriga/Y = new /obj/kriga/
				var/obj/kriga/Z = new /obj/kriga/
				var/obj/kriga/AB = new /obj/kriga/
				var/obj/kriga/AC = new /obj/kriga/
				var/obj/kriga/AD = new /obj/kriga/
				var/obj/kriga/AE = new /obj/kriga/
				var/obj/kriga/AF = new /obj/kriga/
				var/obj/kriga/AG = new /obj/kriga/
				var/obj/kriga/AH = new /obj/kriga/
				var/obj/kriga/AI = new /obj/kriga/
				var/obj/kriga/AJ = new /obj/kriga/
				var/obj/kriga/AK = new /obj/kriga/
				var/obj/kriga/AL = new /obj/kriga/
				var/obj/kriga/AM = new /obj/kriga/
				var/obj/kriga/AN = new /obj/kriga/
				var/obj/kriga/AO = new /obj/kriga/
				var/obj/kriga/AP = new /obj/kriga/
				var/obj/kriga/AQ = new /obj/kriga/
				var/obj/kriga/AR = new /obj/kriga/
				var/obj/kriga/AS = new /obj/kriga/
				var/obj/kriga/AT = new /obj/kriga/
				var/obj/kriga/AU = new /obj/kriga/
				var/obj/kriga/AV = new /obj/kriga/
				var/obj/kriga/AW = new /obj/kriga/
				var/obj/kriga/AX= new /obj/kriga/
				var/obj/kriga/AY = new /obj/kriga/
				var/obj/kriga/AZ = new /obj/kriga/
				K.loc = locate(M.x,M.y,M.z)
				A.loc = locate(M.x+1,M.y,M.z)
				C.loc = locate(M.x-1,M.y,M.z)
				B.loc = locate(M.x,M.y+1,M.z)
				D.loc = locate(M.x,M.y-1,M.z)
				E.loc = locate(M.x+1,M.y+1,M.z)
				F.loc = locate(M.x-1,M.y-1,M.z)
				G.loc = locate(M.x-1,M.y+1,M.z)
				H.loc = locate(M.x+1,M.y-1,M.z)
				I.loc = locate(M.x+2,M.y,M.z)
				J.loc = locate(M.x-2,M.y,M.z)
				L.loc = locate(M.x,M.y+2,M.z)
				M2.loc = locate(M.x,M.y-2,M.z)
				N.loc = locate(M.x+2,M.y+2,M.z)
				O.loc = locate(M.x-2,M.y-2,M.z)
				P.loc = locate(M.x-2,M.y+2,M.z)
				Q.loc = locate(M.x+2,M.y-2,M.z)
				R.loc = locate(M.x+3,M.y,M.z)
				S.loc = locate(M.x-3,M.y,M.z)
				T.loc = locate(M.x,M.y+3,M.z)
				W.loc = locate(M.x,M.y-3,M.z)
				X.loc = locate(M.x+3,M.y+3,M.z)
				Y.loc = locate(M.x-3,M.y-3,M.z)
				Z.loc = locate(M.x-3,M.y+3,M.z)
				AB.loc = locate(M.x-3,M.y-2,M.z)
				AC.loc = locate(M.x+3,M.y+2,M.z)
				AD.loc = locate(M.x+3,M.y-2,M.z)
				AE.loc = locate(M.x-3,M.y+2,M.z)
				AF.loc = locate(M.x+2,M.y+3,M.z)
				AG.loc = locate(M.x-2,M.y-3,M.z)
				AH.loc = locate(M.x-2,M.y+3,M.z)
				AI.loc = locate(M.x+2,M.y-3,M.z)
				AJ.loc = locate(M.x-1,M.y-2,M.z)
				AK.loc = locate(M.x+1,M.y+2,M.z)
				AL.loc = locate(M.x+1,M.y-2,M.z)
				AM.loc = locate(M.x-1,M.y+2,M.z)
				AN.loc = locate(M.x+2,M.y+1,M.z)
				AO.loc = locate(M.x-2,M.y-1,M.z)
				AP.loc = locate(M.x-2,M.y+1,M.z)
				AQ.loc = locate(M.x+2,M.y-1,M.z)
				AR.loc = locate(M.x-1,M.y-3,M.z)
				AS.loc = locate(M.x+1,M.y+3,M.z)
				AT.loc = locate(M.x+1,M.y-3,M.z)
				AU.loc = locate(M.x-1,M.y+3,M.z)
				AV.loc = locate(M.x+3,M.y+1,M.z)
				AW.loc = locate(M.x-3,M.y-1,M.z)
				AX.loc = locate(M.x-3,M.y+1,M.z)
				AY.loc = locate(M.x+3,M.y-1,M.z)
				AZ.loc = locate(M.x+3,M.y-3,M.z)
				sleep(1)
				sleep(usr.gen/7)
				del(K)
				del(A)
				del(B)
				del(C)
				del(D)
				del(E)
				del(F)
				del(G)
				del(H)
				del(I)
				del(J)
				del(L)
				del(M2)
				del(N)
				del(O)
				del(P)
				del(Q)
				del(R)
				del(S)
				del(T)
				del(W)
				del(X)
				del(Y)
				del(Z)
				del(AB)
				del(AC)
				del(AD)
				del(AE)
				del(AF)
				del(AG)
				del(AH)
				del(AI)
				del(AJ)
				del(AK)
				del(AL)
				del(AM)
				del(AN)
				del(AO)
				del(AP)
				del(AQ)
				del(AR)
				del(AS)
				del(AT)
				del(AU)
				del(AV)
				del(AW)
				del(AX)
				del(AY)
				del(AZ)
				if(M)
					M.Frozen = 0
				sleep(100)
				usr.firing=0
				if(usr.Mnin <= usr.cap)
					usr.random = rand(1,6)
					if(random == 5||random==1)
						usr.ninexp += rand(1,10)
						usr.ninup()
						usr.Skills()
						var/ccrandom=rand(1,15)
						if(ccrandom==4||ccrandom==10)
							var/ccgain=rand(1,3)
							if(usr.ChakraC>=100)
								usr.ChakraC=100
								return
							else
								usr.ChakraC+=ccgain
								usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						return
				else
					usr.random = rand(1,20)
					if(random == 5||random==1)
						usr.ninexp += rand(1,10)
						usr.ninup()
						usr.Skills()
						var/ccrandom=rand(1,15)
						if(ccrandom==4||ccrandom==10)
							var/ccgain=rand(1,3)
							if(usr.ChakraC>=100)
								usr.ChakraC=100
								return
							else
								usr.ChakraC+=ccgain
								usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						return

mob/Katon
	verb
		KatonRyuukanoJutsu() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Dragon Flame Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
			if(usr.chakra <= 30)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(usr.Katon4N >= 165)
					usr.chakra -= 30
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#dc143c>K</FONT><FONT COLOR=#d8163b>a</FONT><FONT COLOR=#d3183a>t</FONT><FONT COLOR=#ce1a38>o</FONT><FONT COLOR=#c91c36>n</FONT><FONT COLOR=#c41e34>:</FONT><FONT COLOR=#be2133> </FONT><FONT COLOR=#b92331>R</FONT><FONT COLOR=#b4252f>y</FONT><FONT COLOR=#af272d>u</FONT><FONT COLOR=#aa292c>u</FONT><FONT COLOR=#a52a2a>k</FONT><FONT COLOR=#a62a2a>a</FONT><FONT COLOR=#a82929> </FONT><FONT COLOR=#a92929>N</FONT><FONT COLOR=#aa2828>o</FONT><FONT COLOR=#ab2727> </FONT><FONT COLOR=#ad2626>J</FONT><FONT COLOR=#ae2525>u</FONT><FONT COLOR=#af2424>t</FONT><FONT COLOR=#b02424>s</FONT><FONT COLOR=#b22323>u</FONT><FONT COLOR=#b22222>!</FONT>"
					usr.Katon4N += 1
					var/obj/KRyuuka/K = new /obj/KRyuuka
					K.loc = usr.loc
					K.nin=usr.nin
					K.Move_Delay=2
					usr.Chakragain()
					K.dir = usr.dir
					K.name="[usr]"
					K.Gowner=usr
					walk(K,usr.dir)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					sleep(10)
					usr.firing = 0
					sleep(45)
					del(K)
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 30
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
						usr.Katon4N += 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#dc143c>K</FONT><FONT COLOR=#d8163b>a</FONT><FONT COLOR=#d3183a>t</FONT><FONT COLOR=#ce1a38>o</FONT><FONT COLOR=#c91c36>n</FONT><FONT COLOR=#c41e34>:</FONT><FONT COLOR=#be2133> </FONT><FONT COLOR=#b92331>R</FONT><FONT COLOR=#b4252f>y</FONT><FONT COLOR=#af272d>u</FONT><FONT COLOR=#aa292c>u</FONT><FONT COLOR=#a52a2a>k</FONT><FONT COLOR=#a62a2a>a</FONT><FONT COLOR=#a82929> </FONT><FONT COLOR=#a92929>N</FONT><FONT COLOR=#aa2828>o</FONT><FONT COLOR=#ab2727> </FONT><FONT COLOR=#ad2626>J</FONT><FONT COLOR=#ae2525>u</FONT><FONT COLOR=#af2424>t</FONT><FONT COLOR=#b02424>s</FONT><FONT COLOR=#b22323>u</FONT><FONT COLOR=#b22222>!</FONT>"
						var/obj/KRyuuka/K = new /obj/KRyuuka
						K.loc = usr.loc
						K.nin=usr.nin
						usr.Chakragain()
						K.dir = usr.dir
						K.name="[usr]"
						K.Move_Delay=2
						K.Gowner=usr
						walk(K,usr.dir)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						sleep(10)
						usr.firing = 0
						usr.Move_Delay = usr.Savedspeed
						sleep(45)
						del(K)
					else
						usr<<"You failed to use Katon Ryuuka no Jutsu."
mob/uchiha
	verb
		Amateratsu() // Verb used for firing the beam
			set category = "Doujutsu"
			set name = "Amaterasu"
			usr.Handseals()
			if(usr.firing) // If the mob's firing var is one...
				usr << "You must wait before using this."
				return
			if(usr.chakra <= 1500&&usr.health >= 20000)
				usr<<"You dont have enough power!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(usr.AmaN >= 1000)
					usr.chakra -= 10000
					usr.health -= 21456
					if(usr.health<=0)
						usr.Death(usr)
					if(usr.chakra<=0)
						usr.chakra = 0
					AmaN += 1
					usr.firing = 1
					var/obj/AMA/K = new /obj/AMA
					K.loc = usr.loc
					K.nin=usr.nin
					K.dir = usr.dir
					usr.Chakragain()
					K.name="[usr]"
					K.Gowner=usr
					walk(K,usr.dir)
					sleep(600)
					usr.firing = 0
					usr.Move_Delay = usr.Savedspeed
					del(K)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 10000
						usr.health -= 25199
						if(usr.health<=0)
							usr.Death(usr)
						if(usr.chakra<=0)
							usr.chakra=0
						AmaN += 1
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
						var/obj/AMA/K = new /obj/AMA
						K.loc = usr.loc
						usr.Chakragain()
						K.nin=usr.nin
						K.dir = usr.dir
						K.name="[usr]"
						K.Gowner=usr
						walk(K,usr.dir)
						sleep(600)
						usr.firing = 0
						usr.Move_Delay = usr.Savedspeed
						del(K)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
					else
						usr<<"You failed to use Amaterasu."
mob/pain
	verb
		SennenGoroshi()
			set name = "1000 Years of Death"
			set desc = ""
			set category = "Jutsus"
			for(var/mob/M in get_step(usr,usr.dir))
				if(M.ingat)
					return
				if(usr.firing)
					return
				if (M.intank)
					return
				if (usr.Kaiten)
					return
				if (M.sphere)
					usr<<"Your attack bounces off of the sand!"
					return
				if(usr.inso)
					usr<<"Not while in Soutourou!"
					return
				if (M.Kaiten)
					var/damage = round(usr.Mtai)
					usr <<"You attack [M] but their kaiten reflects the damage back at you."
					usr.firing = 1
					M <<"You reflect [usr]'s attack causing them to hurt themselfs."
					usr.health -= damage
					usr.Death(M)
				else					//otherwise...
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#808080>F</FONT><FONT COLOR=#888888>o</FONT><FONT COLOR=#8f8f8f>r</FONT><FONT COLOR=#979797>b</FONT><FONT COLOR=#9e9e9e>i</FONT><FONT COLOR=#a6a6a6>d</FONT><FONT COLOR=#adadad>d</FONT><FONT COLOR=#b5b5b5>e</FONT><FONT COLOR=#bcbcbc>n</FONT><FONT COLOR=#c4c4c4> </FONT><FONT COLOR=#cbcbcb>J</FONT><FONT COLOR=#d3d3d3>u</FONT><FONT COLOR=#dadada>t</FONT><FONT COLOR=#e2e2e2>s</FONT><FONT COLOR=#e9e9e9>u</FONT><FONT COLOR=#f1f1f1>:</FONT><FONT COLOR=#f8f8f8> </FONT><FONT COLOR=#ffffff>1</FONT><FONT COLOR=#f8f9fa>0</FONT><FONT COLOR=#f0f2f4>0</FONT><FONT COLOR=#e8ebee>0</FONT><FONT COLOR=#e0e4e8> </FONT><FONT COLOR=#d8dde2>Y</FONT><FONT COLOR=#d0d6dc>e</FONT><FONT COLOR=#c8cfd6>a</FONT><FONT COLOR=#c0c8d0>r</FONT><FONT COLOR=#b7c0c9>s</FONT><FONT COLOR=#afb9c3> </FONT><FONT COLOR=#a7b2bd>O</FONT><FONT COLOR=#9fabb7>f</FONT><FONT COLOR=#97a4b1> </FONT><FONT COLOR=#8f9dab>P</FONT><FONT COLOR=#8796a5>a</FONT><FONT COLOR=#7f8f9f>i</FONT><FONT COLOR=#778899>n</FONT>"
					usr << "You attack [M] with Sennen Goroshi!"
					usr.firing = 1
					var/damage = round(usr.Mtai)
					view() << "[usr] hits [M] with Sennen Goroshi for [damage] damage!"
					M.health -= damage
					M.Death(usr)
					if(usr.Mtai <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.taiexp += rand(1,10)
							usr.taiup()
							usr.Skills()
							sleep(30)
							usr.firing = 0
						else
							sleep(30)
							usr.firing = 0
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.taiexp += rand(1,10)
							usr.taiup()
							usr.Skills()
							sleep(30)
							usr.firing = 0
						else
							sleep(30)
							usr.firing = 0
							return
					sleep(30)
					usr.firing=0

mob/Inuzuka
	verb
		Gatsuuga()
			set category = "Jutsus"
			set name = "Tsuuga"
			if(usr.ingat == 1||usr.Kaiten == 1||usr.firing)

				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
			else .
				if(GatN >= 35)
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#708090>T</FONT><FONT COLOR=#a0abb5>s</FONT><FONT COLOR=#d0d5db>u</FONT><FONT COLOR=#ffffff>u</FONT><FONT COLOR=#d5d5d5>g</FONT><FONT COLOR=#ababab>a</FONT><FONT COLOR=#808080>!</FONT>"
					usr.GatN += 1
					usr.ingat = 1
					usr.overlays+='gatsuuga.dmi'
					usr.firing = 1
					sleep(30)
					usr.ingat = 0
					usr.overlays-='gatsuuga.dmi'
					usr.overlays-='gatsuuga.dmi'
					usr.overlays-='gatsuuga.dmi'
					usr.Move_Delay = usr.Savedspeed
					usr.firing = 0
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#708090>T</FONT><FONT COLOR=#a0abb5>s</FONT><FONT COLOR=#d0d5db>u</FONT><FONT COLOR=#ffffff>u</FONT><FONT COLOR=#d5d5d5>g</FONT><FONT COLOR=#ababab>a</FONT><FONT COLOR=#808080>!</FONT>"
						usr.GatN += 1
						usr.ingat = 1
						usr.overlays+='gatsuuga.dmi'
						usr.firing = 1
						usr.overlays += 'gatsuuga.dmi'
						sleep(30)
						usr.ingat = 0
						usr.overlays-='gatsuuga.dmi'
						usr.overlays-='gatsuuga.dmi'
						usr.overlays-='gatsuuga.dmi'
						usr.firing = 0
mob/Inuzuka
	verb
		Gatsuuga1()
			set category = "Jutsus"
			set name = "Gatsuuga"
			if(usr.ingat||usr.Kaiten||usr.firing)
				return
			if(usr.inso)
				return
			else
				for(var/mob/pet/P in oview(11,usr))
					if(!usr.Jujin)
						usr<<"You need to use Juujin Bunshin No Jutsu first!"
						return
					view(usr)<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Gatsuuga!"
					usr.GatN += 1
					usr.ingat = 1
					usr.overlays+='gatsuuga.dmi'
					usr.firing = 1
					P.ingat = 1
					P.overlays = null
					P.icon='gatsuuga.dmi'
					sleep(30)
					usr.firing=0
					usr.Jujin=0
					usr.overlays-='gatsuuga.dmi'
					usr.ingat = 0
					P.firing=0
					P.Jujin=0
					P.icon = 'dog.dmi'
					P.overlays = null
					P.ingat = 0
mob/Inuzuka
	verb
		Garouga()
			set category = "Jutsus"
			set name = "Garouga"
			if(usr.ingat == 1||usr.Kaiten == 1||usr.firing||usr.ingar == 1)

				return
			else .
				if(garN >= 145)
					if(usr.inso == 1)
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#87ceeb>G</FONT><FONT COLOR=#afdff2>a</FONT><FONT COLOR=#d8eff9>r</FONT><FONT COLOR=#ffffff>o</FONT><FONT COLOR=#c0f0ff>u</FONT><FONT COLOR=#80e0ff>g</FONT><FONT COLOR=#40cfff>a</FONT><FONT COLOR=#00bfff>!</FONT>"
						usr.garN += 1
						usr.ingar = 1
						usr.overlays+='Garouga .dmi'
						usr.firing = 1
						sleep(30)
						usr.overlays-='Garouga .dmi'
						usr.ingar = 0
						usr.firing = 0
					else
						usr<<"You must be in soutourou to use Garouga."
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						if(usr.inso == 1)
							view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#87ceeb>G</FONT><FONT COLOR=#afdff2>a</FONT><FONT COLOR=#d8eff9>r</FONT><FONT COLOR=#ffffff>o</FONT><FONT COLOR=#c0f0ff>u</FONT><FONT COLOR=#80e0ff>g</FONT><FONT COLOR=#40cfff>a</FONT><FONT COLOR=#00bfff>!</FONT>"
							usr.garN += 1
							usr.ingar = 1
							usr.overlays+='Garouga .dmi'
							usr.firing = 1
							sleep(30)
							usr.overlays-='Garouga .dmi'
							usr.ingar = 0
							usr.firing = 0
						else
							usr<<"You must be in soutourou to use Garouga."

mob/Bump(mob/src)
	..()
	if(istype(src,/turf))//if it's turf...
		return//return...
	if(istype(src,/obj))//if it's obj...
		return
	if(usr.Rasenganon)
		if(src.Rasenganon)
			if(usr.dir==NORTH)
				step(usr,SOUTH)
			if(usr.dir==SOUTH)
				step(usr,NORTH)
			if(usr.dir==WEST)
				step(usr,EAST)
			if(usr.dir==EAST)
				step(usr,WEST)
			if(src.dir==NORTH)
				step(src,SOUTH)
			if(src.dir==SOUTH)
				step(src,NORTH)
			if(src.dir==WEST)
				step(src,EAST)
			if(src.dir==EAST)
				step(src,WEST)
			usr.firing=0
			src.firing=0
			usr.Rasenganon=0
			src.Rasenganon=0
			return
		if(src.Chidorion&&!usr.battlingRC)
			usr.battlingRC=1
			src.battlingRC=1
			usr.Frozen=1
			src.Frozen=1
			usr.firing=1
			src.firing=1
			usr.overlays+='rasenganover.dmi'
			src.overlays+='chidoriover.dmi'
			sleep(10)
			if(usr.dir==NORTH&&src.dir==SOUTH)
				usr.y-=1
				src.y-=1
				sleep(20)
				usr.y+=1
				src.y+=1
				sleep(20)
				usr.y-=1
				src.y-=1
				sleep(20)
				usr.y+=1
				src.y+=1
				sleep(20)
				if(usr.RasenganD > src.ChidoriD)
					if(usr.tai > src.tai)
						if(usr.nin > src.nin)
							view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD]!"
							src.health -= usr.RasenganD
							src.battlingRC=0
							usr.battlingRC=0
							src.overlays-='chidoriover.dmi'
							usr.overlays-='rasenganover.dmi'
							usr.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.firing=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
						else
							view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD/1.5]!"
							src.health -= usr.RasenganD/1.5
							src.battlingRC=0
							usr.battlingRC=0
							src.overlays-='chidoriover.dmi'
							usr.overlays-='rasenganover.dmi'
							usr.firing=0
							src.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
					else
						view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD/2]!"
						src.health -= usr.RasenganD/2
						src.battlingRC=0
						usr.battlingRC=0
						src.overlays-='chidoriover.dmi'
						usr.overlays-='rasenganover.dmi'
						usr.firing=0
						src.Frozen=0
						usr.Frozen=0
						src.Chidorion=0
						usr.Rasenganon=0
						src.firing=0
						src.RasenganD=0
						usr.ChidoriD=0
						src.Death(usr)
						return
				else
					view()<<"[src] hit [usr] with their Chidori for [src.ChidoriD]!"
					usr.health -= src.ChidoriD
					src.battlingRC=0
					usr.battlingRC=0
					src.overlays-='chidoriover.dmi'
					usr.overlays-='rasenganover.dmi'
					usr.firing=0
					usr.Frozen=0
					src.Frozen=0
					src.Chidorion=0
					usr.Rasenganon=0
					src.firing=0
					src.RasenganD=0
					usr.ChidoriD=0
					usr.Death(src)
					return
			if(usr.dir==SOUTH&&src.dir==NORTH)
				usr.y-=1
				src.y-=1
				sleep(20)
				usr.y+=1
				src.y+=1
				sleep(20)
				usr.y-=1
				src.y-=1
				sleep(20)
				usr.y+=1
				src.y+=1
				sleep(20)
				if(usr.RasenganD > src.ChidoriD)
					if(usr.tai > src.tai)
						if(usr.nin > src.nin)
							view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD]!"
							src.health -= usr.RasenganD
							src.battlingRC=0
							usr.battlingRC=0
							src.overlays-='chidoriover.dmi'
							usr.overlays-='rasenganover.dmi'
							usr.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.firing=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
						else
							view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD/1.5]!"
							src.health -= usr.RasenganD/1.5
							src.battlingRC=0
							usr.battlingRC=0
							src.overlays-='chidoriover.dmi'
							usr.overlays-='rasenganover.dmi'
							usr.firing=0
							src.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
					else
						view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD/2]!"
						src.health -= usr.RasenganD/2
						src.battlingRC=0
						usr.battlingRC=0
						src.overlays-='chidoriover.dmi'
						usr.overlays-='rasenganover.dmi'
						usr.firing=0
						src.Frozen=0
						usr.Frozen=0
						src.Chidorion=0
						usr.Rasenganon=0
						src.firing=0
						src.RasenganD=0
						usr.ChidoriD=0
						src.Death(usr)
						return
				else
					view()<<"[src] hit [usr] with their Chidori for [src.ChidoriD]!"
					usr.health -= src.ChidoriD
					src.battlingRC=0
					usr.battlingRC=0
					src.overlays-='chidoriover.dmi'
					usr.overlays-='rasenganover.dmi'
					usr.firing=0
					usr.Frozen=0
					src.Frozen=0
					src.Chidorion=0
					usr.Rasenganon=0
					src.firing=0
					src.RasenganD=0
					usr.ChidoriD=0
					usr.Death(src)
					return
			if(usr.dir==WEST&&src.dir==EAST)
				usr.x-=1
				src.x-=1
				sleep(20)
				usr.x+=1
				src.x+=1
				sleep(20)
				usr.x-=1
				src.x-=1
				sleep(20)
				usr.x+=1
				src.x+=1
				sleep(20)
				if(usr.RasenganD > src.ChidoriD)
					if(usr.tai > src.tai)
						if(usr.nin > src.nin)
							view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD]!"
							src.health -= usr.RasenganD
							src.battlingRC=0
							usr.battlingRC=0
							src.overlays-='chidoriover.dmi'
							usr.overlays-='rasenganover.dmi'
							usr.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.firing=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
						else
							view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD/1.5]!"
							src.health -= usr.RasenganD/1.5
							src.battlingRC=0
							usr.battlingRC=0
							src.overlays-='chidoriover.dmi'
							usr.overlays-='rasenganover.dmi'
							usr.firing=0
							src.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
					else
						view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD/2]!"
						src.health -= usr.RasenganD/2
						src.battlingRC=0
						usr.battlingRC=0
						src.overlays-='chidoriover.dmi'
						usr.overlays-='rasenganover.dmi'
						usr.firing=0
						src.Frozen=0
						usr.Frozen=0
						src.Chidorion=0
						usr.Rasenganon=0
						src.firing=0
						src.RasenganD=0
						usr.ChidoriD=0
						src.Death(usr)
						return
				else
					view()<<"[src] hit [usr] with their Chidori for [src.ChidoriD]!"
					usr.health -= src.ChidoriD
					src.battlingRC=0
					usr.battlingRC=0
					src.overlays-='chidoriover.dmi'
					usr.overlays-='rasenganover.dmi'
					usr.firing=0
					usr.Frozen=0
					src.Frozen=0
					src.Chidorion=0
					usr.Rasenganon=0
					src.firing=0
					src.RasenganD=0
					usr.ChidoriD=0
					usr.Death(src)
					return
			if(usr.dir==EAST&&src.dir==WEST)
				usr.x-=1
				src.x-=1
				sleep(20)
				usr.x+=1
				src.x+=1
				sleep(20)
				usr.x-=1
				src.x-=1
				sleep(20)
				usr.x+=1
				src.x+=1
				sleep(20)
				if(usr.RasenganD > src.ChidoriD)
					if(usr.tai > src.tai)
						if(usr.nin > src.nin)
							view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD]!"
							src.health -= usr.RasenganD
							src.battlingRC=0
							usr.battlingRC=0
							src.overlays-='chidoriover.dmi'
							usr.overlays-='rasenganover.dmi'
							usr.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.firing=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
						else
							view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD/1.5]!"
							src.health -= usr.RasenganD/1.5
							src.battlingRC=0
							usr.battlingRC=0
							src.overlays-='chidoriover.dmi'
							usr.overlays-='rasenganover.dmi'
							usr.firing=0
							src.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
					else
						view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD/2]!"
						src.health -= usr.RasenganD/2
						src.battlingRC=0
						usr.battlingRC=0
						src.overlays-='chidoriover.dmi'
						usr.overlays-='rasenganover.dmi'
						usr.firing=0
						src.Frozen=0
						usr.Frozen=0
						src.Chidorion=0
						usr.Rasenganon=0
						src.firing=0
						src.RasenganD=0
						usr.ChidoriD=0
						src.Death(usr)
						return
				else
					view()<<"[src] hit [usr] with their Chidori for [src.ChidoriD]!"
					usr.health -= src.ChidoriD
					src.battlingRC=0
					usr.battlingRC=0
					src.overlays-='chidoriover.dmi'
					usr.overlays-='rasenganover.dmi'
					usr.firing=0
					usr.Frozen=0
					src.Frozen=0
					src.Chidorion=0
					usr.Rasenganon=0
					src.firing=0
					src.RasenganD=0
					usr.ChidoriD=0
					usr.Death(src)
					return
		else
			if(!src.Rasenganon&&!src.Chidorion)
				view()<<"[usr] hit [src] with their Rasengan for [usr.RasenganD]!"
				src.health -= usr.RasenganD
				usr.battlingRC=0
				src.battlingRC=0
				usr.firing=0
				usr.Rasenganon = 0
				usr.RasenganD = 0
				src.Death(usr)
				return
	if(usr.Chidorion)
		if(src.Chidorion)
			if(usr.dir==NORTH)
				step(usr,SOUTH)
			if(usr.dir==SOUTH)
				step(usr,NORTH)
			if(usr.dir==WEST)
				step(usr,EAST)
			if(usr.dir==EAST)
				step(usr,WEST)
			if(src.dir==NORTH)
				step(src,SOUTH)
			if(src.dir==SOUTH)
				step(src,NORTH)
			if(src.dir==WEST)
				step(src,EAST)
			if(src.dir==EAST)
				step(src,WEST)
			usr.firing=0
			src.firing=0
			usr.Chidorion=0
			src.Chidorion=0
			return
		if(src.Rasenganon&&!usr.battlingRC)
			usr.battlingRC=1
			src.battlingRC=1
			usr.Frozen=1
			src.Frozen=1
			usr.firing=1
			src.firing=1
			src.overlays+='rasenganover.dmi'
			usr.overlays+='chidoriover.dmi'
			sleep(10)
			if(usr.dir==NORTH&&src.dir==SOUTH)
				usr.y-=1
				src.y-=1
				sleep(20)
				usr.y+=1
				src.y+=1
				sleep(20)
				usr.y-=1
				src.y-=1
				sleep(20)
				usr.y+=1
				src.y+=1
				sleep(20)
				if(usr.ChidoriD > src.RasenganD)
					if(usr.tai > src.tai)
						if(usr.nin > src.nin)
							view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD]!"
							src.health -= usr.ChidoriD
							src.battlingRC=0
							usr.battlingRC=0
							usr.overlays-='chidoriover.dmi'
							src.overlays-='rasenganover.dmi'
							usr.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.firing=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
						else
							view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD/1.5]!"
							src.health -= usr.ChidoriD/1.5
							src.battlingRC=0
							usr.battlingRC=0
							usr.overlays-='chidoriover.dmi'
							src.overlays-='rasenganover.dmi'
							usr.firing=0
							src.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
					else
						view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD/2]!"
						src.health -= usr.ChidoriD/2
						src.battlingRC=0
						usr.battlingRC=0
						usr.overlays-='chidoriover.dmi'
						src.overlays-='rasenganover.dmi'
						usr.firing=0
						src.Frozen=0
						usr.Frozen=0
						src.Chidorion=0
						usr.Rasenganon=0
						src.firing=0
						src.RasenganD=0
						usr.ChidoriD=0
						src.Death(usr)
						return
				else
					view()<<"[src] hit [usr] with their Rasengan for [src.RasenganD]!"
					usr.health -= src.RasenganD
					src.battlingRC=0
					usr.battlingRC=0
					usr.overlays-='chidoriover.dmi'
					src.overlays-='rasenganover.dmi'
					usr.firing=0
					usr.Frozen=0
					src.Frozen=0
					src.Chidorion=0
					usr.Rasenganon=0
					src.firing=0
					src.RasenganD=0
					usr.ChidoriD=0
					usr.Death(src)
					return
			if(usr.dir==SOUTH&&src.dir==NORTH)
				usr.y-=1
				src.y-=1
				sleep(20)
				usr.y+=1
				src.y+=1
				sleep(20)
				usr.y-=1
				src.y-=1
				sleep(20)
				usr.y+=1
				src.y+=1
				sleep(20)
				if(usr.ChidoriD > src.RasenganD)
					if(usr.tai > src.tai)
						if(usr.nin > src.nin)
							view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD]!"
							src.health -= usr.ChidoriD
							src.battlingRC=0
							usr.battlingRC=0
							usr.overlays-='chidoriover.dmi'
							src.overlays-='rasenganover.dmi'
							usr.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.firing=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
						else
							view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD/1.5]!"
							src.health -= usr.ChidoriD/1.5
							src.battlingRC=0
							usr.battlingRC=0
							usr.overlays-='chidoriover.dmi'
							src.overlays-='rasenganover.dmi'
							usr.firing=0
							src.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
					else
						view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD/2]!"
						src.health -= usr.ChidoriD/2
						src.battlingRC=0
						usr.battlingRC=0
						usr.overlays-='chidoriover.dmi'
						src.overlays-='rasenganover.dmi'
						usr.firing=0
						src.Frozen=0
						usr.Frozen=0
						src.Chidorion=0
						usr.Rasenganon=0
						src.firing=0
						src.RasenganD=0
						usr.ChidoriD=0
						src.Death(usr)
						return
				else
					view()<<"[src] hit [usr] with their Rasengan for [src.RasenganD]!"
					usr.health -= src.RasenganD
					src.battlingRC=0
					usr.battlingRC=0
					usr.overlays-='chidoriover.dmi'
					src.overlays-='rasenganover.dmi'
					usr.firing=0
					usr.Frozen=0
					src.Frozen=0
					src.Chidorion=0
					usr.Rasenganon=0
					src.firing=0
					src.RasenganD=0
					usr.ChidoriD=0
					usr.Death(src)
					return
			if(usr.dir==WEST&&src.dir==EAST)
				usr.x-=1
				src.x-=1
				sleep(20)
				usr.x+=1
				src.x+=1
				sleep(20)
				usr.x-=1
				src.x-=1
				sleep(20)
				usr.x+=1
				src.x+=1
				sleep(20)
				if(usr.ChidoriD > src.RasenganD)
					if(usr.tai > src.tai)
						if(usr.nin > src.nin)
							view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD]!"
							src.health -= usr.ChidoriD
							src.battlingRC=0
							usr.battlingRC=0
							usr.overlays-='chidoriover.dmi'
							src.overlays-='rasenganover.dmi'
							usr.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.firing=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
						else
							view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD/1.5]!"
							src.health -= usr.ChidoriD/1.5
							src.battlingRC=0
							usr.battlingRC=0
							usr.overlays-='chidoriover.dmi'
							src.overlays-='rasenganover.dmi'
							usr.firing=0
							src.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
					else
						view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD/2]!"
						src.health -= usr.ChidoriD/2
						src.battlingRC=0
						usr.battlingRC=0
						usr.overlays-='chidoriover.dmi'
						src.overlays-='rasenganover.dmi'
						usr.firing=0
						src.Frozen=0
						usr.Frozen=0
						src.Chidorion=0
						usr.Rasenganon=0
						src.firing=0
						src.RasenganD=0
						usr.ChidoriD=0
						src.Death(usr)
						return
				else
					view()<<"[src] hit [usr] with their Rasengan for [src.RasenganD]!"
					usr.health -= src.RasenganD
					src.battlingRC=0
					usr.battlingRC=0
					usr.overlays-='chidoriover.dmi'
					src.overlays-='rasenganover.dmi'
					usr.firing=0
					usr.Frozen=0
					src.Frozen=0
					src.Chidorion=0
					usr.Rasenganon=0
					src.firing=0
					src.RasenganD=0
					usr.ChidoriD=0
					usr.Death(src)
					return
			if(usr.dir==EAST&&src.dir==WEST)
				usr.x-=1
				src.x-=1
				sleep(20)
				usr.x+=1
				src.x+=1
				sleep(20)
				usr.x-=1
				src.x-=1
				sleep(20)
				usr.x+=1
				src.x+=1
				sleep(20)
				if(usr.ChidoriD > src.RasenganD)
					if(usr.tai > src.tai)
						if(usr.nin > src.nin)
							view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD]!"
							src.health -= usr.ChidoriD
							src.battlingRC=0
							usr.battlingRC=0
							usr.overlays-='chidoriover.dmi'
							src.overlays-='rasenganover.dmi'
							usr.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.firing=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
						else
							view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD/1.5]!"
							src.health -= usr.ChidoriD/1.5
							src.battlingRC=0
							usr.battlingRC=0
							usr.overlays-='chidoriover.dmi'
							src.overlays-='rasenganover.dmi'
							usr.firing=0
							src.firing=0
							src.Frozen=0
							usr.Frozen=0
							src.Chidorion=0
							usr.Rasenganon=0
							src.RasenganD=0
							usr.ChidoriD=0
							src.Death(usr)
							return
					else
						view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD/2]!"
						src.health -= usr.ChidoriD/2
						src.battlingRC=0
						usr.battlingRC=0
						usr.overlays-='chidoriover.dmi'
						src.overlays-='rasenganover.dmi'
						usr.firing=0
						src.Frozen=0
						usr.Frozen=0
						src.Chidorion=0
						usr.Rasenganon=0
						src.firing=0
						src.RasenganD=0
						usr.ChidoriD=0
						src.Death(usr)
						return
				else
					view()<<"[src] hit [usr] with their Rasengan for [src.RasenganD]!"
					usr.health -= src.RasenganD
					src.battlingRC=0
					usr.battlingRC=0
					usr.overlays-='chidoriover.dmi'
					src.overlays-='rasenganover.dmi'
					usr.firing=0
					usr.Frozen=0
					src.Frozen=0
					src.Chidorion=0
					usr.Rasenganon=0
					src.firing=0
					src.RasenganD=0
					usr.ChidoriD=0
					usr.Death(src)
					return
			else
				usr<<"It cancels out!"
				src<<"They cancel out!"
				return
		else
			if(!src.Rasenganon&&!src.Chidorion)
				view()<<"[usr] hit [src] with their Chidori for [usr.ChidoriD]!"
				src.health -= usr.ChidoriD
				usr.battlingRC=0
				src.battlingRC=0
				usr.firing=0
				usr.ChidoriD = 0
				usr.Chidorion = 0
				src.Death(usr)
				return
 if(istype(src,/turf))//if it's turf...
  return//return...
 if(istype(src,/obj))//if it's obj...
  return//return..
 else if(usr.ingat)//GATSUUGA
  if(src.isdog)
   return
  if(src==usr.owner)
   return
  var/Damage = round(usr.tai*1.2)//define var damage(you can make it better)
  if(Damage <= 0)//if damage = 0
   Damage = 1//damage = 1
   src.health -= Damage//lose hp..
   view()<<"[usr] hit [src] with their Tsuuga for [Damage]!"//say it to those who are near you...
   src.Death(usr)//Call death proc
   usr.loc = locate(src.x,src.y,src.z)
  else
   if(src==usr.owner)
    return
   src.health -= Damage//lose hp...
   view()<<"[usr] hit [src] with their Tsuuga for [Damage]!"//say it to those who are near you...
   usr.loc = locate(src.x,src.y,src.z)
   src.Death(usr)
 else if(usr.intank == 1)//MEAT TANK
  var/Damage = round(usr.tai*1.7)//define var damage(you can make it better)
  if(Damage <= 0)//if damage = 0
   Damage = 1//damage = 1
   src.health -= Damage//lose hp..
   view()<<"[usr] hit [src] with their Nikudan Sensha for [Damage]!"//say it to those who are near you...
   src.Death(usr)//Call death proc
   usr.loc = locate(src.x,src.y,src.z)
  else//else..
   src.health -= Damage//lose hp...
   view()<<"[usr] hit [src] with their Nikudan Sensha for [Damage]!"//say it to those who are near you...
   usr.loc = locate(src.x,src.y,src.z)
   src.Death(usr)
 else if(usr.ingar)//GAROUGA
  var/Damage = round(usr.tai*2.2)//define var damage(you can make it better)
  if(Damage <= 0)//if damage = 0
   Damage = 1//damage = 1
   src.health -= Damage//lose hp..
   view()<<"[usr] hit [src] with their garouga for [Damage]!"//say it to those who are near you...
   src.Death(usr)//Call death proc
   usr.loc = locate(src.x,src.y,src.z)
  else//else..
   src.health -= Damage//lose hp...
   view()<<"[usr] hit [src] with their garouga for [Damage]!"//say it to those who are near you...
   usr.loc = locate(src.x,src.y,src.z)
   src.Death(usr)
 else if(usr.inspike == 1)//SPIKES MEAT TANK
  var/Damage = round(usr.tai*2.5)//define var damage(you can make it better)
  if(Damage <= 0)//if damage = 0
   Damage = 1//damage = 1
   src.health -= Damage//lose hp..
   view()<<"[usr] hit [src] with their Nikudan Hari Sensha for [Damage]!"//say it to those who are near you...
   src.Death(usr)//Call death proc
   usr.loc = locate(src.x,src.y,src.z)
  else//else..
   src.health -= Damage//lose hp...
   view()<<"[usr] hit [src] with their Nikudan Hari Sensha for [Damage]!"//say it to those who are near you...
   usr.loc = locate(src.x,src.y,src.z)
   src.Death(usr)
mob/Inuzuka
	verb
		JuujinBunshin() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Juujin Bunshin No Jutsu"
			usr.Handseals()
			if(usr.firing) // If the mob's firing var is one...

				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(JuU >= 11)
					for(var/mob/pet/M in oview(6))
						if(M.owner == usr)
							usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
							usr.move = 0 // Disables the mob's movement
							usr.chakra -= 15
							usr.Jujin=1
							usr.JuU += 1
							sleep(3)
							usr.move = 1
							usr.Chakragain()
							usr.firing = 0
							M.icon = usr.icon
							flick("smoke2",M)
							M.overlays += usr.overlays
							view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#f4a460>J</FONT><FONT COLOR=#ee9a5c>u</FONT><FONT COLOR=#e68f57>u</FONT><FONT COLOR=#df8352>j</FONT><FONT COLOR=#d8784d>i</FONT><FONT COLOR=#d16d48>n</FONT><FONT COLOR=#c96243> </FONT><FONT COLOR=#c2573e>B</FONT><FONT COLOR=#bb4c39>u</FONT><FONT COLOR=#b44034>n</FONT><FONT COLOR=#ac352f>s</FONT><FONT COLOR=#a52a2a>h</FONT><FONT COLOR=#a62a2a>i</FONT><FONT COLOR=#a72a2a>n</FONT><FONT COLOR=#a92929> </FONT><FONT COLOR=#aa2828>N</FONT><FONT COLOR=#ab2727>o</FONT><FONT COLOR=#ac2727> </FONT><FONT COLOR=#ad2626>J</FONT><FONT COLOR=#ae2525>u</FONT><FONT COLOR=#b02424>t</FONT><FONT COLOR=#b12424>s</FONT><FONT COLOR=#b22323>u</FONT><FONT COLOR=#b22222>!</FONT>"
							sleep(600)
							M.overlays =null
							M.icon = 'dog.dmi'
							usr.Jujin = 0
							if(usr.Mnin <= usr.cap)
								usr.random = rand(1,6)
								if(random == 5||random==1)
									usr.ninexp += rand(1,10)
									usr.ninup()
									usr.Skills()
									var/ccrandom=rand(1,15)
									if(ccrandom==4||ccrandom==10)
										var/ccgain=rand(1,3)
										if(usr.ChakraC>=100)
											usr.ChakraC=100
											return
										else
											usr.ChakraC+=ccgain
											usr<<"[usr] you gained [ccgain] Chakra control..."
								else
									return
							else
								usr.random = rand(1,20)
								if(random == 5||random==1)
									usr.ninexp += rand(1,10)
									usr.ninup()
									usr.Skills()
									var/ccrandom=rand(1,15)
									if(ccrandom==4||ccrandom==10)
										var/ccgain=rand(1,3)
										if(usr.ChakraC>=100)
											usr.ChakraC=100
											return
										else
											usr.ChakraC+=ccgain
											usr<<"[usr] you gained [ccgain] Chakra control..."
								else
									return
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						for(var/mob/pet/M in oview(6))
							if(M.owner == usr)
								usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
								usr.move = 0 // Disables the mob's movement
								usr.chakra -= 15
								Jujin=1
								JuU += 1
								usr.Chakragain()
								sleep(3)
								usr.move = 1
								usr.firing = 0
								M.icon = usr.icon
								flick("smoke2",M)
								M.overlays += usr.overlays
								view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#f4a460>J</FONT><FONT COLOR=#ee9a5c>u</FONT><FONT COLOR=#e68f57>u</FONT><FONT COLOR=#df8352>j</FONT><FONT COLOR=#d8784d>i</FONT><FONT COLOR=#d16d48>n</FONT><FONT COLOR=#c96243> </FONT><FONT COLOR=#c2573e>B</FONT><FONT COLOR=#bb4c39>u</FONT><FONT COLOR=#b44034>n</FONT><FONT COLOR=#ac352f>s</FONT><FONT COLOR=#a52a2a>h</FONT><FONT COLOR=#a62a2a>i</FONT><FONT COLOR=#a72a2a>n</FONT><FONT COLOR=#a92929> </FONT><FONT COLOR=#aa2828>N</FONT><FONT COLOR=#ab2727>o</FONT><FONT COLOR=#ac2727> </FONT><FONT COLOR=#ad2626>J</FONT><FONT COLOR=#ae2525>u</FONT><FONT COLOR=#b02424>t</FONT><FONT COLOR=#b12424>s</FONT><FONT COLOR=#b22323>u</FONT><FONT COLOR=#b22222>!</FONT>"
								sleep(600)
								M.overlays -= usr.overlays
								M.icon = 'dog.dmi'
								Jujin = 0
								if(usr.Mnin <= usr.cap)
									usr.random = rand(1,6)
									if(random == 5||random==1)
										usr.ninexp += rand(1,10)
										usr.ninup()
										usr.Skills()
										var/ccrandom=rand(1,15)
										if(ccrandom==4||ccrandom==10)
											var/ccgain=rand(1,3)
											if(usr.ChakraC>=100)
												usr.ChakraC=100
												return
											else
												usr.ChakraC+=ccgain
												usr<<"[usr] you gained [ccgain] Chakra control..."
									else
										return
								else
									usr.random = rand(1,20)
									if(random == 5||random==1)
										usr.ninexp += rand(1,10)
										usr.ninup()
										usr.Skills()
										var/ccrandom=rand(1,15)
										if(ccrandom==4||ccrandom==10)
											var/ccgain=rand(1,3)
											if(usr.ChakraC>=100)
												usr.ChakraC=100
												return
											else
												usr.ChakraC+=ccgain
												usr<<"[usr] you gained [ccgain] Chakra control..."
									else
										return

mob/Inuzuka
	verb
		Soutourou() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Soutourou"
			usr.Handseals()
			if(usr.Jujin == 0||usr.Henge||usr.firing||usr.Kaiten == 1||usr.inso==1) // If the mob's firing var is one...

				return
			if(usr.canS==1)
				usr<<"You have used soutourou to recently..."
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)
				return
			else // If the firing var isn't 1...
				if(soU >= 150)
					for(var/mob/pet/M in oview(6))
						if(M.owner == usr)
							if(usr.Jujin == 1)
								var/list/O = usr.overlays.Copy()
								usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
								usr.move = 0 // Disables the mob's movement
								usr.chakra -= 55
								inso=1
								soU += 1
								sleep(3)
								usr.move = 1
								usr.firing = 0
								usr.Chakragain()
								M.loc=locate(0,0,0)
								usr.Oicon=usr.icon
								usr.overlays = usr.overlays.Remove(usr.overlays)
								usr.icon = 'souta.dmi'
								usr.tai = usr.tai*2.2
								usr.Savedspeed = usr.Move_Delay
								usr.Move_Delay = usr.Speed2
								sleep(300)
								usr<<"<font color = blue>You stop using soutoutou!"
								usr.overlays = O.Copy()
								M.loc = locate(usr.x,usr.y,usr.z)
								usr.icon = usr.Oicon
								usr.tai = usr.Mtai
								M.icon='dog.dmi'
								M.Jujin=0
								usr.inso = 0
								sleep(100)
								usr.canS = 0
								if(usr.Mnin <= usr.cap)
									usr.random = rand(1,6)
									if(random == 5||random==1)
										usr.ninexp += rand(1,10)
										usr.ninup()
										usr.Skills()
										var/ccrandom=rand(1,15)
										if(ccrandom==4||ccrandom==10)
											var/ccgain=rand(1,3)
											if(usr.ChakraC>=100)
												usr.ChakraC=100
												return
											else
												usr.ChakraC+=ccgain
												usr<<"[usr] you gained [ccgain] Chakra control..."
									else
										return
								else
									usr.random = rand(1,20)
									if(random == 5||random==1)
										usr.ninexp += rand(1,10)
										usr.ninup()
										usr.Skills()
										var/ccrandom=rand(1,15)
										if(ccrandom==4||ccrandom==10)
											var/ccgain=rand(1,3)
											if(usr.ChakraC>=100)
												usr.ChakraC=100
												return
											else
												usr.ChakraC+=ccgain
												usr<<"[usr] you gained [ccgain] Chakra control..."
									else
										return
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						for(var/mob/pet/M in oview(6))
							if(M.owner == usr)
								if(usr.Jujin == 1)
									var/list/O = usr.overlays.Copy()
									usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
									usr.move = 0 // Disables the mob's movement
									usr.chakra -= 55
									inso=1
									soU += 1
									sleep(3)
									usr.move = 1
									usr.firing = 0
									usr.Chakragain()
									M.loc=locate(0,0,0)
									usr.Oicon=usr.icon
									usr.overlays = usr.overlays.Remove(usr.overlays)
									usr.icon = 'souta.dmi'
									usr.tai = usr.tai*2.2
									usr.Savedspeed = usr.Move_Delay
									usr.Move_Delay = usr.Speed2
									sleep(300)
									usr<<"<font color = blue>You stop using soutoutou!"
									usr.overlays = O.Copy()
									M.loc = locate(usr.x,usr.y,usr.z)
									usr.icon = usr.Oicon
									usr.tai = usr.Mtai
									M.icon='dog.dmi'
									M.Jujin=0
									usr.inso = 0
									sleep(100)
									usr.canS = 0
									if(usr.Mnin <= usr.cap)
										usr.random = rand(1,6)
										if(random == 5||random==1)
											usr.ninexp += rand(1,10)
											usr.ninup()
											usr.Skills()
											var/ccrandom=rand(1,15)
											if(ccrandom==4||ccrandom==10)
												var/ccgain=rand(1,3)
												if(usr.ChakraC>=100)
													usr.ChakraC=100
													return
												else
													usr.ChakraC+=ccgain
													usr<<"[usr] you gained [ccgain] Chakra control..."
										else
											return
									else
										usr.random = rand(1,20)
										if(random == 5||random==1)
											usr.ninexp += rand(1,10)
											usr.ninup()
											usr.Skills()
											var/ccrandom=rand(1,15)
											if(ccrandom==4||ccrandom==10)
												var/ccgain=rand(1,3)
												if(usr.ChakraC>=100)
													usr.ChakraC=100
													return
												else
													usr.ChakraC+=ccgain
													usr<<"[usr] you gained [ccgain] Chakra control..."
										else
											return
obj
	GoukakyuuHead
		icon='goukakyuuthing.dmi'
		icon_state="head"
		layer = MOB_LAYER+1
		New()
			..()
			spawn(34)
			del(src)

	GoukakyuuTail
		icon='goukakyuuthing.dmi'
		icon_state="tail"
		layer = MOB_LAYER+1
		New()
			..()
			spawn(34)
			del(src)
	middle
		icon='goukakyuuthing.dmi'
		icon_state="1"
		layer = MOB_LAYER+1
		New()
			..()
			spawn(34)
			del(src)

	topleft
		icon='goukakyuuthing.dmi'
		icon_state="2"
		layer = MOB_LAYER+1
		New()
			..()
			spawn(34)
			del(src)
	topright
		icon='goukakyuuthing.dmi'
		icon_state="3"
		layer = MOB_LAYER+1
		New()
			..()
			spawn(34)
			del(src)

	bottomleft
		icon='goukakyuuthing.dmi'
		icon_state="4"
		layer = MOB_LAYER+1
		New()
			..()
			spawn(34)
			del(src)
	bottomright
		icon='goukakyuuthing.dmi'
		icon_state="5"
		layer = MOB_LAYER+1
		New()
			..()
			spawn(34)
			del(src)

mob/katon
	verb
		KatonGoukakyuu() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Fireball Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten) // If the mob's firing var is one...

				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(usr.Katon1N >= 40)
					usr.chakra -= 15
					usr.Chakragain()
					usr.firing = 1
					var/obj/middle/K = new /obj/middle
					var/obj/middle/L = new /obj/middle
					var/obj/middle/M1 = new /obj/middle
					var/obj/middle/N = new /obj/middle
					var/obj/middle/O = new /obj/middle
					var/obj/topright/TR = new /obj/topright
					var/obj/bottomright/BR = new /obj/bottomright
					var/obj/topleft/TL = new /obj/topleft
					var/obj/bottomleft/BL = new /obj/bottomleft
					var/obj/GoukakyuuTail/T = new /obj/GoukakyuuTail
					usr.Katon1N += 1
					usr.handseals=0
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#ffffff>K</FONT><FONT COLOR=#f6ebeb>a</FONT><FONT COLOR=#edd5d5>t</FONT><FONT COLOR=#e3c0c0>o</FONT><FONT COLOR=#d9abab>n</FONT><FONT COLOR=#cf9595>:</FONT><FONT COLOR=#c68080> </FONT><FONT COLOR=#bc6b6b>G</FONT><FONT COLOR=#b25555>o</FONT><FONT COLOR=#a84040>u</FONT><FONT COLOR=#9f2b2b>k</FONT><FONT COLOR=#951515>a</FONT><FONT COLOR=#8b0000>k</FONT><FONT COLOR=#910205>y</FONT><FONT COLOR=#980309>u</FONT><FONT COLOR=#9e050e>u</FONT><FONT COLOR=#a40613> </FONT><FONT COLOR=#ab0817>N</FONT><FONT COLOR=#b10a1c>o</FONT><FONT COLOR=#b70b21> </FONT><FONT COLOR=#bd0d26>J</FONT><FONT COLOR=#c40f2a>u</FONT><FONT COLOR=#ca102f>t</FONT><FONT COLOR=#d01234>s</FONT><FONT COLOR=#d71338>u</FONT><FONT COLOR=#dc143c>!</FONT></FONT>"
					K.Gowner=usr
					K.nin=usr.nin
					usr.Frozen=1
					if(usr.dir==NORTH)
						if(K)
							K.loc = usr.loc
							K.y+=2
						if(L)
							L.loc = usr.loc
							L.y+=3
						if(M1)
							M1.loc = usr.loc
							M1.y+=4
						if(O)
							O.loc = usr.loc
							O.y+=3
							O.x-=1
						if(N)
							N.loc = usr.loc
							N.y+=3
							N.x+=1
						if(TR)
							TR.loc = usr.loc
							TR.y+=4
							TR.x+=1
						if(TL)
							TL.loc = usr.loc
							TL.y+=4
							TL.x-=1
						if(BR)
							BR.loc = usr.loc
							BR.y+=2
							BR.x+=1
						if(BL)
							BL.loc = usr.loc
							BL.y+=2
							BL.x-=1
						if(T)
							T.dir = usr.dir
							T.loc = usr.loc
							T.y+=1
					if(usr.dir==SOUTH)
						if(K)
							K.loc = usr.loc
							K.y-=2
						if(L)
							L.loc = usr.loc
							L.y-=3
						if(M1)
							M1.loc = usr.loc
							M1.y-=4
						if(O)
							O.loc = usr.loc
							O.y-=3
							O.x-=1
						if(N)
							N.loc = usr.loc
							N.y-=3
							N.x+=1
						if(TR)
							TR.loc = usr.loc
							TR.y-=2
							TR.x+=1
						if(TL)
							TL.loc = usr.loc
							TL.y-=2
							TL.x-=1
						if(BR)
							BR.loc = usr.loc
							BR.y-=4
							BR.x+=1
						if(BL)
							BL.loc = usr.loc
							BL.y-=4
							BL.x-=1
						if(T)
							T.dir = usr.dir
							T.loc = usr.loc
							T.y-=1
					if(usr.dir==WEST)
						if(K)
							K.loc = usr.loc
							K.x-=2
						if(L)
							L.loc = usr.loc
							L.x-=3
						if(M1)
							M1.loc = usr.loc
							M1.x-=4
						if(O)
							O.loc = usr.loc
							O.y-=1
							O.x-=3
						if(N)
							N.loc = usr.loc
							N.y+=1
							N.x-=3
						if(TR)
							TR.loc = usr.loc
							TR.x-=2
							TR.y+=1
						if(TL)
							TL.loc = usr.loc
							TL.x-=4
							TL.y+=1
						if(BR)
							BR.loc = usr.loc
							BR.x-=2
							BR.y-=1
						if(BL)
							BL.loc = usr.loc
							BL.x-=4
							BL.y-=1
						if(T)
							T.dir = usr.dir
							T.loc = usr.loc
							T.x-=1
					if(usr.dir==EAST)
						if(K)
							K.loc = usr.loc
							K.x+=2
						if(L)
							L.loc = usr.loc
							L.x+=3
						if(M1)
							M1.loc = usr.loc
							M1.x+=4
						if(O)
							O.loc = usr.loc
							O.y-=1
							O.x+=3
						if(N)
							N.loc = usr.loc
							N.y+=1
							N.x+=3
						if(TR)
							TR.loc = usr.loc
							TR.x+=4
							TR.y+=1
						if(TL)
							TL.loc = usr.loc
							TL.x+=2
							TL.y+=1
						if(BR)
							BR.loc = usr.loc
							BR.x+=4
							BR.y-=1
						if(BL)
							BL.loc = usr.loc
							BL.x+=2
							BL.y-=1
						if(T)
							T.dir = usr.dir
							T.loc = usr.loc
							T.x+=1
					for(var/mob/M in oview(4,usr))
						if(K)
							if(M.loc==K.loc)
								if(M.Kaiten)
									usr<<"Your attack doesn't harm [M]."
									M<<"You block [usr]'s Goukakyuu."
									return
								var/damage=usr.nin*6
								view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
								M.health-=damage
								if(M.health<=0)
									M.Death(usr)
					for(var/mob/M in oview(4,usr))
						if(T)
							if(M.loc==T.loc)
								if(M.Kaiten)
									usr<<"Your attack doesn't harm [M]."
									M<<"You block [usr]'s Goukakyuu."
									return
								var/damage=usr.nin*6
								view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
								M.health-=damage
								if(M.health<=0)
									M.Death(usr)
					for(var/mob/M in oview(4,usr))
						if(L)
							if(M.loc==L.loc)
								if(M.Kaiten)
									usr<<"Your attack doesn't harm [M]."
									M<<"You block [usr]'s Goukakyuu."
									return
								var/damage=usr.nin*6
								view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
								M.health-=damage
								if(M.health<=0)
									M.Death(usr)
					for(var/mob/M in oview(4,usr))
						if(M1)
							if(M.loc==M1.loc)
								if(M.Kaiten)
									usr<<"Your attack doesn't harm [M]."
									M<<"You block [usr]'s Goukakyuu."
									return
								var/damage=usr.nin*6
								view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
								M.health-=damage
								if(M.health<=0)
									M.Death(usr)
					for(var/mob/M in oview(4,usr))
						if(N)
							if(M.loc==N.loc)
								if(M.Kaiten)
									usr<<"Your attack doesn't harm [M]."
									M<<"You block [usr]'s Goukakyuu."
									return
								var/damage=usr.nin*6
								view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
								M.health-=damage
								if(M.health<=0)
									M.Death(usr)
					for(var/mob/M in oview(4,usr))
						if(O)
							if(M.loc==O.loc)
								if(M.Kaiten)
									usr<<"Your attack doesn't harm [M]."
									M<<"You block [usr]'s Goukakyuu."
									return
								var/damage=usr.nin*6
								view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
								M.health-=damage
								if(M.health<=0)
									M.Death(usr)
					for(var/mob/M in oview(4,usr))
						if(BL)
							if(M.loc==BL.loc)
								if(M.Kaiten)
									usr<<"Your attack doesn't harm [M]."
									M<<"You block [usr]'s Goukakyuu."
									return
								var/damage=usr.nin*6
								view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
								M.health-=damage
								if(M.health<=0)
									M.Death(usr)
					for(var/mob/M in oview(4,usr))
						if(BR)
							if(M.loc==BR.loc)
								if(M.Kaiten)
									usr<<"Your attack doesn't harm [M]."
									M<<"You block [usr]'s Goukakyuu."
									return
								var/damage=usr.nin*6
								view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
								M.health-=damage
								if(M.health<=0)
									M.Death(usr)
					for(var/mob/M in oview(4,usr))
						if(TR)
							if(M.loc==TR.loc)
								if(M.Kaiten)
									usr<<"Your attack doesn't harm [M]."
									M<<"You block [usr]'s Goukakyuu."
									return
								var/damage=usr.nin*6
								view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
								M.health-=damage
								if(M.health<=0)
									M.Death(usr)
					for(var/mob/M in oview(4,usr))
						if(TL)
							if(M.loc==TL.loc)
								if(M.Kaiten)
									usr<<"Your attack doesn't harm [M]."
									M<<"You block [usr]'s Goukakyuu."
									return
								var/damage=usr.nin*6
								view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
								M.health-=damage
								if(M.health<=0)
									M.Death(usr)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,8)
						if(random == 5||random==1)
							usr.Mnin += rand(1,2)
							usr.nin = usr.Mnin
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,10)
						if(random == 5||random==1)
							usr.ninexp += rand(1,20)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					sleep(30)
					usr.firing = 0
					usr.Frozen=0
					sleep(45)
					del(K)
					del(T)
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 15
						usr.firing = 1
						var/obj/GoukakyuuHead/K = new /obj/GoukakyuuHead
						var/obj/GoukakyuuTail/T = new /obj/GoukakyuuTail
						usr.Katon1N += 1
						usr.Frozen=1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#ffffff>K</FONT><FONT COLOR=#f6ebeb>a</FONT><FONT COLOR=#edd5d5>t</FONT><FONT COLOR=#e3c0c0>o</FONT><FONT COLOR=#d9abab>n</FONT><FONT COLOR=#cf9595>:</FONT><FONT COLOR=#c68080> </FONT><FONT COLOR=#bc6b6b>G</FONT><FONT COLOR=#b25555>o</FONT><FONT COLOR=#a84040>u</FONT><FONT COLOR=#9f2b2b>k</FONT><FONT COLOR=#951515>a</FONT><FONT COLOR=#8b0000>k</FONT><FONT COLOR=#910205>y</FONT><FONT COLOR=#980309>u</FONT><FONT COLOR=#9e050e>u</FONT><FONT COLOR=#a40613> </FONT><FONT COLOR=#ab0817>N</FONT><FONT COLOR=#b10a1c>o</FONT><FONT COLOR=#b70b21> </FONT><FONT COLOR=#bd0d26>J</FONT><FONT COLOR=#c40f2a>u</FONT><FONT COLOR=#ca102f>t</FONT><FONT COLOR=#d01234>s</FONT><FONT COLOR=#d71338>u</FONT><FONT COLOR=#dc143c>!</FONT></FONT>"
						K.Gowner=usr
						K.nin=usr.nin
						if(usr.dir==NORTH)
							if(K)
								K.loc = usr.loc
								K.y+=2
							if(T)
								T.dir = usr.dir
								T.loc = usr.loc
								T.y+=1
						if(usr.dir==SOUTH)
							if(K)
								K.loc = usr.loc
								K.y-=2
							if(T)
								T.dir = usr.dir
								T.loc = usr.loc
								T.y-=1
						if(usr.dir==WEST)
							if(K)
								K.loc = usr.loc
								K.x-=2
							if(T)
								T.dir = usr.dir
								T.loc = usr.loc
								T.x-=1
						if(usr.dir==EAST)
							if(K)
								K.loc = usr.loc
								K.x+=2
							if(T)
								T.dir = usr.dir
								T.loc = usr.loc
								T.x+=1
						for(var/mob/M in oview(4,usr))
							if(K)
								if(M.loc==K.loc)
									if(M.Kaiten)
										usr<<"Your attack doesn't harm [M]."
										M<<"You block [usr]'s Goukakyuu."
										return
									var/damage=usr.nin*6
									view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
									M.health-=damage
									if(M.health<=0)
										M.Death(usr)
						for(var/mob/M in oview(4,usr))
							if(T)
								if(M.loc==T.loc)
									if(M.Kaiten)
										usr<<"Your attack doesn't harm [M]."
										M<<"You block [usr]'s Goukakyuu."
										return
									var/damage=usr.nin*6
									view()<<"[M] has taken [damage] Damage from [usr]'s Katon Goukakyuu"
									M.health-=damage
									if(M.health<=0)
										M.Death(usr)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						sleep(10)
						usr.firing = 0
						usr.Frozen=0
						sleep(45)
						del(K)
						del(T)
mob/jutsu
	verb
		ShushinNoJutsu(mob/M in oview(10))
			set category = "Jutsus"
			set name = "Shushin No Jutsu"
			usr.Handseals()
			if(usr.firing)
				return
			if(usr.caught)
				return
			if(usr.hyoushou)
				return
			if(usr.chakra <= 100)
				usr<<"Not enough Chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1.
				usr.chakra -= 100
				usr.loc = locate(M.x,M.y-1,M.z)
				usr.Chakragain()
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#c0c0c0>S</FONT><FONT COLOR=#bebebe>h</FONT><FONT COLOR=#bbbbbb>u</FONT><FONT COLOR=#b8b8b8>s</FONT><FONT COLOR=#b5b5b5>h</FONT><FONT COLOR=#b2b2b2>i</FONT><FONT COLOR=#afafaf>n</FONT><FONT COLOR=#acacac> </FONT><FONT COLOR=#a9a9a9>N</FONT><FONT COLOR=#a2a2a2>o</FONT><FONT COLOR=#9a9a9a> </FONT><FONT COLOR=#929292>J</FONT><FONT COLOR=#8a8a8a>u</FONT><FONT COLOR=#818181>t</FONT><FONT COLOR=#797979>s</FONT><FONT COLOR=#717171>u</FONT><FONT COLOR=#696969>!</FONT>"
mob/jutsu
	verb
		MieMie()
			set category = "Jutsus"
			set name = "Mei Mei no Jutsu"
			usr.Handseals()
			if (usr.ingat)
				return
			if (usr.intank)
				return
			if (usr.Kaiten)
				return
			if(usr.firing)
				return
			if (usr.sphere)
				usr<<"Not while useing sand of sphere"
				return
			if(usr.inso)
				usr<<"Not while in Soutourou!"
				return
			if (usr.inMei)
				usr<<"You cant use Mei Mei no jutsu right now!"
				return
			if(usr.chakra <= 20)
				usr<<"Not enough chakra!"
				return
			if(!usr.handseals)

				return
			else
				var/list/O = usr.overlays.Copy()
				view()<<"<font color=silver><b><font face=verdana>[usr]: Mei Mei no jutsu!!"
				usr.icon = null
				usr.firing=1
				usr.overlays = usr.overlays.Remove(usr.overlays)
				usr.inMei = 1
				usr.chakra -= 20
				usr.Chakragain()
				sleep(100)
				usr.icon = usr.Oicon
				usr.overlays = O.Copy()
				sleep(600)
				usr.inMei = 0
				usr.firing=0

/*dance of the camellia
dance of the willows
dance of the pines
dance of the clematis
dance of the seedling ferns
*/

mob/kaguyajutsu
	verb
		CreateBoneSword()//kaguya sword
			set name = "Create Bone Sword"
			set desc = ""
			set category = "Jutsus"
			if (usr.firing == 1)
				usr<<"Not right now!"
			if (usr.chakra <= 13)
				usr<<"Not enough chakra."
			else
				usr.chakra -= 13
				var/obj/BoneSword/B = new/obj/BoneSword
				B.loc = usr
mob/kaguyajutsu
	verb
		CreateSpineWhip()//kaguya whip
			set name = "Create Spine Whip"
			set desc = ""
			set category = "Jutsus"
			if (usr.firing == 1)
				usr<<"Not right now!"
			if (usr.chakra <= 17)
				usr<<"Not enough chakra."
			else
				usr.chakra -= 17
				var/obj/Spinewhip/B = new/obj/Spinewhip
				B.loc = usr
mob/kaguyajutsu
	verb
		TessenkaNoMai()//dance 4
			set name = "Tessenka No Mai"
			set desc = ""
			set category = "Jutsus"
			for(var/mob/M in oview(4,usr))
				if(usr.firing)
					return
				if(M.drunk&&M.NonClan)
					view()<<"[M] dodges [usr]'s attack"
					return
				if (!usr.spinesword)
					usr<<"You must have a spinal whip equiped to use this!"
					return
				if (M.sphere)
					usr<<"Your attack bounces off of the sand!"
					return
				if (M.Kaiten)
					var/damage = round(usr.tai+swordD*5)
					usr.firing = 1
					usr <<"You attack [M] but their kaiten reflects the damage back at you."
					M <<"You reflect [usr]'s attack causing them to hurt themself."
					usr.health -= damage
					usr.Death(M)
				else
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#d8bfd8>T</FONT><FONT COLOR=#dea5de>e</FONT><FONT COLOR=#e389e3>s</FONT><FONT COLOR=#e96ee9>s</FONT><FONT COLOR=#ef52ef>e</FONT><FONT COLOR=#f537f5>n</FONT><FONT COLOR=#fa1bfa>k</FONT><FONT COLOR=#ff00ff>a</FONT><FONT COLOR=#ed0ded> </FONT><FONT COLOR=#da1bda>N</FONT><FONT COLOR=#c728c7>o</FONT><FONT COLOR=#b535b5> </FONT><FONT COLOR=#a242a2>M</FONT><FONT COLOR=#8f508f>a</FONT><FONT COLOR=#7c5d7c>i</FONT><FONT COLOR=#696969>!</FONT>"
					usr.firing = 1
					usr << "You attack [M] with Tessenka No Mai!"
					var/damage = round(usr.tai+swordD*5)
					view() << "[usr] hits [M] with Tessenka No Mai for [damage] damage!"
					usr.Savedspeed = usr.Move_Delay
					usr.Move_Delay = usr.Speed4
					M.health -= damage
					M.Death(usr)
					sleep(20)
					usr.firing = 0
					if(usr.Mtai <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.taiexp += rand(1,10)
							usr.taiup()
							usr.Skills()
						else
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.taiexp += rand(1,10)
							usr.taiup()
							usr.Skills()
						else
							return
mob/kaguyajutsu
	verb
		KaramatsuNoMai()//dance 3
			set name = "Karamatsu No Mai"
			set desc = ""
			set category = "Jutsus"
			for(var/mob/M in oview(1,usr))
				if(!usr.bonesword)
					usr<<"You must have a bone sword equiped to use this!"
					return
				if(M.drunk&&M.NonClan)
					view()<<"[M] dodges [usr]'s attack"
					return
				if(usr.firing)
					return
				if(M.sphere)
					usr<<"Your attack bounces off of the sand!"
					return
				if (M.Kaiten)
					var/damage = round(usr.tai*2.5+swordD)
					usr.firing =1
					usr <<"You attack [M] but their kaiten reflects the damage back at you."
					M <<"You reflect [usr]'s attack causing them to hurt themself."
					usr.health -= damage
					usr.Death(M)
				else					//otherwise...
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Karamatsu No Mai!"
					usr << "You attack [M] with Karamatsu No Mai!"
					usr.firing=1
					var/damage = round(usr.tai*2.5+swordD)
					view() << "[usr] hits [M] with Karamatsu No Mai for [damage] damage!"
					M.health -= damage
					M.Death(usr)
					sleep(50)
					usr.firing = 0
					if(usr.Mtai <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.taiexp += rand(1,10)
							usr.taiup()
							usr.Skills()
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.taiexp += rand(1,10)
							usr.taiup()
							usr.Skills()

obj/var/tmp
	tai=0
	gen=0
	Rowner=""
	Jowner=""
	Zowner=""
	GownerB=""
mob/doton
	verb
		DotonDoryoDango() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Doton Doryo Dango"
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough rocks!"
				return
			else // If the firing var isn't 1...
				if(usr.DDD >= 25)
					usr.chakra -= 15
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
					usr.DDD += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#f0e68c>D</FONT><FONT COLOR=#e8cf81>o</FONT><FONT COLOR=#deb874>t</FONT><FONT COLOR=#d5a068>o</FONT><FONT COLOR=#cb895c>n</FONT><FONT COLOR=#c2714f> </FONT><FONT COLOR=#b85943>D</FONT><FONT COLOR=#af4236>o</FONT><FONT COLOR=#a52a2a>r</FONT><FONT COLOR=#a23233>y</FONT><FONT COLOR=#9e3b3c>o</FONT><FONT COLOR=#994345> </FONT><FONT COLOR=#954b4e>D</FONT><FONT COLOR=#915458>a</FONT><FONT COLOR=#8d5c61>n</FONT><FONT COLOR=#88646a>g</FONT><FONT COLOR=#846d73>o</FONT><FONT COLOR=#80747b>!</FONT>"
					var/obj/DotonDD/K = new /obj/DotonDD
					K.loc = usr.loc
					K.tai=usr.tai
					K.dir = usr.dir
					K.name="[usr]"
					usr.Chakragain()
					K.Gowner=usr
					K.Move_Delay=2
					walk(K,usr.dir)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.taiexp += rand(1,10)
							usr.taiup()
							usr.Skills()
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.taiexp += rand(1,10)
							usr.taiup()
							usr.Skills()
					sleep(45)
					del(K)
					sleep(10)
					usr.firing = 0
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 15
						usr.DDD += 1
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#f0e68c>D</FONT><FONT COLOR=#e8cf81>o</FONT><FONT COLOR=#deb874>t</FONT><FONT COLOR=#d5a068>o</FONT><FONT COLOR=#cb895c>n</FONT><FONT COLOR=#c2714f> </FONT><FONT COLOR=#b85943>D</FONT><FONT COLOR=#af4236>o</FONT><FONT COLOR=#a52a2a>r</FONT><FONT COLOR=#a23233>y</FONT><FONT COLOR=#9e3b3c>o</FONT><FONT COLOR=#994345> </FONT><FONT COLOR=#954b4e>D</FONT><FONT COLOR=#915458>a</FONT><FONT COLOR=#8d5c61>n</FONT><FONT COLOR=#88646a>g</FONT><FONT COLOR=#846d73>o</FONT><FONT COLOR=#80747b>!</FONT>"
						var/obj/DotonDD/K = new /obj/DotonDD
						K.loc = usr.loc
						K.nin=usr.nin
						K.dir = usr.dir
						K.name="[usr]"
						K.Gowner=usr
						K.Move_Delay=2
						walk(K,usr.dir)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.taiexp += rand(1,10)
								usr.taiup()
								usr.Skills()
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.taiexp += rand(1,10)
								usr.taiup()
								usr.Skills()
						sleep(45)
						del(K)
						sleep(10)
						usr.firing = 0
					else
						usr<<"You failed to use Doton Doryo Dango"

mob/kaguyajutsu
	verb
		YanagiNoMai()//dance 1
			set name = "Yanagi No Mai"
			set desc = ""
			set category = "Jutsus"
			for(var/mob/M in oview(1,usr))
				if(usr.firing)
					return
				if(M.drunk&&M.NonClan)
					view()<<"[M] dodges [usr]'s attack"
					return
				if (!usr.bonesword)
					usr<<"You must have a sword bone equiped to use this!"
					return
				if (M.sphere)
					usr<<"Your attack bounces off of the sand!"
					return
				if (M.Kaiten)
					var/damage = round(usr.tai*1.5+swordD)
					usr <<"You attack [M] but their kaiten reflects the damage back at you."
					M <<"You reflect [usr]'s attack causing them to hurt themself."
					usr.health -= damage
					usr.Death(M)
				else
					view()<<"<font color = blue>[usr]:Yanagi No Mai!!"
					usr.firing = 1
					usr << "You attack [M] with Yanagi No Mai!"
					var/damage = round(usr.tai*1.5+swordD)
					view() << "[usr] hits [M] with Yanagi No Mai for [damage] damage!"
					M.health -= damage
					M.Death(usr)
					sleep(15)
					usr.firing = 0
					if(usr.Mtai <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.taiexp += rand(1,10)
							usr.taiup()
							usr.Skills()
						else
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.taiexp += rand(1,10)
							usr.taiup()
							usr.Skills()
						else
							return

mob/kaguyajutsu
	verb
		TsubakiNoMai(mob/M in oview(1))//dance 2
			set name = "Tsubaki No Mai"
			set desc = ""
			set category = "Jutsus"
			if(usr.firing)
				return
			if(M.drunk&&M.NonClan)
				view()<<"[M] dodges [usr]'s attack"
				return
			if (!usr.bonesword)
				usr<<"You must have a sword bone equiped to use this!"
				return
			if (M.sphere)
				usr<<"Your attack bounces off of the sand!"
				return
			if (M.Kaiten)
				var/damage = round(usr.tai*2+swordD)
				usr <<"You attack [M] but their kaiten reflects the damage back at you."
				M <<"You reflect [usr]'s attack causing them to hurt themself."
				usr.health -= damage
				usr.Death(M)
			else
				view()<<"<font color = blue>[usr]:Tsubaki No Mai!!"
				usr.firing = 1
				usr << "You attack [M] with Tsubaki No Mai!"
				var/damage = round(usr.tai*2+swordD)
				view() << "[usr] hits [M] with Tsubaki No Mai for [damage] damage!"
				M.health -= damage
				M.Death(usr)
				sleep(30)
				usr.firing = 0
				if(usr.Mtai <= usr.cap)
					usr.random = rand(1,6)
					if(random == 5||random==1)
						usr.taiexp += rand(1,10)
						usr.taiup()
						usr.Skills()
					else
						return
				else
					usr.random = rand(1,20)
					if(random == 5||random==1)
						usr.taiexp += rand(1,10)
						usr.taiup()
						usr.Skills()
					else
						return
obj/var/tmp/sawarabi=0
obj
	Sawarabi
		icon='sawarabi.dmi'
		layer = MOB_LAYER+1
mob/kaguyajutsu
	verb
		Sawarabi()
			set category = "Jutsus"
			set name = "Sawarabi No Mai"
			if(usr.firing) // If the mob's firing var is one...
				return
			if(usr.chakra <= 9999)
				usr<<"You dont have enough chakra!"
				return
			else // If the firing var isn't 1...
				usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
				view()<<"[usr]: Sawarabi No Mai!"
				var/obj/Sawarabi/F = new /obj/Sawarabi/
				var/obj/Sawarabi/G = new /obj/Sawarabi/
				var/obj/Sawarabi/H = new /obj/Sawarabi/
				var/obj/Sawarabi/I = new /obj/Sawarabi/
				var/obj/Sawarabi/J = new /obj/Sawarabi/
				var/obj/Sawarabi/L = new /obj/Sawarabi/
				var/obj/Sawarabi/A = new /obj/Sawarabi/
				var/obj/Sawarabi/B = new /obj/Sawarabi/
				var/obj/Sawarabi/M2 = new /obj/Sawarabi/
				var/obj/Sawarabi/N = new /obj/Sawarabi/
				var/obj/Sawarabi/O = new /obj/Sawarabi/
				var/obj/Sawarabi/P = new /obj/Sawarabi/
				var/obj/Sawarabi/D = new /obj/Sawarabi/
				var/obj/Sawarabi/E = new /obj/Sawarabi/
				var/obj/Sawarabi/C = new /obj/Sawarabi/
				var/obj/Sawarabi/K = new /obj/Sawarabi/
				var/obj/Sawarabi/Q = new /obj/Sawarabi/
				var/obj/Sawarabi/R = new /obj/Sawarabi/
				var/obj/Sawarabi/S = new /obj/Sawarabi/
				var/obj/Sawarabi/T = new /obj/Sawarabi/
				var/obj/Sawarabi/W = new /obj/Sawarabi/
				var/obj/Sawarabi/X = new /obj/Sawarabi/
				var/obj/Sawarabi/Y = new /obj/Sawarabi/
				var/obj/Sawarabi/Z = new /obj/Sawarabi/
				var/obj/Sawarabi/AB = new /obj/Sawarabi/
				var/obj/Sawarabi/AC = new /obj/Sawarabi/
				var/obj/Sawarabi/AD = new /obj/Sawarabi/
				var/obj/Sawarabi/AE = new /obj/Sawarabi/
				var/obj/Sawarabi/AF = new /obj/Sawarabi/
				var/obj/Sawarabi/AG = new /obj/Sawarabi/
				var/obj/Sawarabi/AH = new /obj/Sawarabi/
				var/obj/Sawarabi/AI = new /obj/Sawarabi/
				var/obj/Sawarabi/AJ = new /obj/Sawarabi/
				var/obj/Sawarabi/AK = new /obj/Sawarabi/
				var/obj/Sawarabi/AL = new /obj/Sawarabi/
				var/obj/Sawarabi/AM = new /obj/Sawarabi/
				var/obj/Sawarabi/AN = new /obj/Sawarabi/
				var/obj/Sawarabi/AO = new /obj/Sawarabi/
				var/obj/Sawarabi/AP = new /obj/Sawarabi/
				var/obj/Sawarabi/AQ = new /obj/Sawarabi/
				var/obj/Sawarabi/AR = new /obj/Sawarabi/
				var/obj/Sawarabi/AS = new /obj/Sawarabi/
				var/obj/Sawarabi/AT = new /obj/Sawarabi/
				var/obj/Sawarabi/AU = new /obj/Sawarabi/
				var/obj/Sawarabi/AV = new /obj/Sawarabi/
				var/obj/Sawarabi/AW = new /obj/Sawarabi/
				var/obj/Sawarabi/AX= new /obj/Sawarabi/
				var/obj/Sawarabi/AY = new /obj/Sawarabi/
				var/obj/Sawarabi/AZ = new /obj/Sawarabi/
				usr.chakra -= 10000
				A.owner=usr
				B.owner=usr
				C.owner=usr
				D.owner=usr
				E.owner=usr
				F.owner=usr
				G.owner=usr
				H.owner=usr
				I.owner=usr
				J.owner=usr
				K.owner=usr
				L.owner=usr
				M2.owner=usr
				N.owner=usr
				O.owner=usr
				P.owner=usr
				Q.owner=usr
				R.owner=usr
				S.owner=usr
				T.owner=usr
				W.owner=usr
				X.owner=usr
				Y.owner=usr
				Z.owner=usr
				AB.owner=usr
				AC.owner=usr
				AD.owner=usr
				AE.owner=usr
				AF.owner=usr
				AG.owner=usr
				AH.owner=usr
				AI.owner=usr
				AJ.owner=usr
				AK.owner=usr
				AL.owner=usr
				AM.owner=usr
				AN.owner=usr
				AO.owner=usr
				AP.owner=usr
				AQ.owner=usr
				AR.owner=usr
				AS.owner=usr
				AV.owner=usr
				AW.owner=usr
				AX.owner=usr
				AY.owner=usr
				AZ.owner=usr
				AU.owner=usr
				AV.owner=usr
				A.tai=usr.tai
				B.tai=usr.tai
				C.tai=usr.tai
				D.tai=usr.tai
				E.tai=usr.tai
				F.tai=usr.tai
				G.tai=usr.tai
				H.tai=usr.tai
				I.tai=usr.tai
				J.tai=usr.tai
				K.tai=usr.tai
				L.tai=usr.tai
				M2.tai=usr.tai
				N.tai=usr.tai
				O.tai=usr.tai
				P.tai=usr.tai
				Q.tai=usr.tai
				R.tai=usr.tai
				S.tai=usr.tai
				T.tai=usr.tai
				W.tai=usr.tai
				X.tai=usr.tai
				Y.tai=usr.tai
				Z.tai=usr.tai
				AB.tai=usr.tai
				AC.tai=usr.tai
				AD.tai=usr.tai
				AE.tai=usr.tai
				AF.tai=usr.tai
				AG.tai=usr.tai
				AH.tai=usr.tai
				AI.tai=usr.tai
				AJ.tai=usr.tai
				AK.tai=usr.tai
				AL.tai=usr.tai
				AM.tai=usr.tai
				AN.tai=usr.tai
				AO.tai=usr.tai
				AP.tai=usr.tai
				AQ.tai=usr.tai
				AR.tai=usr.tai
				AS.tai=usr.tai
				AV.tai=usr.tai
				AW.tai=usr.tai
				AX.tai=usr.tai
				AY.tai=usr.tai
				AZ.tai=usr.tai
				AU.tai=usr.tai
				AV.tai=usr.tai
				K.loc = locate(usr.x,usr.y,usr.z)
				K.sawarabi=1
				A.loc = locate(usr.x+1,usr.y,usr.z)
				A.sawarabi=1
				C.loc = locate(usr.x-1,usr.y,usr.z)
				C.sawarabi=1
				B.loc = locate(usr.x,usr.y+1,usr.z)
				B.sawarabi=1
				D.loc = locate(usr.x,usr.y-1,usr.z)
				D.sawarabi=1
				E.loc = locate(usr.x+1,usr.y+1,usr.z)
				E.sawarabi=1
				F.loc = locate(usr.x-1,usr.y-1,usr.z)
				F.sawarabi=1
				G.loc = locate(usr.x-1,usr.y+1,usr.z)
				G.sawarabi=1
				H.loc = locate(usr.x+1,usr.y-1,usr.z)
				H.sawarabi=1
				I.loc = locate(usr.x+2,usr.y,usr.z)
				I.sawarabi=1
				J.loc = locate(usr.x-2,usr.y,usr.z)
				J.sawarabi=1
				L.loc = locate(usr.x,usr.y+2,usr.z)
				L.sawarabi=1
				M2.loc = locate(usr.x,usr.y-2,usr.z)
				M2.sawarabi=1
				N.loc = locate(usr.x+2,usr.y+2,usr.z)
				N.sawarabi=1
				O.loc = locate(usr.x-2,usr.y-2,usr.z)
				O.sawarabi=1
				P.loc = locate(usr.x-2,usr.y+2,usr.z)
				P.sawarabi=1
				Q.loc = locate(usr.x+2,usr.y-2,usr.z)
				Q.sawarabi=1
				R.loc = locate(usr.x+3,usr.y,usr.z)
				R.sawarabi=1
				S.loc = locate(usr.x-3,usr.y,usr.z)
				S.sawarabi=1
				T.loc = locate(usr.x,usr.y+3,usr.z)
				T.sawarabi=1
				W.loc = locate(usr.x,usr.y-3,usr.z)
				W.sawarabi=1
				X.loc = locate(usr.x+3,usr.y+3,usr.z)
				X.sawarabi=1
				Y.loc = locate(usr.x-3,usr.y-3,usr.z)
				Y.sawarabi=1
				Z.loc = locate(usr.x-3,usr.y+3,usr.z)
				Z.sawarabi=1
				AB.loc = locate(usr.x-3,usr.y-2,usr.z)
				AB.sawarabi=1
				AC.loc = locate(usr.x+3,usr.y+2,usr.z)
				AC.sawarabi=1
				AD.loc = locate(usr.x+3,usr.y-2,usr.z)
				AD.sawarabi=1
				AE.loc = locate(usr.x-3,usr.y+2,usr.z)
				AE.sawarabi=1
				AF.loc = locate(usr.x+2,usr.y+3,usr.z)
				AF.sawarabi=1
				AG.loc = locate(usr.x-2,usr.y-3,usr.z)
				AG.sawarabi=1
				AH.loc = locate(usr.x-2,usr.y+3,usr.z)
				AH.sawarabi=1
				AI.loc = locate(usr.x+2,usr.y-3,usr.z)
				AI.sawarabi=1
				AJ.loc = locate(usr.x-1,usr.y-2,usr.z)
				AJ.sawarabi=1
				AK.loc = locate(usr.x+1,usr.y+2,usr.z)
				AK.sawarabi=1
				AL.loc = locate(usr.x+1,usr.y-2,usr.z)
				AL.sawarabi=1
				AM.loc = locate(usr.x-1,usr.y+2,usr.z)
				AM.sawarabi=1
				AN.loc = locate(usr.x+2,usr.y+1,usr.z)
				AN.sawarabi=1
				AO.loc = locate(usr.x-2,usr.y-1,usr.z)
				AO.sawarabi=1
				AP.loc = locate(usr.x-2,usr.y+1,usr.z)
				AP.sawarabi=1
				AQ.loc = locate(usr.x+2,usr.y-1,usr.z)
				AQ.sawarabi=1
				AR.loc = locate(usr.x-1,usr.y-3,usr.z)
				AR.sawarabi=1
				AS.loc = locate(usr.x+1,usr.y+3,usr.z)
				AS.sawarabi=1
				AT.loc = locate(usr.x+1,usr.y-3,usr.z)
				AT.sawarabi=1
				AU.loc = locate(usr.x-1,usr.y+3,usr.z)
				AU.sawarabi=1
				AV.loc = locate(usr.x+3,usr.y+1,usr.z)
				AV.sawarabi=1
				AW.loc = locate(usr.x-3,usr.y-1,usr.z)
				AW.sawarabi=1
				AX.loc = locate(usr.x-3,usr.y+1,usr.z)
				AX.sawarabi=1
				AY.loc = locate(usr.x+3,usr.y-1,usr.z)
				AY.sawarabi=1
				AZ.loc = locate(usr.x+3,usr.y-3,usr.z)
				AZ.sawarabi=1
				flick("rise",A)
				flick("rise",B)
				flick("rise",C)
				flick("rise",D)
				flick("rise",E)
				flick("rise",F)
				flick("rise",G)
				flick("rise",H)
				flick("rise",I)
				flick("rise",J)
				flick("rise",K)
				flick("rise",L)
				flick("rise",M2)
				flick("rise",N)
				flick("rise",O)
				flick("rise",P)
				flick("rise",Q)
				flick("rise",R)
				flick("rise",S)
				flick("rise",T)
				flick("rise",W)
				flick("rise",X)
				flick("rise",Y)
				flick("rise",Z)
				flick("rise",AB)
				flick("rise",AC)
				flick("rise",AD)
				flick("rise",AE)
				flick("rise",AF)
				flick("rise",AG)
				flick("rise",AH)
				flick("rise",AI)
				flick("rise",AJ)
				flick("rise",AK)
				flick("rise",AL)
				flick("rise",AM)
				flick("rise",AN)
				flick("rise",AO)
				flick("rise",AP)
				flick("rise",AQ)
				flick("rise",AR)
				flick("rise",AS)
				flick("rise",AT)
				flick("rise",AU)
				flick("rise",AV)
				flick("rise",AW)
				flick("rise",AX)
				flick("rise",AY)
				flick("rise",AZ)
				for(var/mob/M in oview(3,usr))
					var/damage=round(usr.tai*15)
					view()<<"[M] has taken [damage] damage from [usr]'s Sawarabi No Mai"
					M.health-=damage
					if(M.health<=0)
						M.Death(usr)
				sleep(100)
				del(K)
				del(A)
				del(B)
				del(C)
				del(D)
				del(E)
				del(F)
				del(G)
				del(H)
				del(I)
				del(J)
				del(L)
				del(M2)
				del(N)
				del(O)
				del(P)
				del(Q)
				del(R)
				del(S)
				del(T)
				del(W)
				del(X)
				del(Y)
				del(Z)
				del(AB)
				del(AC)
				del(AD)
				del(AE)
				del(AF)
				del(AG)
				del(AH)
				del(AI)
				del(AJ)
				del(AK)
				del(AL)
				del(AM)
				del(AN)
				del(AO)
				del(AP)
				del(AQ)
				del(AR)
				del(AS)
				del(AT)
				del(AU)
				del(AV)
				del(AW)
				del(AX)
				del(AY)
				del(AZ)
				sleep(100)
				usr.firing=0
mob/kaguyajutsu
	verb
		TeshiSendan()
			set category = "Jutsus"
			set name = "Teshi Sendan"
			if (usr.ingat)
				return
			if (usr.intank)
				return
			if (usr.Kaiten)
				return
			if(usr.firing)
				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough rocks!"
				return
			else // If the firing var isn't 1...
				usr.chakra -= 15
				usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
				usr.DDD += 1
				view()<<"<font color = blue>[usr]:Teshi Sendan"
				var/obj/TeshiSendan/K = new /obj/TeshiSendan
				K.loc = usr.loc
				K.tai=usr.tai
				K.dir = usr.dir
				K.Move_Delay=2
				K.name="[usr]"
				K.Gowner=usr
				walk(K,usr.dir)
				if (target == null)
					del(K)
				if(usr.Mnin <= usr.cap)
					usr.random = rand(1,6)
					if(random == 5||random==1)
						usr.taiexp += rand(1,10)
						usr.taiup()
						usr.Skills()
				else
					usr.random = rand(1,20)
					if(random == 5||random==1)
						usr.taiexp += rand(1,10)
						usr.taiup()
						usr.Skills()
				sleep(45)
				del(K)
				sleep(10)
				usr.firing = 0
mob/jutsu
	verb
		Chidori()
			set category = "Jutsus"
			set name = "Chidori"
			usr.Handseals()
			if (usr.ingat)
				return
			if (usr.intank)
				return
			if (usr.Kaiten)
				return
			if (usr.sphere)
				return
			if(usr.inso)
				return
			if (usr.firing)
				return
			if(Chidorion)
				usr <<"Your already using Chidori!"
				return
			if(!usr.handseals)

				return
			else
				var/damage = input("How much chakra would you like to put in?")as num
				if(usr.ChidoriU >= 30)
					if(damage <= 4999)
						usr<<"You must put at least 5000 chakra into it!!"
						return
					if(damage >= usr.chakra)
						usr<<"You put to much energy into the Chidori and lose control of it!"
						return
					else
						view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#4682b4>C</FONT><FONT COLOR=#6f97b8>h</FONT><FONT COLOR=#98acbd>i</FONT><FONT COLOR=#c0c0c0>d</FONT><FONT COLOR=#a1abc9>o</FONT><FONT COLOR=#8195d1>r</FONT><FONT COLOR=#617fda>i</FONT><FONT COLOR=#4169e1>!</FONT>"
						usr.ChidoriU += 1
						usr.chakra -= damage
						usr.ChidoriD = damage*1.4
						usr.Chakragain()
						usr.Chidorion = 1
						usr.firing = 1
						usr.overlays += 'Chidori.dmi'
						usr.icon_state = "run"
						RD
							if(!usr.battlingRC)
								ChidoriD -= rand(1000,2000)
							if(usr.ChidoriD <= 1)
								usr << "Your Chidori runs out of energy"
								usr.ChidoriD = 0
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Chidori.dmi'
								usr.overlays -= 'Chidori.dmi'
								usr.Chidorion = 0
								usr.firing = 0
								return
							else
								sleep(6)
								goto RD
				else
					usr.random = rand (1,3)
					if(usr.random == 1||usr.random == 2)
						if(damage <= 4999)
							usr<<"You must put at least 5000 chakra into it!!"
							return
						if(damage >= usr.chakra)
							usr<<"You put to much energy into the chidori and lose control of it!"
							return
						else
							view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#4682b4>C</FONT><FONT COLOR=#6f97b8>h</FONT><FONT COLOR=#98acbd>i</FONT><FONT COLOR=#c0c0c0>d</FONT><FONT COLOR=#a1abc9>o</FONT><FONT COLOR=#8195d1>r</FONT><FONT COLOR=#617fda>i</FONT><FONT COLOR=#4169e1>!</FONT>"
							usr.Chidorion = 1
							usr.ChidoriU += 1
							usr.chakra -= damage
							usr.Chakragain()
							usr.ChidoriD = damage*1.5
							usr.firing = 1
							usr.overlays += 'Chidori.dmi'
							usr.icon_state = "run"
							RD
								if(!usr.battlingRC)
									ChidoriD -= rand(1000,2000)
								if(usr.ChidoriD <= 1&&!usr.battlingRC)
									usr << "Your Chidori runs out of energy"
									usr.ChidoriD = 0
									usr.Chidorion = 0
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Chidori.dmi'
									usr.overlays -= 'Chidori.dmi'
									usr.firing = 0
									return
								else
									sleep(6)
									goto RD
					else
						usr<<"You fail to use Chidori!"
						usr.chakra -= damage
						return
mob/jutsu
	verb
		Rasengan()
			set category = "Jutsus"
			set name = "Rasengan"
			if (usr.ingat)
				return
			if (usr.intank)
				return
			if (usr.Kaiten)
				return
			if (usr.sphere)
				return
			if(usr.inso)
				return
			if (usr.firing)
				return
			if(Rasenganon)
				usr <<"Your already using Rasengan!"
				return
			else
				var/damage = input("How much chakra would you like to put in?")as num
				if(usr.RasenganU >= 30)
					if(damage <= 4999)
						usr<<"You must put at least 5000 chakra into it!!"
						return
					if(damage >= usr.chakra)
						usr<<"You put to much energy into the rasengan and lose control of it!"
						return
					else
						view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#00bfff>R</FONT><FONT COLOR=#30c0f0>a</FONT><FONT COLOR=#61c0e0>s</FONT><FONT COLOR=#91c0d0>e</FONT><FONT COLOR=#c0c0c0>n</FONT><FONT COLOR=#bdc1c8>g</FONT><FONT COLOR=#b9c3d0>a</FONT><FONT COLOR=#b4c4d7>n</FONT><FONT COLOR=#b0c4de>!</FONT>"
						usr.RasenganU += 1
						usr.chakra -= damage
						usr.RasenganD = damage*1.5
						usr.Rasenganon = 1
						usr.firing = 1
						usr.Chakragain()
						usr.overlays += 'Rasengan.dmi'
						usr.icon_state = "run"
						RD
							if(!usr.battlingRC)
								RasenganD -= rand(1000,2000)
							if(usr.RasenganD <= 1&&!usr.battlingRC)
								usr << "Your Rasengan runs out of energy"
								usr.RasenganD = 0
								usr.Rasenganon = 0
								usr.overlays -= 'Rasengan.dmi'
								usr.overlays -= 'Rasengan.dmi'
								usr.overlays -= 'Rasengan.dmi'
								usr.overlays -= 'Rasengan.dmi'
								usr.overlays -= 'Rasengan.dmi'
								usr.firing = 0
								return
							else
								sleep(6)
								goto RD
				else
					usr.random = rand (1,3)
					if(usr.random == 1||usr.random == 2)
						if(damage <= 4999)
							usr<<"You must put at least 5000 chakra into it!!"
							return
						if(damage >= usr.chakra)
							usr<<"You put to much energy into the rasengan and lose control of it!"
							return
						else
							view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#00bfff>R</FONT><FONT COLOR=#30c0f0>a</FONT><FONT COLOR=#61c0e0>s</FONT><FONT COLOR=#91c0d0>e</FONT><FONT COLOR=#c0c0c0>n</FONT><FONT COLOR=#bdc1c8>g</FONT><FONT COLOR=#b9c3d0>a</FONT><FONT COLOR=#b4c4d7>n</FONT><FONT COLOR=#b0c4de>!</FONT>"
							usr.Rasenganon = 1
							usr.RasenganU += 1
							usr.chakra -= damage
							usr.RasenganD = damage*1.5
							usr.Chakragain()
							usr.firing = 1
							usr.overlays += 'Rasengan.dmi'
							usr.icon_state = "run"
							RD
								if(!usr.battlingRC)
									RasenganD -= rand(1000,2000)
								if(usr.RasenganD <= 1)
									usr << "Your Rasengan runs out of energy"
									usr.RasenganD = 0
									usr.overlays -= 'Rasengan.dmi'
									usr.overlays -= 'Rasengan.dmi'
									usr.overlays -= 'Rasengan.dmi'
									usr.overlays -= 'Rasengan.dmi'
									usr.overlays -= 'Rasengan.dmi'
									usr.Rasenganon = 0
									return
								else
									sleep(6)
									goto RD
					else
						usr<<"You fail to use rasengan!"
						usr.chakra -= damage
						return



mob/Suiton
	verb
		SuitonSuikoudannoJutsu(mob/m in oview(usr)) // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Suiton Suikoudan no Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
			if(usr.onwater == 0)
				usr<<"You must be on water to do this!"
				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(usr.SS3 >= 52)
					usr.chakra -= 15
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
					usr.SS3 += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#87ceeb>S</FONT><FONT COLOR=#90d1ec>u</FONT><FONT COLOR=#98d4ed>i</FONT><FONT COLOR=#a1d7ee>t</FONT><FONT COLOR=#a9daee>o</FONT><FONT COLOR=#b2ddef>n</FONT><FONT COLOR=#bae0f0>:</FONT><FONT COLOR=#c3e4f1> </FONT><FONT COLOR=#cbe7f2>Su</FONT><FONT COLOR=#d4eaf3>i</FONT><FONT COLOR=#dcedf3>r</FONT><FONT COLOR=#e5f0f4>y</FONT><FONT COLOR=#edf3f5>u</FONT><FONT COLOR=#f5f5f5>u</FONT><FONT COLOR=#e3f6f6>d</FONT><FONT COLOR=#d0f7f7>a</FONT><FONT COLOR=#bdf8f8>n</FONT><FONT COLOR=#aaf8f8> </FONT><FONT COLOR=#97f9f9>N</FONT><FONT COLOR=#84fafa>o</FONT><FONT COLOR=#72fbfb> </FONT><FONT COLOR=#5ffcfc>J</FONT><FONT COLOR=#4cfdfd>u</FONT><FONT COLOR=#39fdfd>t</FONT><FONT COLOR=#26fefe>s</FONT><FONT COLOR=#13ffff>u</FONT><FONT COLOR=#00ffff>!</FONT>"
					var/obj/SuitonSuikoudan/K = new /obj/SuitonSuikoudan
					usr.target=m
					K.loc = usr.loc
					K.nin=usr.nin
					K.name="[usr]"
					usr.Chakragain()
					K.Move_Delay=2
					K.Gowner=usr
					walk_towards(K,m)
					sleep(8)
					usr.firing = 0
					sleep(21)
					del(K)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 15
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
						usr.SS3 += 1
						view()<<view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: SUIKOUDAN"
						var/obj/SuitonSuikoudan/K = new /obj/SuitonSuikoudan
						usr.target=m
						K.loc = usr.loc
						K.nin=usr.nin
						K.Move_Delay=2
						K.name="[usr]"
						usr.Chakragain()
						K.Gowner=usr
						walk_towards(K,m)
						sleep(8)
						usr.firing = 0
						sleep(21)
						del(K)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
mob/medical
	verb
		Shousen_Jutsu(mob/M in oview(1))
			set category = "Jutsus"
			set name = "Shousen Jutsu"
			usr.Handseals()
			if(usr.firing)
				usr<<"This cannot be done"
				return
			if(M.health >= M.maxhealth)

				return
			if(!usr.handseals)

				return
			else
				M<<"[usr] begins to use his chakra to heal you."
				usr<<"You begin to heal [M]"
				sleep(200)
				if(M)
					M.health += M.maxhealth/4
					if(M.health > M.maxhealth)
						M.health = M.maxhealth
		ChakraNoMesu()
			set category = "Jutsus"
			set name = "Chakra No Mesu"
			if(usr.firing)
				return
			if(!usr.scalpel)
				usr<<"You concentrate the chakra to your hands to develop chakra scalpels."
				usr.verbs += new /mob/medical/verb/SliceTendons()
				usr.scalpel =1
				mesu
				if(usr.scalpel)
					usr.chakra -=3.5
					if(usr.chakra <= 4)
						usr<<"You stop using Chakra No Mesu."
						usr.scalpel = 0
						usr.verbs -= new /mob/medical/verb/SliceTendons()
						return
					else
						sleep(4)
						goto mesu
			else if(usr.scalpel)
				usr.scalpel=0
				usr<<"You stop using Chakra No Mesu."
				usr.verbs -= new /mob/medical/verb/SliceTendons()
				usr.verbs -= new /mob/medical/verb/ScrewNerves()
		SliceTendons(mob/M in get_step(src,src.dir))
			set category = "Jutsus"
			set name = "Slice Tendons"
			if(usr.firing)
				return
			else
				usr<<"You slice [M]'s Tendons slowing their movement!"
				M.Savedspeed = M.Move_Delay
				M.Move_Delay = 10
				sleep(1200)
				M.Move_Delay = usr.Savedspeed
				M<<"Your tendons miraculously heal!"
				usr<<"[M]'s Tendons heal"
		ScrewNerves(mob/M in get_step(src,src.dir))
			set category = "Jutsus"
			set name = "Screw Nerves"
			if(usr.firing==1)
				usr<<"Not now"
			else
				usr<<"You screw [M]'s nerves messing their movement!"
				M.screwed = 1
				sleep(1200)
				if(M)
					M.screwed = 0
					M<<"Your nerves miraculously heal!"
					usr<<"[M]'s nerves heal"
mob/sound
	verb
		Kyoumeisen(mob/M in get_step(src,src.dir))
			set category = "Jutsus"
			set name = "Kyoumeisen"
			usr.Handseals()
			if(usr.firing)
				usr<<"Not now"
			if(!usr.handseals)

				return
			else
				usr<<"You send Vibrating sound waves through [M]'s body slowing their movement!"
				M.Move_Delay = 10
				sleep(600)
				if(M)
					M.Move_Delay = 1
					M<<"Your body recovers from the Kyoumeisen!"
					usr<<"[M]'s Kyoumeisen ends"
mob/sound
	verb
		Zankyokukuuha(mob/m in oview(usr)) // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Zankyokukuuha"
			usr.Handseals()
			if(usr.firing||usr.Kaiten) // If the mob's firing var is one...

				return
			if(usr.inso)
				usr<<"Not while in Soutourou!"
			if(usr.chakra <= 20)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				usr.random = rand (1,4)
				if(usr.random == 1||usr.random == 4)
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
					usr.move = 0 // Disables the mob's movement
					usr.chakra -= 20
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Zankyokukuuha!"
					var/obj/Zanyokukuuha/D = new /obj/Zanyokukuuha
					var/obj/Zanyokukuuha/S = new /obj/Zanyokukuuha
					var/obj/Zanyokukuuha/K = new /obj/Zanyokukuuha
					usr.target=m
					K.loc = usr.loc
					K.nin=usr.nin
					K.name="[usr]"
					usr.Chakragain()
					K.Move_Delay=2
					K.Zowner=usr
					walk_towards(K,m)
					sleep(5)
					D.loc = usr.loc
					D.nin=usr.nin
					D.name="[usr]"
					D.Move_Delay=2
					D.Zowner=usr
					walk_towards(D,m)
					sleep(5)
					S.loc = usr.loc
					S.nin=usr.nin
					S.Move_Delay=2
					S.name="[usr]"
					S.Zowner=usr
					walk_towards(S,m)
					sleep(1)
					usr.move = 1
					sleep(10)
					usr.firing = 0
					sleep(21)
					del(D)
					del(S)
					del(K)
					if (target == null)
						del(D)
						del(S)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
				usr<<"You failed to use Zankyokukuuha"

mob/sound
	verb
		Zankuuha() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Zankuuha"
			usr.Handseals()
			if(usr.firing||usr.Kaiten) // If the mob's firing var is one...

				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				usr.chakra -= 15
				usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Zankuuha!"
				var/obj/Zankuuha/K = new /obj/Zankuuha
				K.loc = usr.loc
				K.nin=usr.nin
				K.dir = usr.dir
				K.Move_Delay=2
				usr.Chakragain()
				K.name="[usr]"
				K.Zowner=usr
				walk(K,usr.dir)
				if (target == null)
					del(K)
				if(usr.Mnin <= usr.cap)
					usr.random = rand(1,6)
					if(random == 5||random==1)
						usr.ninexp += rand(1,10)
						usr.ninup()
						usr.Skills()
						var/ccrandom=rand(1,15)
						if(ccrandom==4||ccrandom==10)
							var/ccgain=rand(1,3)
							if(usr.ChakraC>=100)
								usr.ChakraC=100
								return
							else
								usr.ChakraC+=ccgain
								usr<<"[usr] you gained [ccgain] Chakra control..."
				else
					usr.random = rand(1,20)
					if(random == 5||random==1)
						usr.ninexp += rand(1,10)
						usr.ninup()
						usr.Skills()
						var/ccrandom=rand(1,15)
						if(ccrandom==4||ccrandom==10)
							var/ccgain=rand(1,3)
							if(usr.ChakraC>=100)
								usr.ChakraC=100
								return
							else
								usr.ChakraC+=ccgain
								usr<<"[usr] you gained [ccgain] Chakra control..."
				sleep(10)
				usr.firing = 0
				sleep(45)
				del(K)
mob
	verb
		Rest()
			set category="Taijutsu"
			if(usr.Kaiten)
				usr<<"You nuts? You're spinning deflecting attacks. How do you Rest? o_O"
				return
			if(usr.battlingRC)
				return
			if(usr.firing)
				return
			if(usr.hyoushou)
				return
			if(src.inkyuubi)
				return
			if(src.incs)
				return
			if(usr.resting)
				sleep(100)
				usr.resting=0
				usr<<"You stop resting..."
				usr.Frozen = 0
				usr.icon_state = ""
				return
			else
				if(usr.health == usr.maxhealth && usr.chakra == usr.Mchakra)
					usr<<"You don´t need to Rest..."
					return
				if(usr.meditating||usr.onwater)
					return
				usr<<"You begin to Rest..."
				usr.resting=1
				usr.Frozen = 1
				usr.icon_state = "rest"
				sleep(5)
				usr.rest()
				return
mob/var/tmp/canmed=0
mob
	verb
		Meditate()
			set category ="Jutsus"
			if(usr.firing)
				return
			if(usr.resting)
				return
			if(usr.canmed)
				return
			if(usr.meditating)
				usr.meditating=0
				usr.move=1
				usr.icon_state=null
				usr.canmed=1
				usr << "You Stop Meditating."
				spawn(100)
					usr.canmed=0
			else
				usr.meditating=1
				usr.move=0
				usr << "You Meditate."
				usr.icon_state="rest"
				while(usr.meditating)
					sleep(pick(100,120,110))
					if(prob(80))
						if(usr.chakra > 5)
							usr.random=rand(1,8)
							if(usr.random==4)
								usr<<"Your Genjutsu increases."
								usr.chakra-=rand(5,10)
								usr.genexp+=rand(1,10)
							if(usr.random==2)
								usr<<"Your Ninjutsu increases."
								usr.chakra-=rand(5,10)
								usr.ninexp+=rand(1,10)
							if(usr.random==8)
								usr<<"Your Chakra increases."
								usr.chakra-=rand(5,10)
								usr.Mchakra+=rand(10,30)
							if(usr.random==4)
								usr<<"Your HP increases."
								usr.chakra-=rand(5,10)
								usr.maxhealth+=rand(10,30)
					if(usr.chakra <= 5)
						usr<<"You Stop Meditating"
						usr.meditating=0
						usr.icon_state=null
						usr.canmed=1
						usr.move=1
						spawn(100)
							usr.canmed=0
mob
	proc
		rest()
			rest
			if(usr.resting)
				if(usr.health < usr.maxhealth || usr.chakra < usr.Mchakra)
					usr.health += usr.maxhealth/10
					usr.chakra += usr.Mchakra/10
					if(usr.health>usr.maxhealth)
						usr.health=usr.maxhealth
					if(usr.chakra>usr.Mchakra)
						usr.chakra=usr.Mchakra
					if(usr.health==usr.maxhealth&&usr.chakra==usr.Mchakra)
						usr.resting = 0
						usr.Frozen = 0
						usr.icon_state = ""
						usr<<"You have finish resting..."
						return
					usr.Frozen = 1
					sleep(15)
					goto rest
				else
					sleep(20)
					usr.resting = 0
					usr.Frozen = 0
					usr.icon_state = ""
					usr<<"You have finish resting..."
					if(usr.health>usr.maxhealth)
						usr.health=usr.maxhealth
					if(usr.chakra>usr.Mchakra)
						usr.chakra=usr.Mchakra

obj
	doryuuheki
		icon = 'doryuuheki.dmi'//dont have a base icon so cant make weights icon!lol
		layer = 999999999999
		density = 1
obj
	doryuudan
		icon = 'doryuudan.dmi'//dont have a base icon so cant make weights icon!lol
		layer = 999999999999
		density = 0
mob/doton
	verb
		DotonDoryuuheki() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Doton Doryuuheki"
			usr.Handseals()
			if(usr.firing) // If the mob's firing var is one...

				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
			if(usr.chakra <= 40)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				usr.DoryuuN += 1
				usr.chakra -= 39
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#deb887>D</FONT><FONT COLOR=#d8b78b>o</FONT><FONT COLOR=#d2b590>t</FONT><FONT COLOR=#cbb394>o</FONT><FONT COLOR=#c4b199>n</FONT><FONT COLOR=#bdaf9d> </FONT><FONT COLOR=#b7ada1>D</FONT><FONT COLOR=#b0aba6>o</FONT><FONT COLOR=#a9a9a9>r</FONT><FONT COLOR=#a69595>y</FONT><FONT COLOR=#a28080>u</FONT><FONT COLOR=#9e6a6a>u</FONT><FONT COLOR=#9b5555>h</FONT><FONT COLOR=#974040>e</FONT><FONT COLOR=#932b2b>k</FONT><FONT COLOR=#8f1515>i</FONT><FONT COLOR=#8b0000>!</FONT>"
				sleep(30)
				usr.Chakragain()
				if(usr.dir == NORTH)
					var/obj/doryuuheki/A = new /obj/doryuuheki/
					var/obj/doryuuheki/B = new /obj/doryuuheki/
					var/obj/doryuuheki/C = new /obj/doryuuheki/
					var/obj/doryuuheki/D = new /obj/doryuuheki/
					var/obj/doryuuheki/E = new /obj/doryuuheki/
					A.loc = locate(usr.x, usr.y+1, usr.z)
					C.loc = locate(usr.x+1, usr.y+1, usr.z)
					B.loc = locate(usr.x-1, usr.y+1, usr.z)
					D.loc = locate(usr.x-2, usr.y+1, usr.z)
					E.loc = locate(usr.x+2, usr.y+1, usr.z)
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					D.dir = NORTH
					E.dir = NORTH
					sleep(400)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					sleep(110)
				if(usr.dir == SOUTH)
					var/obj/doryuuheki/A = new /obj/doryuuheki/
					var/obj/doryuuheki/B = new /obj/doryuuheki/
					var/obj/doryuuheki/C = new /obj/doryuuheki/
					var/obj/doryuuheki/D = new /obj/doryuuheki/
					var/obj/doryuuheki/E = new /obj/doryuuheki/
					A.loc = locate(usr.x, usr.y-1, usr.z)
					C.loc = locate(usr.x+1, usr.y-1, usr.z)
					B.loc = locate(usr.x-1, usr.y-1, usr.z)
					D.loc = locate(usr.x-2, usr.y-1, usr.z)
					E.loc = locate(usr.x+2, usr.y-1, usr.z)
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					D.dir = SOUTH
					E.dir = SOUTH
					sleep(400)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					sleep(110)
				if(usr.dir == WEST)
					var/obj/doryuuheki/A = new /obj/doryuuheki/
					var/obj/doryuuheki/B = new /obj/doryuuheki/
					var/obj/doryuuheki/C = new /obj/doryuuheki/
					var/obj/doryuuheki/D = new /obj/doryuuheki/
					var/obj/doryuuheki/E = new /obj/doryuuheki/
					A.loc = locate(usr.x-1, usr.y, usr.z)
					C.loc = locate(usr.x-1, usr.y-1, usr.z)
					B.loc = locate(usr.x-1, usr.y-2, usr.z)
					D.loc = locate(usr.x-1, usr.y+1, usr.z)
					E.loc = locate(usr.x-1, usr.y+2, usr.z)
					A.dir = WEST
					B.dir = WEST
					C.dir = WEST
					D.dir = WEST
					E.dir = WEST
					sleep(400)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					sleep(110)
				if(usr.dir == EAST)
					var/obj/doryuuheki/A = new /obj/doryuuheki/
					var/obj/doryuuheki/B = new /obj/doryuuheki/
					var/obj/doryuuheki/C = new /obj/doryuuheki/
					var/obj/doryuuheki/D = new /obj/doryuuheki/
					var/obj/doryuuheki/E = new /obj/doryuuheki/
					A.loc = locate(usr.x+1, usr.y, usr.z)
					C.loc = locate(usr.x+1, usr.y-1, usr.z)
					B.loc = locate(usr.x+1, usr.y-2, usr.z)
					D.loc = locate(usr.x+1, usr.y+1, usr.z)
					E.loc = locate(usr.x+1, usr.y+2, usr.z)
					A.dir = EAST
					B.dir = EAST
					C.dir = EAST
					D.dir = EAST
					E.dir = EAST
					sleep(400)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					sleep(110)
					return
				return
mob/doton
	verb
		DotonDoryuudan() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Doton Doryuudan"
			usr.Handseals()
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(usr.chakra <= 99)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
				usr.move = 0 // Disables the mob's movement
				usr.DoryuudN += 1
				usr.chakra -= 100
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#deb887>D</FONT><FONT COLOR=#d8b78b>o</FONT><FONT COLOR=#d2b590>t</FONT><FONT COLOR=#cbb394>o</FONT><FONT COLOR=#c4b199>n</FONT><FONT COLOR=#bdaf9d> </FONT><FONT COLOR=#b7ada1>D</FONT><FONT COLOR=#b0aba6>o</FONT><FONT COLOR=#a9a9a9>r</FONT><FONT COLOR=#a69595>y</FONT><FONT COLOR=#a28080>u</FONT><FONT COLOR=#9e6a6a>u</FONT><FONT COLOR=#9b5555>d</FONT><FONT COLOR=#974040>a</FONT><FONT COLOR=#932b2b>n</FONT><FONT COLOR=#8f1515></FONT><FONT COLOR=#8b0000>!</FONT>"
				var/obj/Doryuudan5/D = new /obj/Doryuudan5
				var/obj/doryuudan/A = new /obj/doryuudan/
				D.loc = usr.loc
				A.loc = usr.loc
				D.nin=usr.nin
				D.dir = usr.dir
				usr.Chakragain()
				A.dir = usr.dir
				D.Move_Delay=2
				A.Move_Delay=2
				D.name="[usr]"
				D.GownerB=usr
				walk(D,usr.dir)
				sleep(1)
				usr.move = 1
				sleep(10)
				usr.firing = 0
				sleep(21)
				del(D)
				sleep(7)
				del(A)
				if (target == null)
					del(D)
					sleep(7)
					del(A)
/*				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
						usr.move = 0 // Disables the mob's movement
						usr.chakra -= 100
						usr.DoryuudN += 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Doryuudan"
						var/mob/obj/doton/dotonmissle1/D = new /mob/obj/doton/dotonmissle1
						var/mob/obj/doton/dotonmissle2/S = new /mob/obj/doton/dotonmissle2
						var/mob/obj/doton/dotonmissle1/K = new /mob/obj/doton/dotonmissle1
						K.loc = usr.loc
						K.nin=usr.nin
						K.dir = usr.dir
						K.name="[usr]"
						K.Move_Delay=1
						K.GownerA=usr
						K.Move()
						walk(K,usr.dir)
						sleep(5)
						D.loc = usr.loc
						D.nin=usr.nin
						D.dir = usr.dir
						D.name="[usr]"
						D.Move_Delay=1
						D.GownerB=usr
						D.Move()
						walk(D,usr.dir)
						sleep(5)
						S.loc = usr.loc
						S.nin=usr.nin
						S.dir = usr.dir
						S.name="[usr]"
						S.Move_Delay=1
						S.GownerC=usr
						S.Move()
						walk(S,usr.dir)
						sleep(1)
						usr.move = 1
						sleep(10)
						usr.firing = 0
						sleep(21)
						del(D)
						del(S)
						del(K)
						if (target == null)
							del(D)
							del(S)
							del(K)*/
mob/wind
	verb
		KazeNoYaiba()//dance 3
			set name = "Kaze No Yaiba"
			set desc = ""
			set category = "Jutsus"
			usr.Handseals()
			if(!usr.handseals)

				return
			for(var/mob/M in oview(2))
				if (M.ingat == 1||M.intank == 1||usr.Kaiten == 1)				.
					return
				if (M.sphere == 1)
					usr<<"Your attack bounces off of the sand!"
				if (usr.firing == 1)
					usr<<"Not right now!"
				if(usr.inso == 1)
					usr<<"Not while in Soutourou!"
				if(M.hit == 1)
					..()
				if (M.Kaiten == 1)
					var/damage = round(usr.tai/4)
					usr <<"You attack [M] but their kaiten reflects the damage back at you."
					M <<"You reflect [usr]'s attack causing them to hurt themself."
					usr.health -= damage
					usr.Death(M)
				else					//otherwise...
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Kaze No Yaiba!"
					usr << "You attack [M] with Kaze No Yaiba!"
					var/damage = round(usr.tai)
					view() << "[usr] hits [M] with Kaze No Yaiba for [damage] damage!"
					M.health -= damage
					M.Death(usr)
					M.hit = 1
					if(usr.Mtai <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
//RENKUUDAN IS THE SECOND OF THE FUUTON JUTSUS
mob/fuuton
	verb
		FuutonRenkuudan() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Fuuton Renkuudan No Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(usr.Fuuton2N >= 25)
					usr.chakra -= 15
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
					usr.Fuuton2N += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Fuuton: Renkuudan No Jutsu!"
					var/obj/FuutonRenkuudan/K = new /obj/FuutonRenkuudan
					K.loc = usr.loc
					K.nin=usr.nin
					K.dir = usr.dir
					K.Move_Delay=2
					usr.Chakragain()
					K.name="[usr]"
					K.Gowner=usr
					walk(K,usr.dir)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					sleep(10)
					usr.firing = 0
					sleep(45)
					del(K)
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 15
						usr.Fuuton2N += 1
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Fuuton: Renkuudan No Jutsu!"
						var/obj/FuutonRenkuudan/K = new /obj/FuutonRenkuudan
						K.loc = usr.loc
						K.nin=usr.nin
						K.Move_Delay=2
						K.dir = usr.dir
						K.name="[usr]"
						K.Gowner=usr
						walk(K,usr.dir)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						sleep(10)
						usr.firing = 0
						sleep(45)
						del(K)
mob/fuuton
	verb
		Fuuton_Daitoppa(mob/m in oview(usr)) // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Fuuton Daitoppa No Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(!usr.handseals)

				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
			if(usr.chakra <= 20)
				usr<<"You dont have enough chakra!"
				return
			else // If the firing var isn't 1...
				if(usr.Fuuton3N >= 40)
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
					usr.move = 0 // Disables the mob's movement
					usr.Fuuton3N += 1
					usr.chakra -= 20
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Fuuton Daitoppa No Jutsu!"
					var/obj/Fdaitoppa/D = new /obj/Fdaitoppa
					var/obj/Fdaitoppa/S = new /obj/Fdaitoppa
					var/obj/Fdaitoppa/K = new /obj/Fdaitoppa
					usr.target=m
					K.loc = usr.loc
					K.nin=usr.nin
					K.name="[usr]"
					usr.Chakragain()
					K.Move_Delay=2
					K.Gowner=usr
					walk_towards(K,m)
					sleep(5)
					D.loc = usr.loc
					D.nin=usr.nin
					D.Move_Delay=2
					D.name="[usr]"
					D.Gowner=usr
					walk_towards(D,m)
					sleep(5)
					S.loc = usr.loc
					S.nin=usr.nin
					S.Move_Delay=2
					S.name="[usr]"
					S.Gowner=usr
					walk_towards(S,m)
					sleep(1)
					usr.move = 1
					sleep(10)
					usr.firing = 0
					sleep(21)
					del(D)
					del(S)
					del(K)
					if (target == null)
						del(D)
						del(S)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
						usr.move = 0 // Disables the mob's movement
						usr.chakra -= 20
						usr.Fuuton3N += 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Fuuton Daitoppa No Jutsu!"
						var/obj/Fdaitoppa/D = new /obj/Fdaitoppa
						var/obj/Fdaitoppa/S = new /obj/Fdaitoppa
						var/obj/Fdaitoppa/K = new /obj/Fdaitoppa
						usr.target=m
						K.loc = usr.loc
						K.nin=usr.nin
						K.name="[usr]"
						K.Move_Delay=2
						K.Gowner=usr
						walk_towards(K,m)
						sleep(5)
						D.loc = usr.loc
						usr.Chakragain()
						D.nin=usr.nin
						D.Move_Delay=2
						D.name="[usr]"
						D.Gowner=usr
						walk_towards(D,m)
						sleep(5)
						S.loc = usr.loc
						S.nin=usr.nin
						S.Move_Delay=2
						S.name="[usr]"
						S.Gowner=usr
						walk_towards(S,m)
						sleep(1)
						usr.move = 1
						sleep(10)
						usr.firing = 0
						sleep(21)
						del(D)
						del(S)
						del(K)
						if (target == null)
							del(D)
							del(S)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
					usr<<"You failed to use Fuuton Daitoppa"
mob/fuuton
	verb
		FuutonKazeDangan() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Fuuton Kaze Dangan No Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(usr.Fuuton1N >= 25)
					usr.chakra -= 15
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
					usr.Fuuton1N += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Fuuton: Kaze Dangan No Jutsu!"
					var/obj/kazedangan/K = new /obj/kazedangan
					K.loc = usr.loc
					K.nin=usr.nin
					K.dir = usr.dir
					usr.Chakragain()
					K.name="[usr]"
					K.Move_Delay=2
					K.Gowner=usr
					walk(K,usr.dir)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					sleep(10)
					usr.firing = 0
					sleep(45)
					del(K)
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 15
						usr.Fuuton1N += 1
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Fuuton: Kaze Dangan No Jutsu!"
						var/obj/kazedangan/K = new /obj/kazedangan
						K.loc = usr.loc
						K.nin=usr.nin
						usr.Chakragain()
						K.Move_Delay=2
						K.dir = usr.dir
						K.name="[usr]"
						K.Gowner=usr
						walk(K,usr.dir)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						sleep(10)
						usr.firing = 0
						sleep(45)
						del(K)




//RAIKYUU IS THE FIRST OF THE RAI JUTSUS
mob/rai
	verb
		Raikyuu() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Raikyuu No Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(!usr.handseals)

				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			else // If the firing var isn't 1...
				if(usr.Rai1N >= 25)
					usr.chakra -= 15
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
					usr.Rai1N += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Raikyuu!"
					var/obj/Raikyuu/K = new /obj/Raikyuu
					K.loc = usr.loc
					K.nin=usr.nin
					K.dir = usr.dir
					K.Move_Delay=2
					K.name="[usr]"
					K.Gowner=usr
					usr.Chakragain()
					walk(K,usr.dir)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					sleep(10)
					usr.firing = 0
					sleep(45)
					del(K)
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 15
						usr.Rai1N += 1
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Raikyuu!"
						var/obj/Raikyuu/K = new /obj/Raikyuu
						K.loc = usr.loc
						K.nin=usr.nin
						K.dir = usr.dir
						K.name="[usr]"
						usr.Chakragain()
						K.Move_Delay=2
						K.Gowner=usr
						walk(K,usr.dir)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						sleep(10)
						usr.firing = 0
						sleep(45)
						del(K)
mob/rai
	verb
		Ikazuchi_No_Kiba() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Raikyuu No Jutsu"
			usr.Handseals()
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(usr.Rai3N >= 25)
					usr.chakra -= 15
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
					usr.Rai3N += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Ikazuchi No Kiba!"
					var/obj/Ikazuchi/K = new /obj/Ikazuchi
					K.loc = usr.loc
					usr.Chakragain()
					K.nin=usr.nin
					K.dir = usr.dir
					K.name="[usr]"
					K.Gowner=usr
					walk(K,usr.dir)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					sleep(10)
					usr.firing = 0
					sleep(45)
					del(K)
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 15
						usr.Rai3N += 1
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Ikazuchi No Kiba!"
						var/obj/Ikazuchi/K = new /obj/Ikazuchi
						K.loc = usr.loc
						K.nin=usr.nin
						K.dir = usr.dir
						usr.Chakragain()
						K.name="[usr]"
						K.Gowner=usr
						walk(K,usr.dir)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						sleep(10)
						usr.firing = 0
						sleep(45)
						del(K)
mob/rai
	verb
		RairyuuNoTatsumaki(mob/m in oview(usr)) // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Rairyuu No Tatsumaki"
			usr.Handseals()
			if(usr.firing||usr.Kaiten == 1) // If the mob's firing var is one...

				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			if(!usr.handseals)

				return
			else // If the firing var isn't 1...
				if(usr.Rai2N >= 52)
					usr.chakra -= 15
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
					usr.move = 0 // Disables the mob's movement
					usr.Rai2N += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Rairyuu No Tatsumaki!"
					var/obj/RairyuuTatsumaki/R = new /obj/RairyuuTatsumaki
					usr.target=m
					R.loc = usr.loc
					R.nin=usr.nin
					R.name="[usr]"
					usr.Chakragain()
					R.Gowner=usr
					walk_towards(R,m)
					sleep(1)
					usr.move = 1
					sleep(8)
					usr.firing = 0
					sleep(21)
					del(R)
					if (target == null)
						del(R)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							return
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 15
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
						usr.move = 0 // Disables the mob's movement
						usr.Rai2N += 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Rairyuu No Tatsumaki!"
						var/obj/RairyuuTatsumaki/R = new /obj/RairyuuTatsumaki
						usr.target=m
						R.loc = usr.loc
						R.nin=usr.nin
						R.name="[usr]"
						usr.Chakragain()
						R.Gowner=usr
						walk_towards(R,m)
						sleep(1)
						usr.move = 1
						sleep(8)
						usr.firing = 0
						sleep(21)
						del(R)
						if (target == null)
							del(R)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
							else
								return
mob/Hyuuga
	verb
		HakkeshouKaiten() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Hakkeshou Kaiten"
			if(usr.chakra <= 5)
				usr<<"You dont have enough chakra!"
				return
			if(usr.resting)
				return
			if(!usr.Kaiten&&!usr.firing)
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#0000ff>K</FONT><FONT COLOR=#3a48f7>a</FONT><FONT COLOR=#7491ef>i</FONT><FONT COLOR=#add8e6>t</FONT><FONT COLOR=#83c3cd>e</FONT><FONT COLOR=#57adb4>n</FONT><FONT COLOR=#2c969a>!</FONT><FONT COLOR=#008080>!</FONT>"
				usr.Frozen=1
				usr.firing = 1
				usr.overlays += 'hakkeshou.dmi'
				usr.Kaiten =1
				OMG
				if(usr.Kaiten)
					usr.chakra -=2
					if(usr.chakra <= 2)
						usr.move = 1
						usr.firing = 0
						usr.overlays -= 'hakkeshou.dmi'
						usr.Kaiten = 0
					else
						sleep(4)
						goto OMG
			else if(usr.Kaiten)
				usr.Frozen=0
				usr.firing = 0
				usr.overlays -= 'hakkeshou.dmi'
				usr.Kaiten =0
				usr<<"You release Hakkeshou Kaiten."
obj
	hyuugaeyes
		icon='byakuganthing.dmi'
mob/var/bya1=1
mob/var/bya2=0
mob/hyuuga
	verb
		Byakugan()
			set category = "Doujutsu"
			set name = "Byakugan"
			if(!usr.bya&&usr.bya1) // If the mob's firing var is one...
				var/obj/hyuugaeyes/B = new /obj/hyuugaeyes
				usr.dir=SOUTH
				B.loc = usr.loc
				usr.Frozen=1
				sleep(5)
				usr.overlays += 'byakugan.dmi'
				flick("1",B)
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#f5f5f5>B</FONT><FONT COLOR=#e4eff2>y</FONT><FONT COLOR=#d2e7ee>a</FONT><FONT COLOR=#bfe0ea>k</FONT><FONT COLOR=#add8e6>u</FONT><FONT COLOR=#b1d4df>g</FONT><FONT COLOR=#b5cfd7>a</FONT><FONT COLOR=#b9cad0>n</FONT><FONT COLOR=#bdc5c8>!</FONT><FONT COLOR=#c0c0c0>!</FONT>"
				view()<<"[usr]'s eyes grow brighter"
				usr.bya=1
				usr.byaU += 1
				usr.verbs += /mob/hyuuga/verb/HakkeRokujuuYonshou
				usr.verbs += /mob/hyuuga/verb/ByakuganSearch
				sleep(13)
				del(B)
				usr.Frozen=0
				if(usr.Mnin>=500&&usr.Mtai>=500)
					usr.bya1=0
					usr.bya2=1
				return
			if(!usr.bya&&usr.bya2) // If the firing var isn't 1...
				var/obj/hyuugaeyes/B = new /obj/hyuugaeyes
				usr.dir=SOUTH
				B.loc = usr.loc
				usr.Frozen=1
				sleep(5)
				usr.overlays += 'byakugan.dmi'
				flick("1",B)
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#f5f5f5>B</FONT><FONT COLOR=#e4eff2>y</FONT><FONT COLOR=#d2e7ee>a</FONT><FONT COLOR=#bfe0ea>k</FONT><FONT COLOR=#add8e6>u</FONT><FONT COLOR=#b1d4df>g</FONT><FONT COLOR=#b5cfd7>a</FONT><FONT COLOR=#b9cad0>n</FONT><FONT COLOR=#bdc5c8>!</FONT><FONT COLOR=#c0c0c0>!</FONT>"
				view()<<"[usr]'s eyes grow brighter with more intensity"
				usr.bya=1
				usr.byaU += 1
				usr.verbs += /mob/hyuuga/verb/HakkeRokujuuYonshou
				usr.verbs += /mob/hyuuga/verb/ByakuganSearch
				usr.verbs += /mob/hyuuga/verb/HakkeHyakuNijuhaSho
				sleep(13)
				del(B)
				usr.Frozen=0
				return
			else
				if(usr.bya)
					usr<<"You release Byakugan."
					usr.overlays -= 'byakugan.dmi'
					usr.verbs -= /mob/hyuuga/verb/HakkeRokujuuYonshou
					usr.verbs -= /mob/hyuuga/verb/ByakuganSearch
					usr.verbs -= /mob/hyuuga/verb/HakkeHyakuNijuhaSho
					usr.bya = 0
					usr.icon_state=""
					return

		ByakuganSearch()
			set category = "Doujutsu"
			set name = "Search"
			for(var/mob/M in world)
				if(M.client&&M.z==usr.z)
					usr<<"{\icon[M][M.name],Rank;[rank],[M] health;[M.health],Chakra;[M.chakra],[M] location; [M.x],[M.y]"
					usr<<"[M] health;[M.health],Chakra;[M.chakra]"
					usr<<"[M] location; [M.x],[M.y]"


mob/hyuuga
	verb
		HakkeRokujuuYonshou()
			set name ="Hakke Rokujuu Yonshou"
			set category = "Jutsus"
			if(usr.firing) // If the mob's firing var is one...
				return
			if(usr.bya)
				usr.hakkeRU += 1
				usr.firing = 1
				usr.health -= 190
				usr.underlays+='hyuugacircle.dmi'
				var/damage1 = round(usr.tai + rand(1,5))
				var/damage = round(usr.tai + rand(1,5))
				var/damage2 = round(usr.tai + rand(1,6))
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<font color=silver><center><b><font face=verdana>[usr] says: <FONT COLOR=#00bfff>H</FONT><FONT COLOR=#07b7fd>a</FONT><FONT COLOR=#0daffa>k</FONT><FONT COLOR=#14a6f7>k</FONT><FONT COLOR=#1a9df4>e</FONT><FONT COLOR=#2195f1> </FONT><FONT COLOR=#288ced>R</FONT><FONT COLOR=#2e83ea>o</FONT><FONT COLOR=#357ae7>k</FONT><FONT COLOR=#3b72e4>u</FONT><FONT COLOR=#4169e1>j</FONT><FONT COLOR=#4d71df>u</FONT><FONT COLOR=#5879dc>u</FONT><FONT COLOR=#6481d9> </FONT><FONT COLOR=#7089d6>Y</FONT><FONT COLOR=#7b91d3>o</FONT><FONT COLOR=#8799cf>n</FONT><FONT COLOR=#92a1cc>s</FONT><FONT COLOR=#9ea9c9>h</FONT><FONT COLOR=#aab1c6>o</FONT><FONT COLOR=#b5b9c3>u</FONT><FONT COLOR=#c0c0c0>!</FONT>"
					view()<<"<center><B><font size=2><font color=blue>[usr]:2 strikes!"
					view()<<"<center><B><font size=2><font color=blue>[usr] hit [M] for [damage] damage!"
					M.health -= damage
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><center><font size=2><font color=blue>[usr]:4 strikes!"
					M.health -= damage1
					view()<<"<B><center><font size=2><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><font size=2><center><font color=blue>[usr]:8 strikes!"
					M.health -= damage2
					view()<<"<B><font size=2><center><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><font size=2><center><font color=blue>[usr]:16 strikes!"
					M.health -= damage2
					view()<<"<B><font size=2><center><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><font size=2><center><font color=blue>[usr]:32 strikes!"
					M.health -= damage2
					view()<<"<B><font size=2><center><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><font size=2><center><font color=blue>[usr]:64 strikes!"
					M.health -= damage2
					view()<<"<B><font size=2><center><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
					usr.firing = 0
					usr.icon_state = ""
				usr.underlays-='hyuugacircle.dmi'
				usr.underlays-='hyuugacircle.dmi'
				usr.underlays-='hyuugacircle.dmi'
				usr.underlays-='hyuugacircle.dmi'
				usr.underlays-='hyuugacircle.dmi'
				usr.firing = 0
			else
				usr<<"You failed to use Hakke Rokujuu Yonshou"
mob/hyuuga
	verb
		HakkeHyakuNijuhaSho()
			set name ="Hakke Hyaku Nijuha Sho"
			set category = "Jutsus"
			if(usr.firing) // If the mob's firing var is one...
				return
			if(usr.bya)
				usr.firing = 1
				usr.underlays+='hyuugacircle.dmi'
				usr.health -= 190
				var/damage1 = round(usr.tai*1.5)
				var/damage = round(usr.tai)
				var/damage2 = round(usr.tai*2)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<font color=silver><center><b><font face=verdana>[usr] says: <FONT COLOR=#b0e0e6>H</FONT><FONT COLOR=#a7d6e6>a</FONT><FONT COLOR=#9dcbe6>k</FONT><FONT COLOR=#92c0e5>k</FONT><FONT COLOR=#88b5e5>e</FONT><FONT COLOR=#7eaae4> </FONT><FONT COLOR=#74a0e4>H</FONT><FONT COLOR=#6a95e3>y</FONT><FONT COLOR=#608ae3>a</FONT><FONT COLOR=#557fe2>k</FONT><FONT COLOR=#4b74e2>u</FONT><FONT COLOR=#4169e1> </FONT><FONT COLOR=#4d71df>N</FONT><FONT COLOR=#5879dc>i</FONT><FONT COLOR=#6481d9>j</FONT><FONT COLOR=#7089d6>u</FONT><FONT COLOR=#7b91d3>h</FONT><FONT COLOR=#8799cf>a</FONT><FONT COLOR=#92a1cc> </FONT><FONT COLOR=#9ea9c9>S</FONT><FONT COLOR=#aab1c6>h</FONT><FONT COLOR=#b5b9c3>o</FONT><FONT COLOR=#c0c0c0>!</FONT> "
					view()<<"<B><center><font size=2><font color=blue>[usr]:2 strikes!"
					view()<<"<B><center><font size=2><font color=blue>[usr] hit [M] for [damage] damage!"
					M.health -= damage
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><center><font size=2><font color=blue>[usr]:4 strikes!"
					M.health -= damage1
					view()<<"<B><center><font size=2><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><font size=2><center><font color=blue>[usr]:8 strikes!"
					M.health -= damage2
					view()<<"<B><font size=2><center><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><font size=2><center><font color=blue>[usr]:16 strikes!"
					M.health -= damage2
					view()<<"<B><font size=2><center><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><font size=2><center><font color=blue>[usr]:32 strikes!"
					M.health -= damage2
					view()<<"<B><font size=2><center><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><font size=2><center><font color=blue>[usr]:64 strikes!"
					M.health -= damage2
					view()<<"<B><font size=2><center><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
				sleep(5)
				for(var/mob/M in oview(1))
					if(M.Kaiten||M.sphere)
						usr.underlays-='hyuugacircle.dmi'
						return
					if(M.drunk&&M.NonClan)
						view()<<"[M] dodges [usr]'s attack"
						usr.underlays-='hyuugacircle.dmi'
						return
					view()<<"<B><font size=2><center><font color=blue>[usr]:128 strikes!"
					M.health -= damage2
					view()<<"<B><font size=2><center><font color=blue>[usr] hit [M] for [damage] damage!"
					M.Death(usr)
					usr.firing = 0
				usr.firing = 0
				usr.underlays-='hyuugacircle.dmi'
				usr.underlays-='hyuugacircle.dmi'
				usr.underlays-='hyuugacircle.dmi'
				usr.underlays-='hyuugacircle.dmi'
				usr.underlays-='hyuugacircle.dmi'
			else
				usr<<"You failed to use Hakke Hyaku Nijuha Sho"
mob/hyuuga
	verb
		HakkeKuusho(mob/M in oview(3))
			set name = "Hakke Kuushou"
			set category = "Jutsus"
			if(usr.firing) // If the mob's firing var is one...
				return
			if(M.drunk&&M.NonClan)
				view()<<"[M] dodges [usr]'s attack"
				return
			if (M.ingat == 1||M.intank == 1||usr.Kaiten == 1)				.
				return
			if(usr.chakra <= 10)
				usr<<"Not enough chakra!"
			if (M.inspike)
				usr<<"Your attack bounces off of [usr]!"
			if(usr.inso)
				usr<<"Not while in Soutourou!"
			if (M.sphere)
				usr<<"Your attack bounces off of the sand!"
			if (M.Kaiten)
				var/damage = round(usr.tai)
				usr <<"<B><font size=2><font color=blue>You attack [M] but their kaiten reflects the damage back at you."
				M <<"<B><font size=2><font color=blue>You reflect [usr]'s attack causing them to hurt themself."
				usr.health -= damage
				usr.Death(M)
			else
				if(usr.hakkeK >= 25)
					usr.hakkeK += 1
					usr.firing=1
					usr.chakra -= 10
					var/damage = round(usr.tai*1.6)
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#87ceeb>H</FONT><FONT COLOR=#83bce7>a</FONT><FONT COLOR=#7ea8e2>k</FONT><FONT COLOR=#7995dd>k</FONT><FONT COLOR=#7481d7>e</FONT><FONT COLOR=#6f6ed2> </FONT><FONT COLOR=#6a5acd>K</FONT><FONT COLOR=#7469d0>u</FONT><FONT COLOR=#7e79d2>u</FONT><FONT COLOR=#8888d5>s</FONT><FONT COLOR=#9397d7>h</FONT><FONT COLOR=#9da6da>o</FONT><FONT COLOR=#a7b6dc>u</FONT><FONT COLOR=#b0c4de>!</FONT>"
					M.health -= damage
					M.Death(usr)
					step(M,usr.dir)
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.hakkeK += 1
						usr.chakra -= 10
						usr.firing=1
						var/damage = round(usr.tai*1.6)
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#87ceeb>H</FONT><FONT COLOR=#83bce7>a</FONT><FONT COLOR=#7ea8e2>k</FONT><FONT COLOR=#7995dd>k</FONT><FONT COLOR=#7481d7>e</FONT><FONT COLOR=#6f6ed2> </FONT><FONT COLOR=#6a5acd>K</FONT><FONT COLOR=#7469d0>u</FONT><FONT COLOR=#7e79d2>u</FONT><FONT COLOR=#8888d5>s</FONT><FONT COLOR=#9397d7>h</FONT><FONT COLOR=#9da6da>o</FONT><FONT COLOR=#a7b6dc>u</FONT><FONT COLOR=#b0c4de>!</FONT>"
						M.health -= damage
						M.Death(usr)
						step(M,usr.dir)
				sleep(17)
				usr.firing=0
obj
	DemonMirror
		icon='mirror.dmi'
		icon_state=""
		density=1
obj
	DenseThing
		density=1
mob/var/tmp/hyoushou=0
mob/haku
	verb
		MakyouHyoushou(mob/M in oview(11))
			set category = "Jutsus"
			set name = "Makyou Hyoushou"
			usr.Handseals()
			if(usr.firing)
				return
			if(usr.chakra<=9999)
				return
			if(!usr.handseals)

				return
			if(!usr.hyoushou)
				usr<<"To throw needles use Sensatsu, When you are using Hyoushou, Sensatsu Suishou changes to fit your need"
				usr.hyoushou=1
				usr.Chakragain()
				usr.chakra-=5000
				M.hyoushou=1
				var/obj/DemonMirror/A = new /obj/DemonMirror
				var/obj/DemonMirror/B = new /obj/DemonMirror
				var/obj/DemonMirror/C = new /obj/DemonMirror
				var/obj/DemonMirror/D = new /obj/DemonMirror
				var/obj/DemonMirror/E = new /obj/DemonMirror
				var/obj/DemonMirror/F = new /obj/DemonMirror
				var/obj/DemonMirror/G = new /obj/DemonMirror
				var/obj/DemonMirror/H = new /obj/DemonMirror
				var/obj/DenseThing/A1 = new /obj/DenseThing
				var/obj/DenseThing/B2 = new /obj/DenseThing
				var/obj/DenseThing/C3 = new /obj/DenseThing
				var/obj/DenseThing/D4 = new /obj/DenseThing
				var/obj/DenseThing/E5 = new /obj/DenseThing
				var/obj/DenseThing/F6 = new /obj/DenseThing
				var/obj/DenseThing/G7 = new /obj/DenseThing
				var/obj/DenseThing/H8 = new /obj/DenseThing
				var/obj/DenseThing/I9 = new /obj/DenseThing
				var/obj/DenseThing/J10 = new /obj/DenseThing
				var/obj/DenseThing/K11 = new /obj/DenseThing
				var/obj/DenseThing/L12 = new /obj/DenseThing
				var/obj/DenseThing/M13 = new /obj/DenseThing
				var/obj/DenseThing/N14 = new /obj/DenseThing
				var/obj/DenseThing/O15 = new /obj/DenseThing
				var/obj/DenseThing/P16 = new /obj/DenseThing
				var/obj/DenseThing/Q17 = new /obj/DenseThing
				var/obj/DenseThing/R18 = new /obj/DenseThing
				var/obj/DenseThing/S19 = new /obj/DenseThing
				var/obj/DenseThing/T20 = new /obj/DenseThing
				var/obj/DenseThing/U21 = new /obj/DenseThing
				var/obj/DenseThing/V22 = new /obj/DenseThing
				var/obj/DenseThing/W23 = new /obj/DenseThing
				var/obj/DenseThing/X24 = new /obj/DenseThing
				A1.owner=usr
				B2.owner=usr
				C3.owner=usr
				D4.owner=usr
				E5.owner=usr
				F6.owner=usr
				G7.owner=usr
				H8.owner=usr
				I9.owner=usr
				J10.owner=usr
				K11.owner=usr
				L12.owner=usr
				M13.owner=usr
				N14.owner=usr
				O15.owner=usr
				P16.owner=usr
				Q17.owner=usr
				R18.owner=usr
				S19.owner=usr
				T20.owner=usr
				U21.owner=usr
				V22.owner=usr
				W23.owner=usr
				X24.owner=usr
				A1.loc = locate(M.x-3,M.y+4,M.z)//Tops
				B2.loc = locate(M.x-2,M.y+4,M.z)//Tops
				C3.loc = locate(M.x-1,M.y+4,M.z)//Tops
				D4.loc = locate(M.x+1,M.y+4,M.z)//Tops
				E5.loc = locate(M.x+2,M.y+4,M.z)//Tops
				F6.loc = locate(M.x+3,M.y+4,M.z)//Tops
				G7.loc = locate(M.x-3,M.y-4,M.z)//Bottoms
				H8.loc = locate(M.x-2,M.y-4,M.z)//Bottoms
				I9.loc = locate(M.x-1,M.y-4,M.z)//Bottoms
				J10.loc = locate(M.x+1,M.y-4,M.z)//Bottoms
				K11.loc = locate(M.x+2,M.y-4,M.z)//Bottoms
				L12.loc = locate(M.x+3,M.y-4,M.z)//Bottoms
				M13.loc = locate(M.x-4,M.y+1,M.z)//Lefts
				N14.loc = locate(M.x-4,M.y+2,M.z)//Lefts
				O15.loc = locate(M.x-4,M.y+3,M.z)//Lefts
				P16.loc = locate(M.x-4,M.y-1,M.z)//Lefts
				Q17.loc = locate(M.x-4,M.y-2,M.z)//Lefts
				R18.loc = locate(M.x-4,M.y-3,M.z)//Lefts
				S19.loc = locate(M.x+4,M.y+1,M.z)//Rights
				T20.loc = locate(M.x+4,M.y+2,M.z)//Rights
				U21.loc = locate(M.x+4,M.y+3,M.z)//Rights
				V22.loc = locate(M.x+4,M.y-1,M.z)//Rights
				W23.loc = locate(M.x+4,M.y-2,M.z)//Rights
				X24.loc = locate(M.x+4,M.y-3,M.z)//Rights
				A.loc = locate(M.x-4,M.y,M.z)
				A.owner=usr
				B.loc = locate(M.x,M.y-4,M.z)
				B.owner=usr
				C.loc = locate(M.x-4,M.y-4,M.z)
				C.owner=usr
				D.loc = locate(M.x+4,M.y,M.z)
				D.owner=usr
				E.loc = locate(M.x+4,M.y+4,M.z)
				E.owner=usr
				F.loc = locate(M.x,M.y+4,M.z)
				F.owner=usr
				G.loc = locate(M.x+4,M.y-4,M.z)
				G.owner=usr
				H.loc = locate(M.x-4,M.y+4,M.z)
				H.owner=usr
				Gotcha
					if(usr.chakra>=5)
						if(usr.hyoushou)
							if(A)
								usr.loc = A.loc
								usr.chakra-=100
							sleep(13)
							if(B)
								usr.loc = B.loc
								usr.chakra-=100
							sleep(13)
							if(C)
								usr.loc = C.loc
								usr.chakra-=100
							sleep(13)
							if(D)
								usr.loc = D.loc
								usr.chakra-=100
							sleep(13)
							if(E)
								usr.loc = E.loc
								usr.chakra-=100
							sleep(13)
							if(F)
								usr.loc = F.loc
								usr.chakra-=100
							sleep(13)
							if(G)
								usr.loc = G.loc
								usr.chakra-=100
							sleep(13)
							if(H)
								usr.loc = H.loc
								usr.chakra-=100
							goto Gotcha
						else
							del(A)
							del(B)
							del(C)
							del(D)
							del(E)
							del(F)
							del(G)
							del(H)
							del(A1)
							del(B2)
							del(C3)
							del(D4)
							del(E5)
							del(F6)
							del(G7)
							del(H8)
							del(I9)
							del(J10)
							del(K11)
							del(L12)
							del(M13)
							del(N14)
							del(O15)
							del(P16)
							del(Q17)
							del(R18)
							del(S19)
							del(T20)
							del(U21)
							del(V22)
							del(W23)
							del(X24)
							sleep(600)
							usr.hyoushou=0
							M.hyoushou=0
							return
					else
						del(A)
						del(B)
						del(C)
						del(D)
						del(E)
						del(F)
						del(G)
						del(H)
						del(A1)
						del(B2)
						del(C3)
						del(D4)
						del(E5)
						del(F6)
						del(G7)
						del(H8)
						del(I9)
						del(J10)
						del(K11)
						del(L12)
						del(M13)
						del(N14)
						del(O15)
						del(P16)
						del(Q17)
						del(R18)
						del(S19)
						del(T20)
						del(U21)
						del(V22)
						del(W23)
						del(X24)
						sleep(600)
						usr.hyoushou=0
						M.hyoushou=0
						return
			else
				for(var/obj/DemonMirror/S in world)
					if(S.owner==usr)
						del(S)
				for(var/obj/DenseThing/T in world)
					if(T.owner==usr)
						del(T)
				sleep(600)
				usr.hyoushou=0
				M.hyoushou=0

mob/haku
	verb
		SensatsuSuishou() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Sensatsu Suishou"
			if(usr.firing)
				return
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			else // If the firing var isn't 1...
				if(!usr.hyoushou)
					usr.chakra -= 10
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam // Disables the mob's movement
					usr.SensatsuN += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#c0c0c0>S</FONT><FONT COLOR=#c4c8c8>e</FONT><FONT COLOR=#c8d0d0>n</FONT><FONT COLOR=#ccd8d8>s</FONT><FONT COLOR=#d1e0e0>a</FONT><FONT COLOR=#d5e8e8>t</FONT><FONT COLOR=#d9f0f0>s</FONT><FONT COLOR=#ddf8f8>u</FONT><FONT COLOR=#e0ffff> </FONT><FONT COLOR=#dbfbfd>S</FONT><FONT COLOR=#d4f6fa>u</FONT><FONT COLOR=#cef1f6>i</FONT><FONT COLOR=#c7ecf3>s</FONT><FONT COLOR=#c1e7f0>h</FONT><FONT COLOR=#bae2ed>o</FONT><FONT COLOR=#b4dde9>u</FONT><FONT COLOR=#add8e6>!</FONT>"
					var/obj/Sensatsu/S1 = new /obj/Sensatsu
					var/obj/Sensatsu/S2 = new /obj/Sensatsu
					var/obj/Sensatsu/S3 = new /obj/Sensatsu
					var/obj/Sensatsu/S4 = new /obj/Sensatsu
					usr.Chakragain()
					S1.loc = usr.loc
					S1.tai=usr.tai
					S1.dir = NORTH
					S1.name="[usr]"
					usr.Savedspeed = usr.Move_Delay
					usr.Move_Delay = usr.Speed2
					S1.Gowner=usr
					walk(S1,NORTH)
					S2.loc = usr.loc
					S2.tai=usr.tai
					S2.dir = SOUTH
					S2.name="[usr]"
					usr.Savedspeed = usr.Move_Delay
					usr.Move_Delay = usr.Speed2
					S2.Gowner=usr
					walk(S2,SOUTH)
					S3.loc = usr.loc
					S3.tai=usr.tai
					S3.dir = WEST
					S3.name="[usr]"
					usr.Savedspeed = usr.Move_Delay
					usr.Move_Delay = usr.Speed2
					S3.Gowner=usr
					walk(S3,WEST)
					S4.loc = usr.loc
					S4.tai=usr.tai
					S4.dir = EAST
					S4.name="[usr]"
					usr.Savedspeed = usr.Move_Delay
					usr.Move_Delay = usr.Speed2
					S4.Gowner=usr
					walk(S4,EAST)
					sleep(10)
					usr.firing = 0
					sleep(45)
					del(S1)
					del(S2)
					del(S3)
					del(S4)
					return
				else
					for(var/mob/M in oview(6,usr))
						if(M.hyoushou)
							usr.chakra -= 20
							usr.SensatsuN += 1
							usr.firing = 1
							var/obj/Sensatsu/S1 = new /obj/Sensatsu
							var/obj/Sensatsu/S2 = new /obj/Sensatsu
							var/obj/Sensatsu/S3 = new /obj/Sensatsu
							var/obj/Sensatsu/S4 = new /obj/Sensatsu
							S1.loc = usr.loc
							S1.tai=usr.tai
							S1.name="[usr]"
							S1.Gowner=usr
							walk_towards(S1,M)
							sleep(5)
							S2.loc = usr.loc
							S2.tai=usr.tai
							S2.name="[usr]"
							S2.Gowner=usr
							walk_towards(S2,M)
							sleep(5)
							S3.loc = usr.loc
							S3.tai=usr.tai
							S3.name="[usr]"
							S3.Gowner=usr
							walk_towards(S3,M)
							sleep(5)
							S4.loc = usr.loc
							S4.tai=usr.tai
							S4.name="[usr]"
							S4.Gowner=usr
							walk_towards(S4,M)
							sleep(10)
							usr.firing = 0
							sleep(40)
							del(S1)
							del(S2)
							del(S3)
							del(S4)
							return
mob/var
	KyuuN=0
	tmp/captured=0
mob/gaara
	verb
		SabakuSousou()
			set category = "Jutsus"
			set name = "Sabaku Sousou"
			usr.Handseals()
			if(!usr.handseals)

				return
			for(var/mob/M in oview(10,usr))
				if(usr.sphere)
					return
				if(usr.chakra<=10000)
					usr<<"Not Enough Chakra"
					return
				if(M.captured)
					usr.random=rand(1,3)
					if(usr.random==2)
						usr.firing=1
						var/damage=usr.nin*20
						view(usr)<<"Sabaku Sousou!"
						flick("sousou",M)
						M.overlays-='kyuu.dmi'
						M.overlays-='kyuu.dmi'
						usr.Chakragain()
						M.overlays-='kyuu.dmi'
						M.health-=damage
						M.captured=0
						usr.firing=0
						if(M.health<=0)
							M.Death(usr)
					else
						usr<<"You fail to use Sabaku Sousou"
						usr.firing=1
						sleep(10)
						usr.firing=0
						return
				else
					return
mob/gaara
	verb
		SabakuKyuu(mob/M in oview(10))
			set category = "Jutsus"
			set name = "Sabaku Kyuu"
			usr.Handseals()
			if(!usr.handseals)

				return
			if(usr.firing)
				return
			if(usr.sphere)
				return
			if(usr.chakra<=10000)
				usr<<"Not Enough Chakra"
				return
			if(M.Kaiten)
				return
			if(M.captured)
				usr<<"He is already caught!"
				return
			else
				if(usr.KyuuN>=100)
					usr.chakra -= 10000
					usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
					usr.KyuuN += 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Sabaku Kyuu!"
					M.overlays+='kyuu.dmi'
					M.captured=1
					usr.Chakragain()
					M.Frozen=1
					sleep(100)
					if(M)
						M.captured=0
						M.Frozen=0
						M.overlays-='kyuu.dmi'
						M.overlays-='kyuu.dmi'
						M.overlays-='kyuu.dmi'
						M.overlays-='kyuu.dmi'
						usr.firing=0
					return
				else
					usr.random=rand(1,5)
					if(usr.random==1)
						usr.chakra -= 10000
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
						usr.KyuuN += 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Sabaku Kyuu!"
						M.overlays+='kyuu.dmi'
						M.captured=1
						M.Frozen=1
						sleep(100)
						if(M)
							M.captured=0
							M.Frozen=0
							M.overlays-='kyuu.dmi'
							M.overlays-='kyuu.dmi'
							M.overlays-='kyuu.dmi'
							M.overlays-='kyuu.dmi'
							usr.firing=0
						return
					if(usr.random==2)
						usr.chakra -= 10000
						usr.firing = 1 // Sets the firing var to 1, so he cant fire another beam
						usr.KyuuN += 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Sabaku Kyuu!"
						M.overlays+='kyuu.dmi'
						M.captured=1
						M.Frozen=1
						sleep(100)
						if(M)
							M.captured=0
							M.Frozen=0
							M.overlays-='kyuu.dmi'
							M.overlays-='kyuu.dmi'
							M.overlays-='kyuu.dmi'
							M.overlays-='kyuu.dmi'
						usr.firing=0
						return
					if(usr.random==3)
						usr<<"You fail to use Sabaku Kyuu"
						usr.firing=1
						sleep(40)
						usr.firing=0
						return
					if(usr.random==4)
						usr<<"You fail to use Sabaku Kyuu"
						usr.firing=1
						sleep(40)
						usr.firing=0
						return
					if(usr.random==5)
						usr<<"You fail to use Sabaku Kyuu"
						usr.firing=1
						sleep(40)
						usr.firing=0
						return
					sleep(100)
					usr.firing=0
					if(M)
						M.captured=0
mob/gaara
	verb
		SunaShuriken()
			set category = "Jutsus"
			set name = "Suna Shuriken"
			usr.Handseals()
			if(!usr.handseals)

				return
			if(usr.firing||usr.Kaiten == 1)

				return
			if(usr.inso == 1)
				usr<<"Not while in Soutourou!"
			if(usr.chakra <= 15)
				usr<<"You dont have enough chakra!"
				return
			else // If the firing var isn't 1...
				if(usr.SSU >= 25)
					usr.chakra -= 15
					usr.firing = 1
					usr.SSU += 1
					view()<<"[usr] Suna Shuriken!!!"
					var/obj/Sshuriken/K = new /obj/Sshuriken
					K.loc = usr.loc
					K.nin=usr.nin
					usr.Chakragain()
					K.dir = usr.dir
					K.name="[usr]"
					K.Gowner=usr
					walk(K,usr.dir)
					if (target == null)
						del(K)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
									return
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					sleep(10)
					usr.firing = 0
					sleep(45)
					del(K)
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 15
						usr.firing = 1
						usr.SSU += 1
						view()<<"[usr] Suna Shuriken!!!"
						var/obj/Sshuriken/K = new /obj/Sshuriken
						K.loc = usr.loc
						K.nin=usr.nin
						K.dir = usr.dir
						usr.Chakragain()
						K.name="[usr]"
						K.Gowner=usr
						walk(K,usr.dir)
						if (target == null)
							del(K)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									if(usr.ChakraC>=100)
										usr.ChakraC=100
										return
									else
										usr.ChakraC+=ccgain
										usr<<"[usr] you gained [ccgain] Chakra control..."
						sleep(10)
						usr.firing = 0
						sleep(45)
						del(K)
mob/gaara
	verb
		SunaShushinNoJutsu(mob/M in oview(10))
			set category = "Jutsus"
			set name = "Suna Shushin No Jutsu"
			if(usr.firing||usr.Kaiten == 1||usr.sphere == 1)

				return
			if(usr.chakra <= 17)
				usr<<"Not enough Chakra!"
			else
				usr.overlays += 'Sshushin.dmi'
				usr.chakra -= 17
				usr.loc = locate(M.x,M.y-1,M.z)
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Suna Shushin No Jutsu!!"
				sleep(8)
				usr.overlays -= 'Sshushin.dmi'
				usr.overlays -= 'Sshushin.dmi'
				usr.overlays -= 'Sshushin.dmi'
				usr.overlays -= 'Sshushin.dmi'
mob/gaara
	verb
		SandSphere()
			set category = "Jutsus"
			set name = "Sand Sphere"
			if(usr.chakra <= 50)
				usr<<"You dont have enough chakra!"
				return
			if(usr.firing&&!usr.sphere)
				usr<<"Not now."
				return
			if(usr.resting)
				return
			if(!usr.sphere&&!usr.firing)
				view()<<"<font color = blue>[usr]: Sand Sphere!"
				usr.Frozen=1
				usr.firing = 1
				usr.overlays += /obj/Sphere
				usr.verbs += new /mob/gaara2/verb/AttackNorth()
				usr.verbs += new /mob/gaara2/verb/AttackSouth()
				usr.verbs += new /mob/gaara2/verb/AttackEast()
				usr.verbs += new /mob/gaara2/verb/AttackWest()
				usr.sphere =1
				sand
				if(usr.sphere)
					usr.chakra -=4
					if(usr.chakra <= 4)
						usr.Frozen=0
						usr.firing = 0
						usr.overlays -= /obj/Sphere
						usr.sphere = 0
						usr.verbs -= new /mob/gaara2/verb/AttackNorth()
						usr.verbs -= new /mob/gaara2/verb/AttackSouth()
						usr.verbs -= new /mob/gaara2/verb/AttackEast()
						usr.verbs -= new /mob/gaara2/verb/AttackWest()
						return
					else
						sleep(4)
						goto sand
			else if(usr.sphere)
				usr.Frozen=0
				usr.firing = 0
				usr.overlays -= /obj/Sphere
				usr.sphere =0
				usr<<"You take down the sand sphere."
				usr.verbs -= new /mob/gaara2/verb/AttackNorth()
				usr.verbs -= new /mob/gaara2/verb/AttackSouth()
				usr.verbs -= new /mob/gaara2/verb/AttackEast()
				usr.verbs -= new /mob/gaara2/verb/AttackWest()

mob/gaara2
	verb
		AttackNorth()
			set category = "Jutsus"
			set name = "Attack north"
			for(var/mob/M in get_step(usr,NORTH))
				if(M.ingat||M.intank)				.
					return
				if(M.Kaiten)
					return
				if(M.sphere)
					return
				var/damage = round(usr.tai)
				usr.chakra -= 10
				M.overlays += 'up.dmi'
				M.health -= damage
				sleep(3)
				M.overlays -= 'up.dmi'
				if(M.health <=0)
					M.Death(usr)

		AttackSouth()
			set category = "Jutsus"
			set name = "Attack south"
			for(var/mob/M in get_step(usr,SOUTH))
				if(M.ingat||M.intank)				.
					return
				if(M.Kaiten)
					return
				if(M.sphere)
					return
				var/damage = round(usr.tai)
				usr.chakra -= 10
				M.overlays += 'up.dmi'
				M.health -= damage
				sleep(3)
				M.overlays -= 'up.dmi'
				if(M.health <=0)
					M.Death(usr)
		AttackWest()
			set category = "Jutsus"
			set name = "Attack west"
			for(var/mob/M in get_step(usr,WEST))
				if(M.ingat||M.intank)				.
					return
				if(M.Kaiten)
					return
				if(M.sphere)
					return
				var/damage = round(usr.tai/5)
				usr.chakra -= 10
				M.overlays += 'up.dmi'
				M.health -= damage
				sleep(3)
				M.overlays -= 'up.dmi'
				if(M.health <=0)
					M.Death(usr)
		AttackEast()
			for(var/mob/M in get_step(usr,EAST))
				if(M.ingat||M.intank)				.
					return
				if(M.Kaiten)
					return
				if(M.sphere)
					return
				var/damage = round(usr.tai/5)
				usr.chakra -= 10
				M.overlays += 'up.dmi'
				M.health -= damage
				sleep(3)
				M.overlays -= 'up.dmi'
				if(M.health <=0)
					M.Death(usr)

obj
	bunshins
		SunaBunshinnojutsu
			verb/SunaBunshinNoJutsu()
				set name = "Suna Bunshin no jutsu"
				set desc = "Create a clone of sand that can attack"
				set category = "Jutsus"
				usr.Handseals()
				if(usr.chakra <= 17)
					usr << "Not enough chakra!"
					return
				if (usr.firing)
					return
				if(!usr.handseals)

					return
				else
					usr.KillBunshin()
					usr.firing=1
					view() << "<font color=silver><b><font face=verdana>[usr] says:Suna Bunshin No Jutsu!!"
					var/mob/npcs/KBunshin/S = new /mob/npcs/KBunshin
					usr.sunaU += 1
					usr.Chakragain()
					usr.Sbunshin += 1
					if(S)
						S.original = usr
						S.name = "[usr.name]"
						S.icon = usr.icon
						S.overlays += usr.overlays
						S.loc = locate(usr.x, usr.y - 1, usr.z)
						S.tai = usr:tai/8
						S.health = 1
						usr.chakra -= 17
					sleep(20)
					usr.firing=0
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
//Baika no Jutsu    Bubun Baika no Jutsu
mob/Akimichi
	verb
		BaikaNoJutsu() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Baika No Jutsu"
			usr.Handseals()
			if(usr.Henge)
				return
			if(usr.firing)
				return
			if(usr.intank)
				return
			if(usr.chakra <= 11)
				return
			if(usr.calories <= 200)
				return
			if(!usr.handseals)

				return
			else
				view()<<"<font color=silver><b><font face=verdana>[usr]: Baika No Jutsu!!"
				usr.chakra -= 11
				usr.calories -= 200
				usr.inbaika = 1
				usr.Chakragain()
				sleep(200)
				usr.inbaika = 0
obj
	babunarm
		density=1
		icon='babun.dmi'
		icon_state="arm"
		New()
			..()
			spawn()
				src.delete()
		proc/delete()
			spawn(15)
				del(src)
obj
	babunfist
		density=1
		icon='babun.dmi'
		icon_state="fist"
		Move()
			..()
			var/obj/babunarm/T = new /obj/babunarm
			if(src.dir == NORTH)
				T.loc = src.loc
				T.y = src.y-1
				T.dir = src.dir
			if(src.dir == SOUTH)
				T.loc = src.loc
				T.y = src.y+1
				T.dir = src.dir
			if(src.dir == WEST)
				T.loc = src.loc
				T.x = src.x+1
				T.dir = src.dir
			if(src.dir == EAST)
				T.loc = src.loc
				T.x = src.x-1
				T.dir = src.dir
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.tai*10)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Babun Baika No Jutsu for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
mob/Akimichi
	verb
		BabunBaikaNoJutsu()
			set category = "Jutsus"
			set name = "Bubun Baika No Jutsu"
			usr.Handseals()
			if(usr.Henge)
				return
			if(usr.firing)
				return
			if(!usr.handseals)

				return
			if(usr.intank)
				return
			if(usr.chakra <= 500)
				return
			if(usr.calories <= 200)
				return
			else
				usr.firing=1
				view()<<"<font color=silver><b><font face=verdana>[usr]: Bubun Baika No Jutsu!!"
				usr.chakra -= 500
				usr.calories -= 200
				var/obj/babunfist/B = new /obj/babunfist
				B.Gowner=usr
				B.tai = usr.tai
				B.loc = usr.loc
				B.Move_Delay=1.5
				usr.Chakragain()
				walk(B,usr.dir)
				sleep(10)
				usr.firing=0
				sleep(15)
				del(B)
mob/Akimichi
	verb
		NikudanHariSensha()
			set category = "Jutsus"
			set name = "Nikudan Hari Sensha"
			usr.kunai=0
			for(var/obj/kunai in usr.contents)
				usr.kunai+=1
			if(usr.kunai < 5)
				usr<<"<font color=silver><b><font face=verdana>You must have atleast 5 kunais!"
				if(usr.kunai<=0)
					usr.kunai=0
				return
			if(!usr.inbaika)
				usr<<"<font color=silver><b><font face=verdana>You must first use baika no jutsu!"
				return
			if(usr.firing)
				return
			else .
				if(usr.SpikeN >= 34)
					var/list/O = usr.overlays.Copy()
					view()<<"<font color=blue><b><font face=verdana>[usr]:Nikudan Hari Sensha!"
					usr.SpikeN += 1
					usr.inspike = 1
					usr.overlays = usr.overlays.Remove(usr.overlays)
					usr.icon='meattank.dmi'
					usr.Savedspeed = usr.Move_Delay
					usr.Move_Delay = usr.Speed2
					usr.firing = 1
					sleep(30)
					usr.icon = usr.Oicon
					usr.overlays = O.Copy()
					usr.inspike = 0
					usr.Move_Delay = usr.Savedspeed
					usr.firing = 0
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						view()<<"<font color=blue><b><font face=verdana>[usr]:Nikudan Hari Sensha"
						usr.MN += 1
						usr.inspike= 1
						usr.icon='meattank.dmi'
						usr.Savedspeed = usr.Move_Delay
						usr.Move_Delay = usr.Speed2
						usr.firing = 1
						usr.overlays += 'meattank.dmi'
						sleep(30)
						usr.icon = usr.Oicon
						usr.inspike = 0
						usr.overlays -= 'meattank.dmi'
						usr.Move_Delay = usr.Savedspeed
						usr.firing = 0
mob/Akimichi
	verb
		NikudanSensha()
			set category = "Jutsus"
			set name = "Nikudan Sensha"
			if(usr.inbaika == 0)
				usr<<"<font color=silver><b><font face=verdana>You must first use baika no jutsu!"
			if(usr.ingat == 1||usr.Kaiten == 1||usr.intank == 1||usr.firing)

				return
			else .
				if(usr.MN >= 34)
					var/list/O = usr.overlays.Copy()
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Nikudan Sensha!"
					usr.MN += 1
					usr.intank = 1
					usr.overlays = usr.overlays.Remove(usr.overlays)
					usr.icon='MTS.dmi'
					usr.Savedspeed = usr.Move_Delay
					usr.Move_Delay = usr.Speed3
					usr.firing = 1
					sleep(30)
					usr.icon = usr.Oicon
					usr.overlays = O.Copy()
					usr.intank = 0
					usr.Move_Delay = usr.Savedspeed
					usr.firing = 0
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Nikudan Sensha!"
						usr.MN += 1
						usr.intank = 1
						usr.icon='MTS.dmi'
						usr.Savedspeed = usr.Move_Delay
						usr.Move_Delay = usr.Speed3
						usr.firing = 1
						usr.overlays += 'MTS.dmi'
						sleep(30)
						usr.icon = usr.Oicon
						usr.intank = 0
						usr.overlays -= 'MTS.dmi'
						usr.Move_Delay = usr.Savedspeed
						usr.firing = 0
mob/aburame
	verb
		DestroyKonchuu()
			set category = "Jutsus"
			set name = "Destroy Konchuu"
			for(var/mob/M in world)
				if(M.havekonchuu)
					M.havekonchuu=0
					M<<"A Konchuu has fallen off"
					usr<<"A Konchuu has fallen off [M]'s shoulder"

mob/aburame
	verb
		summonkonchuu()
			set category = "Jutsus"
			set name = "Summon Konchuu"
			if(usr.firing)
				return
			if(usr.chakra <= 10)
				usr<<"Not enough Chakra!"
			else
				usr.chakra -= 15
				usr.Konchuu = 15
				usr<<"You now have 15 Konchuu"
mob/var/tmp/konchuuperson
mob/aburame
	verb
		Placekonchuu(mob/M in oview(2))
			set category = "Jutsus"
			set name = "Place Konchuu"
			if(M)
				if(M.havekonchuu)
					usr<<"Only one bug at a time."
					return
			if(usr.firing)
				return
			if(M.Kaiten||M.sphere)
				usr << "Your Konchuu would be killed if you put it on them right now!"
				return
			if(usr.Konchuu <= 0)
				usr<<"You dont have any konchuu bugs to place!"
				return
			if(usr.chakra <= 12)
				usr<<"Not enough Chakra!"
				return
			else
				usr<<"You place a chakra draining Konchuu on [M]!"
				usr.chakra -= 12
				usr.Konchuu -= 1
				M.havekonchuu = 1
				M.konchuuperson="[usr]"
				M.placebug()
				sleep(600)
				if(M)
					M.havekonchuu=0
					M.konchuuperson=""
					M<<"[usr]'s bug has fallen off your shoulder."
					usr<<"A bug has fallen off of [M]'s shoulder."
mob/proc/placebug()
	if(!src.havekonchuu)
		return
	else
		src.chakra -= 100
		if(src.chakra<=0)
			src.chakra = 0
		sleep(10)
		src.placebug()
mob/var/tmp/konchdelay=0
mob/aburame
	verb
		ExplodeKonchuu()
			set category = "Jutsus"
			set name = "Explode Konchuu"
			usr.Handseals()
			if(usr.konchdelay)
				return
			if(!usr.handseals)

				return
			for(var/mob/M in world)
				if(M.havekonchuu&&M.konchuuperson=="[usr]")
					usr.konchdelay=1
					flick("boom",M)
					var/damage = round(usr.nin*4)
					M<<"[usr]'s Konchuu explodes on your shoulder giving you [damage] damage!"
					usr<<"A Konchuu explodes on [M]'s shoulder giving them [damage] damage!"
					M.havekonchuu=0
					M.konchuuperson=null
					usr.Chakragain()
					M.health -= damage
					M.Death(usr)
			sleep(30)
			usr.konchdelay=0
obj
	bunshins
		KekkaiKonchuuBunshinnoJutsu
			verb/KekkaiKonchuuBunshinnoJutsu()
				set name = "Kekkai Konchuu Bunshin no jutsu"
				set desc = "Create a clone out of bugs"
				set category = "Jutsus"
				usr.Handseals()
				if(usr.Konchuu <= 10)
					usr << "Not enough bugs!"
					return
				if(usr.chakra <= 25)
					usr << "Not enough chakra!"
					return
				if (usr.firing)
					return
				if(!usr.handseals)

					return
				else
					usr.KillBunshin()
					view() << "<font color=silver><b><font face=verdana>[usr] says:Kekkai Konchuu Bunshin No Jutsu!!"
					usr.firing = 1
					var/mob/npcs/KBunshin/S = new /mob/npcs/KBunshin
					usr.KKbunshin += 1
					usr.Chakragain()
					usr.Konchuu -= 5
					if(S)
						S.original = usr
						S.name = "[usr.name]"
						S.icon = usr.icon
						S.overlays += usr.overlays
						S.loc = locate(usr.x, usr.y - 1, usr.z)
						S.tai = usr.Mtai/2
						S.health = usr.maxhealth/2
						usr.chakra -= 17
					sleep(30)
					usr.firing = 0
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,5)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,7)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								if(usr.ChakraC>=100)
									usr.ChakraC=100
								else
									usr.ChakraC+=ccgain
									usr<<"[usr] you gained [ccgain] Chakra control..."
mob/var/tmp/jourou=0
mob/Hunternin
	verb
		JourouSenbon(mob/M in oview(3))
			set category="Jutsus"
			set name="Jourou Senbon"
			if(usr.firing)
				return
			if(M.Kaiten)
				return
			if(M.sphere)
				return
			if(M.jourou)
				usr<<"He is vulnerable (Hes already under the effects of a Senbon)"
				return
			if(usr.chakra>=50)
				usr.firing=1
				sleep(10)
				usr.random=rand(1,8)
				if(usr.random==1)
					var/damage=usr.tai
					usr<<"You hit [M]'s leg with Jourou Senbon ([damage] damage)"
					M<<"Your leg has been hit by [usr]'s Jourou Senbon slowing your movements ([damage] damage)!"
					M.Move_Delay=10
					M.jourou=1
					M.health-=damage
					if(M.health<=0)
						M.Death(usr)
						usr.firing=0
						return
					usr.firing=0
					sleep(300)
					M.jourou=0
					M.Move_Delay=0
					return
				if(usr.random==6)
					var/damage=usr.tai*2
					usr<<"You hit [M]'s torso with Jourou Senbon causing significant damage ([damage] damage)!"
					M<<"Your torso has been hit by [usr]'s Jourou Senbon causing significant damage ([damage] damage)!"
					M.jourou=1
					M.health-=damage
					if(M.health<=0)
						M.Death(usr)
						usr.firing=0
						return
					usr.firing=0
					sleep(300)
					M.jourou=0
					return
				if(usr.random==8)
					var/damage=usr.tai
					usr<<"You hit [M]'s eyes with Jourou Senbon causing coordination loss ([damage] damage)!"
					M<<"Your eyes have been hit by [usr]'s Jourou Senbon causing coordination loss ([damage] damage)!"
					M.jourou=1
					M.screwed=1
					M.health-=damage
					if(M.health<=0)
						M.Death(usr)
						usr.firing=0
						return
					usr.firing=0
					sleep(300)
					M.jourou=0
					M.screwed=0
					return
				else
					usr.firing=1
					usr<<"You missed!"
					sleep(20)
					usr.firing=0
					return
			else
				usr<<"Not enough Chakra"
				return
mob/var
	bakuretsuN=0
	bakuretsuuse=0
mob/Missingnin
	verb
		BakuretsuBunshin()
			set category = "Jutsus"
			set name="Bakuretsu Kage Bunshin"
			usr.Handseals()
			if(usr.firing)
				return
			if(!usr.handseals)

				return
			if(usr.bakuretsuuse)
				return
			for(var/mob/npcs/Bunshin/B in world)
				if(B.original == usr)
					usr.bakuretsuuse=1
					flick("smoke2",B)
					view(B)<<"[usr]'s Bunshin explodes!"
					var/damage=usr.nin*5
					for(var/mob/M in oview(2,B))
						M<<"You have taken [damage] damage!"
						del(B)
						usr<<"You have given [damage] damage to [M]!"
						M.health-=damage
						if(M.health<=0)
							M.Death(usr)
					sleep(300)
					usr.bakuretsuuse=0
					return

mob/Lee
	verb
		Lotus()
			set category = "Jutsus"
			set name = "Lotus"
			if(usr.firing||usr.Kaiten||usr.rank=="Student")

				return
			else
				if(usr.rank=="Genin"||usr.rank=="Chuunin")switch(input("What gate would you like to open?","Gates") in list ("Initial Gate","Heal Gate","Life Gate","Harm Gate","Limit Gate","Close gates","Close Window"))
					if("Initial Gate")
						if(usr.gate1 == 0)
							if(usr.lotusS >= 10)
								view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Initial gate open!!"
								usr.lotusS += 1
								usr.health -= usr.health/2
								usr.tai = usr.tai*1.3
								usr.Move_Delay =Speed2
								usr.overlays += 'lotus.dmi'
								usr.Ldamage()
								usr.gate1 = 1
								return
							else
								usr.random = rand (1,4)
								if(usr.random == 1||usr.random == 4)
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Initial gate open!!"
									usr.lotusS += 1
									usr.health -= usr.health/2
									usr.tai = usr.tai*1.3
									usr.Move_Delay =Speed2
									usr.overlays += 'lotus.dmi'
									usr.Ldamage()
									usr.gate1 = 1
									return
								else
									usr<<"<B><font color = blue>You failed to open the limit gate!"
									usr.gate8 = 0
									usr.gate7 = 0
									usr.gate6 = 0
									usr.gate5 = 0
									usr.gate4 = 0
									usr.gate3 = 0
									usr.gate2 = 0
									usr.gate1 = 0
									usr.tai = usr.Mtai
									usr.overlays -= 'lotus.dmi'
									usr.Move_Delay = Speed1
									return
						else
							view()<<"The initial gate is already open!"
					if("Heal Gate")
						if(usr.gate2 == 0)
							if(usr.gate1 == 1)
								if(usr.lotusS >= 17)
									usr.lotusS += 1
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Heal gate open!!"
									usr.health = usr.maxhealth
									usr.tai = usr.tai*1.4
									usr.Move_Delay =Speed3
									usr.overlays += 'lotus.dmi'
									usr.Ldamage()
									usr.gate2 = 1
									return
								else
									usr.random = rand (1,4)
									if(usr.random == 1||usr.random == 4)
										view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Heal gate open!!"
										usr.lotusS += 1
										usr.health = usr.maxhealth
										usr.tai = usr.tai*1.4
										usr.Move_Delay =Speed3
										usr.overlays += 'lotus.dmi'
										usr.Ldamage()
										usr.gate2 = 1
										return
									else
										usr<<"<B><font color = blue>You failed to open the limit gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.tai = usr.Mtai
										usr.overlays -= 'lotus.dmi'
										usr.overlays -= 'lotus.dmi'
										usr.Move_Delay = Speed1
										return
							else
								view()<<"The Initial gate must be open first!"
						else
							view()<<"The Heal gate is already open!"
					if("Life Gate")
						if(usr.gate3 == 0)
							if(usr.gate2 == 1)
								if(usr.lotusS >= 27)
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Life gate open!!"
									usr.lotusS += 1
									usr.tai = usr.tai*1.5
									usr.overlays += 'lotus.dmi'
									usr.Move_Delay =Speed3
									usr.gate3 = 1
									usr.Ldamage()
									return
								else
									usr.random = rand (1,4)
									if(usr.random == 1||usr.random == 4)
										view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Life gate open!!"
										usr.lotusS += 1
										usr.tai = usr.tai*1.5
										usr.overlays += 'lotus.dmi'
										usr.Move_Delay =Speed3
										usr.gate3 = 1
										usr.Ldamage()
										return
									else
										usr<<"<B><font color = blue>You failed to open the limit gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.tai = usr.Mtai
										usr.overlays -= 'lotus.dmi'
										usr.Move_Delay = Speed1
										return
							else
								view()<<"The heal gate must be open first!"
						else
							view()<<"The Life gate is already open!"
					if("Harm Gate")
						if(usr.gate4 == 0)
							if(usr.gate3 == 1)
								if(usr.lotusS >= 40)
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Harm gate open!!"
									usr.lotusS += 1
									usr.tai = usr.Mtai*2
									usr.health += 1000
									usr.overlays += 'lotus.dmi'
									usr.Move_Delay =Speed4
									usr.gate4 = 1
									usr.Ldamage()
									return
								else
									usr.random = rand (1,6)
									if(usr.random == 1||usr.random == 4)
										view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Harm gate open!!"
										usr.lotusS += 1
										usr.tai = usr.Mtai*2
										usr.health += 1000
										usr.overlays += 'lotus.dmi'
										usr.Move_Delay =Speed4
										usr.gate4 = 1
										usr.Ldamage()
										return
									else
										usr<<"<B><font color = blue>You failed to open the limit gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.overlays -= 'lotus.dmi'
										usr.tai = usr.Mtai
										usr.Move_Delay = Speed1
										return
							else
								usr<<"You must first open the life gate."
						else
							view()<<"The Harm gate is already open!"
					if("Limit Gate")
						if(usr.gate5 == 0)
							if(usr.gate4 == 1)
								if(usr.lotusS >= 65)
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Limit gate open!!"
									usr.lotusS += 1
									usr.tai = usr.Mtai*3
									usr.overlays += 'lotus.dmi'
									usr.Move_Delay =Speed5
									usr.gate5 = 1
									usr.Ldamage()
									return
								else
									usr.random = rand (1,10)
									if(usr.random == 1||usr.random == 4)
										view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Limit gate open!!"
										usr.lotusS += 1
										usr.tai = usr.Mtai*3
										usr.overlays += 'lotus.dmi'
										usr.Move_Delay =Speed5
										usr.gate5 = 1
										usr.Ldamage()
										return
									else
										usr<<"<B><font color = blue>You failed to open the limit gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.tai = usr.Mtai
										usr.overlays -= 'lotus.dmi'
										usr.Move_Delay = Speed1
										return
							else
								usr<<"You must first open the harm gate."
						else
							usr<<"The Limit gate is already open!"
							return
					if("Close gates")
						usr<<"<B><font color = blue>You stop using lotus."
						usr.gate5 = 0
						usr.gate4 = 0
						usr.gate3 = 0
						usr.gate2 = 0
						usr.gate1 = 0
						usr.tai = usr.Mtai
						usr.Move_Delay = Speed1
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
				if(usr.rank=="Jounin"||usr.rank=="ANBU"||usr.rank=="Kage")switch(input("What gate would you like to open?","Gates") in list ("Initial Gate","Heal Gate","Life Gate","Harm Gate","Limit Gate","View Gate","Wonder Gate","Death Gate","Close gates","Close Window"))
					if("Initial Gate")
						if(usr.gate1 == 0)
							if(usr.lotusS >= 10)
								view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Initial gate open!!"
								usr.lotusS += 1
								usr.health -= usr.health/2
								usr.tai = usr.Mtai*1.3
								usr.Move_Delay =Speed2
								usr.overlays += 'lotus.dmi'
								usr.Ldamage()
								usr.gate1 = 1
								return
							else
								usr.random = rand (1,4)
								if(usr.random == 1||usr.random == 4)
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Initial gate open!!"
									usr.lotusS += 1
									usr.health -= usr.health/2
									usr.tai = usr.Mtai*1.3
									usr.Move_Delay =Speed2
									usr.overlays += 'lotus.dmi'
									usr.Ldamage()
									usr.gate1 = 1
									return
								else
									usr<<"<B><font color = blue>You failed to open the initial gate!"
									usr.gate8 = 0
									usr.gate7 = 0
									usr.gate6 = 0
									usr.gate5 = 0
									usr.gate4 = 0
									usr.gate3 = 0
									usr.gate2 = 0
									usr.gate1 = 0
									usr.tai = usr.Mtai
									usr.overlays -= 'lotus.dmi'
									usr.Move_Delay = Speed1
									return
						else
							view()<<"The initial gate is already open!"
					if("Heal Gate")
						if(usr.gate2 == 0)
							if(usr.gate1 == 1)
								if(usr.lotusS >= 17)
									usr.lotusS += 1
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Heal gate open!!"
									usr.health = usr.maxhealth
									usr.tai = usr.Mtai*1.5
									usr.Move_Delay =Speed3
									usr.overlays += 'lotus.dmi'
									usr.Ldamage()
									usr.gate2 = 1
									return
								else
									usr.random = rand (1,4)
									if(usr.random == 1||usr.random == 4)
										view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Heal gate open!!"
										usr.lotusS += 1
										usr.health = usr.maxhealth
										usr.tai = usr.Mtai*1.5
										usr.Move_Delay =Speed3
										usr.overlays += 'lotus.dmi'
										usr.Ldamage()
										usr.gate2 = 1
										return
									else
										usr<<"<B><font color = blue>You failed to open the heal gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.tai = usr.Mtai
										usr.overlays -= 'lotus.dmi'
										usr.overlays -= 'lotus.dmi'
										usr.Move_Delay = Speed1
										return
							else
								view()<<"The Initial gate must be open first!"
						else
							view()<<"The Heal gate is already open!"
					if("Life Gate")
						if(usr.gate3 == 0)
							if(usr.gate2 == 1)
								if(usr.lotusS >= 27)
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Life gate open!!"
									usr.lotusS += 1
									usr.tai = usr.Mtai*1.8
									usr.overlays += 'lotus.dmi'
									usr.Move_Delay =Speed3
									usr.gate3 = 1
									usr.Ldamage()
									return
								else
									usr.random = rand (1,4)
									if(usr.random == 1||usr.random == 4)
										view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Life gate open!!"
										usr.lotusS += 1
										usr.tai = usr.Mtai*1.8
										usr.overlays += 'lotus.dmi'
										usr.Move_Delay =Speed3
										usr.gate3 = 1
										usr.Ldamage()
										return
									else
										usr<<"<B><font color = blue>You failed to open the life gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.tai = usr.Mtai
										usr.overlays -= 'lotus.dmi'
										usr.Move_Delay = Speed1
										return
							else
								view()<<"The heal gate must be open first!"
						else
							view()<<"The Life gate is already open!"
					if("Harm Gate")
						if(usr.gate4 == 0)
							if(usr.gate3 == 1)
								if(usr.lotusS >= 40)
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Harm gate open!!"
									usr.lotusS += 1
									usr.tai = usr.Mtai*2
									usr.health += 1000
									usr.overlays += 'lotus.dmi'
									usr.Move_Delay =Speed4
									usr.gate4 = 1
									usr.Ldamage()
									return
								else
									usr.random = rand (1,6)
									if(usr.random == 1||usr.random == 4)
										view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Harm gate open!!"
										usr.lotusS += 1
										usr.tai = usr.Mtai*2
										usr.health += 1000
										usr.overlays += 'lotus.dmi'
										usr.Move_Delay =Speed4
										usr.gate4 = 1
										usr.Ldamage()
										return
									else
										usr<<"<B><font color = blue>You failed to open the harm gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.overlays -= 'lotus.dmi'
										usr.tai = usr.Mtai
										usr.Move_Delay = Speed1
										return
							else
								usr<<"You must first open the life gate."
						else
							view()<<"The Harm gate is already open!"
					if("Limit Gate")
						if(usr.gate5 == 0)
							if(usr.gate4 == 1)
								if(usr.lotusS >= 65)
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Limit gate open!!"
									usr.lotusS += 1
									usr.tai = usr.Mtai*2.2
									usr.overlays += 'lotus.dmi'
									usr.Move_Delay =Speed5
									usr.gate5 = 1
									usr.Ldamage()
									return
								else
									usr.random = rand (1,10)
									if(usr.random == 1||usr.random == 4)
										view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Limit gate open!!"
										usr.lotusS += 1
										usr.tai = usr.Mtai*2.2
										usr.overlays += 'lotus.dmi'
										usr.Move_Delay =Speed5
										usr.gate5 = 1
										usr.Ldamage()
										return
									else
										usr<<"<B><font color = blue>You failed to open the limit gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.tai = usr.Mtai
										usr.overlays -= 'lotus.dmi'
										usr.Move_Delay = Speed1
										return
							else
								usr<<"You must first open the harm gate."
						else
							usr<<"The Limit gate is already open!"
							return
					if("View Gate")
						if(usr.gate6 == 0)
							if(usr.gate5 == 1)
								if(usr.lotusS >= 100)
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: View gate open!!"
									usr.lotusS += 1
									usr.tai = usr.Mtai*2.6
									usr.overlays += 'lotus.dmi'
									usr.Move_Delay =0
									usr.gate6 = 1
									usr.Ldamage()
									return
								else
									usr.random = rand (1,10)
									if(usr.random == 1||usr.random == 4)
										view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: View gate open!!"
										usr.lotusS += 1
										usr.tai = usr.Mtai*2.5
										usr.overlays += 'lotus.dmi'
										usr.Move_Delay =0
										usr.gate7 = 1
										usr.Ldamage()
										return
									else
										usr<<"<B><font color = blue>You failed to open the View gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.tai = usr.Mtai
										usr.overlays -= 'lotus.dmi'
										usr.Move_Delay = Speed1
										return
							else
								usr<<"You must first open the limit gate."
						else
							usr<<"The View gate is already open!"
							return
					if("Wonder Gate")
						if(usr.gate7 == 0)
							if(usr.gate6 == 1)
								if(usr.lotusS >= 300)
									view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Wonder gate open!!"
									usr.lotusS += 1
									usr.tai = usr.Mtai*4
									usr.overlays += 'lotus.dmi'
									usr.Move_Delay =0
									usr.gate7 = 1
									usr.Ldamage()
									return
								else
									usr.random = rand (1,10)
									if(usr.random == 1||usr.random == 4)
										view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Wonder gate open!!"
										usr.lotusS += 1
										usr.tai = usr.Mtai*4
										usr.overlays += 'lotus.dmi'
										usr.Move_Delay =0
										usr.gate7 = 1
										usr.Ldamage()
										return
									else
										usr<<"<B><font color = blue>You failed to open the Wonder gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.tai = usr.Mtai
										usr.overlays -= 'lotus.dmi'
										usr.Move_Delay = 0
										return
							else
								usr<<"You must first open the view gate."
						else
							usr<<"The Wonder gate is already open!"
							return
					if("Death Gate")
						if(usr.gate8 == 0)
							if(usr.gate7 == 1)
								if(usr.lotusS >= 500)
									view()<<"<B><font color = blue>Death gate open!!"
									usr.lotusS += 1
									usr.tai = usr.Mtai*7
									usr.overlays += 'lotus.dmi'
									usr.Move_Delay =0
									usr.gate8 = 1
									usr.Ldamage()
									return
								else
									usr.random = rand (1,10)
									if(usr.random == 1||usr.random == 4)
										view()<<"<B><font color = blue>Death gate open!!"
										usr.lotusS += 1
										usr.tai = usr.tai*7
										usr.overlays += 'lotus.dmi'
										usr.Move_Delay =0
										usr.gate8 = 1
										usr.Ldamage()
										return
									else
										usr<<"<B><font color = blue>You failed to open the Death gate!"
										usr.gate8 = 0
										usr.gate7 = 0
										usr.gate6 = 0
										usr.gate5 = 0
										usr.gate4 = 0
										usr.gate3 = 0
										usr.gate2 = 0
										usr.gate1 = 0
										usr.tai = usr.Mtai
										usr.overlays -= 'lotus.dmi'
										usr.Move_Delay = 0
										return
							else
								usr<<"You must first open the view gate."
						else
							usr<<"The Wonder gate is already open!"
							return
					if("Close gates")
						usr<<"<B><font color = blue>You stop using lotus."
						usr.gate8 = 0
						usr.gate7 = 0
						usr.gate6 = 0
						usr.gate5 = 0
						usr.gate4 = 0
						usr.gate3 = 0
						usr.gate2 = 0
						usr.gate1 = 0
						usr.tai = usr.Mtai
						usr.Move_Delay = Speed1
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
						usr.overlays -= 'lotus.dmi'
mob
	proc
		lotusoff()
			if(src.health <= 1)
				src.gate8 = 0
				src.gate7 = 0
				src.gate6 = 0
				src.gate5 = 0
				src.gate4 = 0
				src.gate3 = 0
				src.gate2 = 0
				src.gate1 = 0
				src.tai = usr.Mtai
				src.overlays -= 'lotus.dmi'
				src.Move_Delay = 2
mob
	proc
		Ldamage()
			if(src.gate2 == 1&&src.gate3 == 0)
				src.health -= 100
				src.lotusoff()
				if(src.health<=0)
					src.Death(usr)
					usr.dead=1
				sleep(30)
				src.Ldamage()
			if(src.gate3 == 1&&src.gate4 == 0)
				src.health -= 151
				src.lotusoff()
				if(src.health<=0)
					src.Death(usr)
					usr.dead=1
				sleep(25)
				src.Ldamage()
			if(src.gate4 == 1&&src.gate5 == 0)
				src.health -= 200
				src.lotusoff()
				if(src.health<=0)
					src.Death(usr)
					usr.dead=1
				sleep(22)
				src.Ldamage()
			if(src.gate5 == 1)
				src.health -= 250
				src.lotusoff()
				if(src.health<=0)
					src.Death(usr)
					usr.dead=1
				sleep(20)
				src.Ldamage()
			else
				return

mob/Lee
	verb
		KonohaReppu(mob/M in get_step(src,src.dir))
			set category = "Jutsus"
			set name = "Konoha Renpuu"
			if (M.inspike)
				return
			if(usr.firing)
				return
			if (M.sphere)
				return
			if(M.drunk&&M.NonClan)
				view()<<"[M] dodges [usr]'s attack"
				return
			if (M.Kaiten)
				usr <<"You attack [M] but their kaiten reflects the damage back at you."
				M <<"You reflect [usr]'s attack causing them to hurt themself."
				usr.health -= 10
				if(src.health<=0)
					usr.Death(M)
					usr.dead=1
				return
			if (M.ingat == 1)
				usr << "Your attack bounces off of [M] because they are in gatsuuga.."
				return
			else
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#6495ed>K</FONT><FONT COLOR=#549cf0>o</FONT><FONT COLOR=#43a3f3>n</FONT><FONT COLOR=#33abf7>o</FONT><FONT COLOR=#22b2fa>h</FONT><FONT COLOR=#11b9fd>a</FONT><FONT COLOR=#00bfff> </FONT><FONT COLOR=#20c3fb>R</FONT><FONT COLOR=#3fc8f6>e</FONT><FONT COLOR=#5fccf1>n</FONT><FONT COLOR=#7ed0eb>p</FONT><FONT COLOR=#9ed4e6>u</FONT><FONT COLOR=#bdd9e1>u</FONT><FONT COLOR=#dcdcdc>!</FONT>"
				var/damage=usr.tai*5
				M.health -= damage
				M.Death(usr)
				usr.firing=1
				view()<<"[M] takes [damage] damage from Konoha Renpuu!"
				if(M)
					if(usr.dir==NORTH)
						M.dir=NORTH
					if(usr.dir==WEST)
						M.dir=WEST
					if(usr.dir==SOUTH)
						M.dir=SOUTH
					if(usr.dir==EAST)
						M.dir=EAST
				sleep(14)
				usr.firing=0
mob/Lee
	verb
		KonohaGenkurikiSenpuu()
			set category = "Jutsus"
			set name = "Konoha Genuriki Senpuu"
			for(var/mob/M in oview(1,usr))
				if(M.drunk&&M.NonClan)
					view()<<"[M] dodges [usr]'s attack"
					return
				if (M.sphere)
					usr<<"Your attack bounces off of the sand!"
					return
				if (M.inspike)
					usr<<"Your attack bounces off of [usr]!"
					return
				if(usr.firing)
					return
				if (M.Kaiten)
					var/damage = round(usr.tai)
					if(damage <= 1)
						damage = 1
						usr <<"You attack [M] but their kaiten hakkeshou reflects the damage back at you."
						M <<"You reflect [usr]'s attack causing them to hurt themselfs."
						usr.health -= damage/2
					if(usr.health<=0)
						usr.Death(M)
						return
					else
						usr <<"You attack [M] but their kaiten hakkeshou reflects the damage back at you."
						M <<"You reflect [usr]'s attack causing them to hurt themselfs."
						usr.health -= damage
						if(usr.health<=0)
							usr.Death(M)

						return
				if (M.ingat)
					usr << "Your attack bounces off of [M] because they are in gatsuuga.."
					return
				else
					var/damage = round(usr.tai*14)
					usr.firing=1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Konoha Genuriki Senpuu!"
					view()<<"[M] has been hit by Konoha Genuriki Senpuu for [damage] Damage"
					M.health -= damage
					if(M.health<=0)
						M.Death(usr)
					step(M,usr.dir)
					sleep(20)
					usr.firing=0
mob/Lee
	verb
		KonohaSenpuu()
			set category = "Jutsus"
			set name = "Konoha Senpuu"
			for(var/mob/M in oview(1,usr))
				if(M.drunk&&M.NonClan)
					view()<<"[M] dodges [usr]'s attack"
					return
				if (M.sphere)
					usr<<"Your attack bounces off of the sand!"
					return
				if (M.inspike)
					usr<<"Your attack bounces off of [usr]!"
					return
				if(usr.firing)
					return
				if (M.Kaiten)
					var/damage = round(usr.tai)
					if(damage <= 1)
						damage = 1
						usr <<"You attack [M] but their kaiten hakkeshou reflects the damage back at you."
						M <<"You reflect [usr]'s attack causing them to hurt themselfs."
						usr.health -= damage/2
					if(usr.health<=0)
						usr.Death(M)
						return
					else
						usr <<"You attack [M] but their kaiten hakkeshou reflects the damage back at you."
						M <<"You reflect [usr]'s attack causing them to hurt themselfs."
						usr.health -= damage
						if(usr.health<=0)
							usr.Death(M)

						return
				if (M.ingat)
					usr << "Your attack bounces off of [M] because they are in gatsuuga.."
					return
				else
					var/damage = round(usr.tai*8)
					usr.firing=1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#6495ed>K</FONT><FONT COLOR=#549cf0>o</FONT><FONT COLOR=#43a3f3>n</FONT><FONT COLOR=#33abf7>o</FONT><FONT COLOR=#22b2fa>h</FONT><FONT COLOR=#11b9fd>a</FONT><FONT COLOR=#00bfff> </FONT><FONT COLOR=#20c3fb>S</FONT><FONT COLOR=#3fc8f6>e</FONT><FONT COLOR=#5fccf1>n</FONT><FONT COLOR=#7ed0eb>p</FONT><FONT COLOR=#9ed4e6>u</FONT><FONT COLOR=#bdd9e1>u</FONT><FONT COLOR=#dcdcdc>!</FONT>"
					view()<<"[M] has been hit by Konoha Senpuu for [damage] Damage"
					M.health -= damage
					if(M.health<=0)
						M.Death(usr)
					step(M,usr.dir)
					sleep(20)
					usr.firing=0


mob/Lee
	verb
		OmoteRenge(mob/M in get_step(src,SOUTH))
			set name = "Omote Renge"
			set category = "Jutsus"
			if (M.ingat||M.intank)
				return
			if (M.sphere)
				return
			if (M.Kaiten)
				return
			if(usr.health <= 1000)
				usr<<"Not enough health"
				return
			if (M.inspike)
				return
			if(!usr.gate1)
				usr<<"You must have atleast the first gate open to use this!"
				return
			if(usr.firing)
				return
			else
				usr.firing=1
				var/damage = round(usr.tai*20)
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#90ee90>O</FONT><FONT COLOR=#9ae69a>m</FONT><FONT COLOR=#a4dca4>o</FONT><FONT COLOR=#add3ad>t</FONT><FONT COLOR=#b7c9b7>e</FONT><FONT COLOR=#c0c0c0> </FONT><FONT COLOR=#b2b2b2>R</FONT><FONT COLOR=#a4a4a4>e</FONT><FONT COLOR=#959595>n</FONT><FONT COLOR=#868686>g</FONT><FONT COLOR=#787878>e</FONT><FONT COLOR=#696969>!</FONT>"
				usr.health -= usr.health/3
				usr.overlays += 'omote.dmi'
				if(M)
					usr.loc=M.loc
					step(M,SOUTH)
					usr.loc=M.loc
					sleep(3)
					step(M,SOUTH)
					usr.loc=M.loc
					sleep(3)
					step(M,SOUTH)
					usr.loc=M.loc
					sleep(3)
					step(M,SOUTH)
					usr.loc=M.loc
					sleep(3)
					step(M,SOUTH)
					usr.loc=M.loc
					M.health -= damage
				view()<<"[usr] does [damage] to [M] with Omote Renge!"
				M.Death(usr)
				usr.Move_Delay = 5
				usr.overlays-='omote.dmi'
				usr.overlays-='omote.dmi'
				usr.overlays-='omote.dmi'
				usr.overlays-='omote.dmi'
				usr.firing=0
				sleep(90)
				usr.Move_Delay = 0
obj
	Uratrail
		icon = 'ura.dmi'
		icon_state = "trail"
		density = 1
mob/Lee
	verb
		UraRenge(mob/M in get_step(src,SOUTH))
			set name = "Ura Renge"
			set category = "Jutsus"
			if (M.ingat||M.intank)
				return
			if (M.inspike)
				return
			if(usr.health <= 1000)
				usr<<"Not enough health"
				return
			if (M.sphere == 1)
				return
			if (M.Kaiten == 1)
				return
			if(usr.gate3 == 0)
				usr<<"You must have atleast the third gate open to use this!"
			if(usr.firing)
				return
			else
				usr.firing=1
				usr.health -= usr.health/7
				var/obj/Uratrail/K = new /obj/Uratrail
				var/obj/Uratrail/F = new /obj/Uratrail
				view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#f5f5f5>U</FONT><FONT COLOR=#e9e9e9>r</FONT><FONT COLOR=#dbdbdb>a</FONT><FONT COLOR=#cecece> </FONT><FONT COLOR=#c0c0c0>R</FONT><FONT COLOR=#cbc6be>e</FONT><FONT COLOR=#d6ccbb>n</FONT><FONT COLOR=#e0d3b9>g</FONT><FONT COLOR=#ebd9b6>e</FONT><FONT COLOR=#f5deb3>!</FONT>"
				var/damage = round(usr.tai*14)
				M.overlays += 'ura.dmi'
				M.health -= damage
				view()<<"[usr] does [damage] to [M] with Ura Renge!"
				if(M.health <= 0)
					M.Death(usr)
					if(M)
						M.overlays -= 'ura.dmi'
					return
				M.Death(usr)
				sleep(3)
				usr.loc = M.loc
				step(M,SOUTH)
				sleep(3)
				usr.loc = M.loc
				step(M,SOUTH)
				sleep(5)
				del(F)
				step(M,NORTH)
				sleep(5)
				del(K)
				step(M,NORTH)
				if(M)
					M.health -= damage
					view()<<"[usr] does [damage] to [M] with Ura Renge!"
					M.Death(usr)
					M.overlays -= 'ura.dmi'
				usr.Move_Delay = 5
				usr.firing=0
				sleep(90)
				usr.Move_Delay=0

obj
	shibari
		icon = 'kagemane.dmi'
		icon_state = "head"
		density=1
		Move()
			..()
			var/obj/shibaritrail/T = new /obj/shibaritrail
			if(src.dir == NORTH)
				T.loc = src.loc
				T.y = src.y-1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == SOUTH)
				T.loc = src.loc
				T.y = src.y+1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == WEST)
				T.loc = src.loc
				T.x = src.x+1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == EAST)
				T.loc = src.loc
				T.x = src.x-1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == NORTHWEST)
				T.loc = src.loc
				T.y = src.y-1
				T.x = src.x+1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == NORTHEAST)
				T.loc = src.loc
				T.y = src.y-1
				T.x = src.x-1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == SOUTHWEST)
				T.loc = src.loc
				T.x = src.x+1
				T.y = src.y+1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == SOUTHEAST)
				T.loc = src.loc
				T.x = src.x-1
				T.y = src.y+1
				T.dir = src.dir
				T.owner=src.owner
		Bump(A)
			var/mob/O = src.owner
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				src.loc=M.loc
				for(var/mob/C in src.loc)
					if(C == src.target)
						src.move=0
						C.Frozen=1
						C.caught=1
						LOL
							if(O.chakra<=5&&O.Kshibari)
								C.Frozen=0
								O.Frozen=0
								C.caught=0
								C.overlays-='kagekubi.dmi'
								C.overlays-='kagekubi.dmi'
								C.overlays-='kagekubi.dmi'
								C.kubi=0
								for(var/obj/shibaritrail/T in world)
									if(T.owner==O)
										del(T)
										O.Frozen=0
										C.caught=0
										C.overlays-='kagekubi.dmi'
										C.overlays-='kagekubi.dmi'
										C.overlays-='kagekubi.dmi'
										C.kubi=0
								del(src)
							else
								O.chakra-=170
								sleep(10)
								goto LOL
			if(O.chakra<=5)
				del(src)
				O<<"You have run out of chakra"
				for(var/obj/shibaritrail/T in world)
					O.Frozen=0
					if(T.owner == O)
						O.Frozen=0
						del(T)
						return
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					for(var/obj/shibaritrail/B in world)
						if(B.owner==src.owner)
							del(B)
					del(src)
			if(istype(A,/obj/))
				for(var/obj/shibaritrail/B in world)
					if(B.owner==src.owner)
						del(B)
					del(src)
				del(src)
obj
	shibaritrail
		icon = 'kagemane.dmi'
		icon_state="trail"
obj/var
	delay = 0
mob/var/tmp
	caught = 0
	Kshibari = 0
	freeztime=0
	kubi=0
obj/var/tmp
	target=""
	move=1
mob/nara
	verb
		kageshibari(mob/M in oview(10))
			set category = "Jutsus"
			set name = "Shadow Posession Jutsu"
			usr.Handseals()
			if(usr.resting)
				return
			if(usr.meditating)
				return
			if(usr.firing)
				return
			if(!usr.handseals)

				return
			if(usr.chakra <= 1)
				usr<<"Not enough Chakra!"
			else
				if(usr.Kshibari)
					for(var/obj/shibari/K in world)
						if(K.owner==usr)
							del(K)
							usr.Kshibari=0
							usr.Frozen=0
							M.Frozen=0
							M.caught=0
							M.overlays-='kagekubi.dmi'
							M.overlays-='kagekubi.dmi'
							M.overlays-='kagekubi.dmi'
					for(var/obj/shibaritrail/T in world)
						if(T.owner==usr)
							del(T)
							usr.Kshibari=0
							usr.Frozen=0
							M.Frozen=0
							M.caught=0
							M.overlays-='kagekubi.dmi'
							M.overlays-='kagekubi.dmi'
							M.overlays-='kagekubi.dmi'
				else
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#708090>K</FONT><FONT COLOR=#707f8d>a</FONT><FONT COLOR=#6f7c89>g</FONT><FONT COLOR=#6f7a85>e</FONT><FONT COLOR=#6e7781> </FONT><FONT COLOR=#6d757d>S</FONT><FONT COLOR=#6c7379>h</FONT><FONT COLOR=#6b7075>i</FONT><FONT COLOR=#6b6e71>b</FONT><FONT COLOR=#6a6b6d>a</FONT><FONT COLOR=#696969>r</FONT><FONT COLOR=#777777>i</FONT><FONT COLOR=#848484> </FONT><FONT COLOR=#929292>N</FONT><FONT COLOR=#a0a0a0>o</FONT><FONT COLOR=#aeaeae> </FONT><FONT COLOR=#bbbbbb>J</FONT><FONT COLOR=#c9c9c9>u</FONT><FONT COLOR=#d7d7d7>t</FONT><FONT COLOR=#e5e5e5>s</FONT><FONT COLOR=#f2f2f2>u</FONT><FONT COLOR=#ffffff>!</FONT>"
					var/obj/shibari/K = new /obj/shibari
					K.loc = usr.loc
					usr.Chakragain()
					K.Move_Delay = 2
					K.gen = usr.gen
					usr.Kshibari=1
					K.owner = usr
					K.target=M
					usr.Frozen=1

		ExtendShadow()
			set category = "Jutsus"
			set name = "Extend Shadow"
			usr.chakra -= 100
			for(var/obj/shibari/K in world)
				if(K.owner == usr)
					step_towards(K,K.target)
				if(usr.chakra<=5)
					del(K)
					usr.Kshibari=0
					usr<<"You have run out of chakra"
					for(var/obj/shibaritrail/T in world)
						usr.Frozen=0
						if(T.owner == usr)
							usr.Frozen=0
							del(T)
		RetractShadow()
			set category = "Jutsus"
			set name = "Retract Shadow"
			usr.chakra -= 50
			for(var/obj/shibari/K in world)
				K.move=1
				if(K.owner == usr)
					for(var/mob/M in K.loc)
						if(K.owner == M)
							if(K.loc == M.loc)
								del(K)
								usr.Frozen=0
								usr.Kshibari=0
								M.Frozen=0
								for(var/obj/shibaritrail/A in world)
									if(A.owner==usr)
										del(A)
								return
					for(var/obj/shibaritrail/T in oview(1,K))
						if(T.owner==usr)
							K.loc = T.loc
							K.dir=T.dir
							del(T)
						else
							del(K)
							for(var/obj/shibaritrail/L in world)
								if(L.owner==usr)
									del(L)
							usr.Frozen=0
							usr.kubi=0
							usr.Kshibari=0
							usr.firing=0
						for(var/mob/M in oview(11,K))
							if(M==K.target)
								if(K.loc==M.loc)
									M.Frozen=1
									M.caught=1
								else
									M.Frozen=0
									M.caught=0
									M.kubi=0
									M.overlays-='kagekubi.dmi'
									M.overlays-='kagekubi.dmi'
									M.overlays-='kagekubi.dmi'
		KageKubiShibaru()
			set category = "Jutsus"
			set name="Kage Kubi Shibaru"
			if(usr.firing)
				return
			for(var/obj/shibari/K in world)
				if(K.owner==usr)
					for(var/mob/M in world)
						if(M.caught&&!M.kubi)
							M.kubi=1
							usr.Chakragain()
							usr.chakra-=100
							M.overlays+='kagekubi.dmi'
							var/damage=round(usr.gen*2.5-M.gen)
							if(damage<=5)
								usr<<"Your neck bind is too weak, [M] breaks out!"
								return
							else
								ROFL
									if(usr.chakra<=5)
										M.Frozen=0
										usr.Frozen=0
										M.caught=0
										M.kubi=0
										M.overlays-='kagekubi.dmi'
										M.overlays-='kagekubi.dmi'
										M.overlays-='kagekubi.dmi'
										for(var/obj/shibaritrail/T in world)
											if(T.owner==usr)
												del(T)
												usr.Frozen=0
												M.caught=0
												M.caught=0
												M.Frozen=0
												M.kubi=0
												M.overlays-='kagekubi.dmi'
												M.overlays-='kagekubi.dmi'
												M.overlays-='kagekubi.dmi'
												return
									if(!M.caught)
										M.Frozen=0
										usr.Frozen=0
										M.caught=0
										M.kubi=0
										M.overlays-='kagekubi.dmi'
										M.overlays-='kagekubi.dmi'
										M.overlays-='kagekubi.dmi'
										for(var/obj/shibaritrail/T in world)
											if(T.owner==usr)
												del(T)
												usr.Frozen=0
												M.caught=0
												M.caught=0
												M.Frozen=0
												M.kubi=0
												M.overlays-='kagekubi.dmi'
												M.overlays-='kagekubi.dmi'
												M.overlays-='kagekubi.dmi'
												return
									if(!usr.Kshibari)
										M.Frozen=0
										usr.Frozen=0
										M.caught=0
										M.kubi=0
										M.overlays-='kagekubi.dmi'
										M.overlays-='kagekubi.dmi'
										M.overlays-='kagekubi.dmi'
										for(var/obj/shibaritrail/T in world)
											if(T.owner==usr)
												del(T)
												usr.Frozen=0
												M.caught=0
												M.caught=0
												M.Frozen=0
												M.kubi=0
												M.overlays-='kagekubi.dmi'
												M.overlays-='kagekubi.dmi'
												M.overlays-='kagekubi.dmi'
									if(!M.kubi)
										M.Frozen=0
										usr.Frozen=0
										M.caught=0
										M.kubi=0
										M.overlays-='kagekubi.dmi'
										M.overlays-='kagekubi.dmi'
										M.overlays-='kagekubi.dmi'
										for(var/obj/shibaritrail/T in world)
											if(T.owner==usr)
												del(T)
												usr.Frozen=0
												M.caught=0
												M.caught=0
												M.Frozen=0
												M.kubi=0
												M.overlays-='kagekubi.dmi'
												M.overlays-='kagekubi.dmi'
												M.overlays-='kagekubi.dmi'
												return
									else
										usr.chakra-=100
										view(usr)<<"[M] takes [damage] damage from Neck Bind"
										M.health-=damage
										if(M.health<=0)
											M.Death(usr)
											usr.Frozen=0
											usr.Kshibari=0
											usr.kubi=0
											return
										sleep(40)
										goto ROFL

obj
	katonG
		icon = 'katons.dmi'
		icon_state = ""
		density = 1
		Move_Delay = 2.8
		glide_size = 6.5
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*2)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Phoenix Flower for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)


obj
	katonEndan
		icon = 'realendan.dmi'
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*3)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Katon Karyuu Endan for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	SuitonDaib
		icon = 'suitons.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*2)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Suiton Daibakufu for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	Suiryedan
		icon = 'suiryedan.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*1.7)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Suiton Suiryuudan for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	KRyuuka
		icon = 'Ryuuka.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*2.3)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Katon Ryuuka for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	AMA
		icon = 'ama.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*50)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Amaterasu for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	DotonDD
		icon = 'dotons.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.tai*1.5)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Doton Doryo Dango for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	TeshiSendan
		icon = 'bonebullets.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.tai*3)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Bone Bullets for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	SuitonSuikoudan
		icon = 'suiryedan.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*2.8)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Suiton Suikoudan for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	Zanyokukuuha
		icon = 'daitoppa.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Zanyokukuuha for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
obj
	Zankuuha
		icon = 'daitoppa.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*1.5)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was by Zankuuha for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	Doryuudan5
		icon = 'doryuumissle.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*3)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was by Doryuudan for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	FuutonRenkuudan
		icon = 'fuuton.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*1.7)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Renkuudan for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	Fdaitoppa
		icon = 'daitoppa.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Daitoppa for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	kazedangan
		icon = 'kazedangan.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*1.5)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was by Kaze Dangan for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	Ikazuchi
		//icon = 'bolt.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*3)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Ikazuchi No Kiba for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
obj
	Raikyuu
		icon = 'rai.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*1.5)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Raikyuu for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
obj
	RairyuuTatsumaki
		icon = 'rairyuu.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*2)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Rairyuu No Tatsumaki for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	Sensatsu
		icon = 'needles.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.tai/2)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Sensatsu Suishou for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

obj
	Sshuriken
		icon = 'SShuriken.dmi'
		icon_state = ""
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Suna Shuriken for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
obj
	Ice1
		icon='juvenile ice.dmi'
		icon_state="Ice2"
		density=1

obj
	Ice2
		icon='juvenile ice.dmi'
		icon_state="Ice"
		density=1


obj
	FutagozaNoJutsu
		icon = 'juvenile ice.dmi'
		icon_state = "Ice3"
		density = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.nin*5)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by Futagoza No Jutsu for [damage] damage!!"
					var/mob/O = src.Gowner
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
mob/Juvenile_Ice
	verb
		FutagozaNoJutsu() // Verb used for firing the beam
			set category = "Jutsus"
			set name = "Futagoza No Jutsu"
			usr.Handseals()
			if(usr.firing)
				return
			if(usr.inso)
				return
			if(!usr.handseals)

				return
			if(usr.chakra <= 100)
				usr<<"You dont have enough chakra!"
				return
			else // If the firing var isn't 1...
				if(SN >= 100)
					usr.chakra -= 100
					usr.firing = 1
					view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#0000ff>F</FONT><FONT COLOR=#0040ff>u</FONT><FONT COLOR=#0080ff>t</FONT><FONT COLOR=#00c0ff>a</FONT><FONT COLOR=#00ffff>g</FONT><FONT COLOR=#00c0ff>o</FONT><FONT COLOR=#0080ff>z</FONT><FONT COLOR=#0040ff>a</FONT><FONT COLOR=#0000ff> </FONT><FONT COLOR=#0033ff>N</FONT><FONT COLOR=#0066ff>o</FONT><FONT COLOR=#009aff> </FONT><FONT COLOR=#00cdff>J</FONT><FONT COLOR=#00ffff>u</FONT><FONT COLOR=#00c0ff>t</FONT><FONT COLOR=#0080ff>s</FONT><FONT COLOR=#0040ff>u</FONT><FONT COLOR=#0000ff>!</FONT></FONT>"
					var/obj/FutagozaNoJutsu/K = new()
					var/obj/Ice1/A = new()
					var/obj/Ice2/B = new()
					A.dir=usr.dir
					B.dir=usr.dir
					usr.Chakragain()
					if(A.dir==NORTH)
						A.pixel_y=-32
					if(A.dir==SOUTH)
						A.pixel_y=32
					if(A.dir==WEST)
						A.pixel_x=32
					if(A.dir==EAST)
						A.pixel_x=-32
					if(B.dir==NORTH)
						B.pixel_y=-64
					if(B.dir==SOUTH)
						B.pixel_y=64
					if(B.dir==WEST)
						B.pixel_x=64
					if(B.dir==EAST)
						B.pixel_x=-64
					K.loc = usr.loc
					K.nin=usr.nin
					K.overlays+=A
					K.overlays+=B
					K.dir = usr.dir
					K.name="[usr]"
					K.Move_Delay=1.9
					K.Gowner=usr
					walk(K,usr.dir)
					if(usr.Mnin <= usr.cap)
						usr.random = rand(1,6)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								usr.ChakraC+=ccgain
								if(usr.ChakraC>100)
									usr.ChakraC=100
								usr<<"[usr] you gained [ccgain] Chakra control..."
					else
						usr.random = rand(1,20)
						if(random == 5||random==1)
							usr.ninexp += rand(1,10)
							usr.ninup()
							usr.Skills()
							var/ccrandom=rand(1,15)
							if(ccrandom==4||ccrandom==10)
								var/ccgain=rand(1,3)
								usr.ChakraC+=ccgain
								if(usr.ChakraC>100)
									usr.ChakraC=100
								usr<<"[usr] you gained [ccgain] Chakra control..."
					sleep(10)
					usr.firing = 0
					usr.Move_Delay = usr.Savedspeed
					sleep(45)
					del(K)
				else
					usr.random = rand (1,4)
					if(usr.random == 1||usr.random == 4)
						usr.chakra -= 100
						usr.firing = 1
						view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#0000ff>F</FONT><FONT COLOR=#0040ff>u</FONT><FONT COLOR=#0080ff>t</FONT><FONT COLOR=#00c0ff>a</FONT><FONT COLOR=#00ffff>g</FONT><FONT COLOR=#00c0ff>o</FONT><FONT COLOR=#0080ff>z</FONT><FONT COLOR=#0040ff>a</FONT><FONT COLOR=#0000ff> </FONT><FONT COLOR=#0033ff>N</FONT><FONT COLOR=#0066ff>o</FONT><FONT COLOR=#009aff> </FONT><FONT COLOR=#00cdff>J</FONT><FONT COLOR=#00ffff>u</FONT><FONT COLOR=#00c0ff>t</FONT><FONT COLOR=#0080ff>s</FONT><FONT COLOR=#0040ff>u</FONT><FONT COLOR=#0000ff>!</FONT></FONT>"
						var/obj/FutagozaNoJutsu/K = new()
						var/obj/Ice1/A = new()
						var/obj/Ice2/B = new()
						usr.Chakragain()
						A.dir=usr.dir
						B.dir=usr.dir
						if(A.dir==NORTH)
							A.pixel_y=-32
						if(A.dir==SOUTH)
							A.pixel_y=32
						if(A.dir==WEST)
							A.pixel_x=32
						if(A.dir==EAST)
							A.pixel_x=-32
						if(B.dir==NORTH)
							B.pixel_y=-64
						if(B.dir==SOUTH)
							B.pixel_y=64
						if(B.dir==WEST)
							B.pixel_x=64
						if(B.dir==EAST)
							B.pixel_x=-64
						K.loc = usr.loc
						K.nin=usr.nin
						K.overlays+=A
						K.overlays+=B
						K.dir = usr.dir
						K.name="[usr]"
						K.Move_Delay=1.9
						K.Gowner=usr
						walk(K,usr.dir)
						if(usr.Mnin <= usr.cap)
							usr.random = rand(1,6)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									usr.ChakraC+=ccgain
									if(usr.ChakraC>100)
										usr.ChakraC=100
									usr<<"[usr] you gained [ccgain] Chakra control..."
						else
							usr.random = rand(1,20)
							if(random == 5||random==1)
								usr.ninexp += rand(1,10)
								usr.ninup()
								usr.Skills()
								var/ccrandom=rand(1,15)
								if(ccrandom==4||ccrandom==10)
									var/ccgain=rand(1,3)
									usr.ChakraC+=ccgain
									if(usr.ChakraC>100)
										usr.ChakraC=100
									usr<<"[usr] you gained [ccgain] Chakra control..."
						sleep(20)
						usr.firing = 0
						sleep(45)
						del(K)