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


def check_next_letter(board, tile, tile_index, remaining_word)
    return true if remaining_word.length == 0

    adjacent_indexes = get_adjacent_indexes(tile_index)
    adjacent_indexes.each do |index|
        can_form_remaining = false
        if board[index] == remaining_word[0] || board[index] == "*"
            can_form_remaining = check_next_letter(board, board[index], index, remaining_word[1..-1])
        end

        return true if can_form_remaining
    end

    return false
end
