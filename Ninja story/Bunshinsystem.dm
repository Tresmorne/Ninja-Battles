obj/Click()//this will make it so if you click the turf your pet will walk to it			//like in MJ
	for(var/mob/npcs/Bunshin/B in world)
		if(B.original == usr)
			if(B.Frozen)
				B.Frozen = 0
				walk_towards(B,usr) // I don't know how Gunbuddy does his crap
				B.moving = 1
				sleep(5)
				B.Frozen = 1
				B.moving = 0
			else
				walk_towards(B,src)
	for(var/mob/npcs/KBunshin/K in world)
		if(K.original == usr)
			if(K.Frozen)
				K.Frozen = 0
				walk_towards(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)


	for(var/mob/pet/P in view())
		if(P.owner == usr&&P.Frozen == 0)
			walk_towards(P,src)
		else
			..()

turf/Click()//this will make it so if you click the turf your pet will walk to it			//like in MJ
	for(var/mob/npcs/Bunshin/B in world)
		if(B.original == usr)
			if(B.Frozen)
				B.Frozen = 0
				walk_towards(B,src) // I don't know how Gunbuddy does his crap
				B.moving = 1
				sleep(5)
				B:Frozen = 1
				B:moving = 0
			else
				walk_towards(B,src)
	for(var/mob/npcs/KBunshin/K in world)
		if(K.original == usr)
			if(K.Frozen)
				K.Frozen = 0
				walk_towards(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)


	for(var/mob/pet/P in view())
		if(P.owner == usr&&P.Frozen == 0)
			walk_towards(P,src)
		else
			..()

mob/Move()//Move proc.. it's absolutely delectable
	if(src.Frozen)//they can't move if they're locked
		return
	else
		..()
	if(src.client)
		for(var/mob/npcs/Bunshin/B in world)
			if(B.original == src)
				if(B.Frozen||B.moving)
					return
				else
					walk_towards(B,src)




mob/Click()//this will make it so if you click the turf your pet will walk to it			//like in MJ
	for(var/mob/npcs/Bunshin/B in world)
		if(B.original == usr)
			if(B:Frozen)
				B:Frozen = 0
				walk_towards(B,src) // I don't know how Gunbuddy does his crap
				B.moving = 1
				sleep(5)
				B.Frozen = 1
				B.moving = 0
			else
				walk_towards(B,src)
	for(var/mob/npcs/KBunshin/K in world)
		if(K.original == usr)
			if(K.Frozen)
				K.Frozen = 0
				walk_towards(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)
	for(var/mob/pet/P in view())
		if(P.owner == usr&&P.Frozen == 0)
			walk_towards(P,src)
		else
			..()




mob/verb/KillBunshins()//this will make it so if you click the turf your pet will walk to it			//like in MJ
	set name = "Kill Bunshins"

	set desc = "Destroy all of your bunshins"
	for(var/mob/npcs/B in world)
		if(B.original == usr)
			if(B.Frozen)
				usr.bunshin = 0
				del(B)
			else
				usr.bunshin = 0
				del(B)


mob/Move()//Move proc.. it's absolutely delectable
	if(src.Frozen)//they can't move if they're locked
		return
	else
		..()
	/*if(src.client)
		if(src.bunshin >= 1)
			for(var/mob/npcs/KBunshin/K in world)
				if(K.original == src)
					if(K.Frozen||K.moving)
						return
					else
						walk_towards(K,src)
		else
			..()*/

mob/proc/KillBunshin()
	for(var/mob/npcs/B in world)
		if(B.original == src)
			if(B.Frozen)
				src.bunshin = 0
				flick("smoke2",B)
				del(B)
			else
				src.bunshin = 0
				flick("smoke2",B)
				del(B)