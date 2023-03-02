mob/Banker//the new banker!
	name = "Banker"
	icon = 'Banker.dmi'
	health = 9999999999999999999999999999999999999999999999
	verb
		Deposit()
			set src in oview(3)
			set category = "Bank"
			var/heh = input("You have [usr.Yen] yen. How much do you wish to deposit?","Deposit") as num
			if (heh < 0)
				alert("Don't try cheating me!","Bank Keeper")
				return()
			if (heh > usr.Yen)
				alert("You don't have that much yen!", "Deposit")
				return()

			usr << "You deposit [heh] gold."
			usr.Yen -= heh
			usr.goldinbank += heh
			return()

		Withdraw()
			set src in oview(3)
			set category = "Bank"
			var/heh = input("You have [usr.goldinbank] gold in the bank. How much do you wish to withdraw?","Withdraw") as num
			if (heh < 0)
				alert("You can't withdraw less then 1 yen!","Bank Keeper")
				return()
			if (heh > usr.goldinbank)
				alert("You don't have that much yen in the bank!", "Bank Keeper")
				return()

			usr << "You withdraw [heh] gold."
			usr.Yen += heh
			usr.goldinbank -= heh
			return()

		CheckBalance()
			set src in oview(3)
			set category = "Bank"
			set name = "Check Balance"
			usr << "You have [usr.goldinbank] yen in the bank."
mob/Vet
	name = "Vet"
	icon = 'Banker.dmi'
	health = 9999999999999999999999999999999999999999999999
	verb
		Heal()
			set src in oview(3)
			set category = "Dog"
			if(usr.Yen <= 1999)
				usr<<"You need 2000 Yen to heal your dog!"
			else
				for(var/mob/pet/P in usr.contents)
					if(P.owner==usr&&usr.hasdog)
						usr.Yen-=2000
						P.health = P.maxhealth
						P.overlays=null
						usr<<"All done"
						return
					else
						usr<<"You don't own a dog OR It needs to be picked up."
						return
		DogRanAway()
			set src in oview(3)
			set category = "Dog"
			for(var/mob/pet/P in world)
				if(P.owner==usr)
					del(P)
			usr.hasdog=0
			usr<<"Go get a new pet."

mob
	var/tmp
		NPC = 0
		original
		moving=0
		getingready=0
		bowner
		hairPrefix
		enemy
		statePrefix
		lowner
		sowner
		wowner
mob
	npcs
		KBunshin
			human = 1
			NPC = 1

			proc/Die()
				flick("smoke2",src)
				del(src)
			Bump(atom/M)
				if(istype(M,/mob/)) // If they run into the player
					if(M == bowner||M == src.original||M.name==src.name)
						return
					else
						if(src.firing)
							return
						var/mob/P = M
						var/Damage = src.tai
						src.firing=1
						if(P.Kaiten)
							del(src)
						if(P.drunk&&P.NonClan)
							view()<<"[M] dodges [src]'s attack"
							sleep(13)
							src.firing=0
							return
						P.health -= Damage
						view() << "The [src] attacks [M] for [Damage]!"
						P.Death(src)
						sleep(10)
						src.firing=0
		KKBunshin
			proc/Die()
				flick("smoke2",src)
				del(src)
			Bump(atom/M)
				if(istype(M,/mob/)) // If they run into the player
					if(M == lowner||M == src.original||M.name==src.name)
						return
					else
						if(!src.firing)
							src.firing=1
							var/mob/P = M
							var/Damage = src.tai
							if(P.Kaiten)
								del(src)
							if(P.drunk&&P.NonClan)
								view()<<"[M] dodges [src]'s attack"
								sleep(13)
								src.firing=0
								return
							P.health -= Damage // Takes the players health
							view() << "<font size=1>The [src] attacks [M] for [Damage]!"
							P.Death(src)
						sleep(5)
						src.firing=0
		SBunshin
			human = 1
			NPC = 1

			proc/Die()
				flick("smoke2",src)
				del(src)
			Bump(atom/M)
				if(istype(M,/mob/)) // If they run into the player
					if(M == sowner||M == src.original||M.name==src.name)
						return
					else
						if(!src.firing)
							src.firing=1
							var/mob/P = M
							var/Damage = src.tai
							if(P.Kaiten)
								del(src)
							if(P.drunk&&P.NonClan)
								view()<<"[M] dodges [src]'s attack"
								sleep(13)
								src.firing=0
								return
							P.health -= Damage // Takes the players health
							view() << "<font size=1>The [src] attacks [M] for [Damage]!"
							P.Death(src)
						sleep(5)
						src.firing=0
		Bunshin
			human = 1
			NPC = 1

			proc/Die()
				flick("smoke2",src)
				del(src)



mob
	proc/CheckAction()
		return

proc/Name2Mob(var/mName as text)
	for(var/mob/i in world)
		if("[lowertext(i.name)]" == "[lowertext(mName)]")
			return i

obj
	var/tmp
		price
mob
	Merchant2
		name = "Weapon Sales Person"
		icon = 'Banker.dmi'
		health = 9999999999999999999999999999999999999999999999
		verb/Buy()
			set src in oview(3)
			switch(input("What would you like to buy today??")in list("Shuriken - 200","Kunai - 400","Exploding Tag - 1000","Nothing"))
				if("Shuriken - 200")
					var/give = input("How many Shuriken do you wish to buy?")as num
					if(usr.Clan == "Tenten")
						new/obj/Shuriken
						new/obj/Shuriken
						new/obj/Shuriken
						new/obj/Shuriken
						new/obj/Shuriken
						new/obj/Shuriken
						new/obj/Shuriken
						new/obj/Shuriken
						new/obj/Shuriken
						new/obj/Shuriken
					if(give >= 101)
						for(var/obj/Shuriken/A in usr.contents)
							del(A)
						usr<<"You cannot purchase more than 100 Shuriken at a time"
						return
					if(usr.Yen >= give*200&&give>0)
						usr.Yen -= give*200
						var/counter=0
						for(var/obj/Shuriken/O in usr.contents)
							counter+=1
						if(counter<=0)
							var/obj/Shuriken/B = new/obj/Shuriken
							B.loc = usr
							B.ammount+=give
							B.name= "[B.name] ([B.ammount])"
						else
							for(var/obj/Shuriken/O in usr.contents)
								O.ammount+=give
								O.name= "[O.name] ([O.ammount])"
					else
						usr<<"Not enough money!"
				if("Kunai - 400")
					var/give = input("How many Kunai do you wish to buy?")as num
					if(usr.Clan == "Tenten")
						new/obj/kunai
						new/obj/kunai
						new/obj/kunai
						new/obj/kunai
						new/obj/kunai
						new/obj/kunai
						new/obj/kunai
						new/obj/kunai
						new/obj/kunai
						new/obj/kunai
					if(give >= 101)
						for(var/obj/kunai/A in usr.contents)
							del(A)
						usr<<"You cannot purchase more than 100 Kunai at a time"
						return
					if(usr.Yen >= give*400&&give>0)
						usr.Yen -= give*400
						var/counter=0
						for(var/obj/kunai/O in usr.contents)
							counter+=1
						if(counter<=0)
							var/obj/kunai/B = new/obj/kunai
							B.loc = usr
						else
							for(var/obj/kunai/O in usr.contents)
								O.ammount+=give
								O.name= "[O.name] ([O.ammount])"
					else
						usr<<"Not enough money!"
				if("Exploding Tag - 1000")
					var/give = input("How many Exploding Tags do you wish to buy?")as num
					if(give >= 101)
						for(var/obj/Shuriken/A in usr.contents)
							del(A)
						usr<<"You cannot purchase more than 100 Exploding tags at a time"
						return
					if(usr.Yen >= give*1000&&give>0)
						usr.Yen -= give*1000
						var/counter=0
						for(var/obj/ExplodingTag/O in usr.contents)
							counter+=1
						if(counter<=0)
							var/obj/ExplodingTag/B = new/obj/ExplodingTag
							B.loc = usr
						else
							for(var/obj/ExplodingTag/O in usr.contents)
								O.ammount+=give
								O.name= "[O.name] ([O.ammount])"
					else
						usr<<"Not enough money!"
				if("Nothing")
					return
mob
	Food_Vender
		name = "Chef"
		icon = 'Banker.dmi'
		health = 9999999999999999999999999999999999999999999999
		verb
			Buy()
				set src in oview(3)
				switch(input("What would you like to buy today??")in list("Ramen - 350","Vegetable Soup - 320","Sake - 1500","Nothing"))
					if("Ramen - 350")
						if(usr.Yen >= 350)
							usr.Yen -= 350
							var/obj/Ramen/R = new/obj/Ramen
							R.loc = usr
						else
							usr<<"Not enough money!"
					if("Vegetable Soup - 320")
						if(usr.Yen >= 320)
							usr.Yen -= 320
							var/obj/Soup/S = new/obj/Soup
							S.loc = usr
						else
							usr<<"Not enough money!"
					if("Sake - 1500")
						if(usr.Yen >= 1500)
							usr.Yen -= 1500
							var/obj/Sake/L = new/obj/Sake
							L.loc = usr
						else
							usr<<"Not enough money!"
					if("Nothing")
						return
mob
	Merchant
		name = "Sales person"
		icon = 'Banker.dmi'
		health = 9999999999999999999999999999999999999999999999
		verb/Buy()
			set src in oview(3)
			switch(input("What would you like to buy today??")in list("Weights - 7000","Shino Coat - 1000","Pants - 600","Shirt - 1000","Shoes - 150","Shades - 390","Sasuke Shirt - 4500","Nothing"))
				if("Weights - 7000")
					if(usr.Yen >= 7000)
						usr.Yen -= 7000
						var/obj/Weights/B = new/obj/Weights
						B.loc = usr
					else
						usr<<"Not enough money!"
				if("Sasuke Shirt - 4500")
					if(usr.Yen >= 2500)
						usr.Yen -= 2500
						var/obj/SasukeShirt/B = new/obj/SasukeShirt
						B.loc = usr
					else
						usr<<"Not enough money!"
				if("Pants - 600")
					if(usr.Yen >= 600)
						usr.Yen -= 600
						var/obj/Pants/B = new/obj/Pants
						B.loc = usr
					else
						usr<<"Not enough money!"
				if("Shirt - 1000")
					if(usr.Yen >= 1000)
						usr.Yen -= 1000
						var/obj/Shirt/B = new/obj/Shirt
						B.loc = usr
					else
						usr<<"Not enough money!"
				if("Shades - 390")
					if(usr.Yen >= 390)
						usr.Yen -= 390
						var/obj/Shades/B = new/obj/Shades
						B.loc = usr
					else
						usr<<"Not enough money!"
				if("Shino Coat - 1000")
					if(usr.Yen >= 1000)
						usr.Yen -= 1000
						var/obj/ShinoS/B = new/obj/ShinoS
						B.loc = usr
					else
						usr<<"Not enough money!"
				if("Shoes - 150")
					if(usr.Yen >= 150)
						usr.Yen -= 150
						var/obj/Shoes/B = new/obj/Shoes
						B.loc = usr
					else
						usr<<"Not enough money!"
				if("Nothing")
					return


mob
	tailor
		icon = 'Haircuter.dmi'
		health = 9999999999999999999999999999999999999999999999
		verb
			Talk()
				set src in oview(2)
				set category ="Hair-cut"
				switch(input("Would you like me to work magic to that ragged hair??", text) in list ("Yes","No"))
					if("Yes")
						usr.overlays-=usr.hair
						switch(input("What hair style do you want?", "Customization", text) in list ("Naruto","Gaara","Sasuke","Rock Lee","Kakashi","Ino","Sakura","Bald"))
							if("Bald")
								usr.hair = "Bald"
							if("Naruto")
								usr.hair = "Naruto"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'narutoH.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.Ohair = hairover
								usr.hair = usr.Ohair
								usr.overlays += usr.hair
							if("Gaara")
								usr.hair = "Gaara"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'gaaraH.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.Ohair = hairover
								usr.hair = usr.Ohair
								usr.overlays += usr.hair
							if("Kakashi")
								usr.hair = "Kakashi"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'KakashiH.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.Ohair = hairover
								usr.hair = usr.Ohair
								usr.overlays += usr.hair
							if("Ino")
								usr.hair = "Ino"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'inoH.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.Ohair = hairover
								usr.hair = usr.Ohair
								usr.overlays += usr.hair
							if("Sasuke")
								usr.hair = "Sasuke Hair"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'SasukeH.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.Ohair = hairover
								usr.hair = usr.Ohair
								usr.overlays += usr.hair
							if("Sakura")
								usr.hair = "Sakura Hair"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'SakuraH.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.Ohair = hairover
								usr.hair = usr.Ohair
								usr.overlays += usr.hair
							if("Rock Lee")
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

mob/enemy
	Jiraiya
		icon = 'npcs.dmi'
		icon_state="jiraiya"
		health = 9999999999999999999999999999999999999999999999
		maxhealth = 20000
		Mtai = 15000
		Mnin = 15000
		Mgen = 15000
		tai = 15000
		nin = 15000
		gen = 15000
		New()
			..()
			spawn(1)
				NPCAI()
		Bump(mob/M)
			if(M.client)
				MONATTACK(M)
		verb
			Talk()
				set src in oview(1)
				set category ="Jiraiya"
				if(!usr.talkedto&&usr.Mnin>=500&&usr.Mgen>=500&&usr.Mchakra>=10000)
					usr<<"You seem to have a great potential."
					usr.talkedto=1
					usr.random=rand(1,3)
					if(usr.random==3)
						usr.random=rand(1,3)
						if(usr.random==2)
							var/obj/Frog_Summoning_Scroll/F = new()
							F.loc=usr
							usr<<"To Summon your beast you must do the required seals and give a blood sacrifice"
							usr<<"Good luck in training Kuchiyose!"
						if(usr.random==1)
							var/obj/Slug_Summoning_Scroll/F = new()
							F.loc=usr
							usr<<"To Summon your beast you must do the required seals and give a blood sacrifice"
							usr<<"Good luck in training Kuchiyose!"
						if(usr.random==3)
							var/obj/Big_Snake_Scroll/F = new()
							F.loc=usr
							usr<<"To Summon your beast you must do the required seals and give a blood sacrifice"
							usr<<"Good luck in training Kuchiyose!"
					else
						usr<<"But I'm too busy to play with you, I must finish my research *Follows a pretty girl*."
				else
					if(usr.talkedto)
						usr<<"Didn't I say I don't have the time to play?"
					else
						usr<<"You are weak. Talk to me when your worth the time to train."

mob/var/talkedto=0
mob/enemy
	Neji
		icon = 'hiashi.dmi'
		health = 9999999999999999999999999999999999999999999999
		maxhealth = 20000
		Mtai = 15000
		Mnin = 15000
		Mgen = 15000
		tai = 15000
		nin = 15000
		gen = 15000
		New()
			..()
			spawn(1)
				NPCAI()
		Bump(mob/M)
			if(M.client)
				MONATTACK(M)
		verb
			Talk()
				set src in oview(1)
				set category ="Hiashi"
				if(usr.Hyuuga == 1)
					usr<<"Hello fellow Hyuuga, welcome to our house."
					if(usr.rank == "Student")
						return
					if(usr.knowK == 0&&usr.Mnin >=3500)
						usr<<"You have become very strong [usr]..I think it is time to teach you Hakkeshou Kaiten,the Hyuuga ultimate defense jutsu. Use it wisely."
						usr.knowK = 1
						usr.verbs += new /mob/Hyuuga/verb/HakkeshouKaiten()
					if(usr.knowJ == 0&&usr.Mtai >=200)
						usr<<"It is time that you learn our clan's fighting style, Jyuuken."
						usr.knowJ = 1
						usr.verbs += new /mob/hyuuga/verb/Jyuken()
					if(usr.knowKK == 0&&usr.Mtai >=500)
						usr<<"I will now teach you Hakke Kuushou."
						usr.knowJ = 1
						usr.verbs += new /mob/hyuuga/verb/HakkeKuusho()
				else
					usr<<"Welcome to the Hyuuga house."
					return
mob
	proc
		NPCAI() //name of proc
			return
			/*var/mob/player/M //variable M has to be mob/usr
			while(src) //while src is stil kickin
				if(M in oview(5)) //if M is in oview(5)
					if(M.name in src.killlist) //now if M.name is in src.killlist, this has it only attack if attacked!
						walk_to(src,M,1,4) //src walks to M until 1 block away, moving 4/10ths of a second
						if(M in oview(1)) //if M is in oview(1)
							step_towards(src,M) //src steps toward M
					else //if usr.name isnt in src.killlist
						sleep(15)//pauses for 1 and 1/2 seconds
						step_rand(src) //step randomly on the field
						break //breaks out of the while loop
				else //if M isnt in oview(5)
					for(M in view(src)) //for all Ms in view(src)
						break //breaks out of the while loop
				sleep(5) //pauses 1/2 second before redoing loop
			spawn(2) // pauses 2/10 of second before redoing proc
				NPCAI()*/

mob
	proc
		MONATTACK(mob/M in get_step(src,src.dir))
			if(M.drunk&&M.NonClan)
				view(M)<<"[M] dodges [src]'s attack."
				return
			if(src.orochimaru&&src.canattack)
				if(!M.bit)
					var/damage = round(src.tai/1.6)
					if(damage <= 1)
						damage = 1
						view() << "[src] attacks [M] for [damage]!"
						M.health -= damage
						if(M.health <= 0)
							src.killlist = ""
							M.Death(src)
						if(istype(M,/mob/enemy))
							M.killlist += src.name
					else
						view() << "[src] attacks [M] for [damage]!"
						M.health -= damage
						if(M.health <= 0)
							src.killlist = ""
							M.Death(src)
						if(istype(M,/mob/enemy))
							M.killlist += src.name
				else
					if(!M.CS&&!src.GOTCS)
						src.canattack=1
						view(src)<<"Orochimaru: You seem like an interesting subject."
						sleep(10)
						view(src)<<"Orochimaru: I will give you the gift of power young one."
						sleep(10)
						view(M)<<"Orochimaru bites the neck of [M]."
						M.CS = 1
						M<<"You begin to feel an extreme amount of pain, Try to survive, your health is constantly draining!"
						M.firing=1
						M.GettingCurseSeal()
						sleep(40)
						view(M)<<"Orochimaru: I do not have any further business here."
						del(src)
						sleep(40)
						M.inmission=0
						M.loc=locate(6,58,20)
						M<<"You have been brought back to your village."
						M.verbs -= new /mob/mission/verb/Escape()
						M.verbs -= new /mob/mission/verb/Escape()
						M.verbs -= new /mob/mission/verb/Escape()
			else
				if(M.ingat||M.intank||M.NPC)				.
					return
				if(M.Kaiten)
					var/damage = round(usr.tai)
					if(damage <= 1)
						damage = 1
						M <<"You reflect [src]'s attack causing them to hurt themselfs."
						src.health -= damage
						if(src.health <= 0)
							src.killlist = ""
							src.Death(M)
						return
					else
						M <<"You reflect [src]'s attack causing them to hurt themselfs."
						src.health -= damage
						if(src.health <= 0)
							src.killlist = ""
							src.Death(M)
						return
				if (M.ingat == 1)
					return
				else					//otherwise...
					if(src.Tekken&&src.canattack)
						var/damage = round(src.tai)
						if(damage <= 1)
							damage = 1
							view() << "[src] attacks [M] for [damage]!"
							M.health -= damage
							if(M.health <= 0)
								src.killlist = ""
								M.Death(src)
							if(istype(M,/mob/enemy))
								M.killlist += src.name
						else
							view() << "[src] attacks [M] for [damage]!"
							M.health -= damage
							if(M.health <= 0)
								src.killlist = ""
								M.Death(src)
							if(istype(M,/mob/enemy))
								M.killlist += src.name
					else if(src.Jyuken == 1&&src.canattack == 1)
						if(src.chakra >= 2)
							src.canattack =0
							var/damage = round(src.tai)
							if(damage <= 1)
								damage = 1
								view() << "[src] attacks [M] for [damage]!"
								M.health -= damage
								src.chakra -= 2
								if(M.health <= 0)
									src.killlist = ""
									M.Death(src)
								if(istype(M,/mob/enemy))
									M.killlist += src.name
							else
								view() << "[src] attacks [M] for [damage]!"
								M.health -= damage
								src.chakra -= 2
								if(M.health <= 0)
									src.killlist = ""
									M.Death(src)
								if(istype(M,/mob/enemy))
									M.killlist += src.name
						else
							src.Jyuken = 0
							src.Tekken = 1
							return

mob/proc/GettingCurseSeal()
	XD
		if(src.CS)
			src.health-=150
			if(src.health<=0)
				src.Death(src)
			src.random=rand(1,40)
			if(src.random==3)
				src.GOTCS=1
				src.firing=0
				src<<"Your pain stops."
				return
			else
				sleep(12)
				goto XD
		else
			return
mob/var/waterfallS=0
mob/var
	bit=0
	CS=0
	GOTCS=0
mob/Spawndude
   icon = 'Spawn.dmi'
   name = "Spawn Helper"
   health = 9999999999999999999999999999999999999999999999
   density = 1
   isTalkable = 1
   spawnHelper=1

mob
	proc
		ShuriThrow()
			src.firing = 1
			var/obj/Shuriken/K = new /obj/Shuriken
			K.loc = src.loc
			K.tai=src.tai
			K.dir = src.dir
			K.name="[src]"
			K.Gowner=src
			walk(K,usr.dir)
			usr.firing = 0
			sleep(45)
			del(K)

mob
	proc//core procs for the system


		ai_walk_to()
			if(src.client)
				return 0
			else
				for(var/mob/M in oview(5,src))
					if(M.client)
						if(get_dist(src,M) <= 5)//within 5 tiles
							walk_to(src,M,1,5)//walk to the player
							ai_check_dist(src,M)//checks distance
							break//stops the loop
						else
							continue
					else
						continue

		ai_check_dist(mob/attacker,mob/defender)
			if(attacker.client)
				return
			else
				if(get_dist(attacker,defender) <= 1 && defender.NPC==0)//if the monster is one tile away from the player
					attacker.MONATTACK(defender)//attack!
				else
					return

		jutsu()
			for(var/mob/M in oview(7,src))
				if(src.weaknin&&get_dist(src,M) >= 5)
					src.firing = 1
					var/obj/Shuriken/K = new /obj/Shuriken
					K.loc = src.loc
					K.tai=src.tai
					K.dir = src.dir
					K.name="[src]"
					K.Move_Delay=1.5
					K.Gowner=src
					walk_towards(K,M)
					src.firing = 0
					sleep(45)
					del(K)
				if(src.orochimaru&&get_dist(src,M) >= 5)
					src.firing = 1
					view(src)<<"Orochimaru: Katon Karyuu Endan!"
					var/obj/katonEndan/K = new /obj/katonEndan
					K.loc = src.loc
					K.nin=src.nin
					K.dir = src.dir
					K.name="[src]"
					K.Move_Delay=1.7
					K.Gowner=src
					walk_towards(K,M)
					src.firing = 0
					sleep(100)
					del(K)

mob
	enemy//..attack
		rogueshinobi
			name= "Rogue Shinobi(Jounin Rank)"
			icon = 'sandnin.dmi'
			weaknin = 1
			Tekken = 1
			maxhealth=18000
			health = 18000
			tai = 800
			nin = 700
			gen = 400
			NPC=1
		henchmen
			name= "Henchmen(Chuunin Rank)"
			icon = 'soundnin.dmi'
			weaknin = 1
			Tekken = 1
			maxhealth=4000
			health = 4000
			tai = 250
			nin = 200
			gen = 230
			NPC=1
		bodyguards
			name= "BodyGuard(Jounin Rank)"
			icon = 'sandnin.dmi'
			weaknin = 1
			Tekken = 1
			maxhealth=10000
			health = 10000
			tai = 450
			nin = 400
			gen = 530
			NPC=1
		leader
			name= "Leader(Missing-NiN)"
			icon = 'waternin.dmi'
			weaknin = 1
			Tekken = 1
			maxhealth=20000
			health = 20000
			tai = 700
			nin = 800
			gen = 900
			NPC=1
		orochimaru
			name= "Orochimaru"
			icon = 'orochimaru.dmi'
			orochimaru = 1
			Tekken = 1
			maxhealth=180000
			health = 180000
			tai = 6200
			nin = 7000
			gen = 4000
			NPC=1

mob/var
	kyuubinpc=0
	orochimaru=0
mob
	New()//when a mob is created
		..()
		/*sleep(20)
		if(isnull(src.client))//if it's not human
			//ai_random_wander()//wander
			return..()//continue on with normal New() (create and whatnot)
		else
			return..()*/
mob
	Scroll_Vender
		name = "Scroll Seller"
		icon = 'Banker.dmi'
		health = 9999999999999999999999999999999999999999999999
		verb
			Buy()
				set src in oview(3)
				switch(input("What scroll would you like to buy today??")in list("Kaze Dangan No Jutsu - 50k","Kage Bunshin No Jutsu - 5k","Renkuudan No Jutsu - 60k","Daitoppa No Jutsu - 50k","Doton Doryo Dango - 40k","Doton Doryuuheki - 50k","Raikyuu No Jutsu - 40k","Rairyuu No Tatsumaki - 40k","Katon Goukakyuu - 40k","Katon Housenka no jutsu - 40k","Nothing"))
					if("Kaze Dangan No Jutsu - 50k")
						if(usr.Yen >= 50000)
							usr.Yen -= 50000
							usr.contents += new /obj/Scroll_Fuuton1
						else
							usr<<"Not enough money!"
					if("Renkuudan No Jutsu - 60k")
						if(usr.Yen >= 60000)
							usr.Yen -= 60000
							usr.contents += new /obj/Scroll_Fuuton2
						else
							usr<<"Not enough money!"
					if("Daitoppa No Jutsu - 50k")
						if(usr.Yen >= 50000)
							usr.Yen -= 50000
							usr.contents += new /obj/Scroll_Fuuton3
						else
							usr<<"Not enough money!"
					if("Doton Doryo Dango - 40k")
						if(usr.Yen >= 40000)
							usr.Yen -= 40000
							usr.contents += new /obj/Scroll_Doton1
						else
							usr<<"Not enough money!"
					if("Doton Doryuuheki - 50k")
						if(usr.Yen >= 50000)
							usr.Yen -= 50000
							usr.contents += new /obj/Scroll_Doton2
						else
							usr<<"Not enough money!"
					if("Raikyuu No Jutsu - 40k")
						if(usr.Yen >= 40000)
							usr.Yen -= 40000
							usr.contents += new /obj/Scroll_Rai1
						else
							usr<<"Not enough money!"
					if("Rairyuu No Tatsumaki - 40k")
						if(usr.Yen >= 40000)
							usr.Yen -= 40000
							usr.contents += new /obj/Scroll_Rai2
						else
							usr<<"Not enough money!"
					if("Katon Goukakyuu - 40k")
						if(usr.Yen >= 40000)
							usr.Yen -= 40000
							usr.contents += new /obj/Scroll_Katon1
						else
							usr<<"Not enough money!"
					if("Katon Housenka no jutsu - 40k")
						if(usr.Yen >= 40000)
							usr.Yen -= 40000
							usr.contents += new /obj/Scroll_Katon2
						else
							usr<<"Not enough money!"
					if("Kage Bunshin No Jutsu - 5k")
						if(usr.Yen >= 5000)
							usr.Yen -= 5000
							usr.contents += new /obj/KagebunshinS
						else
							usr<<"Not enough money!"
					if("Nothing")
						return