    `timescale 1ns / 1ps
    module braille_time
    
    (
    input clk, rst,
    output reg [5:0] h_l, h_r, m_l, m_r, s_l, s_r
        );
        
        
        
        reg [4:0] hour_state;
        reg [5:0] minute_state; 
        reg [6:0] second_state;
        reg [5:0] seconds;
        reg [5:0] minutes;
        reg [4:0] hours;

    
        
       
        
        initial
        begin
        
        hour_state <= 5'd23;
        minute_state <= 6'd55;                
        hours = 5'd23;
        minutes = 6'd55;
        
             
             //dont change
             second_state <= 6'd0;
             seconds = 6'd0;
        end
        
        //0-6'b011100 - 1c
        //1-6'b100000 - 20
        //2-6'b101000 - 28
        //3-6'b110000 - 30
        //4-6'b110100 - 34
        //5-6'b100100 - 24
        //6-6'b111000 - 38
        //7-6'b111100 - 3c
        //8-6'b101100 - 2c
        //9-6'b011000 - 18
        
        
        always @ (posedge clk)
        begin
        case (hour_state)
        5'b00000 :begin if(minutes <= 59)begin h_l <= 6'b011100; h_r <= 6'b011100;end else begin minutes <= 0; hour_state <= 5'b00001; end end//00    
        5'b00001 :begin if(minutes <= 59)begin h_l <= 6'b011100; h_r <= 6'b100000;end else begin minutes <= 0; hour_state <= 5'b00010; end end//01 
        5'b00010 :begin if(minutes <= 59)begin h_l <= 6'b011100; h_r <= 6'b101000;end else begin minutes <= 0; hour_state <= 5'b00011; end end//02 
        5'b00011 :begin if(minutes <= 59)begin h_l <= 6'b011100; h_r <= 6'b110000;end else begin minutes <= 0; hour_state <= 5'b00100; end end//03 
        5'b00100 :begin if(minutes <= 59)begin h_l <= 6'b011100; h_r <= 6'b110100;end else begin minutes <= 0; hour_state <= 5'b00101; end end//04 
        5'b00101 :begin if(minutes <= 59)begin h_l <= 6'b011100; h_r <= 6'b100100;end else begin minutes <= 0; hour_state <= 5'b00110; end end//05 
        5'b00110 :begin if(minutes <= 59)begin h_l <= 6'b011100; h_r <= 6'b111000;end else begin minutes <= 0; hour_state <= 5'b00111; end end//06 
        5'b00111 :begin if(minutes <= 59)begin h_l <= 6'b011100; h_r <= 6'b111100;end else begin minutes <= 0; hour_state <= 5'b01000; end end//07 
        5'b01000 :begin if(minutes <= 59)begin h_l <= 6'b011100; h_r <= 6'b101100;end else begin minutes <= 0; hour_state <= 5'b01001; end end//08 
        5'b01001 :begin if(minutes <= 59)begin h_l <= 6'b011100; h_r <= 6'b011000;end else begin minutes <= 0; hour_state <= 5'b01010; end end//09 
        5'b01010 :begin if(minutes <= 59)begin h_l <= 6'b100000; h_r <= 6'b011100;end else begin minutes <= 0; hour_state <= 5'b01011; end end//10 
        5'b01011 :begin if(minutes <= 59)begin h_l <= 6'b100000; h_r <= 6'b100000;end else begin minutes <= 0; hour_state <= 5'b01100; end end//11 
        5'b01100 :begin if(minutes <= 59)begin h_l <= 6'b100000; h_r <= 6'b101000;end else begin minutes <= 0; hour_state <= 5'b01101; end end//12 
        5'b01101 :begin if(minutes <= 59)begin h_l <= 6'b100000; h_r <= 6'b110000;end else begin minutes <= 0; hour_state <= 5'b01110; end end//13 
        5'b01110 :begin if(minutes <= 59)begin h_l <= 6'b100000; h_r <= 6'b110100;end else begin minutes <= 0; hour_state <= 5'b01111; end end//14 
        5'b01111 :begin if(minutes <= 59)begin h_l <= 6'b100000; h_r <= 6'b100100;end else begin minutes <= 0; hour_state <= 5'b10000; end end//15 
        5'b10000 :begin if(minutes <= 59)begin h_l <= 6'b100000; h_r <= 6'b111000;end else begin minutes <= 0; hour_state <= 5'b10001; end end//16 
        5'b10001 :begin if(minutes <= 59)begin h_l <= 6'b100000; h_r <= 6'b111100;end else begin minutes <= 0; hour_state <= 5'b10010; end end//17 
        5'b10010 :begin if(minutes <= 59)begin h_l <= 6'b100000; h_r <= 6'b101100;end else begin minutes <= 0; hour_state <= 5'b10011; end end//18 
        5'b10011 :begin if(minutes <= 59)begin h_l <= 6'b100000; h_r <= 6'b011000;end else begin minutes <= 0; hour_state <= 5'b10100; end end//19 
        5'b10100 :begin if(minutes <= 59)begin h_l <= 6'b101000; h_r <= 6'b011100;end else begin minutes <= 0; hour_state <= 5'b10101; end end//20 
        5'b10101 :begin if(minutes <= 59)begin h_l <= 6'b101000; h_r <= 6'b100000;end else begin minutes <= 0; hour_state <= 5'b10110; end end//21 
        5'b10110 :begin if(minutes <= 59)begin h_l <= 6'b101000; h_r <= 6'b101000;end else begin minutes <= 0; hour_state <= 5'b10111; end end//22 
        5'b10111 :begin if(minutes <= 59)begin h_l <= 6'b101000; h_r <= 6'b110000;end else begin minutes <= 0; hour_state <= 5'b00000; end end//23
        default : begin h_l <= 6'b011100; h_r <= 6'b011100; end//00
        endcase
        end
        
        //0-6'b011100 - 1c
        //1-6'b100000 - 20
        //2-6'b101000 - 28
        //3-6'b110000 - 30
        //4-6'b110100 - 34
        //5-6'b100100 - 24
        //6-6'b111000 - 38
        //7-6'b111100 - 3c
        //8-6'b101100 - 2c
        //9-6'b011000 - 18
        
        always @ (posedge clk)
        begin
        case (minute_state)
        6'b000000 :begin if(seconds < 59)begin m_l <= 6'b011100;  m_r <= 6'b011100;end else begin seconds <= 0; minute_state <= 6'b000001; end end//00
        6'b000001 :begin if(seconds < 59)begin m_l <= 6'b011100;  m_r <= 6'b100000;end else begin seconds <= 0; minute_state <= 6'b000010; end end//01
        6'b000010 :begin if(seconds < 59)begin m_l <= 6'b011100;  m_r <= 6'b101000;end else begin seconds <= 0; minute_state <= 6'b000011; end end//02
        6'b000011 :begin if(seconds < 59)begin m_l <= 6'b011100;  m_r <= 6'b110000;end else begin seconds <= 0; minute_state <= 6'b000100; end end//03
        6'b000100 :begin if(seconds < 59)begin m_l <= 6'b011100;  m_r <= 6'b110100;end else begin seconds <= 0; minute_state <= 6'b000101; end end//04
        6'b000101 :begin if(seconds < 59)begin m_l <= 6'b011100;  m_r <= 6'b100100;end else begin seconds <= 0; minute_state <= 6'b000110; end end//05
        6'b000110 :begin if(seconds < 59)begin m_l <= 6'b011100;  m_r <= 6'b111000;end else begin seconds <= 0; minute_state <= 6'b000111; end end//06
        6'b000111 :begin if(seconds < 59)begin m_l <= 6'b011100;  m_r <= 6'b111100;end else begin seconds <= 0; minute_state <= 6'b001000; end end//07
        6'b001000 :begin if(seconds < 59)begin m_l <= 6'b011100;  m_r <= 6'b101100;end else begin seconds <= 0; minute_state <= 6'b001001; end end//08
        6'b001001 :begin if(seconds < 59)begin m_l <= 6'b011100;  m_r <= 6'b011000;end else begin seconds <= 0; minute_state <= 6'b001010; end end//09
        6'b001010 :begin if(seconds < 59)begin m_l <= 6'b100000;  m_r <= 6'b011100;end else begin seconds <= 0; minute_state <= 6'b001011; end end//10
        6'b001011 :begin if(seconds < 59)begin m_l <= 6'b100000;  m_r <= 6'b100000;end else begin seconds <= 0; minute_state <= 6'b001100; end end//11
        6'b001100 :begin if(seconds < 59)begin m_l <= 6'b100000;  m_r <= 6'b101000;end else begin seconds <= 0; minute_state <= 6'b001101; end end//12
        6'b001101 :begin if(seconds < 59)begin m_l <= 6'b100000;  m_r <= 6'b110000;end else begin seconds <= 0; minute_state <= 6'b001110; end end//13
        6'b001110 :begin if(seconds < 59)begin m_l <= 6'b100000;  m_r <= 6'b110100;end else begin seconds <= 0; minute_state <= 6'b001111; end end//14
        6'b001111 :begin if(seconds < 59)begin m_l <= 6'b100000;  m_r <= 6'b100100;end else begin seconds <= 0; minute_state <= 6'b010000; end end//15
        6'b010000 :begin if(seconds < 59)begin m_l <= 6'b100000;  m_r <= 6'b111000;end else begin seconds <= 0; minute_state <= 6'b010001; end end//16
        6'b010001 :begin if(seconds < 59)begin m_l <= 6'b100000;  m_r <= 6'b111100;end else begin seconds <= 0; minute_state <= 6'b010010; end end//17
        6'b010010 :begin if(seconds < 59)begin m_l <= 6'b100000;  m_r <= 6'b101100;end else begin seconds <= 0; minute_state <= 6'b010011; end end//18
        6'b010011 :begin if(seconds < 59)begin m_l <= 6'b100000;  m_r <= 6'b011000;end else begin seconds <= 0; minute_state <= 6'b010100; end end//19
        6'b010100 :begin if(seconds < 59)begin m_l <= 6'b101000;  m_r <= 6'b011100;end else begin seconds <= 0; minute_state <= 6'b010101; end end//20
        6'b010101 :begin if(seconds < 59)begin m_l <= 6'b101000;  m_r <= 6'b100000;end else begin seconds <= 0; minute_state <= 6'b010110; end end//21
        6'b010110 :begin if(seconds < 59)begin m_l <= 6'b101000;  m_r <= 6'b101000;end else begin seconds <= 0; minute_state <= 6'b010111; end end//22
        6'b010111 :begin if(seconds < 59)begin m_l <= 6'b101000;  m_r <= 6'b110000;end else begin seconds <= 0; minute_state <= 6'b011000; end end//23
        6'b011000 :begin if(seconds < 59)begin m_l <= 6'b101000;  m_r <= 6'b110100;end else begin seconds <= 0; minute_state <= 6'b011001; end end//24
        6'b011001 :begin if(seconds < 59)begin m_l <= 6'b101000;  m_r <= 6'b100100;end else begin seconds <= 0; minute_state <= 6'b011010; end end//25
        6'b011010 :begin if(seconds < 59)begin m_l <= 6'b101000;  m_r <= 6'b111000;end else begin seconds <= 0; minute_state <= 6'b011011; end end//26
        6'b011011 :begin if(seconds < 59)begin m_l <= 6'b101000;  m_r <= 6'b111100;end else begin seconds <= 0; minute_state <= 6'b011100; end end//27
        6'b011100 :begin if(seconds < 59)begin m_l <= 6'b101000;  m_r <= 6'b101100;end else begin seconds <= 0; minute_state <= 6'b011101; end end//28
        6'b011101 :begin if(seconds < 59)begin m_l <= 6'b101000;  m_r <= 6'b011000;end else begin seconds <= 0; minute_state <= 6'b011110; end end//29
        6'b011110 :begin if(seconds < 59)begin m_l <= 6'b110000;  m_r <= 6'b011100;end else begin seconds <= 0; minute_state <= 6'b011111; end end//30
        6'b011111 :begin if(seconds < 59)begin m_l <= 6'b110000;  m_r <= 6'b100000;end else begin seconds <= 0; minute_state <= 6'b100000; end end//31
        6'b100000 :begin if(seconds < 59)begin m_l <= 6'b110000;  m_r <= 6'b101000;end else begin seconds <= 0; minute_state <= 6'b100001; end end//32
        6'b100001 :begin if(seconds < 59)begin m_l <= 6'b110000;  m_r <= 6'b110000;end else begin seconds <= 0; minute_state <= 6'b100010; end end//33
        6'b100010 :begin if(seconds < 59)begin m_l <= 6'b110000;  m_r <= 6'b110100;end else begin seconds <= 0; minute_state <= 6'b100011; end end//34
        6'b100011 :begin if(seconds < 59)begin m_l <= 6'b110000;  m_r <= 6'b100100;end else begin seconds <= 0; minute_state <= 6'b100100; end end//35
        6'b100100 :begin if(seconds < 59)begin m_l <= 6'b110000;  m_r <= 6'b111000;end else begin seconds <= 0; minute_state <= 6'b100101; end end//36
        6'b100101 :begin if(seconds < 59)begin m_l <= 6'b110000;  m_r <= 6'b111100;end else begin seconds <= 0; minute_state <= 6'b100110; end end//37
        6'b100110 :begin if(seconds < 59)begin m_l <= 6'b110000;  m_r <= 6'b101100;end else begin seconds <= 0; minute_state <= 6'b100111; end end//38
        6'b100111 :begin if(seconds < 59)begin m_l <= 6'b110000;  m_r <= 6'b011000;end else begin seconds <= 0; minute_state <= 6'b101000; end end//39
        6'b101000 :begin if(seconds < 59)begin m_l <= 6'b110100;  m_r <= 6'b011100;end else begin seconds <= 0; minute_state <= 6'b101001; end end//40
        6'b101001 :begin if(seconds < 59)begin m_l <= 6'b110100;  m_r <= 6'b100000;end else begin seconds <= 0; minute_state <= 6'b101010; end end//41
        6'b101010 :begin if(seconds < 59)begin m_l <= 6'b110100;  m_r <= 6'b101000;end else begin seconds <= 0; minute_state <= 6'b101011; end end//42
        6'b101011 :begin if(seconds < 59)begin m_l <= 6'b110100;  m_r <= 6'b110000;end else begin seconds <= 0; minute_state <= 6'b101100; end end//43
        6'b101100 :begin if(seconds < 59)begin m_l <= 6'b110100;  m_r <= 6'b110100;end else begin seconds <= 0; minute_state <= 6'b101101; end end//44
        6'b101101 :begin if(seconds < 59)begin m_l <= 6'b110100;  m_r <= 6'b100100;end else begin seconds <= 0; minute_state <= 6'b101110; end end//45
        6'b101110 :begin if(seconds < 59)begin m_l <= 6'b110100;  m_r <= 6'b111000;end else begin seconds <= 0; minute_state <= 6'b101111; end end//46
        6'b101111 :begin if(seconds < 59)begin m_l <= 6'b110100;  m_r <= 6'b111100;end else begin seconds <= 0; minute_state <= 6'b110000; end end//47
        6'b110000 :begin if(seconds < 59)begin m_l <= 6'b110100;  m_r <= 6'b101100;end else begin seconds <= 0; minute_state <= 6'b110001; end end//48
        6'b110001 :begin if(seconds < 59)begin m_l <= 6'b110100;  m_r <= 6'b011000;end else begin seconds <= 0; minute_state <= 6'b110010; end end//49
        6'b110010 :begin if(seconds < 59)begin m_l <= 6'b100100;  m_r <= 6'b011100;end else begin seconds <= 0; minute_state <= 6'b110011; end end//50
        6'b110011 :begin if(seconds < 59)begin m_l <= 6'b100100;  m_r <= 6'b100000;end else begin seconds <= 0; minute_state <= 6'b110100; end end//51
        6'b110100 :begin if(seconds < 59)begin m_l <= 6'b100100;  m_r <= 6'b101000;end else begin seconds <= 0; minute_state <= 6'b110101; end end//52
        6'b110101 :begin if(seconds < 59)begin m_l <= 6'b100100;  m_r <= 6'b110000;end else begin seconds <= 0; minute_state <= 6'b110110; end end//53
        6'b110110 :begin if(seconds < 59)begin m_l <= 6'b100100;  m_r <= 6'b110100;end else begin seconds <= 0; minute_state <= 6'b110111; end end//54
        6'b110111 :begin if(seconds < 59)begin m_l <= 6'b100100;  m_r <= 6'b100100;end else begin seconds <= 0; minute_state <= 6'b111000; end end//55
        6'b111000 :begin if(seconds < 59)begin m_l <= 6'b100100;  m_r <= 6'b111000;end else begin seconds <= 0; minute_state <= 6'b111001; end end//56
        6'b111001 :begin if(seconds < 59)begin m_l <= 6'b100100;  m_r <= 6'b111100;end else begin seconds <= 0; minute_state <= 6'b111010; end end//57
        6'b111010 :begin if(seconds < 59)begin m_l <= 6'b100100;  m_r <= 6'b101100;end else begin seconds <= 0; minute_state <= 6'b111011; end end//58
        6'b111011 :begin if(seconds < 59)begin m_l <= 6'b100100;  m_r <= 6'b011000;end else begin seconds <= 0; minute_state <= 6'b000000; end end//59     
        default :begin m_l <= 6'b011100;  m_r <= 6'b011100; end//00    
        endcase
        end
        
                
        //0-6'b011100 - 1c
        //1-6'b100000 - 20
        //2-6'b101000 - 28
        //3-6'b110000 - 30
        //4-6'b110100 - 34
        //5-6'b100100 - 24
        //6-6'b111000 - 38
        //7-6'b111100 - 3c
        //8-6'b101100 - 2c
        //9-6'b011000 - 18
        
        always @ (posedge clk)
        begin       
         
        case (second_state)
        6'b000000 :begin if(seconds == 0)begin s_l <= 6'b011100;  s_r <= 6'b011100; end end//00
        6'b000001 :begin if(seconds == 1)begin s_l <= 6'b011100;  s_r <= 6'b100000; end end//01
        6'b000010 :begin if(seconds == 2)begin s_l <= 6'b011100;  s_r <= 6'b101000; end end//02
        6'b000011 :begin if(seconds == 3)begin s_l <= 6'b011100;  s_r <= 6'b110000; end end//03
        6'b000100 :begin if(seconds == 4)begin s_l <= 6'b011100;  s_r <= 6'b110100; end end//04
        6'b000101 :begin if(seconds == 5)begin s_l <= 6'b011100;  s_r <= 6'b100100; end end//05
        6'b000110 :begin if(seconds == 6)begin s_l <= 6'b011100;  s_r <= 6'b111000; end end//06
        6'b000111 :begin if(seconds == 7)begin s_l <= 6'b011100;  s_r <= 6'b111100; end end//07
        6'b001000 :begin if(seconds == 8)begin s_l <= 6'b011100;  s_r <= 6'b101100; end end//08
        6'b001001 :begin if(seconds == 9)begin s_l <= 6'b011100;  s_r <= 6'b011000; end end//09
        6'b001010 :begin if(seconds == 10)begin s_l <= 6'b100000;  s_r <= 6'b011100; end end//10
        6'b001011 :begin if(seconds == 11)begin s_l <= 6'b100000;  s_r <= 6'b100000; end end//11
        6'b001100 :begin if(seconds == 12)begin s_l <= 6'b100000;  s_r <= 6'b101000; end end//12
        6'b001101 :begin if(seconds == 13)begin s_l <= 6'b100000;  s_r <= 6'b110000; end end//13
        6'b001110 :begin if(seconds == 14)begin s_l <= 6'b100000;  s_r <= 6'b110100; end end//14
        6'b001111 :begin if(seconds == 15)begin s_l <= 6'b100000;  s_r <= 6'b100100; end end//15
        6'b010000 :begin if(seconds == 16)begin s_l <= 6'b100000;  s_r <= 6'b111000; end end//16
        6'b010001 :begin if(seconds == 17)begin s_l <= 6'b100000;  s_r <= 6'b111100; end end//17
        6'b010010 :begin if(seconds == 18)begin s_l <= 6'b100000;  s_r <= 6'b101100; end end//18
        6'b010011 :begin if(seconds == 19)begin s_l <= 6'b100000;  s_r <= 6'b011000; end end//19
        6'b010100 :begin if(seconds == 20)begin s_l <= 6'b101000;  s_r <= 6'b011100; end end//20
        6'b010101 :begin if(seconds == 21)begin s_l <= 6'b101000;  s_r <= 6'b100000; end end//21
        6'b010110 :begin if(seconds == 22)begin s_l <= 6'b101000;  s_r <= 6'b101000; end end//22
        6'b010111 :begin if(seconds == 23)begin s_l <= 6'b101000;  s_r <= 6'b110000; end end//23
        6'b011000 :begin if(seconds == 24)begin s_l <= 6'b101000;  s_r <= 6'b110100; end end//24
        6'b011001 :begin if(seconds == 25)begin s_l <= 6'b101000;  s_r <= 6'b100100; end end//25
        6'b011010 :begin if(seconds == 26)begin s_l <= 6'b101000;  s_r <= 6'b111000; end end//26
        6'b011011 :begin if(seconds == 27)begin s_l <= 6'b101000;  s_r <= 6'b111100; end end//27
        6'b011100 :begin if(seconds == 28)begin s_l <= 6'b101000;  s_r <= 6'b101100; end end//28
        6'b011101 :begin if(seconds == 29)begin s_l <= 6'b101000;  s_r <= 6'b011000; end end//29
        6'b011110 :begin if(seconds == 30)begin s_l <= 6'b110000;  s_r <= 6'b011100; end end//30
        6'b011111 :begin if(seconds == 31)begin s_l <= 6'b110000;  s_r <= 6'b100000; end end//31
        6'b100000 :begin if(seconds == 32)begin s_l <= 6'b110000;  s_r <= 6'b101000; end end//32
        6'b100001 :begin if(seconds == 33)begin s_l <= 6'b110000;  s_r <= 6'b110000; end end//33
        6'b100010 :begin if(seconds == 34)begin s_l <= 6'b110000;  s_r <= 6'b110100; end end//34
        6'b100011 :begin if(seconds == 35)begin s_l <= 6'b110000;  s_r <= 6'b100100; end end//35
        6'b100100 :begin if(seconds == 36)begin s_l <= 6'b110000;  s_r <= 6'b111000; end end//36
        6'b100101 :begin if(seconds == 37)begin s_l <= 6'b110000;  s_r <= 6'b111100; end end//37
        6'b100110 :begin if(seconds == 38)begin s_l <= 6'b110000;  s_r <= 6'b101100; end end//38
        6'b100111 :begin if(seconds == 39)begin s_l <= 6'b110000;  s_r <= 6'b011000; end end//39
        6'b101000 :begin if(seconds == 40)begin s_l <= 6'b110100;  s_r <= 6'b011100; end end//40
        6'b101001 :begin if(seconds == 41)begin s_l <= 6'b110100;  s_r <= 6'b100000; end end//41
        6'b101010 :begin if(seconds == 42)begin s_l <= 6'b110100;  s_r <= 6'b101000; end end//42
        6'b101011 :begin if(seconds == 43)begin s_l <= 6'b110100;  s_r <= 6'b110000; end end//43
        6'b101100 :begin if(seconds == 44)begin s_l <= 6'b110100;  s_r <= 6'b110100; end end//44
        6'b101101 :begin if(seconds == 45)begin s_l <= 6'b110100;  s_r <= 6'b100100; end end//45
        6'b101110 :begin if(seconds == 46)begin s_l <= 6'b110100;  s_r <= 6'b111000; end end//46
        6'b101111 :begin if(seconds == 47)begin s_l <= 6'b110100;  s_r <= 6'b111100; end end//47
        6'b110000 :begin if(seconds == 48)begin s_l <= 6'b110100;  s_r <= 6'b101100; end end//48
        6'b110001 :begin if(seconds == 49)begin s_l <= 6'b110100;  s_r <= 6'b011000; end end//49
        6'b110010 :begin if(seconds == 50)begin s_l <= 6'b100100;  s_r <= 6'b011100; end end//50
        6'b110011 :begin if(seconds == 51)begin s_l <= 6'b100100;  s_r <= 6'b100000; end end//51
        6'b110100 :begin if(seconds == 52)begin s_l <= 6'b100100;  s_r <= 6'b101000; end end//52
        6'b110101 :begin if(seconds == 53)begin s_l <= 6'b100100;  s_r <= 6'b110000; end end//53
        6'b110110 :begin if(seconds == 54)begin s_l <= 6'b100100;  s_r <= 6'b110100; end end//54
        6'b110111 :begin if(seconds == 55)begin s_l <= 6'b100100;  s_r <= 6'b100100; end end//55
        6'b111000 :begin if(seconds == 56)begin s_l <= 6'b100100;  s_r <= 6'b111000; end end//56
        6'b111001 :begin if(seconds == 57)begin s_l <= 6'b100100;  s_r <= 6'b111100; end end//57
        6'b111010 :begin if(seconds == 58)begin s_l <= 6'b100100;  s_r <= 6'b101100; end end//58
        6'b111011 :begin if(seconds == 59)begin s_l <= 6'b100100;  s_r <= 6'b011000; end end//59
        default :begin s_l <= 6'b011100;  s_r <= 6'b011100; end//00        
        endcase
        
        
        end
        

always @ (posedge clk)
begin
    if (rst)
    begin
        seconds <= 0;
        minutes <= 0;
        hours <= 0;
        second_state <= 6'b000000;
        minute_state <= 6'b000000;
        hour_state <= 5'b00000;
    end
    else
    begin
        
        if (seconds == 59) 
        begin
            seconds <= 0;
            second_state <= 6'b000000;
            
            
            if (minutes == 59) 
            begin
                minutes <= 0;
                
                
                if (hours == 23) 
                begin
                    hours <= 0;  
                    hour_state <= 5'b00000;
                end
                else
                begin
                    hours <= hours + 1;  
                    hour_state <= hour_state + 1;
                end
            end
            else
            begin
                minutes <= minutes + 1; 
                minute_state <= minute_state + 1;
            end
        end
        else
        begin
            seconds <= seconds + 1;  
            second_state <= second_state + 1'b1;
        end
    end
end
            
        
    endmodule
