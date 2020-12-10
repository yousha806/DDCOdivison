

module tb();

  
parameter N=4;

                       reg  clk; 
                       reg  rst_n;
                       reg [N-1:0]  dividend;
                       reg [N-1:0] divisor;
                       wire [N-1:0] quotient;  
                       wire [N-1:0] remainder;  

initial begin $dumpfile("testbench.vcd"); $dumpvars(0,tb); end
initial clk = 1'b0; always #50 clk = ~clk;
initial begin rst_n = 1'b0; dividend = 4'd10; divisor = 4'd2; #120 rst_n = 1'b1; #1000 $finish; end


        
        
    restoringdivision inst (
                         .clk(clk), 
                         .rst_n(rst_n),
                         .dividend(dividend),
                         .divisor(divisor),
                         .quotient(quotient),  
                         .remainder(remainder)  
                       );




endmodule
