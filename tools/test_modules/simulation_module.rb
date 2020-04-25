module Simulation

    #Test 1:
    #King can capture a piece checking him while there is two pieces checking him.
    def simulation_1(board)
        simulate_intro = [
            [[1, 3], [2, 3]], [[2, 3], [3, 3]], [[6, 3], [5, 3]], 
            [[5, 3], [4, 3]], [[0, 3], [2, 3]], [[2, 3], [4, 1]],
            [[4, 1], [4, 3]], [[4, 3], [7, 3]], [[6, 5], [5, 5]],
            [[0, 2], [5, 6]]
        ]
        simulate_intro.each do | start, dest = sub_arr |
            board.move_piece(start, dest)
        end
    end

    #Test 2:
    #Another piece of the kings color can capture a piece that is currently
    #checking the king if the king can't check.
    def simulation_2(board)
        simulate_intro = [
            [[1, 3], [2, 3]], [[2, 3], [3, 3]], [[6, 3], [5, 3]], 
            [[5, 3], [4, 3]], [[0, 3], [2, 3]], [[2, 3], [4, 1]],
            [[4, 1], [4, 3]], [[4, 3], [7, 3]], [[0, 1], [5, 4]],
            [[7, 1], [5, 2]], [[7, 0], [4, 3]]
        ]
        simulate_intro.each do | start, dest = sub_arr |
            board.move_piece(start, dest)
        end
    end

    #Test 3:
    #Another simulation to show that you can capture with a king or just capture
    #with another piece when in check.
    def simulation_3(board)
        simulate_intro = [
            [[1, 3], [2, 3]], [[2, 3], [3, 3]], [[6, 3], [5, 3]], 
            [[5, 3], [4, 3]], [[0, 3], [2, 3]], [[2, 3], [4, 1]],
            [[4, 1], [4, 3]], [[4, 3], [7, 3]], [[7, 1], [5, 2]],
            [[7, 0], [4, 3]]
        ]
        simulate_intro.each do | start, dest = sub_arr |
            board.move_piece(start, dest)
        end
    end

    #Test 4
    #Another simulation with just two kings left and a pawn. This is to remove the
    #king shit

    def simulation_4(board)
        simulate_intro = [
            [[1, 3], [2, 3]], [[2, 3], [3, 3]], [[6, 3], [5, 3]], 
            [[5, 3], [4, 3]], [[0, 3], [2, 3]], [[2, 3], [4, 1]],
            [[4, 1], [4, 3]], [[4, 3], [7, 3]], [[7, 1], [5, 2]],
            [[7, 0], [4, 3]], [[7, 3], [5, 2]], [[6, 1], [5, 2]],
        ]
        simulate_intro.each do | start, dest = sub_arr |
            board.move_piece(start, dest)
        end
    end

    #Test 5
    #Another simulation to show that you can block to protect the king in check
    def simulation_5(board)
        simulate_intro = [
            [[1, 3], [2, 3]], [[2, 3], [3, 3]], [[6, 3], [5, 3]], 
            [[5, 3], [4, 3]], [[0, 3], [2, 3]], [[2, 3], [4, 1]],
            [[4, 1], [4, 3]], [[4, 3], [7, 3]], [[7, 1], [5, 2]],
            [[7, 0], [4, 3]], [[7, 3], [5, 2]]
        ]
        simulate_intro.each do | start, dest = sub_arr |
            board.move_piece(start, dest)
        end
    end

    #Test 6 Castling
    def simulation_6(board)
        simulate_intro = [
            [[6, 1], [5, 1]], [[6, 2], [5, 2]], [[6, 3], [5, 3]], 
            [[7, 1], [5, 0]], [[7, 2], [6, 1]], [[7, 3], [6, 3]],
            [[1, 3], [3, 3]], [[6, 4], [4, 4]], [[0, 3], [2, 3]],
            [[2, 3], [4, 5]], [[4, 5], [5, 4]], [[7, 5], [6, 4]],
            [[7, 6], [5, 7]]
        ]
        simulate_intro.each do | start, dest = sub_arr |
            board.move_piece(start, dest)
        end
    end

    #Test 7 Castling works if theres a piece checking through a pathway where
    #the king is not passing through, this is the edge case for where there are
    #three empty spaces between king and rook on the left of the board. The most
    #left empty space does not have to check for checks as only the rook will 
    #pass through it.
    def simulation_7(board)
        simulate_intro = [
            [[6, 1], [5, 1]], [[6, 2], [5, 2]], [[6, 3], [5, 3]], 
            [[7, 1], [5, 0]], [[7, 2], [6, 1]], [[7, 3], [6, 3]],
            [[1, 3], [3, 3]], [[6, 4], [4, 4]], [[0, 3], [2, 3]],
            [[2, 3], [4, 5]], [[4, 5], [5, 4]], [[7, 5], [6, 4]],
            [[7, 6], [5, 7]], [[5, 4], [5, 3]], [[5, 3], [5, 2]],
            [[5, 2], [5, 1]], [[5, 1], [6, 1]], [[6, 1], [3, 1]],
            [[6, 3], [4, 2]], [[4, 2], [1, 2]], [[1, 2], [0, 1]],
            [[0, 1], [1, 1]], [[0, 2], [2, 4]], [[1, 1], [3, 1]],
            [[2, 4], [1, 3]]
        ]
        simulate_intro.each do | start, dest = sub_arr |
            board.move_piece(start, dest)
        end
    end

    #Test 8: After castling create a check
    def simulation_8(board)
        simulate_intro = [
            [[6, 1], [5, 1]], [[6, 2], [5, 2]], [[6, 3], [5, 3]], 
            [[7, 1], [5, 0]], [[7, 2], [6, 1]], [[7, 3], [6, 3]],
            [[1, 3], [3, 3]], [[6, 4], [4, 4]], [[0, 3], [2, 3]],
            [[2, 3], [4, 5]], [[4, 5], [5, 4]], [[7, 5], [6, 4]],
            [[7, 6], [5, 7]], [[5, 4], [5, 3]], [[5, 3], [5, 2]],
            [[5, 2], [5, 1]], [[5, 1], [6, 1]], [[6, 1], [3, 1]],
            [[6, 3], [4, 2]], [[4, 2], [1, 2]], [[1, 2], [0, 1]],
            [[0, 1], [1, 1]], [[0, 2], [2, 4]], [[1, 1], [3, 1]],
            [[2, 4], [1, 3]], [[7, 4], [7, 3]], [[3, 1], [3, 3]],
            [[3, 3], [5, 1]], [[1, 3], [2, 4]]
        ]
        simulate_intro.each do | start, dest = sub_arr |
            board.move_piece(start, dest)
        end
    end

    
    #Test 9: Stalemate
    def simulation_9(board)
        simulate_intro = [
            [[6, 1], [5, 1]], [[6, 2], [5, 2]], [[6, 3], [5, 3]], 
            [[7, 1], [5, 0]], [[7, 2], [6, 1]], [[7, 3], [6, 3]],
            [[1, 3], [3, 3]], [[6, 4], [4, 4]], [[0, 3], [2, 3]],
            [[2, 3], [4, 5]], [[4, 5], [5, 4]], [[7, 5], [6, 4]],
            [[7, 6], [5, 7]], [[5, 4], [5, 3]], [[5, 3], [5, 2]],
            [[5, 2], [5, 1]], [[5, 1], [6, 1]], [[6, 1], [3, 1]],
            [[6, 3], [4, 2]], [[4, 2], [1, 2]], [[1, 2], [0, 1]],
            [[0, 1], [1, 1]], [[0, 2], [2, 4]], [[1, 1], [3, 1]],
            [[2, 4], [1, 3]], [[7, 4], [7, 3]], [[3, 1], [3, 3]],
            [[3, 3], [5, 1]], [[1, 3], [2, 4]], [[1, 5], [3, 5]],
            [[3, 5], [4, 5]], [[4, 5], [5, 5]], [[5, 5], [6, 6]],
            [[0, 0], [0, 1]], [[0, 1], [5, 1]], [[5, 1], [5, 0]],
            [[5, 0], [6, 0]], [[7, 0], [7, 2]], [[7, 2], [2, 2]],
            [[2, 2], [2, 4]], [[2, 4], [2, 6]], [[2, 6], [1, 6]],
            [[1, 6], [1, 7]], [[1, 7], [0, 7]], [[0, 7], [0, 6]],
            [[6, 0], [6, 4]], [[6, 4], [6, 5]], [[6, 5], [5, 5]],
            [[0, 6], [6, 6]], [[5, 5], [4, 7]], [[4, 7], [5, 7]],
            [[0, 5], [2, 7]], [[6, 6], [2, 7]], [[2, 7], [1, 0]],
            [[7, 3], [5, 7]], [[1, 0], [6, 7]], [[5, 7], [6, 7]],
            [[6, 7], [7, 7]]
        ]
        simulate_intro.each do | start, dest = sub_arr |
            board.move_piece(start, dest)
        end
    end

    #Test ?: Enpassant

end