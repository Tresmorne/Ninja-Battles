obj
	var/num = 0       // This var is used later to help set the icon state
	var/width = 15   // this is basically the number of icon states you have
	var/rangemax      // the range of the var that each tile of the meter will deal with
	var/rangemin
	var/num2 = 0       // This var is used later to help set the icon state
	var/width2 = 100   // this is basically the number of icon states you have
	var/rangemax2      // the range of the var that each tile of the meter will deal with
	var/rangemin2

obj
	var
		worn = 0
		have = 0
	Weights
		name = "Weights"
		icon = 'Weights.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 5000
		verb
			Wear()

				if(src.worn)
					src.worn = 0
					usr.overlays -= 'Weights.dmi'//temp icon
					usr.Move_Delay = usr.Savedspeed
					usr.Weights = 0
					usr << "You remove the [src.name]."
					if(usr.Mountain&&usr.Frozen)
						usr<<"You can now climb the mountain..."
						usr.Frozen=0
					if(usr.onwater&&usr.Frozen)
						usr<<"You can now walk on water..."
						usr.Frozen=0
				else
					src.worn = 1
					usr.Savedspeed = usr.Move_Delay
					usr.overlays += 'Weights.dmi'
					usr << "You wear the [src.name]."
					usr.Weights = 1
			Drop()
				if(src.worn)
					usr << "Not while its being worn."
				if(!src.worn)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()

				set src in oview(1)
				src.loc = usr
				usr<<"You picked up [src]"





obj
	Shoes
		name = "Shoes"
		icon = 'Cloths.dmi'//dont have a base icon so cant make weights icon!lol
		price = 100
		worn = 0
		verb
			Wear()

				if(!src.worn)
					src.worn=1
					usr.overlays += 'Cloths.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
				else
					src:worn = 0
					usr.overlays -= 'Cloths.dmi'
					usr << "You remove the [src.name]."
					src.suffix = ""
					usr.overlays -= 'Cloths.dmi'
			Drop()

				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()

				set src in oview(1)
				src.loc = usr
				usr<<"You picked up some [src]"
mob/var/shirtI
obj
	Shirt
		name = "Shirt"
		icon = 'shirt.dmi'//dont have a base icon so cant make weights icon!lol
		price = 750
		worn = 0
		verb
			Wear()

				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'shirt.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
					usr.overlays-= usr.shirtI
				else
					src:worn = 1
					var/shirtred = input("How much red do you want?") as num
					var/shirtblue = input("How much blue do you want?") as num
					var/shirtgreen = input("How much green do you want?") as num
					usr.shirtI = 'shirt.dmi'
					usr.shirtI += rgb(shirtred,shirtgreen,shirtblue)
					usr.rshirt = shirtred
					usr.gshirt = shirtgreen
					usr.bshirt = shirtblue
					usr.overlays += usr.shirtI
					usr.SI = usr.shirtI
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Drop()

				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up some [src]"

obj
	SasukeShirt
		name = "Sasuke Shirt"
		icon = 'SasukeShirt.dmi'//dont have a base icon so cant make weights icon!lol
		price = 250
		worn = 0
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'SasukeShirt.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'SasukeShirt.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a shirt."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	Pants
		name = "Pants"
		icon = 'pants.dmi'//dont have a base icon so cant make weights icon!lol
		price = 250
		worn = 0
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'pants.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
					usr.overlays -= usr.Picon
				else
					src:worn = 1
					var/pantsred = input("How much red do you want?") as num
					var/pantsblue = input("How much blue do you want?") as num
					var/pantsgreen = input("How much green do you want?") as num
					var/pantsI = 'pants.dmi'
					pantsI += rgb(pantsred,pantsgreen,pantsblue)
					usr.rpants = pantsred
					usr.gpants = pantsgreen
					usr.bpants = pantsblue
					usr.overlays += pantsI
					usr.Picon = pantsI
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a shirt."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up some [src]"
obj
	EChuuninVest
		name = "Earth Chuunin Vest"
		icon = 'earthVest.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 2000
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'earthVest.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'earthVest.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a official vest given to chuunins."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	LChuuninVest
		name = "Lightning Chuunin Vest"
		icon = 'lightningVest.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 2000
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'lightningVest.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'lightningVest.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a official vest given to chuunins."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	GChuuninVest
		name = "Grass Chuunin Vest"
		icon = 'BrightGrass.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 2000
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'BrightGrass.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'BrightGrass.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a official vest given to chuunins."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	WChuuninVest
		name = "Water Chuunin Vest"
		icon = 'waterVest.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 2000
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'waterVest.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'waterVest.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a official vest given to chuunins."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	RChuuninVest
		name = "Rain Chuunin Vest"
		icon = 'rainVest.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 2000
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'rainVest.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'rainVest.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a official vest given to chuunins."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	SChuuninVest
		name = "Sand Chuunin Vest"
		icon = 'sandvest.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 2000
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'sandvest.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'sandvest.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a official vest given to chuunins."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	SoundChuuninVest
		name = "Sound Chuunin Vest"
		icon = 'SoundVest.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 2000
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'SoundVest.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'SoundVest.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a official vest given to chuunins."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	ChuuninVest
		name = "Chuunin Vest"
		icon = 'Vest.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 2000
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'Vest.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'Vest.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a official vest given to chuunins."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	Shades
		name = "Shades"
		icon = 'shades.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 158
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'shades.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'shades.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a official vest given to chuunins."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"

obj
	Headband
		name = "Head Band"
		worn = 0
		icon = 'headband.dmi'
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'headband.dmi'//temp icon
					usr.overlays -= 'kakashi style.dmi'
					usr.overlays -= 'bandastyle.dmi'
					usr.overlays -= 'leetype.dmi'
					usr << "You remove the [src.name]."
					src.suffix = ""
					usr.bandanat = 0
				else
					switch(input("What head band style would you like?","Headband style picker")in list("Regular","Lee style","Kakashi","Bandana style"))
						if("Regular")
							src.worn = 1
							usr.overlays += 'headband.dmi'
							usr << "You wear the [src.name]."
							src.suffix = "Equipped"
							usr.bandanat = 1
						if("Kakashi")
							src.worn = 1
							usr.overlays += 'kakashi style.dmi'
							usr << "You wear the [src.name]."
							src.suffix = "Equipped"
							usr.bandanat = 2
						if("Bandana style")
							src.worn = 1
							usr.overlays += 'bandastyle.dmi'
							usr << "You wear the [src.name]."
							src.suffix = "Equipped"
							usr.bandanat = 3
						if("Lee style")
							src.worn = 1
							usr.overlays += 'leetype.dmi'
							usr << "You wear the [src.name]."
							src.suffix = "Equipped"
							usr.bandanat = 4
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	hair
		layer = FLOAT_LAYER - 2
obj
	Jouninsuit
		name = "Jounin suit"
		icon = 'JouninS.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 2000
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'JouninS.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'JouninS.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a official suit given to Jounins."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"

obj
	KagebunshinS
		name = "Kage bunshin scroll"
		icon = 'scroll.dmi'//dont have a base icon so cant make weights icon!lol
		icon_state = "1"
		worn = 0
		price = 0
		verb
			Learn()
				if(usr.learntK == 0)
					if(usr.rank == "Student")
						return
					if(usr.BunshinN<0)
						usr<<"Sorry you can´t learn it yet you need to use Bunshin No Jutsu 200 times first..."
						return
					if(usr.BunshinN>=0)
						usr << "<I><B><font face = courier><font color = blue>You learned Kage Bunshin No Jutsu!";usr.verbs += new /obj/bunshins/KageBunshinnojutsu/verb/KageBunshinNoJutsu()
						usr:learntK = 1
					if(usr.Clan=="Uzumaki")
						usr << "<I><B><font face = courier><font color = blue>You learned Kage Bunshin No Jutsu!";usr.verbs += new /obj/bunshins/KageBunshinnojutsu/verb/KageBunshinNoJutsu()
						usr:learntK = 1
				else ..()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"

obj
	AKAH
		name = "Akatsuki Hat"
		icon = 'AKAH.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'AKAH.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'AKAH.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a Akatsuki Hat."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"

obj
	AKAS
		name = "Akatsuki Suit"
		icon = 'AKAS.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'AKAS.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'AKAS.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a Akatsuki suit."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
obj
	Ramen
		name = "Ramen"
		icon = 'things.dmi'//dont have a base icon so cant make weights icon!lol
		icon_state="ramen"
		verb
			Eat()
				if(usr.health < usr.maxhealth)
					usr<<"You eat some Ramen"
					usr.health += 100
					usr.calories += 200
					del(src)
				else
					usr<<"You eat some Ramen"
					usr.calories += 250
					del(src)
			Look()
				usr<<"This is a Bowl of Ramen."
			Drop()
				src.loc=locate(usr.x,usr.y-1,usr.z)
				usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a bowl of [src]"
mob/var/tmp/drunk=0
obj
	Sake
		name = "Sake"
		icon = 'things.dmi'//dont have a base icon so cant make weights icon!lol
		icon_state="sake"
		verb
			Drink()
				if(usr.health < usr.maxhealth)
					usr<<"You drink some Sake"
					usr.health += 50
					usr.drunk=1
					usr<<"You begin to feel relaxed and dazed"
					sleep(350)
					usr<<"The Sake wears off"
					usr.drunk=0
					del(src)
				else
					usr<<"You drink some Sake"
					usr<<"You begin to feel relaxed and dazed"
					usr.drunk=1
					sleep(350)
					usr.drunk=0
					usr<<"The Sake wears off"
					del(src)
			Look()
				usr<<"This is a bottle of Sake."
			Drop()
				src.loc=locate(usr.x,usr.y-1,usr.z)
				usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a bottle of [src]"
obj
	Soup
		name = "Vegetable Soup"
		icon = 'things.dmi'//dont have a base icon so cant make weights icon!lol
		icon_state="veggies"
		verb
			Eat()
				if(usr.health < usr.maxhealth)
					usr<<"You eat some Vegetable Soup"
					usr.health += 100
					usr.calories += 100
					del(src)
				else
					usr<<"You eat some Vegetable Soup"
					usr.calories += 150
					del(src)
			Look()
				usr<<"This is a Bowl of Vegetable Soup."
			Drop()
				src.loc=locate(usr.x,usr.y-1,usr.z)
				usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a bowl of [src]"
obj
	Ranbu
		name = "Red ANBU mask"
		icon = 'Ranbu.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'Ranbu.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'Ranbu.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is the ANBU captains mask."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"

obj
	ShinoS
		name = "Coat"
		icon = 'ShinoS.dmi'
		worn = 0
		price = 750
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'ShinoS.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'ShinoS.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is coat."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"

obj/var/tmp/tagset=0
obj
	ExplodingTag
		name = "Exploding Tag"
		icon = 'explodingtag.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		price = 6000
		New()
			..()
			spawn()
				src.CheckAmount()
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		verb
			Look()
				usr<<"This is an Exploding Tag."
			Drop()
				for(var/obj/Shuriken/O in usr.contents)
					if(O.ammount<=0)
						del(src)
					else
						var/drop = input("How many Exploding Tags do you wish to drop?")as num
						if(src.ammount>drop)
							usr<<"You don't have that many to drop."
						if(drop<=0)
							usr<<"You cannot do that."
						if(src.ammount>=drop)
							src.ammount-=drop
							var/obj/ExplodingTag/B = new/obj/ExplodingTag
							B.loc=locate(usr.x,usr.y-1,usr.z)
							B.ammount=drop
							view(usr)<<"[usr] drops [drop] Exploding Tags."
							if(src.ammount<=0)
								del(src)
				usr.SaveK()
			Get()
				set src in oview(1)
				if(src.tagset)
					usr<<"Its been Set already"
					return
				else
					usr<<"You picked up an [src]"
					var/counter=0
					for(var/obj/ExplodingTag/O in usr.contents)
						counter+=1
					if(counter<=0)
						Move(usr)
					else
						for(var/obj/ExplodingTag/O in usr.contents)
							O.ammount+=src.ammount
							O.name= "[O.name] ([O.ammount])"
							del(src)
			SetTag()
				if(usr.firing)
					usr<<"You can't do this right now"
					return
				if(!src.tagset)
					var/obj/ExplodingTag/B = new/obj/ExplodingTag
					src.ammount-=1
					B.Gowner=usr
					B.tagset=1
					B.icon_state="fire"
					usr.verbs+= new /mob/tag/verb/Explode
					for(var/obj/ExplodingTag/O in usr.contents)
						if(O.ammount<=0)
							del(src)
						else
							src.ammount-=1
mob/tag
	verb
		Explode()
			set category = "Exploding Tag"
			for(var/obj/ExplodingTag/T in world)
				if(T.Gowner==usr)
					if(T.tagset)
						flick("explode",T)
						sleep(5)
						del(T)
						for(var/mob/M in view(3,T))
							var/damage=usr.nin*3
							M<<"You have been hit by [usr]'s exploding tag for [damage] damage!"
							usr<<"You hit [M] with your exploding tag for [damage] damage!"
							M.health-=damage
							if(M.health<=0)
								M.Death(usr)
						for(var/mob/npcs/Bunshin/B in oview(3,T))
							flick("smoke2",B)
							sleep(4)
							del(B)
			usr.verbs-= new /mob/tag/verb/Explode
			usr.verbs-= new /mob/tag/verb/Explode
			usr.verbs-= new /mob/tag/verb/Explode
			usr.verbs-= new /mob/tag/verb/Explode
			usr.verbs-= new /mob/tag/verb/Explode
			usr.verbs-= new /mob/tag/verb/Explode
			usr.verbs-= new /mob/tag/verb/Explode

obj/var/oname=""
obj
	Shuriken
		name = "Shuriken"
		icon = 'shuriken.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		density=1
		oname="Shuriken"
		price = 1000
		New()
			..()
			spawn()
				src.CheckAmount()
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		verb
			Look()
				usr<<"This is a standard Shuriken."
			Drop()
				for(var/obj/Shuriken/O in usr.contents)
					if(O.ammount<=0)
						del(src)
					else
						var/drop = input("How many Shuriken do you wish to drop?")as num
						if(src.ammount>drop)
							usr<<"You don't have that many to drop."
						if(drop<=0)
							usr<<"You cannot do that."
						if(src.ammount>=drop)
							src.ammount-=drop
							var/obj/Shuriken/B = new/obj/Shuriken
							B.loc=locate(usr.x,usr.y-1,usr.z)
							B.ammount=drop
							view(usr)<<"[usr] drops [drop] Shuriken."
							if(src.ammount<=0)
								del(src)
				usr.SaveK()
			Get()
				set src in oview(1)
				usr<<"You picked up [src]"
				var/counter=0
				for(var/obj/Shuriken/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/Shuriken/O in usr.contents)
						O.ammount+=src.ammount
						O.name= "[O.name] ([O.ammount])"
						del(src)
			Throw()
				if(usr.firing)
					return
				if(usr.weaponthrow)
					return
				var/obj/Shuriken/L = new()
				L.loc=usr.loc
				usr.weaponthrow=1
				L.tai=usr.tai
				L.dir = usr.dir
				L.Move_Delay=1.5
				L.Gowner=usr
				walk(L,usr.dir)
				for(var/obj/Shuriken/O in usr.contents)
					O.ammount-=1
					if(O.ammount<=0)
						del(O)
					else
						src.name="[O.oname] ([O.ammount])"
				sleep(8)
				usr.weaponthrow=0
				sleep(30)
		Bump(A)
			var/mob/O = src.Gowner
			if(istype(A,/obj/Log))
				for(var/obj/Log/L in oview(3,O))
					if(L)
						O<<"You cannot be that close to the log"
						O.weaponthrow=0
						del(src)
						return
				O.random=rand(1,5)
				if(O.random==1)
					O.taiexp+=rand(1,4)
					O.taiup()
				if(O.random==3)
					O.ninexp+=rand(1,4)
					O.ninup()
				if(O.random==2)
					O.random=rand(1,25)
					if(O.random==5)
						O.Mnin+=1
						O.nin+=1
						O<<"<font color=blue>Your Ninjutsu has increased!"
					if(O.random==1)
						O.Mtai+=1
						O.tai+=1
						O<<"<font color=blue>Your Taijutsu has increased!"
					if(O.random==9)
						O.random=rand(1,3)
						if(O.random==2)
							O<<"Your shuriken skill increases!"
							O.shurikenskill+=1
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.tai)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by [O]'s Shuriken for [damage] damage!!"
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
obj
	Kageshuriken
		icon='kageshuriken.dmi'
		density=1
		Bump(A)
			var/mob/O = src.Gowner
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.tai)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by [O]'s Kage Shurikens for [damage] damage!!"
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
mob/var/tmp/weaponthrow=0
obj/var/ammount=0
obj
	kunai
		name = "Kunai"
		icon = 'kunai.dmi'
		worn = 0
		price = 2000
		density=1
		ammount=1
		oname="Kunai"
		New()
			..()
			spawn()
				src.CheckAmount()
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		verb
			Wear()
				if(src.worn)
					src.worn = 0
					usr.overlays -= 'kunai.dmi'
					usr.overlays -= 'kunai.dmi'
					usr << "You remove the [src.name]."
					src.suffix = ""
					usr.swordD = 0
				else
					src.worn = 1
					usr.overlays += 'kunai.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
					usr.swordD = 100
			Look()
				usr<<"This a standard Kunai."
			Drop()
				if(src.worn)
					usr << "Not while its being worn."
					return
				for(var/obj/kunai/O in usr.contents)
					if(O.ammount<=0)
						del(src)
					else
						var/drop = input("How many Kunai do you wish to drop?")as num
						if(src.ammount>drop)
							usr<<"You don't have that many to drop."
						if(drop<=0)
							usr<<"You cannot do that."
						if(src.ammount>=drop)
							src.ammount-=drop
							var/obj/kunai/B = new/obj/kunai
							B.loc=locate(usr.x,usr.y-1,usr.z)
							B.ammount=drop
							view(usr)<<"[usr] drops [drop] Kunai."
							if(src.ammount<=0)
								del(src)
				usr.SaveK()
			Get()
				set src in oview(1)
				usr<<"You picked up a [src]"
				usr.kunai+=1
				src.icon_state=""
				var/counter=0
				for(var/obj/kunai/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/kunai/O in usr.contents)
						O.ammount+=src.ammount
						O.name= "[O.name] ([O.ammount])"
						del(src)
			Throw()
				if(usr.firing)
					return
				if(usr.weaponthrow)
					return
				var/obj/kunai/K = new()
				K.icon_state="Throw"
				usr.overlays -= 'kunai.dmi'
				if(src.worn)
					src.worn=0
				usr.swordD = 0
				usr.kunai-=1
				K.tai=usr.tai
				K.dir = usr.dir
				usr.weaponthrow=1
				K.Move_Delay=1.5
				K.Gowner=usr
				walk(K,usr.dir)
				for(var/obj/kunai/O in usr.contents)
					O.ammount-=1
					if(O.ammount<=0)
						del(O)
					else
						src.name="[O.oname] ([O.ammount])"
				sleep(13)
				usr.weaponthrow=0
				sleep(20)

		Bump(A)
			var/mob/O = src.Gowner
			if(istype(A,/obj/Log))
				for(var/obj/Log/L in oview(3,O))
					if(L)
						O<<"You cannot be that close to the log"
						O.weaponthrow=0
						del(src)
						return
				O.random=rand(1,5)
				if(O.random==1)
					O.taiexp+=rand(1,7)
					O.taiup()
				if(O.random==3)
					O.ninexp+=rand(1,7)
					O.ninup()
				if(O.random==2)
					O.random=rand(1,25)
					if(O.random==5)
						O.Mnin+=rand(1,2)
						O.nin=O.Mnin
						O<<"<font color=blue>Your Ninjutsu has increased!"
					if(O.random==1)
						O.Mtai+=rand(1,2)
						O.tai=O.Mtai
						O<<"<font color=blue>Your Taijutsu has increased!"
					if(O.random==9)
						O.random=rand(1,5)
						if(O.random==5)
							O<<"Your Kunai skill increases!"
							O.kunaiskill+=1
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/damage = round(src.tai*2)
				if(damage >= 1)
					M.health -= damage
					view(M) << "[M] was hit by [O]'s Kunai for [damage] damage!!"
					M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
obj
	Zabuzasword
		name = "Kubikiri Houcho"
		icon = 'Zabuza sword.dmi'
		worn = 0
		price = 10000
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'Zabuza sword.dmi'
					usr << "You remove the [src.name]."
					src.suffix = ""
					usr.swordD = 0
				else
					src:worn = 1
					usr.overlays += 'Zabuza sword.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
					usr.swordD = 200
			Look()
				usr<<"This is the sword that zabuza uses."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"




obj
	BoneSword
		name = "Bone Sword"
		icon = 'yanagi.dmi'
		worn = 0
		price = 0
		verb
			Wear()
				if(src.worn)
					src.worn = 0
					usr.overlays -= 'yanagi.dmi'
					usr << "You remove the [src.name]."
					src.suffix = ""
					usr.bonesword = 0
					usr.swordD = 0
				else
					if(usr.spinesword)
						usr<<"You can only weild one Bone sword at a time"
						return
					src.worn = 1
					usr.overlays += 'yanagi.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
					usr.swordD = 100
					usr.bonesword = 1
			Look()
				usr<<"This is a sword made from the arm bone."
obj
	Spinewhip
		name = "Spine Bone Whip"
		icon = 'tessenka.dmi'
		worn = 0
		price = 0
		verb
			Wear()
				if(src.worn)
					src:worn = 0
					usr.overlays -= 'tessenka.dmi'
					usr << "You remove the [src.name]."
					src.suffix = ""
					usr.spinesword = 0
					usr.swordD = 0
				else
					if(usr.bonesword)
						usr<<"You must weild one or the other"
						return
					src.worn = 1
					usr.overlays += 'tessenka.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
					usr.swordD = 150
					usr.spinesword = 1
			Look()
				usr<<"This is a whip made from the spine."

obj
	Sphere
		icon = 'SandSphere.dmi'
		layer = 999
obj
	Gourd
		name = "Gourd"
		icon = 'Gord.dmi'//dont have a base icon so cant make weights icon!lol
		price = 300
		worn = 0
		verb
			Wear()
				if(src.worn)
					src:worn = 0
					usr.overlays -= 'Gord.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'Gord.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is a gourd filled with sand."
obj
	Ganbu
		name = "Green ANBU Mask"
		icon = 'Ganbu.dmi'
		worn = 0
		verb
			Wear()
				if(src.worn)
					src:worn = 0
					usr.overlays -= 'Ganbu.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'Ganbu.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is the ANBU Green Mask."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up [src]"
obj
	Banbu
		name = "Blue ANBU Mask"
		icon = 'Banbu.dmi'//dont have a base icon so cant make weights icon!lol
		worn = 0
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'Banbu.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'Banbu.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is the ANBU Blue Mask."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up [src]"
obj
	tchat
		icon='menus.dmi'
		icon_state="Chat"
		screen_loc="1,4"
		Click()
			switch(input("Whats the chat system you want?", text) in list("World","Say","None"))
				if("World")
					usr.talk="world"
					alert("Your Chat System changed to <<World>>...")
				if("Say")
					usr.talk="say"
					alert("Your Chat System changed to <<Say>>...")
				if("None")
					usr.talk=0
					alert("You turned off your Chat System...")
obj
	trest
		icon='menus.dmi'
		icon_state="Rest"
		screen_loc="1,6"
		Click()
			if(usr.resting)
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
				usr.rest()
obj
	tsave
		icon='menus.dmi'
		icon_state="save"
		screen_loc="1,5"
		Click()
			usr.SaveK()
obj
	meditate
		icon='meditate.dmi'
		icon_state=""

obj/Scroll_Fuuton1
	icon='scroll.dmi'
	icon_state="5"
	verb/Learn_Fuuton1()
		if(usr:L45 == 0)
			if(usr.rank == "Student")
				return
			if(usr.Mnin >=300)
				usr << "<B><font color = blue>You have acquired Fuuton: Kaze Dangan No Jutsu!!";usr.verbs += new /mob/fuuton/verb/FuutonKazeDangan()
				usr:L45 = 1
			else ..()

	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"
obj/Scroll_Fuuton2
	icon='scroll.dmi'
	icon_state="5"
	verb/Learn_Fuuton2()
		if(usr:L46 == 0)
			if(usr.rank == "Student")
				return
			if(usr.Mnin >=300)
				usr << "<B><font color = blue>You have acquired Fuuton: Renkuudan No Jutsu!!";usr.verbs += new /mob/fuuton/verb/FuutonRenkuudan()
				usr:L46 = 1
			else ..()
		else ..()

	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"
obj/Scroll_Fuuton3
	icon='scroll.dmi'
	icon_state="5"
	verb/Learn_Fuuton3()
		if(usr:L47 == 0)
			if(usr.rank == "Student"||usr.rank == "Genin")
				return
			if(usr.Mnin >=400)
				usr << "<B><font color = blue>You have acquired Fuuton: Daitoppa No Jutsu!!";usr.verbs += new /mob/fuuton/verb/Fuuton_Daitoppa()
				usr:L47 = 1
			else ..()
		else ..()
	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"
obj/Scroll_Doton1
	icon='scroll.dmi'
	icon_state="4"
	verb/Learn_Doton1()
		if(usr:L38 == 0)
			if(usr.rank == "Student")
				return
			if(usr.Mtai >=500)
				usr << "<B><font color = blue>You have acquired Doton Doryo Dango!!";usr.verbs += new /mob/doton/verb/DotonDoryoDango()
				usr:L38 = 1
			else ..()
		else ..()
	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"
obj/Scroll_Doton2
	icon='scroll.dmi'
	icon_state="4"
	verb/Learn_Doton2()
		if(usr:L39 == 0)
			if(usr.rank == "Student"||usr.rank == "Genin")
				return
			if(usr.Mtai >=600)
				usr << "<B><font color = blue>You have acquired Doton Doryuuheki!!";usr.verbs += new /mob/doton/verb/DotonDoryuuheki()
				usr:L39 = 1
			else ..()
		else ..()
	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"

obj/Scroll_Rai1
	icon='scroll.dmi'
	icon_state="2"
	verb/Learn_Rai1()
		if(usr:L43 == 0)
			if(usr.rank == "Student")
				return
			if(usr.Mnin >=300)
				usr << "<B><font color = blue>You have acquired Raikyuu No Jutsu!!";usr.verbs += new /mob/rai/verb/Raikyuu()
				usr:L43 = 1
			else ..()
		else ..()
	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"
obj/Scroll_Rai2
	icon='scroll.dmi'
	icon_state="2"
	verb/Learn_Rai2()
		if(usr.L44 == 0)
			if(usr.rank == "Student"||usr.rank=="Genin")
				return
			if(usr.Mnin >=500)
				usr << "<B><font color = blue>You have acquired Rairyuu No Tatsumaki!!";usr.verbs += new /mob/rai/verb/RairyuuNoTatsumaki()
				usr.L44 = 1
			else ..()
		else ..()
	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"
obj/Scroll_Katon1
	icon='scroll.dmi'
	icon_state="6"
	verb/Learn_Katon1()
		if(usr.Mnin >=100)
			usr << "<B><font color = blue>You learned Katon Goukakyuu!!";usr.verbs += new /mob/katon/verb/KatonGoukakyuu()
			usr:L8 = 1
		else ..()
	else ..()
	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"
obj/Scroll_Katon2
	icon='scroll.dmi'
	icon_state="6"
	verb/Learn_Katon2()
		if(usr.Uchiha == 0&&usr.Mnin >=300)
			usr << "<B><font color = blue>You learned Katon Housenka no jutsu!!";usr.verbs += new /mob/katon/verb/KatonHousenka()
			usr:L9 = 1
		else ..()
	else ..()
	verb/Get()
		set src in oview(1)
		src.loc = usr
		usr<<"You picked up a [src]"
obj
	AnbuClothes
		name = "AnbuClothes"
		icon = 'clothes.dmi'//dont have a base icon so cant make weights icon!lol
		price = 250
		worn = 0
		verb
			Wear()
				if(src.worn == 1)
					src:worn = 0
					usr.overlays -= 'clothes.dmi'//temp icon
					usr << "You remove the [src.name]."
					src.suffix = ""
				else
					src:worn = 1
					usr.overlays += 'clothes.dmi'
					usr << "You wear the [src.name]."
					src.suffix = "Equipped"
			Look()
				usr<<"This is an anbu uniform."
			Drop()
				if(src:worn == 1)
					usr << "Not while its being worn."
				if(src:worn == 0)
					src.loc=locate(usr.x,usr.y-1,usr.z)
					usr.SaveK()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up a [src]"
