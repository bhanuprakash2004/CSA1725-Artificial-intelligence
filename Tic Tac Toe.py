import random
import time

def create_board():
    return [[' ']*3 for _ in range(3)]

def print_board(board):
    for row in board:
        print('|'.join(row))
        print('-' * 5)

def check_winner(board):
    for row in board:
        if row.count(row[0]) == len(row) and row[0] != ' ':
            return True
    
    for col in range(len(board[0])):
        if board[0][col] == board[1][col] == board[2][col] and board[0][col] != ' ':
            return True
    
    if board[0][0] == board[1][1] == board[2][2] and board[0][0] != ' ':
        return True
    
    if board[0][2] == board[1][1] == board[2][0] and board[0][2] != ' ':
        return True
    
    return False

def is_board_full(board):
    for row in board:
        if ' ' in row:
            return False
    return True

def play_game():
    board = create_board()
    player = 'X'
    
    while True:
        print_board(board)
        row = int(input("Enter row (0, 1, or 2): "))
        col = int(input("Enter column (0, 1, or 2): "))
        
        if board[row][col] == ' ':
            board[row][col] = player
        else:
            print("That position is already taken!")
            continue
        
        if check_winner(board):
            print_board(board)
            print(f"Player {player} wins!")
            break
        elif is_board_full(board):
            print_board(board)
            print("It's a tie!")
            break
        
        player = 'O' if player == 'X' else 'X'
        time.sleep(1)

play_game()
