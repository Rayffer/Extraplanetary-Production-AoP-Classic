--recipe is the string of a recipe
--category_type is the string used to indicate it is made in a certain machine; i.e. "pressing" or "metallurgy" for foundry
--machines is a table of machine names to check for category_type.
-- Any machine in the list will have its categories checked for category_type and have the new category added if it matches.
-- function only checks "assembling-machine" type machines
-- function aop_add_recipe_to_machine(recipe,category.name_type,machines)
--     if not data.raw["recipe"][recipe] then 
--         log("aop_add_recipe_to_machine failed to add "..recipe.." to ".. machine..": recipe does not exist")
--         return false
--     elseif not data.raw["assembling-machine"][machine] then 
--         log("aop_add_recipe_to_machine failed to add "..recipe.." to ".. machine..": machine does not exist")
--         return false
--     else

--     end
-- end

if not mods["Age-of-Production"] then
    log("Did not find compat Age-of-Production")
    return nil
end

log("Found compat Age-of-Production")

if data.raw["assembling-machine"]["aop-atomic-enricher"] then aop_atomic_enricher = data.raw["assembling-machine"]["aop-atomic-enricher"] end
if data.raw["assembling-machine"]["aop-biochemical-facility"] then aop_biomechanical_facility = data.raw["assembling-machine"]["aop-biochemical-facility"] end
if data.raw["assembling-machine"]["aop-electromechanic-facility"] then aop_electromechanic_facility = data.raw["assembling-machine"]["aop-electromechanic-facility"] end
if data.raw["assembling-machine"]["aop-greenhouse"] then aop_greenhouse = data.raw["assembling-machine"]["aop-greenhouse"] end
if data.raw["assembling-machine"]["aop-lumber-mill"] then aop_lumber_mill = data.raw["assembling-machine"]["aop-lumber-mill"] end
if data.raw["assembling-machine"]["aop-petrochemical-facility"] then aop_petrochemical_facility = data.raw["assembling-machine"]["aop-petrochemical-facility"] end
if data.raw["assembling-machine"]["aop-hydraulic-plant"] and not mods["maraxsis"] then aop_hydraulic_plant = data.raw["assembling-machine"]["aop-hydraulic-plant"] end
if data.raw["assembling-machine"]["aop-scrubber"] then aop_scrubber = data.raw["assembling-machine"]["aop-scrubber"] end
if data.raw["assembling-machine"]["aop-smeltery"] then aop_smeltery = data.raw["assembling-machine"]["aop-smeltery"] end
if data.raw["assembling-machine"]["aop-quantum-assembler"] then aop_quantum_assembler = data.raw["assembling-machine"]["aop-quantum-assembler"] end
if data.raw["assembling-machine"]["aop-armory"] then aop_armory = data.raw["assembling-machine"]["aop-armory"] end
if data.raw["assembling-machine"]["aop-mineral-synthesizer"] then aop_mineral_synthesizer = data.raw["assembling-machine"]["aop-mineral-synthesizer"] end
if data.raw["assembling-machine"]["aop-advanced-assembling-machine"] then aop_advanced_assembling_machine = data.raw["assembling-machine"]["aop-advanced-assembling-machine"] end

data:extend({
    {
        type = "recipe-category",
        name = "quantum-assembling-or-crafting-with-fluid",
    },
    {
        type = "recipe-category",
        name = "organic-or-quantum-assembling-or-crafting",
    },
    {
        type = "recipe-category",
        name = "organic-or-quantum-assembling-or-crafting-with-fluid",
    },
    {
        type = "recipe-category",
        name = "metallurgy-or-quantum-assembling-or-crafting",
    },
    {
        type = "recipe-category",
        name = "metallurgy-or-quantum-assembling-or-crafting-with-fluid",
    },
    {
        type = "recipe-category",
        name = "electronics-or-quantum-assembling-or-crafting",
    },
    {
        type = "recipe-category",
        name = "electronics-or-quantum-assembling-or-crafting-with-fluid",
    },
    {
        type = "recipe-category",
        name = "cryogenics-or-quantum-assembling-or-crafting",
    },
    {
        type = "recipe-category",
        name = "cryogenics-or-quantum-assembling-or-crafting-with-fluid",
    },
    {
        type = "recipe-category",
        name = "cryogenics-or-advanced-centrifuging",
    },
    {
      type = "recipe-category",
      name = "cryogenics-or-advanced-centrifuging-or-centrifuging",
    },
    {
      type = "recipe-category",
      name = "cryogenics-or-advanced-centrifuging-or-crafting",
    },
    {
      type = "recipe-category",
      name = "cryogenics-or-advanced-centrifuging-or-crafting-or-electromechanics",
    },
    {
      type = "recipe-category",
      name = "cryogenics-or-advanced-centrifuging-or-centrifuging",
    },
    {
      type = "recipe-category",
      name = "pressing-or-electromechanics-or-crafting",
    },
    {
      type = "recipe-category",
      name = "cryogenics-or-assembling-or-electromechanics",
    },
    {
      type = "recipe-category",
      name = "biochemistry-or-organic-or-quantum-assembling-or-crafting",
    },
    {
      type = "recipe-category",
      name = "electronics-or-electromechanics-or-crafting",
    },
    {
      type = "recipe-category",
      name = "pressing-or-ammunition",
    },
    {
      type = "recipe-category",
      name = "cryogenics-or-assembling-or-ammunition",
    },
    {
      type = "recipe-category",
      name = "cryogenics-or-advanced-centrifuging-or-crafting-or-ammunition",
    },
    {
      type = "recipe-category",
      name = "crafting-or-pressing-or-ammunition",
    },
    {
      type = "recipe-category",
      name = "crafting-or-cryogenics-or-ammunition",
    },
    {
      type = "recipe-category",
      name = "crafting-or-quantum-assembling-or-ammunition",
    }
})

--make sure all recipe categories are added to the appropriate machines
--works by checking for keywords within the category names that indicate what machines the category is for
--i.e. 'electronics' indicates the category is made in assembling machines and em plants, so a category including this word will be added to both.
--Due for an update to make adding new machines less manual
for _, category in pairs(data.raw["recipe-category"]) do
    if string.find(category.name,"basic-crafting",1,true) then
        if not tableContains(data.raw.character.character.crafting_categories,category.name) and not string.find(category.name,"assembling",1,true) then
            table.insert(data.raw.character.character.crafting_categories,category.name)
            log("Added category "..category.name.." to character")
        end
        if not tableContains(assembler_1.crafting_categories,category.name) then
            table.insert(assembler_1.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_1")
        end
        if not tableContains(assembler_2.crafting_categories,category.name) then
            table.insert(assembler_2.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_2")
        end
        if not tableContains(assembler_3.crafting_categories,category.name) then
            table.insert(assembler_3.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_3")
        end
        if aop_advanced_assembling_machine and not tableContains(aop_advanced_assembling_machine.crafting_categories,category.name) then
            table.insert(aop_advanced_assembling_machine.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_advanced_assembling_machine")
        end
    end
    if string.find(category.name,"advanced-crafting",1,true) then
        -- doesn't add the recipe to assembler 1's if it's a recipe with fluid since they don't (usually) have fluid ports
        if not tableContains(assembler_1.crafting_categories,category.name) and not string.find(category.name,"assembling",1,true) and not string.find(category.name,"fluid",1,true) then
            table.insert(assembler_1.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_1")
        end
        if not tableContains(assembler_2.crafting_categories,category.name) then
            table.insert(assembler_2.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_2")
        end
        if not tableContains(assembler_3.crafting_categories,category.name) then
            table.insert(assembler_3.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_3")
        end
        if aop_advanced_assembling_machine and not tableContains(aop_advanced_assembling_machine.crafting_categories,category.name) then
            table.insert(aop_advanced_assembling_machine.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_advanced_assembling_machine")
        end
    end

    --only 'crafting' and not 'basic-crafting' can be hand-crafted and made in assemblers
    if string.find(category.name,"crafting",1,true) and not string.find(category.name,"hand",1,true) and not string.find(category.name,"basic",1,true) and not string.find(category.name,"advanced-crafting",1,true) then
        if not tableContains(data.raw.character.character.crafting_categories,category.name) and not string.find(category.name,"assembling",1,true) and not string.find(category.name,"fluid",1,true) then
            table.insert(data.raw.character.character.crafting_categories,category.name)
            log("Added category "..category.name.." to character")
        end
        if not tableContains(assembler_1.crafting_categories,category.name) and not string.find(category.name,"fluid",1,true) then
            table.insert(assembler_1.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_1")
        end
        if not tableContains(assembler_2.crafting_categories,category.name) then
            table.insert(assembler_2.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_2")
        end
        if not tableContains(assembler_3.crafting_categories,category.name) then
            table.insert(assembler_3.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_3")
        end
        if aop_advanced_assembling_machine and not tableContains(aop_advanced_assembling_machine.crafting_categories,category.name) then
            table.insert(aop_advanced_assembling_machine.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_advanced_assembling_machine")
        end
    end
    if string.find(category.name,"assembling",1,true) then
        if not tableContains(assembler_1.crafting_categories,category.name)  and not string.find(category.name,"fluid",1,true) then
            table.insert(assembler_1.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_1")
        end
        if not tableContains(assembler_2.crafting_categories,category.name) then
            table.insert(assembler_2.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_2")
        end
        if not tableContains(assembler_3.crafting_categories,category.name) then
            table.insert(assembler_3.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_3")
        end
        if aop_advanced_assembling_machine and not tableContains(aop_advanced_assembling_machine.crafting_categories,category.name) then
            table.insert(aop_advanced_assembling_machine.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_advanced_assembling_machine")
        end
    end
    if string.find(category.name,"hand-crafting",1,true) then
        if not tableContains(data.raw.character.character.crafting_categories,category.name) then
            table.insert(data.raw.character.character.crafting_categories,category.name)
            log("Added category "..category.name.." to character")
        end
    end
    if string.find(category.name,"chemistry",1,true) then
        if not tableContains(chemical_plant.crafting_categories,category.name) then
            table.insert(chemical_plant.crafting_categories,category.name)
            log("Added category "..category.name.." to chemical_plant")
        end
    end
    if string.find(category.name,"electronics",1,true) then
        if not tableContains(assembler_1.crafting_categories,category.name) and not string.find(category.name,"fluid",1,true) then
            table.insert(assembler_1.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_1")
        end
        if not tableContains(assembler_2.crafting_categories,category.name) then
            table.insert(assembler_2.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_2")
        end
        if not tableContains(assembler_3.crafting_categories,category.name) then
            table.insert(assembler_3.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_3")
        end
        if not tableContains(em_plant.crafting_categories,category.name) then
            table.insert(em_plant.crafting_categories,category.name)
            log("Added category "..category.name.." to em_plant")
        end
        if aop_advanced_assembling_machine and not tableContains(aop_advanced_assembling_machine.crafting_categories,category.name) then
            table.insert(aop_advanced_assembling_machine.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_advanced_assembling_machine")
        end
    end
    if string.find(category.name,"pressing",1,true) then
        if not tableContains(assembler_1.crafting_categories,category.name) and not string.find(category.name,"fluid",1,true) then
            table.insert(assembler_1.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_1")
        end
        if not tableContains(assembler_2.crafting_categories,category.name) then
            table.insert(assembler_2.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_2")
        end
        if not tableContains(assembler_3.crafting_categories,category.name) then
            table.insert(assembler_3.crafting_categories,category.name)
            log("Added category "..category.name.." to assembler_3")
        end
        if not tableContains(foundry.crafting_categories,category.name) then
            table.insert(foundry.crafting_categories,category.name)
            log("Added category "..category.name.." to foundry")
        end
        if aop_advanced_assembling_machine and not tableContains(aop_advanced_assembling_machine.crafting_categories,category.name) then
            table.insert(aop_advanced_assembling_machine.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_advanced_assembling_machine")
        end
    end
    if string.find(category.name,"metallurgy",1,true) then
        if not tableContains(foundry.crafting_categories,category.name) then
            table.insert(foundry.crafting_categories,category.name)
            log("Added category "..category.name.." to foundry")
        end
    end
    if string.find(category.name,"electromagnetics",1,true) then
        if not tableContains(em_plant.crafting_categories,category.name) then
            table.insert(em_plant.crafting_categories,category.name)
            log("Added category "..category.name.." to em_plant")
        end
    end
    if string.find(category.name,"organic",1,true) then
        if not tableContains(biochamber.crafting_categories,category.name) then
            table.insert(biochamber.crafting_categories,category.name)
            log("Added category "..category.name.." to biochamber")
        end
    end
    if string.find(category.name,"cryogenics",1,true) then
        if not tableContains(cryo_plant.crafting_categories,category.name) then
            table.insert(cryo_plant.crafting_categories,category.name)
            log("Added category "..category.name.." to cryo_plant")
        end
    end
    if string.find(category.name,"centrifuging",1,true) and not string.find(category.name,"advanced-centrifuging",1,true) then
        if not tableContains(centrifuge.crafting_categories,category.name) then
            table.insert(centrifuge.crafting_categories,category.name)
            log("Added category "..category.name.." to centrifuge")
        end
        if aop_atomic_enricher and not tableContains(aop_atomic_enricher.crafting_categories,category.name) then
            table.insert(aop_atomic_enricher.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_atomic_enricher")
        end
    end
    if string.find(category.name,"advanced-centrifuging",1,true) then
        if aop_atomic_enricher and not tableContains(aop_atomic_enricher.crafting_categories,category.name) then
            table.insert(aop_atomic_enricher.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_atomic_enricher")
        end
    end
    if string.find(category.name,"quantum-assembling",1,true) then
        if aop_quantum_assembler and not tableContains(aop_quantum_assembler.crafting_categories,category.name) then
            table.insert(aop_quantum_assembler.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_quantum_assembler")
        end
    end
    if string.find(category.name,"biochemistry",1,true) then
        if aop_biomechanical_facility and not tableContains(aop_biomechanical_facility.crafting_categories,category.name) then
            table.insert(aop_biomechanical_facility.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_biomechanical_facility")
        end
    end
    if string.find(category.name,"electromechanics",1,true) then
        if aop_electromechanic_facility and not tableContains(aop_electromechanic_facility.crafting_categories,category.name) then
            table.insert(aop_electromechanic_facility.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_electromechanic_facility")
        end
    end
    if string.find(category.name,"petrochemistry",1,true) then
        if aop_petrochemical_facility and not tableContains(aop_petrochemical_facility.crafting_categories,category.name) then
            table.insert(aop_petrochemical_facility.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_petrochemical_facility")
        end
    end
    if string.find(category.name,"hydraulics",1,true) then
        if aop_hydraulic_plant and not tableContains(aop_hydraulic_plant.crafting_categories,category.name) then
            table.insert(aop_hydraulic_plant.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_hydraulic_plant")
        end
    end
    if string.find(category.name,"ammunition",1,true) then
        if data.raw["assembling-machine"]["aop-armory"] and not tableContains(data.raw["assembling-machine"]["aop-armory"].crafting_categories,category.name) then
            table.insert(data.raw["assembling-machine"]["aop-armory"].crafting_categories,category.name)
            log("Added category "..category.name.." to aop_armory")
        end
    end
    if string.find(category.name,"synthesis",1,true) then
        if aop_mineral_synthesizer and not tableContains(aop_mineral_synthesizer.crafting_categories,category.name) then
            table.insert(aop_mineral_synthesizer.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_mineral_synthesizer")
        end
    end
end

--CENTRIFUGE and ATOMIC ENRICHER
changeCategory("atomic-bomb","cryogenics-or-advanced-centrifuging-or-crafting-or-ammunition")
if settings.startup["nuclear-reactor-cryo-plant"].value then
    changeCategory("nuclear-reactor","cryogenics-or-advanced-centrifuging-or-crafting")
end

--QUANTUM ASSEMBLER and SCIENCES

if settings.startup["basic-science-changes"].value then
    changeCategory("chemical-science-pack","biochemistry-or-organic-or-quantum-assembling-or-crafting")
    changeCategory("production-science-pack","metallurgy-or-quantum-assembling-or-crafting")
    changeCategory("utility-science-pack","electronics-or-quantum-assembling-or-crafting")
    changeCategory("space-science-pack","cryogenics-or-quantum-assembling-or-crafting")
end

--BIOCHAMBER and BIOMECHANICAL FACILITY

changeCategory("biolab","biochemistry-or-organic-or-assembling")
changeCategory("artificial-yumako-soil","biochemistry-or-organic-or-assembling")
changeCategory("overgrowth-yumako-soil","biochemistry-or-organic-or-assembling")
changeCategory("artificial-jellynut-soil","biochemistry-or-organic-or-assembling")
changeCategory("overgrowth-jellynut-soil","biochemistry-or-organic-or-assembling")
changeCategory("solid-fuel-from-light-oil","biochemistry-or-organic-or-assembling")
changeCategory("solid-fuel-from-petroleum-gas","biochemistry-or-organic-or-assembling")
changeCategory("solid-fuel-from-heavy-oil","biochemistry-or-organic-or-assembling")


--FOUNDRY AND SMELTERY

changeCategory("locomotive","pressing-or-electromechanics-or-crafting")
changeCategory("cargo-wagon","pressing-or-electromechanics-or-crafting")
changeCategory("fluid-wagon","pressing-or-electromechanics-or-crafting")
changeCategory("artillery-wagon","pressing-or-electromechanics")


--EM PLANT and ELECTROMECHANIC FACILITY

changeCategory("energy-shield-equipment","electronics-or-electromechanics-or-crafting")
changeCategory("energy-shield-mk2-equipment","electronics-or-electromechanics-or-crafting")
changeCategory("battery-equipment","electronics-or-electromechanics-or-crafting")
changeCategory("battery-mk2-equipment","electronics-or-electromechanics-or-crafting")
changeCategory("battery-mk3-equipment","electronics-or-electromechanics-or-crafting")
changeCategory("solar-panel-equipment","electronics-or-electromechanics-or-crafting")
changeCategory("laser-turret","electronics-or-electromechanics-or-crafting")
changeCategory("personal-laser-defense-equipment","electronics-or-electromechanics-or-crafting")

changeCategory("radar","electronics-or-electromechanics-or-crafting")

changeCategory("defender-capsule","electronics-or-electromechanics-or-crafting")
changeCategory("distractor-capsule","electronics-or-electromechanics-or-crafting")
changeCategory("destroyer-capsule","electronics-or-electromechanics-or-crafting")

changeCategory("roboport","electronics-or-electromechanics-or-crafting")
changeCategory("construction-robot","electronics-or-electromechanics-or-crafting")
changeCategory("logistic-robot","electronics-or-electromechanics-or-crafting")

changeCategory("cargo-bay","electromechanics-or-crafting")
changeCategory("asteroid-collector","electromechanics-or-crafting")
changeCategory("crusher","electromechanics-or-crafting")
changeCategory("thruster","electromechanics-or-crafting")

changeCategory("beacon","electronics-or-electromechanics-or-crafting")

if settings.startup["personal-equip-em-plant"].value then
    changeCategory("exoskeleton-equipment","electronics-or-electromechanics")
    changeCategory("personal-roboport-equipment","electronics-or-electromechanics")
    changeCategory("personal-roboport-mk2-equipment","electronics-or-electromechanics")
    changeCategory("night-vision-equipment","electronics-or-electromechanics")
    changeCategory("belt-immunity-equipment","electronics-or-electromechanics")
    if settings.startup["nuclear-reactor-cryo-plant"].value then
        changeCategory("fission-reactor-equipment","cryogenics-or-assembling-or-electromechanics")
        changeCategory("fusion-reactor-equipment","cryogenics-or-assembling-or-electromechanics")
    end
end


--CRYO PLANT
changeCategory("ammonial-holmium-solution","hydraulics-or-chemistry-or-cryogenics")


--ASSEMBLING MACHINE

--CHEMISTRY and PETROCHEM
changeCategory("solid-fuel-from-light-oil","petrochemistry-or-organic-or-chemistry")
changeCategory("solid-fuel-from-heavy-oil","petrochemistry-or-organic-or-chemistry")
changeCategory("solid-fuel-from-petroleum-gas","petrochemistry-or-organic-or-chemistry")

--AMMUNITION
changeCategory("artillery-shell","crafting-or-pressing-or-ammunition")
changeCategory("cannon-shell","crafting-or-pressing-or-ammunition")
changeCategory("explosive-cannon-shell","crafting-or-pressing-or-ammunition")
changeCategory("uranium-cannon-shell","crafting-or-cryogenics-or-ammunition")
changeCategory("explosive-uranium-cannon-shell","crafting-or-cryogenics-or-ammunition")
changeCategory("rocket","crafting-or-pressing-or-ammunition")
changeCategory("explosive-rocket","crafting-or-pressing-or-ammunition")
changeCategory("firearm-magazine","crafting-or-pressing-or-ammunition")
changeCategory("piercing-rounds-magazine","crafting-or-pressing-or-ammunition")
changeCategory("uranium-rounds-magazine","crafting-or-cryogenics-or-ammunition")

changeCategory("military-science-pack","crafting-or-quantum-assembling-or-ammunition")
changeCategory("advanced-military-science-pack","crafting-or-quantum-assembling-or-ammunition")

return skipped_recipes