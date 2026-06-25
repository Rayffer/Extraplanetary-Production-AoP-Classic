
if not mods["maraxsis"] then
    log("Did not find compat maraxsis")
    return nil
end

log("Found compat maraxsis")

if data.raw["assembling-machine"]["maraxis-hydro-plant"] then maraxis_hydro_plant = data.raw["assembling-machine"]["maraxis-hydro-plant"] end

for _, category in pairs(data.raw["recipe-category"]) do
    if string.find(category.name,"hydraulics",1,true) then
        if maraxis_hydro_plant and not tableContains(maraxis_hydro_plant.crafting_categories,category.name) then
            table.insert(maraxis_hydro_plant.crafting_categories,category.name)
        end
    end
    if string.find(category.name,"hydro-plant",1,true) then
        if maraxis_hydro_plant and not tableContains(maraxis_hydro_plant.crafting_categories,category.name) then
            table.insert(maraxis_hydro_plant.crafting_categories,category.name)
        end
    end
end