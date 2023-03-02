turf
	t1
		icon = 'menus.dmi'
		icon_state = "1"
	t2
		icon = 'menus.dmi'
		icon_state = "2"
	t3
		icon = 'menus.dmi'
		icon_state = "3"
	t4
		icon = 'menus.dmi'
		icon_state = "4"
	t5
		icon = 'menus.dmi'
		icon_state = "5"
	t6
		icon = 'menus.dmi'
		icon_state = "6"
	muddy
		icon = 'turf.dmi'
		icon_state = "muddy"
	white
		icon = 'white.dmi'
	deadtree
		icon = 'turf.dmi'
		icon_state = "deadtree"
		density = 1
	throne
		icon = 'Throne.dmi'
		icon_state = "throne"
		density = 1
	waterfall1
		icon = 'waterfall.dmi'
		icon_state = "1"
		layer = MOB_LAYER+1
	waterfall2
		icon = 'waterfall.dmi'
		icon_state = "2"
		density = 1
	waterfall3
		icon = 'waterfall.dmi'
		icon_state = "3"
		density = 1
		layer = MOB_LAYER+1
	waterfall4
		icon = 'waterfall.dmi'
		icon_state = "4"
		density = 1
		layer = MOB_LAYER+1
	waterfall5
		icon = 'waterfall.dmi'
		icon_state = "5"
		density = 1
	waterfall6
		icon = 'waterfall.dmi'
		icon_state = "6"
		density = 1
	/*treee1
		icon = 'bigtree.dmi'
		icon_state = "1"
		density=1
	treee2
		icon = 'bigtree.dmi'
		icon_state = "2"
		density=1
	treee3
		icon = 'bigtree.dmi'
		density=1
		icon_state = "3"
	treee4
		icon = 'bigtree.dmi'
		density=1
		icon_state = "4"
	treee5
		icon = 'bigtree.dmi'
		density=1
		icon_state = "5"
	treee6
		icon = 'bigtree.dmi'
		density=1
		icon_state = "6"
	treee7
		icon = 'bigtree.dmi'
		density=1
		icon_state = "7"
	treee8
		icon = 'bigtree.dmi'
		layer = MOB_LAYER+1
		icon_state = "8"
	treee9
		icon = 'bigtree.dmi'
		layer = MOB_LAYER+1
		icon_state = "9"
	treee10
		icon = 'bigtree.dmi'
		layer = MOB_LAYER+1
		icon_state = "10"
	treee11
		icon = 'bigtree.dmi'
		layer = MOB_LAYER+1
		icon_state = "11"
	treee12
		icon = 'bigtree.dmi'
		layer = MOB_LAYER+1
		icon_state = "12"
	treee13
		icon = 'bigtree.dmi'
		layer = MOB_LAYER+1
		icon_state = "13"
	treee14
		icon = 'bigtree.dmi'
		layer = MOB_LAYER+1
		icon_state = "14"
	treee15
		icon = 'bigtree.dmi'
		layer = MOB_LAYER+1
		icon_state = "15"
	treee16
		icon = 'bigtree.dmi'
		layer = MOB_LAYER+1
		icon_state = "16"*/
	grass
		icon = 'Landscapes.dmi'
		icon_state = "grass"
	sand
		icon = 'Landscapes.dmi'
		icon_state = "sand"
	MD
		icon = 'furnature.dmi'
		density=1
		icon_state = "69"
	LD
		icon = 'furnature.dmi'
		density=1
		icon_state = "68"
	RD
		icon = 'furnature.dmi'
		density=1
		icon_state = "70"
	fence1
		icon = 'Landscapes.dmi'
		icon_state = "fence1"
		density = 1
	boulder
		icon = 'Mountain.dmi'
		icon_state = "boulder"
		density = 1
	fence2
		icon = 'Landscapes.dmi'
		icon_state = "fence2"
		density = 1
	HyuugaE//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(11,42,2)
			else
				if(istype(A,/obj/)) del(A)
	HyuugaEXIT//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(75,29,1)
			else
				if(istype(A,/obj/)) del(A)
	openwall
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
	Leafacadenter//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(7,2,2)
			else
				if(istype(A,/obj/)) del(A)
	Lightningacadenter//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(48,39,2)
			else
				if(istype(A,/obj/)) del(A)
turf
	fromchuunin
		icon = 'Landscapes.dmi'
		icon_state = ""
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.invillage="grass"
					M.loc = locate(1,49,14)
			else
				if(istype(A,/obj/)) del(A)
	inchuunin
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.invillage="grass"
					M.loc = locate(26,68,15)
			else
				if(istype(A,/obj/)) del(A)
	TOLEAF
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(41,99,1)
			else
				if(istype(A,/obj/)) del(A)
	LEAVELEAF
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.rank=="Student")
					usr<<"You need to be Genin to be able to leave the village"
					return
				if(M.client)
					M.loc = locate(50,3,12)

			else
				if(istype(A,/obj/)) del(A)
	TOWATERFALL
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(50,99,24)
			else
				if(istype(A,/obj/)) del(A)
	LEAVEWATERFALL
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.rank=="Student")
					usr<<"You need to be Genin to be able to leave the village"
					return
				if(M.client)
					M.loc = locate(33,2,23)
			else
				if(istype(A,/obj/)) del(A)
	LEAVEGRASS
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.rank=="Student")
					usr<<"You need to be Genin to be able to leave the village"
					return
				if(M.client)
					M.loc = locate(98,29,12)
			else
				if(istype(A,/obj/)) del(A)
	TOGRASS
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(2,54,3)
			else
				if(istype(A,/obj/)) del(A)
	LEAVERAIN
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.rank=="Student")
					usr<<"You need to be Genin to be able to leave the village"
					return
				if(M.client)
					M.loc = locate(98,93,12)
			else
				if(istype(A,/obj/)) del(A)
	TORAIN
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(3,58,4)
			else
				if(istype(A,/obj/)) del(A)
	LEAVESAND
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.rank=="Student")
					usr<<"You need to be Genin to be able to leave the village"
					return
				if(M.client)
					M.loc = locate(47,99,12)
			else
				if(istype(A,/obj/)) del(A)
	TOSAND
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(55,2,5)
			else
				if(istype(A,/obj/)) del(A)
	LEAVESOUND
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.rank=="Student")
					usr<<"You need to be Genin to be able to leave the village"
					return
				if(M.client)
					M.loc = locate(49,99,21)
			else
				if(istype(A,/obj/)) del(A)
	TOSOUND
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(50,2,6)
			else
				if(istype(A,/obj/)) del(A)
	LEAVEEARTH
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.rank=="Student")
					usr<<"You need to be Genin to be able to leave the village"
					return
				if(M.client)
					M.loc = locate(2,24,21)
			else
				if(istype(A,/obj/)) del(A)
	TOEARTH
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(99,13,7)
			else
				if(istype(A,/obj/)) del(A)
	LEAVELIGHTNING
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.rank=="Student")
					usr<<"You need to be Genin to be able to leave the village"
					return
				if(M.client)
					M.loc = locate(44,2,21)
			else
				if(istype(A,/obj/)) del(A)
	TOLIGHTNING
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(24,99,8)
			else
				if(istype(A,/obj/)) del(A)
	LEAVEMIST1
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.rank=="Student")
					usr<<"You need to be Genin to be able to leave the village"
					return
				if(M.client)
					M.loc = locate(99,45,23)
			else
				if(istype(A,/obj/)) del(A)
	TOMIST2
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(42,99,23)
			else
				if(istype(A,/obj/)) del(A)
	TOMIST1
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(2,66,9)
			else
				if(istype(A,/obj/)) del(A)
	LEAVEMIST2
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(45,2,22)
			else
				if(istype(A,/obj/)) del(A)
	TO_S_E_L
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(99,y,21)
			else
				if(istype(A,/obj/)) del(A)
	TO_L_R_G
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(2,y,12)
			else
				if(istype(A,/obj/)) del(A)
	TO_M
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(49,99,22)
			else
				if(istype(A,/obj/)) del(A)
	TO_L
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(46,92,8)
			else
				if(istype(A,/obj/)) del(A)
	chu1
		icon = 'menus.dmi'
		icon_state = "chu1"
		density=1
	chu2
		icon = 'menus.dmi'
		icon_state = "chu2"
		density=1
turf
	floor
		icon = 'Landscapes.dmi'
		icon_state = "floor"
		density = 0
	floor2
		icon = 'Landscapes.dmi'
		icon_state = "floor2"
		density = 0
	floor3
		icon = 'Landscapes.dmi'
		icon_state = "floor3"
		density = 0
	floor4
		icon = 'Landscapes.dmi'
		icon_state = "floor4"
		density = 0
obj
	tree1
		icon = 'treee.dmi'
		icon_state = "top"
		layer = MOB_LAYER+1
	tree2
		icon = 'treee.dmi'
		icon_state = "bottom"
		density = 1
turf
	chair
		icon = 'furnature.dmi'
		icon_state = "75"
		density = 0
	chair2
		icon = 'furnature.dmi'
		icon_state = "77"
		density = 0
		layer = MOB_LAYER+1
	dirt
		icon = 'Landscapes.dmi'
		icon_state = "dirt"
		density = 0
	bridgeup
		icon = 'Landscapes.dmi'
		icon_state = "bridgeup"
		density = 0
	bridgeside
		icon = 'Landscapes.dmi'
		icon_state = "bridgeside"
		density = 0
	wall
		icon = 'Landscapes.dmi'
		icon_state = "wall"
		density = 1
		Enter(mob/player/M)
			if (istype(M,/mob/player))
				if(M.density == 0)
					return 0
				else
					return 0
	wall2
		icon = 'Landscapes.dmi'
		icon_state = "wall"
		density = 1
		opacity=1
		Enter(mob/player/M)
			if (istype(M,/mob/player))
				if(M.density == 0)
					return 0
				else
					return 0
	desk
		icon = 'furnature.dmi'
		icon_state = "55"
		density = 1
	sanddune
		icon = 'Landscapes.dmi'
		icon_state = "sandDune"
		density = 1
	Cactus
		icon = 'Landscapes.dmi'
		icon_state = "cactus"
		density = 1
	doorfromacadkonoha
		icon = 'Landscapes.dmi'
		icon_state="openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(48,47,1)
			else
				if(istype(A,/obj/)) del(A)
	doorfromacadsound
		icon = 'Landscapes.dmi'
		icon_state="openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					usr.loc = locate(64,41,6)
			else
				if(istype(A,/obj/)) del(A)
	doorfromacadrain
		icon = 'Landscapes.dmi'
		icon_state="openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(60,67,4)
			else
				if(istype(A,/obj/)) del(A)

	doorfromacadgrass
		icon = 'Landscapes.dmi'
		icon_state="openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(57,63,3)
			else
				if(istype(A,/obj/)) del(A)

	doorfromacadlightning
		icon = 'Landscapes.dmi'
		icon_state="openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(24,57,8)
			else
				if(istype(A,/obj/)) del(A)

	doorfromacadearth
		icon = 'Landscapes.dmi'
		icon_state="openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(67,54,7)
			else
				if(istype(A,/obj/)) del(A)

	doorfromacadwater
		icon = 'Landscapes.dmi'
		icon_state="openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(34,65,9)
			else
				if(istype(A,/obj/)) del(A)

	Earthacadenter
		icon = 'Landscapes.dmi'
		icon_state="openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(47,3,2)
			else
				if(istype(A,/obj/)) del(A)

	doorfromacadsand
		icon = 'Landscapes.dmi'
		icon_state="openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(42,60,5)
			else
				if(istype(A,/obj/)) del(A)

	Grassacadenter//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(90,2,2)
			else
				if(istype(A,/obj/)) del(A)

	Sandacadenter//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(7,86,2)
			else
				if(istype(A,/obj/)) del(A)

	Soundacadenter//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(89,37,2)
			else
				if(istype(A,/obj/)) del(A)

	Rainacadenter//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(41,86,2)
			else
				if(istype(A,/obj/)) del(A)

	Arenaenter//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(53,2,13)
			else
				if(istype(A,/obj/)) del(A)

	Arenaleave//usr.loc = locate(x,y,4)
		density = 0
		Enter()
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(5,16,10)
					M.firing = 0
			else
				if(istype(A,/obj/)) del(A)


	MizuplaceIN//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(91,2,10)
			else
				if(istype(A,/obj/)) del(A)

	MizuplaceOUT//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(77,79,9)
			else
				if(istype(A,/obj/)) del(A)

	Wateracadenter//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(10,85,10)
			else
				if(istype(A,/obj/)) del(A)

	inuzukaIN//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(84,96,2)
			else
				if(istype(A,/obj/)) del(A)

	inuzukaOUT//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(25,19,1)
			else
				if(istype(A,/obj/)) del(A)

	fence3
		icon = 'Landscapes.dmi'
		icon_state = "fence3"
		density = 1
		Enter(mob/player/M)
			if (istype(M,/mob/player))
				if(M.density == 0)
					return 0
				else
					return 0
	level_restrict
		icon = 'blank.dmi'
		density = 1
		Enter()
			if(usr.level > 1)
				return 1
				usr << "You may pass."
			else
				usr << "You must level up some more."
	water
		icon = 'Landscapes.dmi'
		icon_state="water2"
		layer = 1
		density=0
		Enter(mob/M)
			..()
			if(ismob(M)&&M.waterwalk)
				if(!M.onwater)
					M.onwater = 1
				return 1
			else if(isobj(M))
				return 1
			else ..()
		Exit(mob/M)
			..()
			if(ismob(M)&&M.waterwalk)
				M.onwater=0
				return 1
			else if(isobj(M))
				return 1
			else ..()

obj
	movie
		icon='Sweet movie.dmi'


var/COVER_LAYER = 10
obj
	konosign
		icon = 'hiddenleafvillage.PNG'
		layer=555



turf
	floor5
		icon = 'Landscapes.dmi'
		icon_state = "floor4"
		density = 0
area
	chuunin
		Entered(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					if(M.Mtai >=100&&M.Mnin>=100&&M.Mgen>=100 && M.level>=15&&M.rank=="Genin")
						M.bchuuninx = M.x
						M.bchuuniny = M.y
						M.bchuuninz = M.z
						usr.loc=locate(26,68,15)
					else
						M<<"You aren't qualified (Need over 100 Each stat, Genin, and level 15 to qualify."
						return
			else
				if(istype(A,/obj/)) del(A)


	chuuninout
		Entered(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(M.bchuuninx,M.bchuuniny-1,M.bchuuninz)
			else
				if(istype(A,/obj/)) del(A)

turf
	mountain1
		name="Mountain"
		density=0
		icon='turfs.dmi'
		icon_state="mountain1"
obj
	mountain2
		name="Mountain"
		density=1
		icon='turfs.dmi'
		icon_state="mountain2"
turf
	mountain3
		name="Mountain"
		density=1
		icon='turfs.dmi'
		icon_state="mountain3"
turf
	mountain4
		name="Mountain"
		density=1
		icon='turfs.dmi'
		icon_state="mountain4"
turf
	mountain5
		name="Mountain"
		density=1
		icon='turfs.dmi'
		icon_state="mountain5"
turf
	mountain6
		name="Mountain"
		density=1
		icon='turfs.dmi'
		icon_state="mountain6"
turf
	mountain7
		name="Mountain"
		density=1
		icon='turfs.dmi'
		icon_state="mountain7"
turf
	mountain8
		name="Mountain"
		density=1
		icon='turfs.dmi'
		icon_state="mountain8"
turf
	mountain9
		name="Mountain"
		density=0
		icon='turfs.dmi'
		icon_state="mountain9"
area
	cliff
		Entered(atom/M)
			if(ismob(M))
				M.verbs+=typesof(/mob/cliff/verb)
				usr.Mountain=1
			return ..()
		Exited(atom/M)
			if(ismob(M))
				M.verbs-=typesof(/mob/cliff/verb)
				usr.Mountain=0
			return ..()
mob/var/Mountain=0
mob/var/tmp/climbing=0

mob
	cliff
		verb
			climbup()
				set name="Climb Up"
				set category = "Train"
				var/obj/mountain2/C
				if(usr.climbing)
					return
				if(usr.firing)
					return
				if(usr.resting)
					usr<<"You cannot rest and climb at the same time, Impossible"
					return
				if(usr.meditating)
					return
				if(usr.health<=5)
					for(C in get_step(usr,SOUTH))
						if(C)
							usr << "<b>You are to tired, you slip and fall.</b>"
							usr.loc=locate(usr.x,usr.y-1,usr.z)
							return
					for(C in get_step(usr,NORTH))
						if(C)
							usr << "<b>You are to tired to climb up</b>"
				else
					for(C in get_step(usr,NORTH))
						if(C)
							if(prob(95))
								usr << "<b>You climb up the cliff.</b>"
								usr.climbing=1
								var/minus=pick(prob(70); 5,prob(30); rand(1,3))
								minus=pick(prob(60); 5,prob(30); rand(1,50))
								usr.health-=minus
								usr.y+=1
								if(usr.health<=0)
									Death(usr)
								sleep(10)
								usr.climbing=0
								if(usr.maxhealth<100000)
									switch(rand(1,5))
										if(1)
											taiexp+=rand(1000,4000)
											taiup()
										if(2)
											if(usr.Weights)
												maxhealth+=rand(10000,20000)
												usr<<"Your weights put a harder strain on you"
												taiexp+=rand(1,3)
												taiup()
										if(3)
											maxhealth+=rand(1000,2000)
											usr<<"Your Stamina increases"
										if(4)
											maxhealth+=rand(1000,1500)
											usr<<"Your Stamina increases"
										if(5)
											taiexp+=rand(1000,2000)
											taiup()
								else
									switch(rand(1,5))
										if(1)
											maxhealth+=rand(1,5)
											usr<<"Your Stamina increases"
										if(2)
											taiexp+=rand(1,3)
											taiup()
							else
								if(prob(10))
									usr.loc=locate(src.x,src.y-rand(1,2),src.z)
									usr << "<b>You reach for the next ledge but slip</b>"

			climbdown()
				set name="Climb Down"
				set category = "Train"
				var/obj/mountain2/C
				if(usr.climbing)
					return
				for(C in get_step(usr,SOUTH))
					if(C)
						usr.climbing=1
						usr.loc=locate(src.x,src.y-1,src.z)
						usr << "<b>You slide down the cliff.</b>"
						spawn(5) usr.climbing=0
turf
	stadium1
		icon = 'stadium.dmi'
		icon_state = "1"
		density = 1
	stadium2
		icon = 'stadium.dmi'
		icon_state = "2"
		density = 1
	stadium3
		icon = 'stadium.dmi'
		icon_state = "3"
		density = 1
	stadium4
		icon = 'stadium.dmi'
		icon_state = "4"
		density = 1
	stadium5
		icon = 'stadium.dmi'
		icon_state = "5"
		density = 1
	stadium6
		icon = 'stadium.dmi'
		icon_state = "6"
		density = 1
	stadium7
		icon = 'stadium.dmi'
		icon_state = "7"
		density = 1
	stadium8
		icon = 'stadium.dmi'
		icon_state = "8"
		density = 1
	stadium9
		icon = 'stadium.dmi'
		icon_state = "9"
		density = 1
	stadium10
		icon = 'stadium.dmi'
		icon_state = "10"
		density = 0

	S1
		icon = 'furnature.dmi'
		icon_state = "S1"
		density = 1
	S2
		icon = 'furnature.dmi'
		icon_state = "S2"
		density = 1
	S3
		icon = 'furnature.dmi'
		icon_state = "S3"
		density = 1
	S4
		icon = 'furnature.dmi'
		icon_state = "S4"
		density = 1
	S5
		icon = 'furnature.dmi'
		icon_state = "S5"
		density = 1
	mountain11
		icon = 'Mountain.dmi'
		icon_state = "1"
		density = 1
	mountain12
		icon = 'Mountain.dmi'
		icon_state = "2"
		density = 1
	mountain13
		icon = 'Mountain.dmi'
		icon_state = "3"
		density = 1
	mountain14
		icon = 'Mountain.dmi'
		icon_state = "4"
		density = 1
	mountain15
		icon = 'Mountain.dmi'
		icon_state = "5"
		density = 1
	mountain16
		icon = 'Mountain.dmi'
		icon_state = "6"
		density = 1
	mountain17
		icon = 'Mountain.dmi'
		icon_state = "7"
		density = 1
	mountain18
		icon = 'Mountain.dmi'
		icon_state = "8"
		density = 1
	mountain19
		icon = 'Mountain.dmi'
		icon_state = "9"
		density = 1
	leafmansion1
		icon = 'mansions.dmi'
		icon_state = "1"
		density = 1
	leafmansion2
		icon = 'mansions.dmi'
		icon_state = "2"
		density = 1
	leafmansion3
		icon = 'mansions.dmi'
		icon_state = "3"
		density = 1
	leafmansion4
		icon = 'mansions.dmi'
		icon_state = "4"
		density = 1
	leafmansion5
		icon = 'mansions.dmi'
		icon_state = "5"
		density = 1
	leafmansion6
		icon = 'mansions.dmi'
		icon_state = "6"
		density = 1
	leafmansion7
		icon = 'mansions.dmi'
		icon_state = "7"
		density = 1
	leafmansion8
		icon = 'mansions.dmi'
		icon_state = "8"
		density = 1
	leafmansion9
		icon = 'mansions.dmi'
		icon_state = "9"
		density = 1
	leafmansion10
		icon = 'mansions.dmi'
		icon_state = "10"
		density = 1
	leafmansion11
		icon = 'mansions.dmi'
		icon_state = "11"
		density = 1
	leafmansion12
		icon = 'mansions.dmi'
		icon_state = "12"
		density = 1
	leafmansion13
		icon = 'mansions.dmi'
		icon_state = "13"
		density = 1
	leafmansion14
		icon = 'mansions.dmi'
		icon_state = "14"
		density = 1
	leafmansion15
		icon = 'mansions.dmi'
		icon_state = "15"
		density = 1
	leafmansion16
		icon = 'mansions.dmi'
		icon_state = "16"
		density = 1
	leafmansion17
		icon = 'mansions.dmi'
		icon_state = "17"
		density = 1
	leafmansion18
		icon = 'mansions.dmi'
		icon_state = "18"
		density = 1
	leafmansion19
		icon = 'mansions.dmi'
		icon_state = "19"
		density = 1
	leafmansion20
		icon = 'mansions.dmi'
		icon_state = "20"
		density = 1
	leafmansion21
		icon = 'mansions.dmi'
		icon_state = "21"
		density = 1
	leafmansion22
		icon = 'mansions.dmi'
		icon_state = "22"
		density = 1
	leafmansion23
		icon = 'mansions.dmi'
		icon_state = "23"
		density = 1
	leafmansion24
		icon = 'mansions.dmi'
		icon_state = "24"
		density = 1
	leafmansion25
		icon = 'mansions.dmi'
		icon_state = "25"
		density = 1
	leafmansion26
		icon = 'mansions.dmi'
		icon_state = "26"
		density = 1
	leafmansion27
		icon = 'mansions.dmi'
		icon_state = "27"
		density = 1
	kageIN
		icon = 'mansions.dmi'
		icon_state = "kagedoor"
		density = 1
		opacity = 1
		Enter()
			if(usr.rank == "Kage")
				return 1
				usr << "You may pass."
			else
				usr << "You must be Kage level to enter."
	leafmansionIN
		icon = 'mansions.dmi'
		icon_state = "28"
		density = 1
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(22,24,10)
			else
				if(istype(A,/obj/)) del(A)

	leafmansionOUT
		icon = 'mansions.dmi'
		icon_state = "28"
		density = 1
		opacity = 1
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(23,55,1)
			else
				if(istype(A,/obj/)) del(A)

	sandmansion1
		icon = 'mansionsand.dmi'
		icon_state = "1"
		density = 1
	sandmansion2
		icon = 'mansionsand.dmi'
		icon_state = "2"
		density = 1
	sandmansion3
		icon = 'mansionsand.dmi'
		icon_state = "3"
		density = 1
	sandmansion4
		icon = 'mansionsand.dmi'
		icon_state = "4"
		density = 1
	sandmansion5
		icon = 'mansionsand.dmi'
		icon_state = "5"
		density = 1
	sandmansion6
		icon = 'mansionsand.dmi'
		icon_state = "6"
		density = 1
	sandmansion7
		icon = 'mansionsand.dmi'
		icon_state = "7"
		density = 1
	sandmansion8
		icon = 'mansionsand.dmi'
		icon_state = "8"
		density = 1
	sandmansion9
		icon = 'mansionsand.dmi'
		icon_state = "9"
		density = 1
	sandmansion10
		icon = 'mansionsand.dmi'
		icon_state = "10"
		density = 1
	sandmansion11
		icon = 'mansionsand.dmi'
		icon_state = "11"
		density = 1
	sandmansion12
		icon = 'mansionsand.dmi'
		icon_state = "12"
		density = 1
	sandmansion13
		icon = 'mansionsand.dmi'
		icon_state = "13"
		density = 1
	sandmansion14
		icon = 'mansionsand.dmi'
		icon_state = "14"
		density = 1
	sandmansion15
		icon = 'mansionsand.dmi'
		icon_state = "15"
		density = 1
	sandmansion16
		icon = 'mansionsand.dmi'
		icon_state = "16"
		density = 1
	sandmansion17
		icon = 'mansionsand.dmi'
		icon_state = "17"
		density = 1
	sandmansion18
		icon = 'mansionsand.dmi'
		icon_state = "18"
		density = 1
	sandmansion19
		icon = 'mansionsand.dmi'
		icon_state = "19"
		density = 1
	sandmansion20
		icon = 'mansionsand.dmi'
		icon_state = "20"
		density = 1
	sandmansion21
		icon = 'mansionsand.dmi'
		icon_state = "21"
		density = 1
	sandmansion22
		icon = 'mansionsand.dmi'
		icon_state = "22"
		density = 1
	sandmansion23
		icon = 'mansionsand.dmi'
		icon_state = "23"
		density = 1
	sandmansion24
		icon = 'mansionsand.dmi'
		icon_state = "24"
		density = 1
	sandmansion25
		icon = 'mansionsand.dmi'
		icon_state = "25"
		density = 1
	sandmansion26
		icon = 'mansionsand.dmi'
		icon_state = "26"
		density = 1
	sandmansion27
		icon = 'mansionsand.dmi'
		icon_state = "27"
		density = 1
	sandmansionIN
		icon = 'mansionsand.dmi'
		icon_state = "28"
		density = 1
		Enter()
			usr.loc=locate(80,23,10)
	sandmansionOUT
		icon = 'mansionsand.dmi'
		icon_state = "28"
		density = 1
		opacity = 1
		Enter()
			usr.loc=locate(64,55,5)
	wmansion1
		icon = 'mansionwater.dmi'
		icon_state = "1"
		density = 1
	wmansion2
		icon = 'mansionwater.dmi'
		icon_state = "2"
		density = 1
	wmansion3
		icon = 'mansionwater.dmi'
		icon_state = "3"
		density = 1
	wmansion4
		icon = 'mansionwater.dmi'
		icon_state = "4"
		density = 1
	wmansion5
		icon = 'mansionwater.dmi'
		icon_state = "5"
		density = 1
	wmansion6
		icon = 'mansionwater.dmi'
		icon_state = "6"
		density = 1
	wmansion7
		icon = 'mansionwater.dmi'
		icon_state = "7"
		density = 1
	wmansion8
		icon = 'mansionwater.dmi'
		icon_state = "8"
		density = 1
	wmansion9
		icon = 'mansionwater.dmi'
		icon_state = "9"
		density = 1
	wmansion10
		icon = 'mansionwater.dmi'
		icon_state = "10"
		density = 1
	wmansion11
		icon = 'mansionwater.dmi'
		icon_state = "11"
		density = 1
	wmansion12
		icon = 'mansionwater.dmi'
		icon_state = "12"
		density = 1
	wmansion13
		icon = 'mansionwater.dmi'
		icon_state = "13"
		density = 1
	wmansion14
		icon = 'mansionwater.dmi'
		icon_state = "14"
		density = 1
	wmansion15
		icon = 'mansionwater.dmi'
		icon_state = "15"
		density = 1
	wmansion16
		icon = 'mansionwater.dmi'
		icon_state = "16"
		density = 1
	wmansion17
		icon = 'mansionwater.dmi'
		icon_state = "17"
		density = 1
	wmansion18
		icon = 'mansionwater.dmi'
		icon_state = "18"
		density = 1
	wmansion19
		icon = 'mansionwater.dmi'
		icon_state = "19"
		density = 1
	wmansion20
		icon = 'mansionwater.dmi'
		icon_state = "20"
		density = 1
	wmansion21
		icon = 'mansionwater.dmi'
		icon_state = "21"
		density = 1
	wmansion22
		icon = 'mansionwater.dmi'
		icon_state = "22"
		density = 1
	wmansion23
		icon = 'mansionwater.dmi'
		icon_state = "23"
		density = 1
	wmansion24
		icon = 'mansionwater.dmi'
		icon_state = "24"
		density = 1
	wmansion25
		icon = 'mansionwater.dmi'
		icon_state = "25"
		density = 1
	wmansion26
		icon = 'mansionwater.dmi'
		icon_state = "26"
		density = 1
	wmansion27
		icon = 'mansionwater.dmi'
		icon_state = "27"
		density = 1
	wmansionIN
		icon = 'mansionwater.dmi'
		icon_state = "28"
		density = 1
		Enter()
			usr.loc=locate(22,2,15)
	wmansionOUT
		icon = 'mansionwater.dmi'
		icon_state = "28"
		density = 1
		opacity = 1
		Enter()
			usr.loc=locate(82,79,9)
	lmansion1
		icon = 'mansionlight.dmi'
		icon_state = "1"
		density = 1
	lmansion2
		icon = 'mansionlight.dmi'
		icon_state = "2"
		density = 1
	lmansion3
		icon = 'mansionlight.dmi'
		icon_state = "3"
		density = 1
	lmansion4
		icon = 'mansionlight.dmi'
		icon_state = "4"
		density = 1
	lmansion5
		icon = 'mansionlight.dmi'
		icon_state = "5"
		density = 1
	lmansion6
		icon = 'mansionlight.dmi'
		icon_state = "6"
		density = 1
	lmansion7
		icon = 'mansionlight.dmi'
		icon_state = "7"
		density = 1
	lmansion8
		icon = 'mansionlight.dmi'
		icon_state = "8"
		density = 1
	lmansion9
		icon = 'mansionlight.dmi'
		icon_state = "9"
		density = 1
	lmansion10
		icon = 'mansionlight.dmi'
		icon_state = "10"
		density = 1
	lmansion11
		icon = 'mansionlight.dmi'
		icon_state = "11"
		density = 1
	lmansion12
		icon = 'mansionlight.dmi'
		icon_state = "12"
		density = 1
	lmansion13
		icon = 'mansionlight.dmi'
		icon_state = "13"
		density = 1
	lmansion14
		icon = 'mansionlight.dmi'
		icon_state = "14"
		density = 1
	lmansion15
		icon = 'mansionlight.dmi'
		icon_state = "15"
		density = 1
	lmansion16
		icon = 'mansionlight.dmi'
		icon_state = "16"
		density = 1
	lmansion17
		icon = 'mansionlight.dmi'
		icon_state = "17"
		density = 1
	lmansion18
		icon = 'mansionlight.dmi'
		icon_state = "18"
		density = 1
	lmansion19
		icon = 'mansionlight.dmi'
		icon_state = "19"
		density = 1
	lmansion20
		icon = 'mansionlight.dmi'
		icon_state = "20"
		density = 1
	lmansion21
		icon = 'mansionlight.dmi'
		icon_state = "21"
		density = 1
	lmansion22
		icon = 'mansionlight.dmi'
		icon_state = "22"
		density = 1
	lmansion23
		icon = 'mansionlight.dmi'
		icon_state = "23"
		density = 1
	lmansion24
		icon = 'mansionlight.dmi'
		icon_state = "24"
		density = 1
	lmansion25
		icon = 'mansionlight.dmi'
		icon_state = "25"
		density = 1
	lmansion26
		icon = 'mansionlight.dmi'
		icon_state = "26"
		density = 1
	lmansion27
		icon = 'mansionlight.dmi'
		icon_state = "27"
		density = 1
	lmansionIN
		icon = 'mansionlight.dmi'
		icon_state = "28"
		density = 1
		Enter()
			usr.loc=locate(80,2,15)
	lmansionOUT
		icon = 'mansionlight.dmi'
		icon_state = "28"
		density = 1
		opacity = 1
		Enter()
			usr.loc=locate(25,4,8)
	emansion1
		icon = 'mansioner.dmi'
		icon_state = "1"
		density = 1
	emansion2
		icon = 'mansioner.dmi'
		icon_state = "2"
		density = 1
	emansion3
		icon = 'mansioner.dmi'
		icon_state = "3"
		density = 1
	emansion4
		icon = 'mansioner.dmi'
		icon_state = "4"
		density = 1
	emansion5
		icon = 'mansioner.dmi'
		icon_state = "5"
		density = 1
	emansion6
		icon = 'mansioner.dmi'
		icon_state = "6"
		density = 1
	emansion7
		icon = 'mansioner.dmi'
		icon_state = "7"
		density = 1
	emansion8
		icon = 'mansioner.dmi'
		icon_state = "8"
		density = 1
	emansion9
		icon = 'mansioner.dmi'
		icon_state = "9"
		density = 1
	emansion10
		icon = 'mansioner.dmi'
		icon_state = "10"
		density = 1
	emansion11
		icon = 'mansioner.dmi'
		icon_state = "11"
		density = 1
	emansion12
		icon = 'mansioner.dmi'
		icon_state = "12"
		density = 1
	emansion13
		icon = 'mansioner.dmi'
		icon_state = "13"
		density = 1
	emansion14
		icon = 'mansioner.dmi'
		icon_state = "14"
		density = 1
	emansion15
		icon = 'mansioner.dmi'
		icon_state = "15"
		density = 1
	emansion16
		icon = 'mansioner.dmi'
		icon_state = "16"
		density = 1
	emansion17
		icon = 'mansioner.dmi'
		icon_state = "17"
		density = 1
	emansion18
		icon = 'mansioner.dmi'
		icon_state = "18"
		density = 1
	emansion19
		icon = 'mansioner.dmi'
		icon_state = "19"
		density = 1
	emansion20
		icon = 'mansioner.dmi'
		icon_state = "20"
		density = 1
	emansion21
		icon = 'mansioner.dmi'
		icon_state = "21"
		density = 1
	emansion22
		icon = 'mansioner.dmi'
		icon_state = "22"
		density = 1
	emansion23
		icon = 'mansioner.dmi'
		icon_state = "23"
		density = 1
	emansion24
		icon = 'mansioner.dmi'
		icon_state = "24"
		density = 1
	emansion25
		icon = 'mansioner.dmi'
		icon_state = "25"
		density = 1
	emansion26
		icon = 'mansioner.dmi'
		icon_state = "26"
		density = 1
	emansion27
		icon = 'mansioner.dmi'
		icon_state = "27"
		density = 1
	emansionIN
		icon = 'mansioner.dmi'
		icon_state = "28"
		density = 1
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(22,2,16)
			else
				if(istype(A,/obj/)) del(A)
	emansionOUT
		icon = 'mansioner.dmi'
		icon_state = "28"
		density = 1
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(80,65,7)
			else
				if(istype(A,/obj/)) del(A)

	UCHIHAIN//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(10,23,2)
			else
				if(istype(A,/obj/)) del(A)

	UCHIHAOUT//usr.loc = locate(x,y,4)
		icon = 'Landscapes.dmi'
		icon_state = "openwall"
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(44,25,1)
			else
				if(istype(A,/obj/)) del(A)
mob
	see_invisible=1
obj
	roof
		icon = 'Landscapes.dmi'
		icon_state="wall"
		invisibility = 1
		layer = 10
turf
	wall3
		icon = 'Landscapes.dmi'
		icon_state="omg"
		density=1
area
    houseroof
        Entered(mob/M)
            if(ismob(M))
                M.see_invisible = 0
        Exited(mob/M)
            if(ismob(M))
                M.see_invisible = 1
turf
	layerwall
		icon = 'Landscapes.dmi'
		icon_state="wall"
		layer = MOB_LAYER+1