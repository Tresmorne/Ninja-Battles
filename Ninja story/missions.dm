mob/var
	tmp/inmission=0
	amission=0
	tmp/roguekills=0
var
	peoplein=0
obj
	Weed
		icon = 'weed.dmi'
		verb
			Pick()
				set src in oview(1)
				var/place = src.loc
				usr<<"<font face=verdana>You picked up a [src]"
				usr.picked += 1
				src.loc = usr
				spawn(600)
					var/obj/Weed/W = new/obj/Weed
					W.loc = place
obj
	Hidden_Scroll
		icon = 'scroll.dmi'
		icon_state="1"
		verb
			Get()
				set src in oview(1)
				if(usr.gotscroll)
					usr<<"You already have it!"
					return
				var/place = src.loc
				usr<<"<font face=verdana>You picked up the [src]"
				usr.gotscroll = 1
				src.loc = usr
				spawn(600)
					var/obj/Hidden_Scroll/H = new/obj/Hidden_Scroll
					H.loc = place

mob/MissionJounin
	icon = 'Spawn.dmi'
	health = 99999999999999999999999999999999999999999999999999999999999999999999999999999999999
	human = 0
	verb
		Talk()
			set src in oview(3)
			set category ="Mission"
			switch(input("Which Level Mission are you certified for?", text) in list ("D","C","B","A","S"))
				if("D")
					if(usr.rank == "Student")
						usr<<"You must be atleast a genin to do a D rank mission."
						return
					else
						if(usr.picked <= 0)
							usr.picked = 0
							usr<<"<b><font face=verdana>There a lot of troublesome weeds lingering around tripping people walking by, Please pick as many as you can ans you'll be rewarded for how many you pick."
						else
							usr.Yen += usr.picked * 3
							usr.picked = 0
							usr.dmission+=1
							for(var/obj/Weed/W in usr.contents)
								del(W)
				if("C")
					if(usr.rank == "Student")
						usr<<"You must be atleast a Genin to do a C rank mission."
					else
						if(usr.gotscroll <= 0)
							usr.gotscroll = 0
							usr<<"<b><font face=verdana>There is a stolen scroll located in the Hidden Village of Rain, Defeat the guards and bring the scroll back in one piece for a reward."
						else
							usr.Yen += 1000
							usr<<"<b><font face=verdana>Good job, I will now send the scroll back to lord Hokage."
							usr.gotscroll = 0
							usr.cmission+=1
							for(var/obj/Hidden_Scroll/HS in usr.contents)
								del(HS)
				if("B")
					if(usr.rank == "Student"||usr.rank=="Genin")
						usr<<"This mission is only for Chuunin or higher"
						return
					else if(usr.roguekills<=0)
						switch(input("You will embark on your mission, Sure you wish to leave so soon?", text) in list ("Yes","No"))
							if("Yes")
								usr<<"Objective: Rogue Ninja have been terrizing the village, Please seek out and eliminate them."
								return
							else
								return
					else
						usr<<"Lord Hokage is pleased with your performance, Good work."
						usr.bmission+=1
						usr.Yen+=usr.roguekills*200
						usr.roguekills=0
						return
				if("A")
					if(usr.rank == "Student"||usr.rank=="Genin")
						usr<<"This mission is only for Chuunin or higher"
						return
					else if(usr.Mnin >=400&&usr.Mgen>=400&&usr.Mtai>=400)
						switch(input("You will embark on your mission, Sure you wish to leave so soon?", text) in list ("Yes","No"))
							if("Yes")
								usr.loc=locate(3,4,11)
								usr.inmission=1
								usr<<"Objective: Detect Orochimaru and retrieve information on his where abouts."
								usr.verbs += new /mob/mission/verb/Escape()
								sleep(6000)
								if(usr&&usr.inmission)
									usr<<"Sorry, You have run out of time, Lord Hokage has gotton impatient, Please return and try again next time!"
									usr.inmission=0
									usr.loc=locate(6,58,20)
									usr.verbs -= new /mob/mission/verb/Escape()
									usr.verbs -= new /mob/mission/verb/Escape()
									usr.verbs -= new /mob/mission/verb/Escape()
									return
							else
								return
					else
						usr<<"You aren't qualified for this mission. Need to train some more."
						return
mob/mission/verb/Escape()
	set category="Mission"
	usr.loc=locate(6,58,20)
	usr.inmission=0
	usr.verbs -= new /mob/mission/verb/Escape()
	usr.verbs -= new /mob/mission/verb/Escape()
	usr.verbs -= new /mob/mission/verb/Escape()
	usr.verbs -= new /mob/mission/verb/Escape()