var/list/profane = list("THIS GAME SUCKS","pokemon") //make the list of profane words
var/list/bannedwords = list("http://games.byond.com/hub/Hydrocrush/NarutoHiddenPowers") // if you want to ban miscellaneous words
var/list/tags = list("<font") // the list to ban html tags!
//////////////////////
//Do not touch the////
//Following code!/////
//////////////////////
client/var/
	const
		DENYMSG = "You were denied permission to log in because another person with the same ip address is logged in!"
		BOOTMSG = "You were booted for multi play!"
var/Banned_Ip_list[0]
var/log = 0
mob/proc/filterr(T as text, var/list/L)
	for(var/O in L)
		if(findtext(T,O))
			return TRUE
mob/proc/spamcheck()
	if(src.spamcheck >= 5)
		return TRUE
	else
		src.spamcheck += 1
		spawn(10)
		src.spamcheck -= 1

proc/ipban(address)
	if(!Banned_Ip_list.Find(address) && address &&address!="localhost" &&address!="127.0.0.1")
		Banned_Ip_list.Add(address)



proc/scan(mob/M in world)
	var/mob/player
	for(player in world)
		if(player.client && player != M)
			return TRUE
			break
		else
			return
mob/proc/boot()
	del(src)
mob
	proc

		profane()
			src << "One of the words you used was a curse word!"
		bannedwords()
			src << "A admin has banned one of the words you used for some reason!"
		html()
			src << "Please do not use html tags in your name!"



mob/Admin/verb/toggle_logging()
	set category = "Staff"
	set name = "Restrict Login"


mob/Admin
	verb
		word_ban()
			set category = "Staff"
			usr<<"Taken out"
		Change_Icon(mob/M in world, arg as icon)
			set category = "Staff"
			set name = "Change Icon"
			M.icon = arg
		Change_Icon_State(mob/M in world, t as text)
			set category ="Staff"
			set name ="Change icon state"
			var/answer = input("change icon state to?(CASE SENSITIVE!!!!!!)") as text
			M.icon_state="[answer]"