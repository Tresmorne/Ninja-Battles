mob/proc/menu()
	if(src.menus)
		src.client.screen+=new/obj/tchat
		src.client.screen+=new/obj/trest
		src.client.screen+=new/obj/tsave

mob/proc/menu2()
	if(!src.menus)
		src.client.screen=null
turf/Customization
	density = 1
	icon = 'untitled16kl.png'
turf/Full
	density = 1
	layer = 999
	icon = 'nsblogin.bmp'
turf/Welcome
	icon = 'WELCOME.png'
turf/START
	density = 1
	layer = 999
	Click()
		var/charactername = input("","Name") as text|null
		if(length(charactername) < 2)
			alert("Your name must be longer than 2 letters!")
			return
		if(length(charactername) > 20)
			alert("Your name can not be longer then 20 letters!")
			return
		usr.name="[html_encode(charactername)]"
		usr.loc = locate(94,94,20)

turf/Load
	density = 1
	layer = 999
	Click()
		usr.LoadPlayer()

turf/Quit
	density = 1
	layer = 999
	Click()
		del(usr)
client
	Del()
		..()
		del(mob)
		return ..()
turf/Finished
	density=1
	Click()
		if(usr.villageselected&&usr.baseselected)
			usr.loc=locate(6,58,20)
			usr.cansave=1
			usr.OOC=1
			if(!usr.Kyuubi)
				usr.random=rand(1,100)
				if(usr.random==60)
					usr.bit=1
			if(!usr.bit)
				usr.random=rand(1,100)
				if(usr.random==30)
					usr.Kyuubiget=1
			usr.AutoSave()
		else
			usr<<"You must choose a village and a base icon!"
turf/Skincolorselect
	density=1
	Click()
		usr.baseselected=0
		switch(input("Choose a skin color", text) in list ("Pale","Tan"))
			if("Pale")
				usr.icon='Base white.dmi'
				usr.baseselected=1
			if("Tan")
				usr.icon='BaseT.dmi'
				usr.baseselected=1
turf/Delete
	density = 1
	layer=999
	Click()
		usr.DeleteChar()

mob
	proc
		DeleteChar()
			if(fexists("players/[src.key].sav"))
				var/sure=alert(src,"Are you sure you want to delete your character?","Confirmation","Yes","No")
				if(sure=="Yes")
					sleep(0)
					fdel("players/[src.key].sav")
					src << "Character Deleted"
				else
					src << "Canceled deleting '[src.key].sav'"
			else
				src << "You do not have a character saved on this server."
mob/var
	hairselected=0
	villageselected=0
	baseselected=0
turf/Villageselect
	density=1
	Click()
		usr.Village=""
		usr.leafS=0
		usr.mistS=0
		usr.soundS=0
		usr.earthS=0
		usr.sandS=0
		usr.rainS=0
		usr.grassS=0
		usr.lightningS=0
		usr.villageselected=0
		alert("Remember that each village has their own unique Jutsus.")
		switch(input("Which Village would you like to be born in?", text) in list ("Leaf","Sand","Sound","Grass","Rain","Cloud","Mist","Earth","Waterfall"))
			if("Leaf")
				usr.leafS=1
				usr.mistS=0
				usr.soundS=0
				usr.earthS=0
				usr.sandS=0
				usr.rainS=0
				usr.grassS=0
				usr.lightningS=0
				usr.villageselected=1
				usr.Village="Leaf"
				usr.waterfallS=0
			if("Sand")
				usr.leafS=0
				usr.mistS=0
				usr.sandS=1
				usr.soundS=0
				usr.earthS=0
				usr.waterfallS=0
				usr.rainS=0
				usr.grassS=0
				usr.lightningS=0
				usr.villageselected=1
				usr.Village="Sand"
			if("Sound")
				usr.leafS=0
				usr.mistS=0
				usr.sandS=0
				usr.soundS=1
				usr.earthS=0
				usr.waterfallS=0
				usr.rainS=0
				usr.grassS=0
				usr.lightningS=0
				usr.villageselected=1
				usr.Village="Sound"
			if("Rain")
				usr.leafS=0
				usr.mistS=0
				usr.soundS=0
				usr.sandS=0
				usr.earthS=0
				usr.rainS=1
				usr.waterfallS=0
				usr.grassS=0
				usr.lightningS=0
				usr.villageselected=1
				usr.Village="Rain"
			if("Grass")
				usr.leafS=0
				usr.mistS=0
				usr.soundS=0
				usr.earthS=0
				usr.sandS=0
				usr.waterfallS=0
				usr.rainS=0
				usr.grassS=1
				usr.lightningS=0
				usr.villageselected=1
				usr.Village="Grass"
			if("Earth")
				usr.leafS=0
				usr.mistS=0
				usr.soundS=0
				usr.sandS=0
				usr.earthS=1
				usr.rainS=0
				usr.waterfallS=0
				usr.grassS=0
				usr.lightningS=0
				usr.villageselected=1
				usr.Village="Earth"
			if("Cloud")
				usr.leafS=0
				usr.mistS=0
				usr.soundS=0
				usr.earthS=0
				usr.sandS=0
				usr.rainS=0
				usr.waterfallS=0
				usr.grassS=0
				usr.lightningS=1
				usr.villageselected=1
				usr.Village="Cloud"
			if("Mist")
				usr.leafS=0
				usr.mistS=1
				usr.sandS=0
				usr.soundS=0
				usr.earthS=0
				usr.rainS=0
				usr.grassS=0
				usr.waterfallS=0
				usr.lightningS=0
				usr.villageselected=1
				usr.Village="Mist"
			if("Waterfall")
				usr.leafS=0
				usr.mistS=0
				usr.waterfallS=1
				usr.sandS=0
				usr.soundS=0
				usr.earthS=0
				usr.rainS=0
				usr.grassS=0
				usr.lightningS=0
				usr.villageselected=1
				usr.Village="Waterfall"
turf/Hairselect
	density=1
	Click()
		usr.overlays=null
		usr.hairselected=0
		switch(input("Which hair style would you like?", text) in list ("Naruto","Sasuke","Gaara","Sakura","Ino","Temari","Shikamaru","Kakashi","Rock Lee"))
			if("Ino")
				usr.hair = "Ino Hair"
				var/hairred = input("How much red do you want in your hair?") as num
				var/hairblue = input("How much blue do you want in your hair?") as num
				var/hairgreen = input("How much green do you want in your hair?") as num
				var/hairover = 'inoH.dmi'
				hairover += rgb(hairred,hairgreen,hairblue)
				usr.rhair = hairred
				usr.ghair = hairgreen
				usr.bhair = hairblue
				usr.Ohair = hairover
				usr.hair = usr.Ohair
				usr.hairselected=1
				usr.overlays += usr.hair
			if("Kakashi")
				usr.hair = "Kakashi Hair"
				var/hairred = input("How much red do you want in your hair?") as num
				var/hairblue = input("How much blue do you want in your hair?") as num
				var/hairgreen = input("How much green do you want in your hair?") as num
				var/hairover = 'KakashiH.dmi'
				hairover += rgb(hairred,hairgreen,hairblue)
				usr.rhair = hairred
				usr.ghair = hairgreen
				usr.bhair = hairblue
				usr.Ohair = hairover
				usr.hairselected=1
				usr.hair = usr.Ohair
				usr.overlays += usr.hair
			if("Sasuke")
				usr.hair = "Sasuke Hair"
				var/hairred = input("How much red do you want in your hair?") as num
				var/hairblue = input("How much blue do you want in your hair?") as num
				var/hairgreen = input("How much green do you want in your hair?") as num
				var/hairover = 'SasukeH.dmi'
				hairover += rgb(hairred,hairgreen,hairblue)
				usr.rhair = hairred
				usr.ghair = hairgreen
				usr.bhair = hairblue
				usr.Ohair = hairover
				usr.hair = usr.Ohair
				usr.hairselected=1
				usr.overlays += usr.hair
			if("Naruto")
				usr.hair = "Naruto Hair"
				var/hairred = input("How much red do you want in your hair?") as num
				var/hairblue = input("How much blue do you want in your hair?") as num
				var/hairgreen = input("How much green do you want in your hair?") as num
				var/hairover = 'narutoH.dmi'
				hairover += rgb(hairred,hairgreen,hairblue)
				usr.rhair = hairred
				usr.ghair = hairgreen
				usr.bhair = hairblue
				usr.Ohair = hairover
				usr.hairselected=1
				usr.hair = usr.Ohair
				usr.overlays += usr.hair
			if("Sakura")
				usr.hair = "Sakura Hair"
				var/hairred = input("How much red do you want in your hair?") as num
				var/hairblue = input("How much blue do you want in your hair?") as num
				var/hairgreen = input("How much green do you want in your hair?") as num
				var/hairover = 'SakuraH.dmi'
				hairover += rgb(hairred,hairgreen,hairblue)
				usr.rhair = hairred
				usr.ghair = hairgreen
				usr.hairselected=1
				usr.bhair = hairblue
				usr.Ohair = hairover
				usr.hair = usr.Ohair
				usr.overlays += usr.hair
			if("Shikamaru")
				usr.hair = "Shikamaru Hair"
				var/hairred = input("How much red do you want in your hair?") as num
				var/hairblue = input("How much blue do you want in your hair?") as num
				var/hairgreen = input("How much green do you want in your hair?") as num
				var/hairover = 'shikaH.dmi'
				hairover += rgb(hairred,hairgreen,hairblue)
				usr.rhair = hairred
				usr.ghair = hairgreen
				usr.bhair = hairblue
				usr.Ohair = hairover
				usr.hair = usr.Ohair
				usr.overlays += usr.hair
			if("Rock Lee")
				usr.overlays = 0
				usr.hair = "Lee Hair"
				var/hairred = input("How much red do you want to put into your hair?") as num
				var/hairblue = input("How much blue do you want to put into your hair?") as num
				var/hairgreen = input("How much green do you want to put into your hair?") as num
				var/hairover = 'leeH.dmi'
				hairover += rgb(hairred,hairgreen,hairblue)
				usr.rhair = hairred
				usr.ghair = hairgreen
				usr.bhair = hairblue
				usr.Ohair = hairover
				usr.hair = usr.Ohair
				usr.overlays += usr.hair
turf/Nonclan
	density = 1
	Click()
		if(usr.clany)
			return
		usr.clany = 1
		switch(input("Which type of Non-Clan style do you wish to inherit?", "Non-Clan") in list ("Taijutsu","Sand","Medical","Cancel"))
			if("Taijutsu")
				usr<<"You are now a Taijutsu specialist!"
				usr.NonClan=1
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Lee"
				usr.Inuzuka=0
				usr.Gaaraclan=0
				usr.Kaguya=0
				usr.Hyuuga=0
				usr.Nara=0
				usr.Medical=0
				usr.Uchiha=0
				usr.Aburame=0
				usr.Akimichi = 0
				usr.loc = locate(94,7,20)
			if("Sand")
				usr<<"You can now manipulate sand!"
				usr.Gaaraclan=1
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Gaara"
				usr.Inuzuka=0
				usr.Kaguya=0
				usr.Medical=0
				usr.Hyuuga=0
				usr.Nara=0
				usr.NonClan=0
				usr.Uchiha=0
				usr.Aburame=0
				usr.Akimichi = 0
				var/obj/Gourd/B = new/obj/Gourd
				B.loc = usr
				usr.loc = locate(94,7,20)
			if("Medical")
				usr<<"You are now a Medical jutsu specialist!"
				usr.NonClan=0
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Medical"
				usr.Inuzuka=0
				usr.Gaaraclan=0
				usr.Kaguya=0
				usr.Hyuuga=0
				usr.Nara=0
				usr.Medical=1
				usr.Uchiha=0
				usr.Aburame=0
				usr.Akimichi = 0
				usr.loc = locate(94,7,20)
			if("Cancel")
				usr.clany=0
				return


turf/UCHIHA
	density = 1
	Click()
		if(usr.clany)
			return
		usr.clany = 1
		switch(input("Are you sure you would like to be Uchiha?", "Uchiha") in list ("Yes","No"))
			if("Yes")
				usr<<"You have chosen the Uchiha clan!"
				usr.Uchiha=1
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Uchiha"
				usr.Inuzuka=0
				usr.chosen = 1
				usr.Gaaraclan=0
				usr.Kaguya=0
				usr.Hyuuga=0
				usr.Nara=0
				usr.NonClan=0
				usr.Aburame=0
				usr.Akimichi = 0
				usr.view = 6
				usr.loc = locate(94,7,20)
			if("No")
				usr.clany = 0
				return
turf/choosescreen
	icon = 'nsblogin2.bmp'
	density = 1

turf/KAGUYA

	density = 1
	Click()
		if(usr.clany)
			return
		usr.clany = 1
		switch(input("Are you sure you would like to be Kaguya?", "Kaguya") in list ("Yes","No"))
			if("Yes")
				usr<<"You have chosen the Kaguya clan!"
				usr.Kaguya=1
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Kaguya"
				usr.Inuzuka=0
				usr.Gaaraclan=0
				usr.chosen = 1
				usr.Hyuuga=0
				usr.Nara=0
				usr.NonClan=0
				usr.Uchiha=0
				usr.Aburame=0
				usr.Akimichi = 0
				usr.view = 6
				usr.loc = locate(94,7,20)
			if("No")
				usr.clany = 0
				return



turf/Hyuuga
	density = 1
	Click()
		if(usr.clany)
			return
		usr.clany = 1
		switch(input("Are you sure you would like to be Hyuuga?", "Hyuuga") in list ("Yes","No"))
			if("Yes")
				usr<<"You have chosen the Hyuuga clan!"
				usr.Hyuuga=1
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Hyuuga"
				usr.Inuzuka=0
				usr.Gaaraclan=0
				usr.Kaguya=0
				usr.chosen = 1
				usr.Nara=0
				usr.NonClan=0
				usr.Uchiha=0
				usr.Aburame=0
				usr.Akimichi = 0
				usr.view = 6
				usr.loc = locate(94,7,20)
			if("No")
				usr.clany = 0
				return
mob/var
	chosen=0
turf/Lee
	density = 1

	Click()
		if(usr.clany)
			return
		usr.clany = 1
		switch(input("Are you sure you would like to be Lee Non-Clan?", "Lee") in list ("Yes","No"))
			if("Yes")
				usr<<"You have chosen the Rock Lee Non-Clan!"
				usr.NonClan=1
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Non-Clan"
				usr.Inuzuka=0
				usr.Gaaraclan=0
				usr.Kaguya=0
				usr.Hyuuga=0
				usr.chosen = 1
				usr.Nara=0
				usr.Uchiha=0
				usr.Aburame=0
				usr.Akimichi = 0
				usr.view = 6
				usr.loc = locate(94,7,20)
			if("No")
				usr.clany = 0
				return

turf/Akimichi
	density = 1
	Click()
		if(usr.clany)
			return
		usr.clany = 1
		switch(input("Are you sure you would like to be Akimichi?", "Akimichi") in list ("Yes","No"))
			if("Yes")
				usr<<"You have chosen the Akimichi clan!"
				usr.Akimichi=1
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Akimichi"
				usr.Inuzuka=0
				usr.Gaaraclan=0
				usr.chosen = 1
				usr.Kaguya=0
				usr.Hyuuga=0
				usr.Nara=0
				usr.NonClan=0
				usr.Uchiha=0
				usr.Aburame=0
				usr.view = 6
				usr.loc = locate(94,7,20)
			if("No")
				usr.clany = 0
				return

turf/Aburame
	density = 1
	Click()
		if(usr.clany)
			return
		usr.clany = 1
		switch(input("Are you sure you would like to be Aburame?", "Aburame") in list ("Yes","No"))
			if("Yes")
				usr<<"You have chosen the Aburame clan"
				usr.Aburame=1
				usr.Realplayer = 1
				usr.Konchuu = 10
				usr.human = 1
				usr.Clan ="Aburame"
				usr.Haku = 0
				usr.Akimichi=0
				usr.Inuzuka=0
				usr.chosen = 1
				usr.Gaaraclan=0
				usr.Kaguya=0
				usr.Hyuuga=0
				usr.Nara=0
				usr.NonClan=0
				usr.Uchiha=0
				usr.view = 6
				usr.loc = locate(94,7,20)
			if("No")
				usr.clany = 0
				return

turf/Inuzuka
	density = 1
	Click()
		if(usr.clany)
			return
		usr.clany = 1
		switch(input("Are you sure you would like to be Inuzuka?", "Inuzuka") in list ("Yes","No"))
			if("Yes")
				usr<<"You have chosen the Inuzuka clan!"
				usr.Inuzuka=1
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Inuzuka"
				usr.Gaaraclan=0
				usr.Kaguya=0
				usr.Hyuuga=0
				usr.Nara=0
				usr.NonClan=0
				usr.chosen = 1
				usr.Uchiha=0
				usr.Aburame=0
				usr.Akimichi = 0
				usr.view = 6
				usr.loc = locate(94,7,20)
			if("No")
				usr.clany = 0
				return

turf/Nara
	density = 1
	Click()
		if(usr.clany)
			return
		usr.clany = 1
		switch(input("Are you sure you would like to be Nara?", "Nara") in list ("Yes","No"))
			if("Yes")
				usr<<"You have chosen the Nara clan!"
				usr.Nara=1
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Nara"
				usr.Inuzuka=0
				usr.Gaaraclan=0
				usr.Kaguya=0
				usr.Hyuuga=0
				usr.chosen = 1
				usr.NonClan=0
				usr.Uchiha=0
				usr.Aburame=0
				usr.Akimichi = 0
				usr.view = 6
				usr.loc = locate(94,7,20)
			if("No")
				usr.clany = 0
				return
mob/var/tmp
	clany = 0
turf/Haku
	density = 1
	Click()
		if(usr.clany)
			return
		usr.clany = 1
		switch(input("Are you sure you would like to be Haku?", "Haku") in list ("Yes","No"))
			if("Yes")
				usr<<"You now have inherited the bloodline of Haku!"
				usr.Haku=1
				usr.Realplayer = 1
				usr.human = 1
				usr.Clan = "Haku"
				usr.Akimichi=0
				usr.Inuzuka=0
				usr.Gaaraclan=0
				usr.Kaguya=0
				usr.Hyuuga=0
				usr.chosen = 1
				usr.Nara=0
				usr.NonClan=0
				usr.Uchiha=0
				usr.Aburame=0
				usr.view = 6
				usr.loc = locate(94,7,20)
			if("No")
				usr.clany = 0
				return


