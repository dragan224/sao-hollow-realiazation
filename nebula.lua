function search(id)
    --Scan
    local scan = createMemScan(true)
    scan.setOnlyOneResult(false)
    scan.firstScan(soExactValue, vtDword, rtRounded, id, nil, 0, 0xFFFFFFFF, "", fsmAligned, "4", true, false, false, false)
    scan.waitTillDone()

    --Fetch result
    local result = createFoundList(scan)
    result.initialize()

    return result.Address[result.Count-1]
end


--Swap Skills
local address_to = tonumber(search("0x00230438"), 16)
local address_from = tonumber(search("0x002303F2"), 16)

for i = 4, 63 do
    WriteBytes(address_to + i, ReadBytes(address_from + i))
end

