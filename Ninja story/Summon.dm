obj/Big_Snake_Scroll//DO NOT USE : IT IS BAD!!(use . instead)
	icon ='scrolls.dmi'
	icon_state="snake"
	verb/Summon_Snake()
		usr.Handseals()
		if(usr.firing)
			return
		if(usr.kuchiyoseusing)
			return
		if(!usr.handseals)
			return
		if(usr.chakra>=10000)
			usr.Summoneffect()
			view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Kuchiyose No Jutsu!"
			usr.snakeup()
			usr.randomsnake()
	verb/Get()
		set src in oview()
		usr.contents+=src
	verb/Unsummon()
		for(var/mob/Big_Snake/B in world)
			if(B.owner==usr)
				usr.ride=0
				usr.Frozen=0
				usr.kuchiyoseusing=0
				del(B)
		for(var/mob/Medium_Snake/B in world)
			if(B.owner==usr)
				usr.ride=0
				usr.Frozen=0
				usr.kuchiyoseusing=0
				del(B)
mob/var
	tmp/ride=0
	kuchiyoseusing=0
obj/Slug_Summoning_Scroll
	icon = 'scrolls.dmi'
	icon_state = "slug"
	verb/Summon_Slug()
		usr.Handseals()
		if(usr.firing)
			return
		if(!usr.handseals)
			return
		if(usr.kuchiyoseusing)
			return
		if(usr.Mchakra >= 10000)
			usr.slugup()
			usr.Summoneffect()
			view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Kuchiyose No Jutsu!"
			usr.randomslug()
		else usr <<"You aren't good enough to summon!"
	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"
	verb/Unsummon()
		for(var/mob/Big_Slug/B in world)
			if(B.owner==usr)
				usr.ride=0
				usr.kuchiyoseusing=0
				usr.Frozen=0
				del(B)
		for(var/mob/Medium_Slug/B in world)
			if(B.owner==usr)
				usr.ride=0
				usr.kuchiyoseusing=0
				usr.Frozen=0
				del(B)
obj/Frog_Summoning_Scroll
	icon = 'scrolls.dmi'
	icon_state = "frog"
	verb/Summon_Frog()
		usr.Handseals()
		if(usr.firing)
			return
		if(!usr.handseals)
			return
		if(usr.kuchiyoseusing)
			return
		if(usr.chakra >= 10000)
			usr.frogup()
			usr.Summoneffect()
			view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Kuchiyose No Jutsu!"
			usr.randomfrog()
		else usr <<"You aren't good enough to summon!"
	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"
	verb/Unsummon()
		for(var/mob/Gamabunta/B in world)
			if(B.owner==usr)
				usr.ride=0
				usr.kuchiyoseusing=0
				usr.Frozen=0
				del(B)
		for(var/mob/Medium_Frog/B in world)
			if(B.owner==usr)
				usr.ride=0
				usr.Frozen=0
				usr.kuchiyoseusing=0
				del(B)
mob/var/B=0
mob/var/frogsummoning=0
turf/Click()
	for(var/mob/Gamabunta/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Gamabunta/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
turf/Click()
	for(var/mob/Big_Snake/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Big_Snake/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/var
	slugsummoning=0
	snakesummoning=0
	kuchiyose=0
mob/proc
	randomsnake()
		if(usr.snakesummoning>=50)
			if(usr.chakra>=10000&&usr.chakra<30000)
				src.firing = 1
				sleep(10)
				src.firing = 0
				var/mob/Medium_Snake/B = new()
				B.owner=src
				B.name = "Medium Snake"
				B.loc = locate(src.x, src.y - 1, src.z)
				B.tai = src.Mtai*3
				B.max_exp = 200
				src.kuchiyoseusing=1
				B.exp = 1000
				B.kuchiyose=1
				B.health = 15000
				src.chakra -= 10000
				return
			if(usr.chakra>=30000)
				src.firing = 1
				sleep(10)
				src.firing = 0
				var/mob/Big_Snake/B = new()
				B.owner=src
				B.name = "Big Snake"
				B.loc = locate(src.x, src.y - 1, src.z)
				B.tai = src.Mtai*10
				src.kuchiyoseusing=1
				B.max_exp = 200
				B.kuchiyose=1
				B.exp = 1000
				B.health = 50000
				src.chakra -= 10000
				return
		else
			usr.random=rand(1,4)
			if(usr.random==1)
				if(usr.chakra>=10000&&usr.chakra<30000)
					src.firing = 1
					sleep(10)
					src.firing = 0
					var/mob/Medium_Snake/B = new()
					B.owner=src
					B.name = "Medium Snake"
					B.loc = locate(src.x, src.y - 1, src.z)
					B.tai = src.Mtai*3
					B.max_exp = 200
					B.exp = 1000
					B.kuchiyose=1
					src.kuchiyoseusing=1
					B.health = 15000
					src.chakra -= 10000
					return
				if(usr.chakra>=30000)
					src.firing = 1
					sleep(10)
					src.firing = 0
					var/mob/Big_Snake/B = new()
					B.owner=src
					B.name = "Big Snake"
					B.loc = locate(src.x, src.y - 1, src.z)
					B.tai = src.Mtai*10
					B.kuchiyose=1
					src.kuchiyoseusing=1
					B.max_exp = 200
					B.exp = 1000
					B.health = 50000
					src.chakra -= 10000
					return
			else
				var/mob/failedsnake/F = new()
				F.loc=usr.loc
				F.y-=1
				view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Oops.."
				sleep(40)
				del(F)


mob/proc
	randomfrog()
		if(usr.frogsummoning>=50)
			if(usr.chakra>=10000&&usr.chakra<30000)
				src.firing = 1
				sleep(10)
				src.firing = 0
				var/mob/Medium_Frog/B = new()
				B.owner=src
				B.name = "Gamakoucho"
				B.loc = locate(src.x, src.y - 1, src.z)
				B.tai = src.Mtai*3
				B.max_exp = 200
				B.exp = 1000
				src.kuchiyoseusing=1
				B.kuchiyose=1
				B.health = 15000
				src.chakra -= 10000
				return
			if(usr.chakra>=30000)
				src.firing = 1
				sleep(10)
				src.firing = 0
				var/mob/Gamabunta/B = new()
				B.owner=src
				B.name = "Gamabunta"
				B.loc = locate(src.x, src.y - 1, src.z)
				B.tai = src.Mtai*10
				B.max_exp = 200
				src.kuchiyoseusing=1
				B.kuchiyose=1
				B.exp = 1000
				B.health = 50000
				src.chakra -= 10000
				return
		else
			usr.random=rand(1,4)
			if(usr.random==1)
				if(usr.chakra>=10000&&usr.chakra<30000)
					src.firing = 1
					sleep(10)
					src.firing = 0
					var/mob/Medium_Frog/B = new()
					B.owner=src
					B.kuchiyose=1
					B.name = "Gamakoucho"
					B.loc = locate(src.x, src.y - 1, src.z)
					B.tai = src.Mtai*3
					B.max_exp = 200
					B.exp = 1000
					src.kuchiyoseusing=1
					B.health = 15000
					src.chakra -= 10000
					return
				if(usr.chakra>=30000)
					src.firing = 1
					sleep(10)
					src.firing = 0
					var/mob/Gamabunta/B = new()
					B.owner=src
					B.name = "Gamabunta"
					B.loc = locate(src.x, src.y - 1, src.z)
					B.tai = src.Mtai*10
					B.max_exp = 200
					B.kuchiyose=1
					src.kuchiyoseusing=1
					B.exp = 1000
					B.health = 50000
					src.chakra -= 10000
					return
			else
				var/mob/failedfrog/F = new()
				F.loc=usr.loc
				F.y-=1
				view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Oops.."
				sleep(50)
				del(F)


mob/proc
	randomslug()
		if(usr.slugsummoning>=50)
			if(usr.chakra>=10000&&usr.chakra<30000)
				src.firing = 1
				sleep(10)
				src.firing = 0
				var/mob/Medium_Slug/B = new()
				B.owner=src
				B.name = "Kitsuii"
				B.loc = locate(src.x, src.y - 1, src.z)
				B.tai = src.Mtai*3
				B.max_exp = 200
				B.kuchiyose=1
				B.exp = 1000
				B.health = 15000
				src.kuchiyoseusing=1
				src.chakra -= 10000
				return
			if(usr.chakra>=30000)
				src.firing = 1
				sleep(10)
				src.firing = 0
				var/mob/Big_Slug/B = new()
				B.owner=src
				B.name = "Katsuya"
				B.loc = locate(src.x, src.y - 1, src.z)
				B.tai = src.Mtai*10
				src.kuchiyoseusing=1
				B.max_exp = 200
				B.kuchiyose=1
				B.exp = 1000
				B.health = 50000
				src.chakra -= 10000
				return
		else
			usr.random=rand(1,4)
			if(usr.random==1)
				if(usr.chakra>=10000&&usr.chakra<30000)
					src.firing = 1
					sleep(10)
					src.firing = 0
					var/mob/Medium_Slug/B = new()
					B.owner=src
					B.name = "Kitsuii"
					B.loc = locate(src.x, src.y - 1, src.z)
					B.tai = src.Mtai*3
					B.max_exp = 200
					B.kuchiyose=1
					B.exp = 1000
					src.kuchiyoseusing=1
					B.health = 15000
					src.chakra -= 10000
					return
				if(usr.chakra>=30000)
					src.firing = 1
					sleep(10)
					src.firing = 0
					var/mob/Big_Slug/B = new()
					B.owner=src
					B.name = "Katsuya"
					B.loc = locate(src.x, src.y - 1, src.z)
					B.tai = src.Mtai*10
					B.max_exp = 200
					src.kuchiyoseusing=1
					B.kuchiyose=1
					B.exp = 1000
					B.health = 50000
					src.chakra -= 10000
					return
			else
				var/mob/failedslug/F = new()
				F.loc=usr.loc
				F.y-=1
				view() << "<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Oops.."
				sleep(50)
				del(F)


mob/proc/snakeup()
	var/chance=rand(1,4)
	if(chance==1)
		usr.snakesummoning+=1
		usr <<"<font color=green>Your snake summoning ability went up by 1!"
	else
		return
mob/proc/frogup()
	var/chance=rand(1,4)
	if(chance==1)
		usr.frogsummoning+=1
		usr <<"<font color=green>Your frog summoning ability went up by 1!"
	else
		return
mob/proc/slugup()
	var/chance=rand(1,4)
	if(chance==1)
		usr.slugsummoning+=1
		usr <<"<font color=green>Your slug summoning ability went up by 1!"
	else
		return

turf/Click()
	for(var/mob/Medium_Snake/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Medium_Snake/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
turf/Click()
	for(var/mob/Medium_Frog/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Medium_Frog/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
turf/Click()
	for(var/mob/Medium_Slug/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Medium_Slug/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
turf/Click()
	for(var/mob/Big_Slug/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Big_Slug/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob
	Gamabunta
		icon='gammabunta1.dmi'
		icon_state="1,1"
		density=1
		layer=FLY_LAYER

		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner)
					src.loc=M.loc
					return
				if(src.firing)
					return
				else
					var/mob/P = M
					var/Damage = src.tai/1.4
					P.health -= Damage // Takes the players health
					view() << "The [src] attacks [M] for [Damage]!"
					P.Death(src)
					src.firing = 1
					sleep(7)
					src.firing = 0
		New()
			..()
			overlays+=/obj/part2
			overlays+=/obj/part3
			overlays+=/obj/part4
			overlays+=/obj/part5
			overlays+=/obj/part6
			overlays+=/obj/part7
			overlays+=/obj/part8
			overlays+=/obj/part9
			..()
		verb/Ride()
			set src in oview(1)
			set category="Jutsus"
			for(var/mob/Gamabunta/G in oview(1,usr))
				if(G.owner==usr)
					if(!usr.ride&&!G.ride)
						usr.ride=1
						if(G)
							G.ride=1
						usr.Frozen=1
					else
						usr.ride=0
						usr.Frozen=0
						if(G)
							G.ride=0
		Move()
			..()
			var/mob/O = src.owner
			if(O.ride&&src.ride)
				O.loc=src.loc
				O.dir=src.dir
				O.y+=1

obj
	part2
		icon='gammabunta1.dmi'
		icon_state="1,2"
		density=1
		pixel_y=32
		name="1"
obj
	part3
		icon='gammabunta1.dmi'
		icon_state="0,1"
		density=1
		pixel_x=-32
		name="2"
obj
	part4
		icon='gammabunta1.dmi'
		icon_state="2,1"
		density=1
		pixel_x=32
		name="3"
obj
	part5
		icon='gammabunta1.dmi'
		icon_state="0,2"
		pixel_x=-32
		density=1
		pixel_y=32
		name="4"
obj
	part6
		icon='gammabunta1.dmi'
		icon_state="2,2"
		pixel_x=32
		density=1
		pixel_y=32
		name="5"
obj
	part7
		icon='gammabunta1.dmi'
		icon_state="0,0"
		pixel_x=-32
		pixel_y=-32
		density=1
		name="6"
obj
	part8
		icon='gammabunta1.dmi'
		icon_state="1,0"
		density=1
		pixel_y=-32
		name="7"
obj
	part9
		icon='gammabunta1.dmi'
		icon_state="2,0"
		pixel_x=32
		density=1
		pixel_y=-32
		name="8"
mob
	Big_Snake
		icon='orochimarusnake.dmi'
		icon_state="0,0"
		density=1
		layer=FLY_LAYER

		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner)
					src.loc=M.loc
					return
				if(src.firing)
					return
				else
					var/mob/P = M
					var/Damage = src.tai/1.4
					P.health -= Damage // Takes the players health
					view() << "The [src] attacks [M] for [Damage]!"
					P.Death(src)
					src.firing = 1
					sleep(5)
					src.firing = 0
		New()
			..()
			overlays+=/obj/snake1
			overlays+=/obj/snake2
			overlays+=/obj/snake3
			overlays+=/obj/snake4
			overlays+=/obj/snake5
			..()
		verb/Ride()
			set src in oview(2)
			set category="Jutsus"
			for(var/mob/Big_Snake/G in oview(1,usr))
				if(G.owner==usr)
					if(!usr.ride&&!G.ride)
						usr.ride=1
						if(G)
							G.ride=1
						usr.Frozen=1
					else
						usr.ride=0
						usr.Frozen=0
						if(G)
							G.ride=0

obj
	snake1
		icon='orochimarusnake.dmi'
		icon_state="0,1"
		density=1
		pixel_y=32
		name="2"
obj
	snake2
		icon='orochimarusnake.dmi'
		icon_state="1,0"
		density=1
		pixel_x=32
		name="2"
obj
	snake3
		icon='orochimarusnake.dmi'
		icon_state="1,1"
		density=1
		pixel_x=32
		pixel_y=32
		name="2"
obj
	snake4
		icon='orochimarusnake.dmi'
		icon_state="0,2"
		density=1
		pixel_y=64
		name="2"
obj
	snake5
		icon='orochimarusnake.dmi'
		icon_state="1,2"
		density=1
		pixel_x=32
		pixel_y=64
		name="2"
mob
	Big_Slug
		icon='katsuya(1).dmi'
		icon_state="1,0"
		density=1
		layer=FLY_LAYER

		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner)
					src.loc=M.loc
					return
				if(src.firing)
					return
				else
					var/mob/P = M
					var/Damage = src.tai/1.4
					P.health -= Damage // Takes the players health
					view() << "The [src] attacks [M] for [Damage]!"
					P.Death(src)
					src.firing = 1
					sleep(5)
					src.firing = 0
		New()
			..()
			overlays+=/obj/kata1
			overlays+=/obj/kata2
			overlays+=/obj/kata3
			overlays+=/obj/kata4
			overlays+=/obj/kata5
			..()
		verb/Ride()
			set src in oview(1)
			set category="Jutsus"
			for(var/mob/Big_Slug/G in oview(1,usr))
				if(G.owner==usr)
					if(!usr.ride&&!G.ride)
						usr.ride=1
						if(G)
							G.ride=1
						usr.Frozen=1
					else
						usr.ride=0
						usr.Frozen=0
						if(G)
							G.ride=0
		Move()
			..()
			var/mob/O = src.owner
			if(O.ride&&src.ride)
				O.loc=src.loc
				O.dir=src.dir
				O.y+=1
obj
	kata1
		icon='katsuya(1).dmi'
		icon_state="0,0"
		density=1
		pixel_x=-32

obj
	kata2
		icon='katsuya(1).dmi'
		icon_state="2,0"
		density=1
		pixel_x=32

obj
	kata3
		icon='katsuya(1).dmi'
		icon_state="1,1"
		density=1
		pixel_y=32
obj
	kata4
		icon='katsuya(1).dmi'
		icon_state="0,1"
		density=1
		pixel_x=-32
		pixel_y=32

obj
	kata5
		icon='katsuya(1).dmi'
		icon_state="2,1"
		density=1
		pixel_x=32
		pixel_y=32

mob
	Medium_Frog
		icon='medium frog.dmi'
		icon_state="0,1"
		density=1

		layer=FLY_LAYER
		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner||firing == 1)
					return
				else
					var/mob/P = M
					var/Damage = src.tai/1.4
					P.health -= Damage // Takes the players health
					view() << "The [src] attacks [M] for [Damage]!"
					P.Death(src)
					src.firing = 1
					sleep(5)
					src.firing = 0
		New()
			..()
			overlays+=/obj/mfrog1
			overlays+=/obj/mfrog2
			overlays+=/obj/mfrog3
			..()
obj
	mfrog1
		icon='medium frog.dmi'
		icon_state="0,0"
		density=1
		pixel_y=-32
obj
	mfrog2
		icon='medium frog.dmi'
		icon_state="1,1"
		density=1
		pixel_x=32
obj
	mfrog3
		icon='medium frog.dmi'
		icon_state="1,0"
		density=1
		pixel_x=32
		pixel_y=-32



mob/failedsnake
	icon='fail summons.dmi'
	icon_state="snake"


mob/failedfrog
	icon='fail summons.dmi'
	icon_state="frog"

mob/Medium_Slug
	icon='mediumslug.dmi'
	icon_state="0,0"
	Bump(atom/M)
		if(istype(M,/mob/)) // If they run into the player
			if(M == owner||firing == 1)
				return
			else
				var/mob/P = M
				var/Damage = src.tai/1.4
				P.health -= Damage // Takes the players health
				view() << "The [src] attacks [M] for [Damage]!"
				P.Death(src)
				src.firing = 1
				sleep(5)
				src.firing = 0
	New()
		..()
		overlays+=/obj/msnail1
		overlays+=/obj/msnail2
		overlays+=/obj/msnail3
		..()
obj
	msnail1
		icon='mediumslug.dmi'
		icon_state="1,0"
		density=1
		pixel_x=32
obj
	msnail2
		icon='mediumslug.dmi'
		icon_state="0,1"
		density=1
		pixel_y=32
obj
	msnail3
		icon='mediumslug.dmi'
		icon_state="1,1"
		density=1
		pixel_x=32
		pixel_y=32
mob/failedslug
	icon='fail summons.dmi'
	icon_state="slug"
obj
	msnake1
		icon='snakemedium.dmi'
		icon_state="0,1"
		density=1
		pixel_y=32
mob
	Medium_Snake
		icon='snakemedium.dmi'
		icon_state="0,0"
		density=1
		layer=FLY_LAYER
		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner||firing == 1)
					return
				else
					var/mob/P = M
					var/Damage = src.tai/1.4
					P.health -= Damage // Takes the players health
					view() << "The [src] attacks [M] for [Damage]!"
					P.Death(src)
					src.firing = 1
					sleep(5)
					src.firing = 0
		New()
			..()
			overlays+=/obj/msnake1
			..()
obj/summoneffect
	icon='summoningeffect.dmi'
	density=0
obj/summoncircle
	icon='summoncircle.dmi'
	density=0
	layer=MOB_LAYER+1
mob/proc/Summoneffect()
	var/obj/summoneffect/U = new()
	var/obj/summoneffect/D = new()
	var/obj/summoneffect/L = new()
	var/obj/summoneffect/R = new()
	var/obj/summoneffect/NW = new()
	var/obj/summoneffect/NE = new()
	var/obj/summoneffect/SE = new()
	var/obj/summoneffect/SW = new()
	var/obj/summoncircle/SC = new()
	SC.loc=usr.loc
	flick("summon",SC)
	U.loc=src.loc
	walk(U,NORTH)
	D.loc=src.loc
	walk(D,SOUTH)
	L.loc=src.loc
	walk(L,WEST)
	R.loc=src.loc
	walk(R,EAST)
	NW.loc=src.loc
	walk(NW,NORTHWEST)
	NE.loc=src.loc
	walk(NE,NORTHEAST)
	SE.loc=src.loc
	walk(SE,SOUTHEAST)
	SW.loc=src.loc
	walk(SW,SOUTHWEST)
	sleep(3)
	if(U)
		del(U)
	if(D)
		del(D)
	if(L)
		del(L)
	if(R)
		del(R)
	if(NW)
		del(NW)
	if(NE)
		del(NE)
	if(SE)
		del(SE)
	if(SW)
		del(SW)
	sleep(7)
	if(SC)
		del(SC)
