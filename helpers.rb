# Given a tile's index (0 - 15), return a list of adjacent tile indexes
def get_adjacent_indexes(index)
    row = index / 4
    col = index % 4

    adjacent_indexes = []
    if row > 0
        adjacent_indexes.push(index - 4)  # top
    end
    if row < 3
        adjacent_indexes.push(index + 4)  # bottom
    end
    if col > 0
        adjacent_indexes.push(index - 1)  # left
    end
    if col < 3
        adjacent_indexes.push(index + 1)  # right
    end
    if row > 0 && col > 0
        adjacent_indexes.push(index - 5)  # top-left
    end
    if row > 0 && col < 3
        adjacent_indexes.push(index - 3)  # top-right
    end
    if row < 3 && col > 0
        adjacent_indexes.push(index + 3)  # bottom-left
    end
    if row < 3 && col < 3
        adjacent_indexes.push(index + 5)  # bottom-right
    end

    return adjacent_indexes
end
