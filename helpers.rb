# Given a tile's index (0 - 15), return a list of adjacent tile indexes
def get_adjacent_indexes(index)
    row = index / 4  # Ruby will round-down integer division
    col = index % 4

    adjacent_indexes = []
    adjacent_indexes.push(index - 4) if row > 0  # top
    adjacent_indexes.push(index + 4) if row < 3  # bottom
    adjacent_indexes.push(index - 1) if col > 0  # left
    adjacent_indexes.push(index + 1) if col < 3  # right
    adjacent_indexes.push(index - 5) if row > 0 && col > 0  # top-left
    adjacent_indexes.push(index - 3) if row > 0 && col < 3 # top-right
    adjacent_indexes.push(index + 3) if row < 3 && col > 0  # bottom-left
    adjacent_indexes.push(index + 5) if row < 3 && col < 3  # bottom-right

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


def check_word(board, word)
    word = word.upcase  # to prevent any casing issues

    first_letter = word[0]
    remaining_word = word[1..-1]
    can_form_word = false
    board.each_with_index do |tile, index|
        # find possible starts
        if tile == word[0] || tile == "*"
            can_form_word = check_next_letter(board, tile, index, remaining_word)
            break if can_form_word
        end
    end
    return can_form_word
end
