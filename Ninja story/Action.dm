
mob/var
	isTalkable=0
	inAction=0
	spawnHelper=0
	move_time = 0
mob/verb/Action(mob/M in oview(1))
	if(M.isTalkable&&!usr.inAction)
		usr.inAction = 1
		TalkTo(M)


mob/proc/TalkTo(mob/M)
	if(M.spawnHelper)
		if(usr.Village == "Leaf")
			VillageSpawning(usr)
			usr.leafS = 1
			usr<<"You will now spawn in the Leaf Village!"
			usr.inAction = 0
		if(usr.Village == "Grass")
			VillageSpawning(usr)
			usr.grassS = 1
			usr<<"You will now spawn in the Grass Village!"
			usr.inAction = 0
		if(usr.Village == "Sand")
			VillageSpawning(usr)
			usr.sandS = 1
			usr<<"You will now spawn in the Sand Village!"
			usr.inAction = 0
		if(usr.Village == "Sound")
			VillageSpawning(usr)
			usr.soundS = 1
			usr<<"You will now spawn in the Sound Village!"
			usr.inAction = 0
		if(usr.Village == "Rain")
			VillageSpawning(usr)
			usr.rainS = 1
			usr<<"You will now spawn in the Rain Village!"
			usr.inAction = 0
		if(usr.Village == "Waterfall")
			VillageSpawning(usr)
			usr.waterfallS = 1
			usr<<"You will now spawn in the Waterfall Village!"
			usr.inAction = 0
		if(usr.Village == "Mist")
			VillageSpawning(usr)
			usr.mistS = 1
			usr<<"You will now spawn in the Mist Village!"
			usr.inAction = 0
		if(usr.Village == "Cloud")
			VillageSpawning(usr)
			usr.lightningS = 1
			usr<<"You will now spawn in the Cloud Village!"
			usr.inAction = 0

mob/proc/VillageSpawning()
	usr.leafS = 0
	usr.grassS = 0
	usr.sandS = 0
	usr.soundS = 0
	usr.rainS = 0
	usr.earthS = 0
	usr.waterfallS=0
	usr.mistS = 0
	usr.lightningS = 0
