local Static = {}

local map_string = [[
#################################
#...............................#
#..##...........................#
#..##...............#...........#
#...................##..........#
#.....####...........#..........#
#.....#..#...........##.........#
#..#..#..#............###.......#
#.....####...........#####......#
#...............................#
#................###......##....#
#................###.....##.....#
#................###....###.....#
#...##...................#......#
#...####....#...................#
#....##....###........###.......#
#...........#..........##.......#
#....................####.......#
#...............................#
#...............................#
#...............................#
#################################
]]

Static.map = {size = {0, 0}, cels = {}}

do -- Generate map from ascii
    local width = #map_string:match("[^\n]+")
    local x = 0
    local y = 0
    for row in map_string:gmatch("[^\n]+") do
        Static.map.cels[y] = {}
        for char in row:gmatch(".") do
            Static.map.cels[y][x] = {}
            if char == '#' then
                Static.map.cels[y][x].type = 'wall'
            elseif char == 'A' then
                Static.map.cels[y][x].type = 'arch'
            elseif char == 'T' then
                Static.map.cels[y][x].type = 'trap'
            else
                Static.map.cels[y][x].type = 'floor'
            end
            x = x + 1
        end
        print(row)
        x = 0
        y = y + 1
    end
    print(width, y)
    Static.map.size = {width - 1, y - 1}
end

return Static