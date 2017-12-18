<<<<<<< HEAD
/obj/effect/proc_holder/spell/targeted/genetic
	name = "Genetic"
	desc = "This spell inflicts a set of mutations and disabilities upon the target."

	var/disabilities = 0 //bits
	var/list/mutations = list() //mutation strings
	var/duration = 100 //deciseconds
	/*
		Disabilities
			1st bit - ?
			2nd bit - ?
			3rd bit - ?
			4th bit - ?
			5th bit - ?
			6th bit - ?
	*/

/obj/effect/proc_holder/spell/targeted/genetic/cast(list/targets,mob/user = usr)
	playMagSound()
	for(var/mob/living/carbon/target in targets)
		if(!target.dna)
			continue
		for(var/A in mutations)
			target.dna.add_mutation(A)
		target.disabilities |= disabilities
=======
/obj/effect/proc_holder/spell/targeted/genetic
	name = "Genetic"
	desc = "This spell inflicts a set of mutations and disabilities upon the target."

	var/list/disabilities = list() //disabilities
	var/list/mutations = list() //mutation strings
	var/duration = 100 //deciseconds
	/*
		Disabilities
			1st bit - ?
			2nd bit - ?
			3rd bit - ?
			4th bit - ?
			5th bit - ?
			6th bit - ?
	*/

/obj/effect/proc_holder/spell/targeted/genetic/cast(list/targets,mob/user = usr)
	playMagSound()
	for(var/mob/living/carbon/target in targets)
		if(!target.dna)
			continue
		for(var/A in mutations)
			target.dna.add_mutation(A)
		for(var/A in disabilities)
			target.add_disability(A, GENETICS_SPELL)
>>>>>>> 146d167... [Ready Again]Refactors disabilities into lists, allowing for independent disability sources (#33055)
		addtimer(CALLBACK(src, .proc/remove, target), duration)

/obj/effect/proc_holder/spell/targeted/genetic/proc/remove(mob/living/carbon/target)
	if(!QDELETED(target))
		for(var/A in mutations)
			target.dna.remove_mutation(A)
		for(var/A in disabilities)
			target.remove_disability(A, GENETICS_SPELL)