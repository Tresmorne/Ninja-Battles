mob
	puppet
		var
			puppetowner = ""
			PEX = 0
			tmp/canhit = 1
mob
	puppet
		icon = 'karasu.dmi'
		density = 1
		verb
			PickUp()
				set src in oview(1)
				if(puppetowner == usr)
					src.loc = usr
					usr<<"You picked up [src]"
					usr.verbs -= new /mob/puppet/verb/PuppetNorth()
					usr.verbs -= new /mob/puppet/verb/PuppetSouth()
					usr.verbs -= new /mob/puppet/verb/PuppetEast()
					usr.verbs -= new /mob/puppet/verb/PuppetWest()

				else
					usr<<"Not your puppet."
mob/puppet
	verb
		kugutsu(mob/puppet/P in usr.contents)
			set category = "Jutsus"
			set name = "Kugutsu No Jutsu"
			P.loc = locate(usr.x,usr.y - 1,usr.z)
			P.health = usr.health/2
			P.puppet = 1
			P.tai = usr.tai
			usr.verbs += new /mob/puppet/verb/PuppetNorth()
			usr.verbs += new /mob/puppet/verb/PuppetSouth()
			usr.verbs += new /mob/puppet/verb/PuppetEast()
			usr.verbs += new /mob/puppet/verb/PuppetWest()


mob/puppet
	verb
		PuppetNorth()
			set category = "Puppet"
			for(var/mob/puppet/K in oview())
				if(K.puppetowner == usr)
					K.puppet = 1
					step(K,NORTH)
		PuppetSouth()
			set category = "Puppet"
			for(var/mob/puppet/K in oview())
				if(K.puppetowner == usr)
					K.puppet = 1
					step(K,SOUTH)
		PuppetEast()
			set category = "Puppet"
			for(var/mob/puppet/K in oview())
				if(K.puppetowner == usr)
					K.puppet = 1
					step(K,EAST)
		PuppetWest()
			set category = "Puppet"
			for(var/mob/puppet/K in oview())
				if(K.puppetowner == usr)
					K.puppet = 1
					step(K,WEST)



mob/puppet
	verb
		Puppetattack()
			set category = "Puppet"
			for(var/mob/puppet/P in oview())
				for(var/mob/M in get_step(P,P.dir))
					if(P.puppetowner == usr)
						if(P.canhit == 0)
							return
						if (M.inspike == 1)
							P.canhit = 0
							usr<<"Your puppet's attack bounces off of [usr]!"
							sleep(8)
							P.canhit = 1
						if (M.sphere == 1)
							P.canhit = 0
							usr<<"Your puppet's attack bounces off of the sand!"
							sleep(8)
							P.canhit = 1
						if (M.Kaiten == 1)
							var/damage = round(usr.tai/2)
							if(damage <= 1)
								P.canhit = 0
								damage = 1
								usr <<"Your puppet attack [M] but their kaiten hakkeshou reflects the damage back at them."
								M <<"You reflect [usr]'s attack causing them to hurt themselfs."
								P.health -= damage
								Death(M)
								sleep(8)
								P.canhit = 1
								return
							else
								usr <<"Your puppet attacks [M] but their kaiten hakkeshou reflects the damage back at them."
								M <<"You reflect [usr]'s attack causing them to hurt themselfs."
								P.health -= damage
								Death(M)
								return
						if (M.ingat == 1)
							usr << "Your puppet's attack bounces off of [M] because they are in gatsuuga.."
							return
						else
							P.canhit = 0
							var/damage = round(P.tai/11)
							oview()<<"[P] hit [M] for [damage]!"
							M.health -= damage
							Death(usr)
							PEX = M.max_exp/2
							sleep(8)
							P.canhit = 1


