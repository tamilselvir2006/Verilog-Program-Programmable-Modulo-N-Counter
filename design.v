module programmable_modulo_n_counter #(
    parameter WIDTH = 8
)(
    input                   clk,
    input                   reset,
    input                   enable,
    input  [WIDTH-1:0]      N,
    output reg [WIDTH-1:0]  count
);

    always @(posedge clk or posedge reset) begin

        if (reset)
            count <= 0;

        else if (enable) begin

            if (N <= 1)
                count <= 0;

            else if (count >= N-1)
                count <= 0;

            else
                count <= count + 1'b1;

        end

    end

endmodule