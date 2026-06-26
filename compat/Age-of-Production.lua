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

if not mods["Age-of-Production-Classic"] then
    log("Did not find compat Age-of-Production-Classic")
    return nil
end

log("Found compat Age-of-Production-Classic")

local function add_categories(recipe_name, categories)
    local recipe = data.raw.recipe[recipe_name]
    if recipe and categories then
        recipe.categories = recipe.categories or {"crafting"}
        for _, cat in pairs(categories) do
            table.insert(recipe.categories, cat)
        end
    end
end

if data.raw["assembling-machine"]["aop-atomic-enricher"] then aop_atomic_enricher = data.raw["assembling-machine"]["aop-atomic-enricher"] end
if data.raw["assembling-machine"]["aop-greenhouse"] then aop_greenhouse = data.raw["assembling-machine"]["aop-greenhouse"] end
if data.raw["assembling-machine"]["aop-lumber-mill"] then aop_lumber_mill = data.raw["assembling-machine"]["aop-lumber-mill"] end
if data.raw["assembling-machine"]["aop-petrochemical-facility"] then aop_petrochemical_facility = data.raw["assembling-machine"]["aop-petrochemical-facility"] end
if data.raw["assembling-machine"]["aop-hydraulic-plant"] and not mods["maraxsis"] then aop_hydraulic_plant = data.raw["assembling-machine"]["aop-hydraulic-plant"] end
if data.raw["assembling-machine"]["aop-quantum-assembler"] then aop_quantum_assembler = data.raw["assembling-machine"]["aop-quantum-assembler"] end
if data.raw["assembling-machine"]["aop-armory"] then aop_armory = data.raw["assembling-machine"]["aop-armory"] end
if data.raw["assembling-machine"]["aop-mineral-synthesizer"] then aop_mineral_synthesizer = data.raw["assembling-machine"]["aop-mineral-synthesizer"] end
if data.raw["assembling-machine"]["aop-advanced-assembling-machine"] then aop_advanced_assembling_machine = data.raw["assembling-machine"]["aop-advanced-assembling-machine"] end

data:extend({
  {
    type = "recipe-category",
    name = "advanced-centrifuging",
  },
  {
    type = "recipe-category",
    name = "quantum-assembling",
  },
  {
    type = "recipe-category",
    name = "woodworking",
  },
  {
    type = "recipe-category",
    name = "hydraulics",
  },
  {
    type = "recipe-category",
    name = "petrochemistry",
  },
    {
    type = "recipe-category",
    name = "synthesis",
  },
  {
    type = "recipe-category",
    name = "agriculture",
  },
  {
    type = "recipe-category",
    name = "core-mining"
  },
  {
    type = "recipe-category",
    name = "ammunition"
  },
  {
    type = "recipe-category",
    name = "cryogenics"
  },
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
    if string.find(category.name,"electromagnetics",1,true) then
        if not tableContains(em_plant.crafting_categories,category.name) then
            table.insert(em_plant.crafting_categories,category.name)
            log("Added category "..category.name.." to em_plant")
        end
        if aop_advanced_assembling_machine and not tableContains(aop_advanced_assembling_machine.crafting_categories,category.name) then
            table.insert(aop_advanced_assembling_machine.crafting_categories,category.name)
            log("Added category "..category.name.." to aop_advanced_assembling_machine")
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
add_categories("atomic-bomb", {"cryogenics", "advanced-centrifuging", "crafting", "ammunition"})
if settings.startup["nuclear-reactor-cryo-plant"].value then
    add_categories("nuclear-reactor", { "cryogenics", "advanced-centrifuging", "crafting" })
end

--QUANTUM ASSEMBLER and SCIENCES

if settings.startup["basic-science-changes"].value then
    add_categories("chemical-science-pack", { "organic", "quantum-assembling", "crafting" })
    add_categories("production-science-pack", { "metallurgy", "quantum-assembling", "crafting" })
    add_categories("utility-science-pack", { "electromagnetics", "quantum-assembling", "crafting" })
    add_categories("space-science-pack", { "cryogenics", "quantum-assembling", "crafting" })
end

--BIOCHAMBER and BIOMECHANICAL FACILITY

add_categories("biolab", { "organic" })
add_categories("artificial-yumako-soil", { "organic" })
add_categories("overgrowth-yumako-soil", { "organic" })
add_categories("artificial-jellynut-soil", { "organic" })
add_categories("overgrowth-jellynut-soil", { "organic" })
add_categories("solid-fuel-from-light-oil", { "organic" })
add_categories("solid-fuel-from-petroleum-gas", { "organic" })
add_categories("solid-fuel-from-heavy-oil", { "organic" })


--FOUNDRY AND SMELTERY

add_categories("locomotive", { "electromagnetics", "crafting" })
add_categories("cargo-wagon", { "electromagnetics", "crafting" })
add_categories("fluid-wagon", { "electromagnetics", "crafting" })
add_categories("artillery-wagon", { "electromagnetics" })


--EM PLANT and ELECTROMECHANIC FACILITY

add_categories("energy-shield-equipment", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("energy-shield-mk2-equipment", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("battery-equipment", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("battery-mk2-equipment", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("battery-mk3-equipment", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("solar-panel-equipment", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("laser-turret", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("personal-laser-defense-equipment", { "electromagnetics", "electromagnetics", "crafting" })

add_categories("radar", { "electromagnetics", "electromagnetics", "crafting" })

add_categories("defender-capsule", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("distractor-capsule", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("destroyer-capsule", { "electromagnetics", "electromagnetics", "crafting" })

add_categories("roboport", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("construction-robot", { "electromagnetics", "electromagnetics", "crafting" })
add_categories("logistic-robot", { "electromagnetics", "electromagnetics", "crafting" })

add_categories("cargo-bay", { "electromagnetics", "crafting" })
add_categories("asteroid-collector", { "electromagnetics", "crafting" })
add_categories("crusher", { "electromagnetics", "crafting" })
add_categories("thruster", { "electromagnetics", "crafting" })

add_categories("beacon", { "electromagnetics", "electromagnetics", "crafting" })

if settings.startup["personal-equip-em-plant"].value then
    add_categories("exoskeleton-equipment", { "electromagnetics", "electromagnetics" })
    add_categories("personal-roboport-equipment", { "electromagnetics", "electromagnetics" })
    add_categories("personal-roboport-mk2-equipment", { "electromagnetics", "electromagnetics" })
    add_categories("night-vision-equipment", { "electromagnetics", "electromagnetics" })
    add_categories("belt-immunity-equipment", { "electromagnetics", "electromagnetics" })
    if settings.startup["nuclear-reactor-cryo-plant"].value then
        add_categories("fission-reactor-equipment", { "cryogenics", "electromagnetics" })
        add_categories("fusion-reactor-equipment", { "cryogenics", "electromagnetics" })
    end
end


--CRYO PLANT
add_categories("ammonial-holmium-solution", { "hydraulics", "chemistry", "cryogenics" })


--ASSEMBLING MACHINE

--CHEMISTRY and PETROCHEM
add_categories("solid-fuel-from-light-oil", { "petrochemistry", "organic", "chemistry" })
add_categories("solid-fuel-from-heavy-oil", { "petrochemistry", "organic", "chemistry" })
add_categories("solid-fuel-from-petroleum-gas", { "petrochemistry", "organic", "chemistry" })

--AMMUNITION
add_categories("artillery-shell", { "crafting", "ammunition" })
add_categories("cannon-shell", { "crafting", "ammunition" })
add_categories("explosive-cannon-shell", { "crafting", "ammunition" })
add_categories("uranium-cannon-shell", { "crafting", "cryogenics", "ammunition" })
add_categories("explosive-uranium-cannon-shell", { "crafting", "cryogenics", "ammunition" })
add_categories("rocket", { "crafting", "ammunition" })
add_categories("explosive-rocket", { "crafting", "ammunition" })
add_categories("firearm-magazine", { "crafting", "ammunition" })
add_categories("piercing-rounds-magazine", { "crafting", "ammunition" })
add_categories("uranium-rounds-magazine", { "crafting", "cryogenics", "ammunition" })

add_categories("military-science-pack", { "crafting", "quantum-assembling", "ammunition" })
add_categories("advanced-military-science-pack", { "quantum-assembling", "ammunition", "crafting-with-fluid" })

return skipped_recipes