require_relative "piece"
require_relative "piece_modules/step_module"

#The stepping class derives from the piece class and will either act as
#a knight or king.

class SteppingPiece < Piece

    include Stepable

    attr_accessor :moved

    #Initializes all the characteristics of the piece and sets the moved attribute.
    def initialize(color, board, pos)
        super
        @moved = false
    end

    #Creates a copy of the piece.
    def copy(color, board, piece, symbol)
        copy_piece = SteppingPiece.new(color, board, piece)
        copy_piece.set_symbol(symbol)
        copy_piece
    end

    #This will check if the current king is under in check mode.
    def no_checks_currently
        @board.check(@pos) == false
    end

    #Checks if a given piece is not attacked.
    def check_not_attacked(to_check)
        opp_color = @color == :white ? :black : :white
        to_check.select do | emptied_pos |
            can_use = true
            @board.rows.each do | row |
                row.each do | piece |
                    can_use = false if piece.color == opp_color && piece.get_moves.include?(emptied_pos)
                end
            end
            can_use
        end
    end

    #Checks if there are no attacks on the castle paths in order to castle.
    def no_attacks_on_castle_paths(castle_list)
        castle_list.select do | king_pos |
            case king_pos
            when [7, 2]
                #Not [7, 1] because the king is not moving through there when
                #it is castling.
                to_check = [[7, 2], [7, 3]]
                unattacked = check_not_attacked(to_check)
                to_check.length == unattacked.length
            when [7, 6]
                to_check = [[7, 5], [7, 6]]
                unattacked = check_not_attacked(to_check)
                to_check.length == unattacked.length
            when [0, 2]
                #Not [0, 1] because the king is not moving through there when
                #it is castling.
                to_check = [[0, 2], [0, 3]]
                unattacked = check_not_attacked(to_check)
                to_check.length == unattacked.length
            when [0, 6]
                to_check = [[0, 5], [0, 6]]
                unattacked = check_not_attacked(to_check)
                to_check.length == unattacked.length
            end
        end

    end

    #Lets you get the places where the king may castle.
    def castle
        castle_spots = []
        #This section checks if all the spaces are empty to castle.
        case @color
        when :white
            queen_side = [[7, 1], [7, 2], [7, 3]]
            king_side = [[7, 5], [7, 6]]
            castle_spots << [7, 2] if queen_side.all? { | pos | !piece?(pos) }
            castle_spots << [7, 6] if king_side.all? { | pos | !piece?(pos) }
        when :black
            queen_side = [[0, 1], [0, 2], [0, 3]]
            king_side = [[0, 5], [0, 6]]
            castle_spots << [0, 2] if queen_side.all? { | pos | !piece?(pos) }
            castle_spots << [0, 6] if king_side.all? { | pos | !piece?(pos) }
        end
        #This section checks if the rooks and kings have not moved and
        #also checks for symbol because maybe the spot is null.
        can_castle = castle_spots.select do | spot |
            case spot
            when [7, 2]
                rook = @board.rows[7][0]
                king = @board.rows[7][4]
                rook.symbol == :rook && king.symbol == :king && !rook.moved && !king.moved
            when [7, 6]
                rook = @board.rows[7][7]
                king = @board.rows[7][4]
                rook.symbol == :rook && king.symbol == :king && !rook.moved && !king.moved
            when [0, 2]
                rook = @board.rows[0][0]
                king = @board.rows[0][4]
                rook.symbol == :rook && king.symbol == :king && !rook.moved && !king.moved
            when [0, 6]
                rook = @board.rows[0][7]
                king = @board.rows[0][4]
                rook.symbol == :rook && king.symbol == :king && !rook.moved && !king.moved
            end
        end
        #This section checks if there are no pieces of opposite color attacking the
        #empty spaces where the kings and rooks can move.
        no_checks_currently ? no_attacks_on_castle_paths(can_castle) : []
    end

    #Gets the unblocked moves of the piece.
    def get_unblocked_moves(moves)
        result = []
        moves.each do | pos |
            if piece?(pos)
                x, y = pos
                result << pos if @color != @board.rows[x][y].color 
            else
                result << pos
            end
        end
        result
    end

    #Gets the common valid moves of the piece.
    def get_moves
        possible_moves = step_positions(@pos, @symbol)
        get_unblocked_moves(possible_moves)
    end
    
end