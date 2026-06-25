log("Basic Compat | This feature may add recipes to the wrong machines, but should make sure they're in the right ones too.")
log("Basic Compat | Extraplanetary production is primarily focused around vanilla, and has only partial support for other mods.")
log("Basic Compat | If this is an issue, you can disable it in the mod settings.")
for _, machine in ipairs(data.raw["assembling-machine"]) do
    log("Basic Compat | Looking at /'"..machine.name.."/'")

    --skip AoP stuff since we'd be doing it twice (and also messing up the quantum assembler)
    if not string.find(machine.name,"aop-") then

    --assemblers can assemble, who knew
        if string.find(machine.name,"assembler") then
            log("Basic Compat | Detected /'"..machine.name.."/' as an assembler.")
            for _, category in ipairs(data.raw["recipe-category"]) do
                if (string.find(category,"assembling") or string.find(category,"crafting")) then
                    if (string.find(category,"fluid") and data.raw["assembling-machine"][machine].fluid_boxes) or not string.find(category,"fluid") then
                        table.insert(data.raw["assembling-machine"][machine].crafting_categories,category)
                        log("Basic Compat | Added category /'"..category.."/' to /'".. machine.name.."/'")
                    end
                end
            end
        end

        --chemical plants can... chemistry?
        if string.find(machine.name,"chemical-plant") then
            log("Basic Compat | Detected /'"..machine.name.."/' as a chemical plant.")
            for _, category in ipairs(data.raw["recipe-category"]) do
                if string.find(category,"chemistry") then
                    if data.raw["assembling-machine"][machine].fluid_boxes then
                        table.insert(data.raw["assembling-machine"][machine].crafting_categories,category)
                        log("Basic Compat | Added category /'"..category.."/' to /'".. machine.name.."/'")
                    end
                end
            end
        end

    else
        log("Machine contains /'aop/', skipping.")
    end
end