module ADD_CONST #(
    parameter WIDTH=32,        // Ширина данных
    parameter ADD_VALUE=1      // Константа, которая будет добавлена
    ) (
    input wire [WIDTH-1:0] Value, // Входное значение шириной WIDTH бит
    output wire [WIDTH-1:0] Q     // Результат сложения шириной WIDTH бит
);

    // Выполнение сложения входного значения и константы ADD_VALUE
    assign Q = Value + ADD_VALUE;

endmodule

module WIRE2BUS #(
    parameter WIDTH=4          // Ширина выходной шины
    ) (
    input wire A,              // Однобитный входной сигнал
    output wire [WIDTH-1:0] Q  // Выходная шина
);

    // Заполнение всех бит выходной шины значением входного сигнала A
    assign Q = {WIDTH{A}};

endmodule

module bus_comparator #(
    parameter WIDTH=4  // Define the width of the buses
    )(
    input [WIDTH-1:0] A,   // First input bus
    input [WIDTH-1:0] B,   // Second input bus
    output wire Q		    	// Output
);
	// 1 if the buses are equal, 0 if not
	assign Q = A == B;

endmodule

module clock_divider #(
    parameter divider = 0  // Division factor is (divider + 1)
    )(
    input  wire clk_in,
    output reg  clk_out
);
    reg [31:0] count = 0;

    always @(posedge clk_in) begin
        if (divider == 0) begin
            clk_out <= clk_in;  // No division, pass through
        end else begin
            if (count == divider) begin
                count   <= 0;
                clk_out <= ~clk_out;
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule

module debounce_circuit #(
    parameter divider = 0,  // clk_ref division factor
    parameter count = 1     // Amount of buttons
    )(
    input  wire clk_ref,
    input  wire [count-1:0] d_in,   // Inputs to be debounced
    output reg  [count-1:0] d_out   // Outputs
);
    wire clk_div;

    clock_divider #(divider) clk_divider (clk_ref, clk_div);

    always @(posedge clk_ref) begin
        d_out <= d_in;
    end

endmodule
