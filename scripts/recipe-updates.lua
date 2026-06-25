-- category_to_building = {
--     ["electromagnetics"]= "electromagnetic-plant",
--     ["electronics"]= "electromagnetic-plant",
--     ["electronics-with-fluid"]= "electromagnetic-plant",
--     ["electronics-or-assembling"]= "electromagnetic-plant",

--     ["metallurgy"]= "foundry" ,
--     ["pressing"]= "foundry" ,
--     ["metallurgy-or-assembling"]= "foundry" ,
--     ["crafting-with-fluid-or-metallurgy"]= "foundry",

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

changeCategory("steel-chest","pressing","transport-belt")
changeCategory("pumpjack","pressing","transport-belt")
changeCategory("pump","pressing","transport-belt")
changeCategory("offshore-pump","pressing","transport-belt")
changeCategory("barrel","pressing","transport-belt")
changeCategory("car","pressing","transport-belt")
changeCategory("tank","pressing","transport-belt")
changeCategory("storage-tank","pressing","transport-belt")
changeCategory("steam-turbine","pressing","transport-belt")
changeCategory("electric-mining-drill","pressing","transport-belt")

if inserters_in_em_plant then
    changeCategory("inserter","electronics","speed-module")
    changeCategory("long-handed-inserter","electronics","speed-module")
    changeCategory("fast-inserter","electronics","speed-module")
    changeCategory("filter-inserter","electronics","speed-module")
    changeCategory("stack-inserter","electronics","speed-module")
    changeCategory("bulk-inserter","electronics","speed-module")
end

changeCategory("space-platform-foundation","pressing","transport-belt")

changeCategory("locomotive","pressing","transport-belt")
changeCategory("cargo-wagon","pressing","transport-belt")
changeCategory("fluid-wagon","pressing","transport-belt")
changeCategory("artillery-wagon","pressing","transport-belt")
changeCategory("train-stop","pressing","transport-belt")
changeCategory("rail-signal","pressing","transport-belt")
changeCategory("rail-chain-signal","pressing","transport-belt")

changeCategory("artillery-turret","pressing","transport-belt")
changeCategory("artillery-shell","pressing","transport-belt")

changeCategory("cannon-shell","pressing","transport-belt")
changeCategory("explosive-cannon-shell","pressing","transport-belt")
changeCategory("uranium-cannon-shell","cryogenics-or-assembling","cryogenic-plant")
changeCategory("explosive-uranium-cannon-shell","cryogenics-or-assembling","cryogenic-plant")
changeCategory("rocket","pressing","transport-belt")
changeCategory("explosive-rocket","pressing","transport-belt")
changeCategory("atomic-bomb","cryogenics-or-assembling","cryogenic-plant")
changeCategory("firearm-magazine","pressing","transport-belt")
changeCategory("piercing-rounds-magazine","pressing","transport-belt")
changeCategory("uranium-rounds-magazine","cryogenics-or-assembling","cryogenic-plant")

changeCategory("defender-capsule","electronics","speed-module")
changeCategory("distractor-capsule","electronics","speed-module")
changeCategory("destroyer-capsule","electronics","speed-module")

changeCategory("poison-capsule","cryogenics-or-assembling","cryogenic-plant")
changeCategory("slowdown-capsule","cryogenics-or-assembling","cryogenic-plant")

changeCategory("electric-engine-unit","electronics-with-fluid","processing-unit")
changeCategory("flying-robot-frame","electronics","speed-module")

changeCategory("roboport","electronics","speed-module")
changeCategory("construction-robot","electronics","speed-module")
changeCategory("logistic-robot","electronics","speed-module")

if logi_in_em_plant then
    changeCategory("storage-chest","electronics","speed-module")
    changeCategory("passive-provider-chest","electronics","speed-module")
    changeCategory("buffer-chest","electronics","speed-module")
    changeCategory("requester-chest","electronics","speed-module")
    changeCategory("active-provider-chest","electronics","speed-module")
end

changeCategory("small-lamp","electronics","speed-module")
changeCategory("constant-combinator","electronics","speed-module")
changeCategory("arithmetic-combinator","electronics","speed-module")
changeCategory("decider-combinator","electronics","speed-module")
changeCategory("selector-combinator","electronics","speed-module")
changeCategory("power-switch","electronics","speed-module")
changeCategory("programmable-speaker","electronics","speed-module")
changeCategory("display-panel","electronics","speed-module")

changeCategory("radar","electronics","speed-module")

changeCategory("energy-shield-equipment","electronics","speed-module")
changeCategory("energy-shield-mk2-equipment","electronics","speed-module")
changeCategory("battery-equipment","electronics","speed-module")
changeCategory("battery-mk2-equipment","electronics","speed-module")
changeCategory("battery-mk3-equipment","electronics","speed-module")
changeCategory("solar-panel-equipment","electronics","speed-module")
changeCategory("laser-turret","electronics","speed-module")
changeCategory("personal-laser-defense-equipment","electronics","speed-module")

if personal_equip_em_plant then
    changeCategory("exoskeleton-equipment","electronics","speed-module")
    changeCategory("personal-roboport-equipment","electronics","speed-module")
    changeCategory("personal-roboport-mk2-equipment","electronics","speed-module")
    changeCategory("night-vision-equipment","electronics","speed-module")
    changeCategory("belt-immunity-equipment","electronics","speed-module")
    if nuclear_reactor_cryo_plant then
        changeCategory("fission-reactor-equipment","cryogenics-or-assembling","cryogenic-plant")
        changeCategory("fusion-reactor-equipment","cryogenics-or-assembling","cryogenic-plant")
    end
end

changeCategory("biolab","organic-or-assembling","rocket-fuel")

changeCategory("artificial-yumako-soil","organic-or-assembling","rocket-fuel")
changeCategory("overgrowth-yumako-soil","organic-or-assembling","rocket-fuel")
changeCategory("artificial-jellynut-soil","organic-or-assembling","rocket-fuel")
changeCategory("overgrowth-jellynut-soil","organic-or-assembling","rocket-fuel")
changeCategory("solid-fuel-from-light-oil","organic-or-chemistry","light-oil-cracking")
changeCategory("solid-fuel-from-petroleum-gas","organic-or-chemistry","light-oil-cracking")
changeCategory("solid-fuel-from-heavy-oil","organic-or-chemistry","light-oil-cracking")

changeCategory("recycler","pressing","transport-belt")

changeCategory("rail-support","pressing","transport-belt")
changeCategory("rail-ramp","pressing","transport-belt")

changeCategory("ice-platform","cryogenics-or-assembling","cryogenic-plant")
changeCategory("foundation","pressing","express-transport-belt")

if nuclear_reactor_cryo_plant then
    changeCategory("nuclear-reactor","cryogenics-or-assembling","cryogenic-plant")
end

if basic_science_changes then
    changeCategory("chemical-science-pack","organic-or-assembling","biochamber")
    changeCategory("production-science-pack","metallurgy-or-assembling","foundry")
    changeCategory("utility-science-pack","electronics-or-assembling","electromagnetic-plant")
    changeCategory("space-science-pack","cryogenics-or-assembling","cryogenic-plant")
end


----- MOD COMPAT
if mods["cargo-ships"] then
    log("Found compatible mod cargo-ships")
    changeCategory("boat","pressing","transport-belt")
    changeCategory("cargo_ship","pressing","transport-belt")
    changeCategory("oil_tanker","pressing","transport-belt")
    changeCategory("port","pressing","transport-belt")
    changeCategory("buoy","pressing","transport-belt")
    changeCategory("chain_buoy","pressing","transport-belt")
    changeCategory("floating-electric-pole","electronics","speed-module")
    if settings.startup["offshore_oil_enabled"].value then
        changeCategory("oil_rig","pressing","transport-belt")
    end
end

if mods["valves"] then
    log("Found compatible mod valves")
    changeCategory("valves-overflow","pressing","transport-belt")
    changeCategory("valves-top_up","pressing","transport-belt")
    changeCategory("valves-one_way","pressing","transport-belt")
end

if mods["aai-containers"] then
    log("Found compatible mod aai-containers")
    changeCategory("aai-strongbox","pressing","transport-belt")
    changeCategory("aai-storehouse","pressing","transport-belt")
    changeCategory("aai-warehouse","pressing","transport-belt")

    changeCategory("aai-strongbox-storage","electronics","speed-module")
    changeCategory("aai-strongbox-passive-provider","electronics","speed-module")
    changeCategory("aai-strongbox-buffer","electronics","speed-module")
    changeCategory("aai-strongbox-requester","electronics","speed-module")
    changeCategory("aai-strongbox-active-provider","electronics","speed-module")

    changeCategory("aai-storehouse-storage","electronics","speed-module")
    changeCategory("aai-storehouse-passive-provider","electronics","speed-module")
    changeCategory("aai-storehouse-buffer","electronics","speed-module")
    changeCategory("aai-storehouse-requester","electronics","speed-module")
    changeCategory("aai-storehouse-active-provider","electronics","speed-module")

    changeCategory("aai-warehouse-storage","electronics","speed-module")
    changeCategory("aai-warehouse-passive-provider","electronics","speed-module")
    changeCategory("aai-warehouse-buffer","electronics","speed-module")
    changeCategory("aai-warehouse-requester","electronics","speed-module")
    changeCategory("aai-warehouse-active-provider","electronics","speed-module")
end

if mods["vtk-cannon-turret"] then
    log("Found compatible mod vtk-cannon-turret")
    changeCategory("vtk-cannon-turret","pressing","transport-belt")
    changeCategory("vtk-cannon-turret-heavy","pressing","transport-belt")
end

if mods["doeworks-deer"] then
    log("Found compatible mod doeworks-deer")
    changeCategory("dw-deer-turret","pressing","transport-belt")
end

if mods["pushbutton"] then
    log("Found compatible mod pushbutton")
    changeCategory("pushbutton","electronics","speed-module")
end