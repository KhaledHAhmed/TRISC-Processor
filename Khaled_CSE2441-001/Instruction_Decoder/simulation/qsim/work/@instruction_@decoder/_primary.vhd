library verilog;
use verilog.vl_types.all;
entity Instruction_Decoder is
    port(
        w               : in     vl_logic;
        x               : in     vl_logic;
        y               : in     vl_logic;
        z               : in     vl_logic;
        HLT             : out    vl_logic;
        JPN             : out    vl_logic;
        JPZ             : out    vl_logic;
        JMP             : out    vl_logic;
        CLR             : out    vl_logic;
        INC             : out    vl_logic;
        \XOR\           : out    vl_logic;
        SUB             : out    vl_logic;
        ADD             : out    vl_logic;
        SAT             : out    vl_logic;
        LDA             : out    vl_logic
    );
end Instruction_Decoder;
