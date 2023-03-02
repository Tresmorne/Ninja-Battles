mob
	proc
		makeJounin()
			if(src.jounin)
				return
			if(src.bmission>=5&&src.cmission>=5&&src.dmission>=10&&src.maxhealth>=15000&&src.rank=="Chuunin"&&src.Mchakra>=15000&&src.Mtai>=500&&src.Mgen>=500&&src.Mnin>=500&&src.seals>=100&&!src.jounin)
				src.seals=100
				src.rank="Jounin"
				var/obj/Jouninsuit/B = new/obj/Jouninsuit
				usr.verbs+= new /mob/Buyou/verb/Kagebuyou
				B.loc = src
				src.jounin=1
mob
	proc
		makeMissing()
			if(src.hunternin)
				return
			if(src.missingnin)
				return
			if(src.maxhealth>=85000&&src.rank=="Jounin"&&src.Mchakra>=75000&&src.Mtai>=1100&&src.Mgen>=1200&&src.Mnin>=1300&&!src.missingnin&&src.kills>=1000)
				src.ChakraC=100
				usr.verbs+= new /mob/Missingnin/verb/BakuretsuBunshin
				src.rank="Missing-Nin"
				src.missingnin=1
mob
	proc
		makeHunter()
			if(src.missingnin)
				return
			if(src.hunternin)
				return
			if(src.maxhealth>=85000&&src.rank=="Jounin"&&src.Mchakra>=75000&&src.Mtai>=1100&&src.Mgen>=1200&&src.Mnin>=1300&&src.ChakraC>=100&&!src.missingnin&&src.missingkills>=10)
				src.ChakraC=100
				usr.verbs+= new /mob/Hunternin/verb/JourouSenbon
				src.rank="Hunter-Nin"
				src.hunternin=1
var
	Chuunintime
	Chuuninexam
mob/var
	tmp/finals=0
	jounin=0
	missingnin=0
	hunternin=0
mob/owner
	verb
		Chuuninexam()
			set category = "Staff"
			set name = "Chuunin Examination"
			if(!Chuunintime)
				usr<<"You will be teleported to the Chuunin host room when it starts"
				world<<"<font size=3><font color=red>There will be a Chuunin exam in 5 minutes - Go to the Chuunin room theres one in all Villages..."
				sleep(500)
				world<<"<font size=3><font color=red>There will be a Chuunin exam in 4 minutes..."
				sleep(500)
				world<<"<font size=3><font color=red>There will be a Chuunin exam in 3 minutes..."
				sleep(500)
				world<<"<font size=3><font color=red>There will be a Chuunin exam in 2 minutes..."
				sleep(500)
				world<<"<font size=3><font color=red>There will be a Chuunin exam in 1 minute..."
				sleep(500)
				world<<"<font size=3><font color=red>Chuunin exam has now started..."
				Chuunintime=1
				usr.loc=locate(52,40,13)
			else
				world<<"Chuunin Exam Part one over"
				Chuunintime=0
mob/var/tmp
	testing=0
	cantest=1
var
	Bmission=1
obj/GT2
	chuunintest
	name = "Chuunin Test"
	icon = 'Test.dmi'
	verb
		TakeTest()
			set src in oview(1)
			if(Chuunintime&&usr.cantest)
				usr.testing=1
				usr.cantest=0
				switch(input("When you throw a Shuriken, Which way will it spin?","Shuriken Spin",) in list("Clockwise","Counter-Clockwise","Depends Lefty/Righty","No Spin"))
					if("Depends Lefty/Righty")
						usr.points += 1
					else
						usr.points += 0
				switch(input("What kind of tool is used with Kugutsu No Jutsu?","Kugutsu Tool",) in list("Kunai","Shuriken","Explosive Note","Puppet"))
					if("Puppet")
						usr.points += 1
					else
						usr.points += 0
				switch(input("What is the name of Zabuza's legendary sword?","Sword",) in list("Raijin","Samehada","Kubikiri Houcho","No Name"))
					if("Kubikiri Houcho")
						usr.points += 1
					else
						usr.points += 0
				switch(input("What category of Doujutsu, Kinjutsu, Ninjutsu, Genjutsu, and Taijutsu does Lotus fall under?","Lotus",) in list("Ninjutsu","Doujutsu","Taijutsu","Genjutsu","Kinjutsu"))
					if("Taijutsu")
						usr.points += 1
					else
						usr.points += 0
				switch(input("What are the clan abilities of the Yamanaka clan?","Yamanaka",) in list("Precise Target Hitters","Increase Body Size","Freeze The Enemy","Mind Transfer"))
					if("Mind Transfer")
						usr.points += 1
					else
						usr.points += 0
				switch(input("Who is Hinata's younger sister?","rank",) in list("Hiashi","Neji","Hizashi","Kurenai","Hanabi"))
					if("Hanabi")
						usr.points += 1
					else
						usr.points += 0
				switch(input("What does Hokage stand for?","Hokage",) in list("Fire Emperor","Head Ruler","Fire Shadow","Head Honcho","Fire Guardian"))
					if("Fire Shadow")
						usr.points += 1
					else
						usr.points += 0
				switch(input("Name a Byakugan ability","Hyuuga",) in list("See people among Bunshins","Sight of Opponents Chakra flow","Eyes pop out","Strength","Agility"))
					if("Sight of Opponents Chakra flow")
						usr.points += 1
					else
						usr.points += 0
				switch(input("What type of Ninja is Akasuna no Sasori?","Sasori",) in list("Puppet","Medical","Fan","Sound"))
					if("Puppet")
						usr.points += 1
					else
						usr.points += 0
				switch(input("What are the Kaguya clan known for?","Kaguya",) in list("Katon Goukakyuu No Jutsu","Hakke","Tsuuga","5 Dances","Their size"))
					if("5 Dances")
						usr.points+= 1
					else
						usr.points += 0
				switch(input("What is/are the main accessory(ies) of a Ninja?","Accessory",) in list("Kunai","Shuriken","Their Villages Forehead Protector","All of the Above"))
					if("All of the Above")
						usr.points += 1
				if(usr.points>=9&&Chuunintime)
					usr.testing=0
					usr.loc=locate(52,2,13)
					usr<<"You have passed the first part of the exam! Please make your way to the arena and form a line below the Exam host"
					return
				else
					usr<<"You have failed, Try again next time."
					return
			else
				usr<<"You must wait for the Exam to start."
				return



obj
	earthscroll
		name = "Scroll Of Earth"
		icon = 'scroll.dmi'
		icon_state = "6"
		verb
			Get()
				set src in oview(1)
				if(usr.earthscroll >= 1)
					usr<<"You already have this scroll"
				else
					src.loc = usr
					usr<<"You picked up a [src]"
					usr.earthscroll = 1
			Drop()
				src.loc=locate(usr.x,usr.y-1,usr.z)
			Destroy()
			 set hidden = 1
			 del(src)
obj
	heavenscroll
		name = "Scroll Of Heaven"
		icon = 'scroll.dmi'
		icon_state = "7"
		verb
			Get()
				set src in oview(1)
				if(usr.heavenscroll >= 1)
					usr<<"You already have this scroll"
				else
					src.loc = usr
					usr<<"You picked up a [src]"
					usr.heavenscroll = 1
			Drop()
				src.loc=locate(usr.x,usr.y-1,usr.z)
			Destroy()
			 set hidden = 1
			 del(src)