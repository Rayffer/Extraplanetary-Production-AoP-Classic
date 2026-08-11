-- category_to_building = {
--     ["electromagnetics"]= "electromagnetic-plant",

--     ["metallurgy"]= "foundry" ,

--     ["cryogenics"]= "cryogenic-plant",
--     ["cryogenics-or-assembling"]= "cryogenic-plant",
--     ["chemistry-or-cryogenics"]= "cryogenic-plant",

--     ["organic"]= "biochamber",
--     ["organic-or-assembling"]= "biochamber",
--     ["organic-or-chemistry"]= "biochamber",
-- }

basic_science_changes = settings.startup["basic-science-changes"].value
adv_science_changes = settings.startup["adv-science-recipes"].value
personal_equip_em_plant = settings.startup["personal-equip-em-plant"].value
nuclear_reactor_cryo_plant = settings.startup["nuclear-reactor-cryo-plant"].value
logi_in_em_plant = settings.startup["logi-in-em-plant"].value
inserters_in_em_plant = settings.startup["inserters-in-em-plant"].value

changeCategory("steel-chest","metallurgy","transport-belt")
changeCategory("pumpjack","metallurgy","transport-belt")
changeCategory("pump","metallurgy","transport-belt")
changeCategory("offshore-pump","metallurgy","transport-belt")
changeCategory("barrel","metallurgy","transport-belt")
changeCategory("car","metallurgy","transport-belt")
changeCategory("tank","metallurgy","transport-belt")
changeCategory("storage-tank","metallurgy","transport-belt")
changeCategory("steam-turbine","metallurgy","transport-belt")
changeCategory("electric-mining-drill","metallurgy","transport-belt")

if inserters_in_em_plant then
    changeCategory("inserter","electromagnetics","speed-module")
    changeCategory("long-handed-inserter","electromagnetics","speed-module")
    changeCategory("fast-inserter","electromagnetics","speed-module")
    changeCategory("filter-inserter","electromagnetics","speed-module")
    changeCategory("stack-inserter","electromagnetics","speed-module")
    changeCategory("bulk-inserter","electromagnetics","speed-module")
end

changeCategory("space-platform-foundation","metallurgy","transport-belt")

changeCategory("locomotive","metallurgy","transport-belt")
changeCategory("cargo-wagon","metallurgy","transport-belt")
changeCategory("fluid-wagon","metallurgy","transport-belt")
changeCategory("artillery-wagon","metallurgy","transport-belt")
changeCategory("train-stop","metallurgy","transport-belt")
changeCategory("rail-signal","metallurgy","transport-belt")
changeCategory("rail-chain-signal","metallurgy","transport-belt")

changeCategory("artillery-turret","metallurgy","transport-belt")
changeCategory("artillery-shell","metallurgy","transport-belt")

changeCategory("cannon-shell","metallurgy","transport-belt")
changeCategory("explosive-cannon-shell","metallurgy","transport-belt")
changeCategory("uranium-cannon-shell","cryogenics","cryogenic-plant")
changeCategory("explosive-uranium-cannon-shell","cryogenics","cryogenic-plant")
changeCategory("rocket","metallurgy","transport-belt")
changeCategory("explosive-rocket","metallurgy","transport-belt")
changeCategory("atomic-bomb","cryogenics","cryogenic-plant")
changeCategory("firearm-magazine","metallurgy","transport-belt")
changeCategory("piercing-rounds-magazine","metallurgy","transport-belt")
changeCategory("uranium-rounds-magazine","cryogenics","cryogenic-plant")

changeCategory("defender-capsule","electromagnetics","speed-module")
changeCategory("distractor-capsule","electromagnetics","speed-module")
changeCategory("destroyer-capsule","electromagnetics","speed-module")

changeCategory("poison-capsule","cryogenics","cryogenic-plant")
changeCategory("slowdown-capsule","cryogenics","cryogenic-plant")

changeCategory("electric-engine-unit","electronics-with-fluid","processing-unit")
changeCategory("flying-robot-frame","electromagnetics","speed-module")

changeCategory("roboport","electromagnetics","speed-module")
changeCategory("construction-robot","electromagnetics","speed-module")
changeCategory("logistic-robot","electromagnetics","speed-module")

if logi_in_em_plant then
    changeCategory("storage-chest","electromagnetics","speed-module")
    changeCategory("passive-provider-chest","electromagnetics","speed-module")
    changeCategory("buffer-chest","electromagnetics","speed-module")
    changeCategory("requester-chest","electromagnetics","speed-module")
    changeCategory("active-provider-chest","electromagnetics","speed-module")
end

changeCategory("small-lamp","electromagnetics","speed-module")
changeCategory("constant-combinator","electromagnetics","speed-module")
changeCategory("arithmetic-combinator","electromagnetics","speed-module")
changeCategory("decider-combinator","electromagnetics","speed-module")
changeCategory("selector-combinator","electromagnetics","speed-module")
changeCategory("power-switch","electromagnetics","speed-module")
changeCategory("programmable-speaker","electromagnetics","speed-module")
changeCategory("display-panel","electromagnetics","speed-module")

changeCategory("radar","electromagnetics","speed-module")

changeCategory("energy-shield-equipment","electromagnetics","speed-module")
changeCategory("energy-shield-mk2-equipment","electromagnetics","speed-module")
changeCategory("battery-equipment","electromagnetics","speed-module")
changeCategory("battery-mk2-equipment","electromagnetics","speed-module")
changeCategory("battery-mk3-equipment","electromagnetics","speed-module")
changeCategory("solar-panel-equipment","electromagnetics","speed-module")
changeCategory("laser-turret","electromagnetics","speed-module")
changeCategory("personal-laser-defense-equipment","electromagnetics","speed-module")

if personal_equip_em_plant then
    changeCategory("exoskeleton-equipment","electromagnetics","speed-module")
    changeCategory("personal-roboport-equipment","electromagnetics","speed-module")
    changeCategory("personal-roboport-mk2-equipment","electromagnetics","speed-module")
    changeCategory("night-vision-equipment","electromagnetics","speed-module")
    changeCategory("belt-immunity-equipment","electromagnetics","speed-module")
end

if nuclear_reactor_cryo_plant then
    changeCategory("fission-reactor-equipment","cryogenics","cryogenic-plant")
    changeCategory("fusion-reactor-equipment","cryogenics","cryogenic-plant")
end

if adv_science_changes then
    changeCategory("chemical-science-pack","organic", "biochamber")
    changeCategory("production-science-pack","metallurgy", "foundry")
    changeCategory("utility-science-pack","electronics", "electromagnetic-plant")
    changeCategory("space-science-pack","cryogenics","cryogenic-plant")
end

changeCategory("biolab","organic","rocket-fuel")

changeCategory("artificial-yumako-soil","organic","rocket-fuel")
changeCategory("overgrowth-yumako-soil","organic","rocket-fuel")
changeCategory("artificial-jellynut-soil","organic","rocket-fuel")
changeCategory("overgrowth-jellynut-soil","organic","rocket-fuel")
changeCategory("solid-fuel-from-light-oil","organic-or-chemistry","light-oil-cracking")
changeCategory("solid-fuel-from-petroleum-gas","organic-or-chemistry","light-oil-cracking")
changeCategory("solid-fuel-from-heavy-oil","organic-or-chemistry","light-oil-cracking")

changeCategory("recycler","metallurgy","transport-belt")

changeCategory("rail-support","metallurgy","transport-belt")
changeCategory("rail-ramp","metallurgy","transport-belt")

changeCategory("foundation","metallurgy","express-transport-belt")

if nuclear_reactor_cryo_plant then
    changeCategory("nuclear-reactor","cryogenics","cryogenic-plant")
end

----- MOD COMPAT
if mods["cargo-ships"] then
    log("Found compatible mod cargo-ships")
    changeCategory("boat","metallurgy","transport-belt")
    changeCategory("cargo_ship","metallurgy","transport-belt")
    changeCategory("oil_tanker","metallurgy","transport-belt")
    changeCategory("port","metallurgy","transport-belt")
    changeCategory("buoy","metallurgy","transport-belt")
    changeCategory("chain_buoy","metallurgy","transport-belt")
    changeCategory("floating-electric-pole","electromagnetics","speed-module")
    if settings.startup["offshore_oil_enabled"].value then
        changeCategory("oil_rig","metallurgy","transport-belt")
    end
end

if mods["valves"] then
    log("Found compatible mod valves")
    changeCategory("valves-overflow","metallurgy","transport-belt")
    changeCategory("valves-top_up","metallurgy","transport-belt")
    changeCategory("valves-one_way","metallurgy","transport-belt")
end

if mods["configurable-valves"] then
    log("Found compatible mod configurable-valves")
    changeCategory("configurable-valve","metallurgy","transport-belt")
end

if mods["aai-containers"] then
    log("Found compatible mod aai-containers")
    changeCategory("aai-strongbox","metallurgy","transport-belt")
    changeCategory("aai-storehouse","metallurgy","transport-belt")
    changeCategory("aai-warehouse","metallurgy","transport-belt")

    changeCategory("aai-strongbox-storage","electromagnetics","speed-module")
    changeCategory("aai-strongbox-passive-provider","electromagnetics","speed-module")
    changeCategory("aai-strongbox-buffer","electromagnetics","speed-module")
    changeCategory("aai-strongbox-requester","electromagnetics","speed-module")
    changeCategory("aai-strongbox-active-provider","electromagnetics","speed-module")

    changeCategory("aai-storehouse-storage","electromagnetics","speed-module")
    changeCategory("aai-storehouse-passive-provider","electromagnetics","speed-module")
    changeCategory("aai-storehouse-buffer","electromagnetics","speed-module")
    changeCategory("aai-storehouse-requester","electromagnetics","speed-module")
    changeCategory("aai-storehouse-active-provider","electromagnetics","speed-module")

    changeCategory("aai-warehouse-storage","electromagnetics","speed-module")
    changeCategory("aai-warehouse-passive-provider","electromagnetics","speed-module")
    changeCategory("aai-warehouse-buffer","electromagnetics","speed-module")
    changeCategory("aai-warehouse-requester","electromagnetics","speed-module")
    changeCategory("aai-warehouse-active-provider","electromagnetics","speed-module")
end

if mods["vtk-cannon-turret"] then
    log("Found compatible mod vtk-cannon-turret")
    changeCategory("vtk-cannon-turret","metallurgy","transport-belt")
    changeCategory("vtk-cannon-turret-heavy","metallurgy","transport-belt")
end

if mods["doeworks-deer"] then
    log("Found compatible mod doeworks-deer")
    changeCategory("dw-deer-turret","metallurgy","transport-belt")
end

if mods["pushbutton"] then
    log("Found compatible mod pushbutton")
    changeCategory("pushbutton","electromagnetics","speed-module")
end