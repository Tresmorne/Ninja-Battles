client
	script = "<STYLE>BODY {background: black; font-family: Verdana; font-size: 8px;color: white}</STYLE>"
mob/var
	isAdmin = 0

mob/newplayer/Login()
	src.GlideSize()
	src.loc = locate(20,13,20)
	src<<'Naruto.mid'
	..()
mob/Login()
	if(src.key == "Tresmorneagain")
		src.verbs += typesof(/mob/Admin/verb)
		src.verbs += typesof(/mob/owner/verb)
		src.verbs += new /mob/Juvenile_Ice/verb/FutagozaNoJutsu()
		src.isAdmin = 1
		src.GM=1
	if(src.key == "Tresmorne1")
		src.verbs += typesof(/mob/Admin/verb)
		src.verbs += typesof(/mob/owner/verb)
		src.verbs += new /mob/Juvenile_Ice/verb/FutagozaNoJutsu()
		src.isAdmin = 1
		src.GM=1
	if(src.key == "")
		src.verbs += typesof(/mob/Admin/verb)
		src.GM=1
		src.verbs += typesof(/mob/owner/verb)
		src.verbs += new /mob/Juvenile_Ice/verb/FutagozaNoJutsu()
	if(src.key == "")
		src.verbs += typesof(/mob/Admin/verb)
		src.GM=1
		src.verbs += typesof(/mob/owner/verb)
		src.verbs += new /mob/Juvenile_Ice/verb/FutagozaNoJutsu()
	if(src.key == "")
		src.verbs -= typesof(/mob/Admin/verb)
		src.GM=1
		src.MakeModerator()
		src.verbs += new /mob/Juvenile_Ice/verb/FutagozaNoJutsu()
	if(src.key == "")
		src.verbs -= typesof(/mob/Admin/verb)
		src.GM=1
		src.MakeModerator()
		src.verbs += new /mob/Juvenile_Ice/verb/FutagozaNoJutsu()
		src.verbs += typesof(/mob/Admin/verb)
	if(src.key == "")
		src.verbs -= typesof(/mob/Admin/verb)
		src.GM=1
		src.MakeModerator()
		src.verbs += new /mob/Juvenile_Ice/verb/FutagozaNoJutsu()
	return


mob/var/tmp/GM=0
mob/player/uchiha
	Uchiha=1
	Realplayer = 1
	human = 1
	Clan = "Uchiha"
	Inuzuka=0
	Gaaraclan=0
	Kaguya=0
	Hyuuga=0
	Nara=0
	NonClan=0
	Aburame=0
	Akimichi = 0
mob/player/nonclan
	NonClan=1
	Realplayer = 1
	human = 1
	Clan = "Non-Clan"
	Inuzuka=0
	Gaaraclan=0
	Kaguya=0
	Hyuuga=0
	Nara=0
	Uchiha=0
	Aburame=0
	Akimichi = 0
mob/player/nara
	Nara=1
	Realplayer = 1
	human = 1
	Clan = "Nara"
	Inuzuka=0
	Gaaraclan=0
	Kaguya=0
	Hyuuga=0
	NonClan=0
	Uchiha=0
	Aburame=0
	Akimichi = 0
mob/player/Hyuuga
	Hyuuga=1
	Realplayer = 1
	human = 1
	Clan = "Hyuuga"
	Inuzuka=0
	Gaaraclan=0
	Kaguya=0
	Nara=0
	NonClan=0
	Uchiha=0
	Aburame=0
	Akimichi = 0
mob/player/kaguya
	Kaguya=1
	Realplayer = 1
	human = 1
	Clan = "Kaguya"
	Inuzuka=0
	Gaaraclan=0
	Hyuuga=0
	Nara=0
	NonClan=0
	Uchiha=0
	Aburame=0
	Akimichi = 0
mob/player/Gaara
	Gaaraclan=1
	Realplayer = 1
	human = 1
	Clan = "Gaara"
	Inuzuka=0
	Kaguya=0
	Hyuuga=0
	Nara=0
	NonClan=0
	Uchiha=0
	Aburame=0
	Akimichi = 0
mob/player/Inuzuka
	Inuzuka=1
	Realplayer = 1
	human = 1
	Clan = "Inuzuka"
	Gaaraclan=0
	Kaguya=0
	Hyuuga=0
	Nara=0
	NonClan=0
	Uchiha=0
	Aburame=0
	Akimichi = 0
mob/player/Akimichi
	Akimichi=1
	Realplayer = 1
	human = 1
	Clan = "Akimichi"
	Inuzuka=0
	Gaaraclan=0
	Kaguya=0
	Hyuuga=0
	Nara=0
	NonClan=0
	Uchiha=0
	Aburame=0
mob/player/Haku
	Haku=1
	Realplayer = 1
	human = 1
	Clan = "Haku"
	Akimichi=0
	Inuzuka=0
	Gaaraclan=0
	Kaguya=0
	Hyuuga=0
	Nara=0
	NonClan=0
	Uchiha=0
	Aburame=0
mob/player/Aburame
	Aburame=1
	Realplayer = 1
	Konchuu = 10
	human = 1
	Clan = "Aburame"
	Haku = 0
	Akimichi=0
	Inuzuka=0
	Gaaraclan=0
	Kaguya=0
	Hyuuga=0
	Nara=0
	NonClan=0
	Uchiha=0
mob/player
	Logout()
		world<<"<font size=1><font color =red><B>Info: <font color = white>[src] Logged out"
		src.overlays -= 'meattank.dmi'
		src.overlays -= 'hakkeshou.dmi'
		src.overlays -= 'gatsuuga.dmi'
		src.overlays -= 'lotus.dmi'
		src.overlays -= 'lotus.dmi'
		src.overlays -= 'lotus.dmi'
		src.overlays -= 'lotus.dmi'
		src.overlays -= 'lotus.dmi'
		src.overlays -= 'lotus.dmi'
		src.overlays -= 'lotus.dmi'
		src.overlays -= 'lotus.dmi'
		src.icon = src.Oicon
		src.icon_state = ""
		if(src.tai >= src.Mtai)
			src.tai = src.Mtai
		if(src.nin >= src.Mnin)
			src.nin = src.Mnin
		if(src.gen >= src.Mgen)
			src.gen = src.Mgen


