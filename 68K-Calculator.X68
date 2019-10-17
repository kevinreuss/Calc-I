*-----------------------------------------------------------
* Title       : CALC - I
* Written by  : Kevin Reuss
* Date        : 08.2015
* Description : 68K - Calculator
*-----------------------------------------------------------
    ORG    $1000
START:
    LEA $E00000, A0
    LEA $E00014, A1
    BSR WELCOME
REPEAT_2:
    LEA $E00000, A0
    BTST #0, (A1)
    BEQ START_2
    JMP REPEAT_2
START_2:
    BSR CLEAR
    BSR WAIT
    LEA $E00000, A0
    LEA $E00014, A1
    CLR.L D0
    CLR.L D1
    CLR.L D2
    CLR.L D3
    BSR NUMBERS
MARK_ONE:
    BSR INPUT_ONE
    BTST #0, D1
    BEQ MARK_ONE
* -------------------- *
    BSR WAIT
    MOVE.L #0, D1
    BSR CLEAR
    BSR OPERATIONS
MARK_TWO:
    BSR INPUT_TWO
    BTST #0, D2
    BEQ MARK_TWO
* -------------------- *
    BSR WAIT
    MOVE.L #0, D2
    BSR CLEAR
    BSR NUMBERS
MARK_THREE:
    BSR INPUT_THREE
    BTST #0, D3
    BEQ MARK_THREE
* -------------------- *
    MOVE.L #0, D3
    BSR CLEAR
    BSR PRINT_ONE
    BSR PRINT_TWO
    BSR PRINT_THREE
    BSR PRINT_EQUAL
* -------------------- *
    BSR CALC
    BSR RESULT
    BSR RESULT_2
    BSR WAIT
REPEAT:
    LEA $E00000, A0
    BTST #0, (A1)
    BEQ START_2
    BTST #7, (A1)
    BEQ BYE
    JMP REPEAT
    SIMHALT
    
PRINT_ONE:
    LEA $E00000, A0
    CMPI #0, D0
    BEQ NULL_THREE
    CMPI #1, D0
    BEQ ONE_THREE
    CMPI #2, D0
    BEQ TWO_THREE
    CMPI #3, D0
    BEQ THREE_THREE
    CMPI #4, D0
    BEQ FOUR_THREE
    CMPI #5, D0
    BEQ FIVE_THREE
    CMPI #6, D0
    BEQ SIX_THREE
    CMPI #7, D0
    BEQ SEVEN_THREE
    RTS
    
PRINT_TWO:
    LEA $E00000, A0
    ADD #2, A0
    CMPI #1, D1
    BEQ PLUS_THREE
    CMPI #2, D1
    BEQ MINUS_THREE
    CMPI #4, D1
    BEQ MULTIPLY_THREE
    
PRINT_THREE:
    LEA $E00000, A0
    ADD #4, A0
    CMPI #0, D2
    BEQ NULL_THREE
    CMPI #1, D2
    BEQ ONE_THREE
    CMPI #2, D2
    BEQ TWO_THREE
    CMPI #3, D2
    BEQ THREE_THREE
    CMPI #4, D2
    BEQ FOUR_THREE
    CMPI #5, D2
    BEQ FIVE_THREE
    CMPI #6, D2
    BEQ SIX_THREE
    CMPI #7, D2
    BEQ SEVEN_THREE
    RTS
    
PRINT_EQUAL:
    LEA $E00000, A0
    ADD #8, A0
    MOVE.B #$48, (A0)
    RTS
    
MULTIPLY_THREE:
    MOVE.B #$73, (A0)
    RTS

MINUS_THREE:
    MOVE.B #$40, (A0)
    RTS

PLUS_THREE:
    MOVE.B #$76, (A0)
    RTS
    
NULL_THREE:
    MOVE.B #$3F,(A0)
    RTS
ONE_THREE:
    MOVE.B #$06,(A0)
    RTS
TWO_THREE:
    MOVE.B #$5B,(A0)
    RTS
THREE_THREE:
    MOVE.B #$4F,(A0)
    RTS
FOUR_THREE:
    MOVE.B #$66,(A0)
    RTS
FIVE_THREE:
    MOVE.B #$6D,(A0)
    RTS
SIX_THREE:
    MOVE.B #$7D,(A0)
    RTS
SEVEN_THREE:
    MOVE.B #$07,(A0)
    RTS
EIGHT_THREE:
    MOVE.B #$7F,(A0)
    RTS
NINE_THREE:
    MOVE.B #$6F,(A0)
    RTS

INPUT_THREE:
    MOVE.L #0, D3
* - input 0 -
    BTST #0, (A1)
    BEQ NULL_TWO
* - input 1 -
    BTST #1, (A1)
    BEQ ONE_TWO
* - input 2 -
    BTST #2, (A1)
    BEQ TWO_TWO
* - input 3 -
    BTST #3, (A1)
    BEQ THREE_TWO
* - input 4 -
    BTST #4, (A1)
    BEQ FOUR_TWO
* - input 5 -
    BTST #5, (A1)
    BEQ FIVE_TWO
* - input 6 -
    BTST #6, (A1)
    BEQ SIX_TWO
* - input 7 -
    BTST #7, (A1)
    BEQ SEVEN_TWO
* - default -
    RTS
    
NULL_TWO:
    MOVE.L #0, D2
    MOVE.L #1, D3
    RTS
ONE_TWO:
    MOVE.L #1, D2
    MOVE.L #1, D3
    RTS
TWO_TWO:
    MOVE.L #2, D2
    MOVE.L #1, D3
    RTS
THREE_TWO:
    MOVE.L #3, D2
    MOVE.L #1, D3
    RTS
FOUR_TWO:
    MOVE.L #4, D2
    MOVE.L #1, D3
    RTS
FIVE_TWO:
    MOVE.L #5, D2
    MOVE.L #1, D3
    RTS
SIX_TWO:
    MOVE.L #6, D2
    MOVE.L #1, D3
    RTS
SEVEN_TWO:
    MOVE.L #7, D2
    MOVE.L #1, D3
    RTS

INPUT_ONE:
    MOVE.L #0, D1
* - input 0 -
    BTST #0, (A1)
    BEQ NULL_ONE
* - input 1 -
    BTST #1, (A1)
    BEQ ONE_ONE
* - input 2 -
    BTST #2, (A1)
    BEQ TWO_ONE
* - input 3 -
    BTST #3, (A1)
    BEQ THREE_ONE
* - input 4 -
    BTST #4, (A1)
    BEQ FOUR_ONE
* - input 5 -
    BTST #5, (A1)
    BEQ FIVE_ONE
* - input 6 -
    BTST #6, (A1)
    BEQ SIX_ONE
* - input 7 -
    BTST #7, (A1)
    BEQ SEVEN_ONE
* - default -
    RTS
    
NULL_ONE:
    MOVE.L #0, D0
    MOVE.L #1, D1
    RTS
ONE_ONE:
    MOVE.L #1, D0
    MOVE.L #1, D1
    RTS
TWO_ONE:
    MOVE.L #2, D0
    MOVE.L #1, D1
    RTS
THREE_ONE:
    MOVE.L #3, D0
    MOVE.L #1, D1
    RTS
FOUR_ONE:
    MOVE.L #4, D0
    MOVE.L #1, D1
    RTS
FIVE_ONE:
    MOVE.L #5, D0
    MOVE.L #1, D1
    RTS
SIX_ONE:
    MOVE.L #6, D0
    MOVE.L #1, D1
    RTS
SEVEN_ONE:
    MOVE.L #7, D0
    MOVE.L #1, D1
    RTS

INPUT_TWO:
    MOVE.L #0, D1
    MOVE.L #0, D2
* - input * -
    BTST #0, (A1)
    BEQ MULTIPLY
* - input - -
    BTST #1, (A1)
    BEQ MINUS
* - input + -
    BTST #2, (A1)
    BEQ PLUS
* - default -
    RTS

MULTIPLY:
    BSET #0, D1
    MOVE.L #1, D2
    RTS
MINUS:
    BSET #1, D1
    MOVE.L #1, D2
    RTS
PLUS:
    BSET #2, D1
    MOVE.L #1, D2
    RTS

OPERATIONS:
    LEA $E00000, A0
    ADD #10, A0
    MOVE.B #$73, (A0)
    ADD #2, A0
    MOVE.B #$40, (A0)
    ADD #2, A0
    MOVE.B #$76, (A0)
    RTS
    
CLEAR:
    LEA $E00000, A0
    MOVE.B #$00,(A0)
    ADD #2, A0
    MOVE.B #$00,(A0)
    ADD #2, A0
    MOVE.B #$00,(A0)
    ADD #2, A0
    MOVE.B #$00,(A0)
    ADD #2, A0
    MOVE.B #$00,(A0)
    ADD #2, A0
    MOVE.B #$00,(A0)
    ADD #2, A0
    MOVE.B #$00,(A0)
    ADD #2, A0
    MOVE.B #$00,(A0)
    RTS

NUMBERS:
    LEA $E00000, A0
* - 7 -
    MOVE.B #$07,(A0)
* - 6 -
    ADD #2, A0
    MOVE.B #$7D,(A0)
* - 5 -
    ADD #2, A0
    MOVE.B #$6D,(A0)
* - 4 -
    ADD #2, A0
    MOVE.B #$66,(A0)
* - 3 -
    ADD #2, A0
    MOVE.B #$4F,(A0)
* - 2 -
    ADD #2, A0
    MOVE.B #$5B,(A0)
* - 1 -
    ADD #2, A0
    MOVE.B #$06,(A0)
* - 0 -
    ADD #2, A0
    MOVE.B #$3F,(A0)
* - return -
    LEA $E00000, A0
    RTS
    
WAIT:
    BTST #0, (A1)
    BEQ WAIT
    BTST #1, (A1)
    BEQ WAIT
    BTST #2, (A1)
    BEQ WAIT
    BTST #3, (A1)
    BEQ WAIT
    BTST #4, (A1)
    BEQ WAIT
    BTST #5, (A1)
    BEQ WAIT
    BTST #6, (A1)
    BEQ WAIT
    BTST #7, (A1)
    BEQ WAIT
    RTS
    
CALC:
    CMPI #4, D1
    BEQ ADDING
    CMPI #2, D1
    BEQ SUBTRACT
    CMPI #1, D1
    BEQ MULTI
    RTS
    
ADDING:
    ADD D2, D0
    CLR.L D1
    CLR.L D2
    RTS

SUBTRACT:
    CLR.L D3
    BSR CHECK
    SUB D2, D0
    CLR.L D1
    CLR.L D2
    RTS

CHECK:
    CMPI #0, D0
    BEQ NULL_SWAP
    CMPI #1, D0
    BEQ ONE_SWAP
    CMPI #2, D0
    BEQ TWO_SWAP
    CMPI #3, D0
    BEQ THREE_SWAP
    CMPI #4, D0
    BEQ FOUR_SWAP
    CMPI #5, D0
    BEQ FIVE_SWAP
    CMPI #6, D0
    BEQ SIX_SWAP
    CMPI #7, D0
    BEQ SEVEN_SWAP
    RTS
    
NULL_SWAP:
    CMPI #0, D2
    BGT SWAP
    RTS
ONE_SWAP:
    CMPI #1, D2
    BGT SWAP
    RTS
TWO_SWAP:
    CMPI #2, D2
    BGT SWAP
    RTS
THREE_SWAP:
    CMPI #3, D2
    BGT SWAP
    RTS
FOUR_SWAP:
    CMPI #4, D2
    BGT SWAP
    RTS
FIVE_SWAP:
    CMPI #5, D2
    BGT SWAP
    RTS
SIX_SWAP:
    CMPI #6, D2
    BGT SWAP
    RTS
SEVEN_SWAP:
    CMPI #7, D2
    BGT SWAP
    RTS

SWAP:
    MOVE.L D0, D3
    MOVE.L D2, D0
    MOVE.L D3, D2
    MOVE.L #1, D3
    RTS

MULTI:
    CLR.L D3
    CLR.L D1
    CMPI #0, D0
    BEQ END
    CMPI #0, D2
    BEQ END
LOOP:
    CMPI #0, D2
    BEQ END
    ADD D0, D1
    SUB #1, D2
    JMP LOOP
END:
    MOVE.L D1, D0
    CLR.L D1
    CLR.L D2
    RTS
    
LOOP_2:
    ADD #1, D1
    SUB #10, D0
    JMP LOOP_3
    RTS
    
RESULT:
    LEA $E00000, A0
    ADD #12, A0
    CMPI #1, D3
    BEQ PRINT_MINUS
LOOP_3:
    CMPI #0, D0
    BGE LOOP_2
    ADD #10, D0
    SUB #1, D1
    
    ADD #2, A0
    CMPI #0, D0
    BEQ NULL_THREE
    CMPI #1, D0
    BEQ ONE_THREE
    CMPI #2, D0
    BEQ TWO_THREE
    CMPI #3, D0
    BEQ THREE_THREE
    CMPI #4, D0
    BEQ FOUR_THREE
    CMPI #5, D0
    BEQ FIVE_THREE
    CMPI #6, D0
    BEQ SIX_THREE
    CMPI #7, D0
    BEQ SEVEN_THREE
    CMPI #8, D0
    BEQ EIGHT_THREE
    CMPI #9, D0
    BEQ NINE_THREE
    RTS
    
RESULT_2:
    LEA $E00000, A0
    ADD #12, A0
    CMPI #1, D1
    BEQ ONE_THREE
    CMPI #2, D1
    BEQ TWO_THREE
    CMPI #3, D1
    BEQ THREE_THREE
    CMPI #4, D1
    BEQ FOUR_THREE
    RTS
    
PRINT_MINUS:
    MOVE.B #$40, (A0)
    CLR.L D3
    JMP RESULT
    
WELCOME:
    LEA $E00000, A0
    MOVE.B #$39, (A0)
    ADD #2, A0
    MOVE.B #$77, (A0)
    ADD #2, A0
    MOVE.B #$38, (A0)
    ADD #2, A0
    MOVE.B #$39, (A0)
    ADD #2, A0
    MOVE.B #$00, (A0)
    ADD #2, A0
    MOVE.B #$40, (A0)
    ADD #2, A0
    MOVE.B #$00, (A0)
    ADD #2, A0
    MOVE.B #$06, (A0)
    ADD #2, A0
    RTS
    
BYE:
    LEA $E00000, A0
    MOVE.B #$7F, (A0)
    ADD #2, A0
    MOVE.B #$6E, (A0)
    ADD #2, A0
    MOVE.B #$79, (A0)
    ADD #2, A0
    MOVE.B #$00, (A0)
    ADD #2, A0
    MOVE.B #$00, (A0)
    ADD #2, A0
    MOVE.B #$00, (A0)
    ADD #2, A0
    MOVE.B #$00, (A0)
    ADD #2, A0
    MOVE.B #$00, (A0)
    ADD #2, A0
    SIMHALT
    RTS
    
    END START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
