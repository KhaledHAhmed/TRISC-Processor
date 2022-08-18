//Ripple Carry Adder Subtractor Structural Model with Overflow Detection

module AdderSubtractor (

     input AddSub,                             //select add (AddSub=0) or subtract (AddSub=1) operation

     input [3:0] A, B,           //declare input ports

     output [3:0] S,                              //declare output ports for sum

     output Cout, OVR);    //declare carry-out and overflow ports

     wire [3:0] Bb;                               //declare internal nets

     wire [4:0] C;                                                 

     //complement B input for subtraction 

     assign Bb[3:0] = {AddSub^B[3],AddSub^B[2],AddSub^B[1],AddSub^B[0]};

     assign C[0] = AddSub;               //Add 0 for addition, 1 for subtraction

     assign Cout = C[4];     //rename carry out port

     assign OVR = C[3]^C[4];//generate OVR

                  //instantiate the full adder module for each stage of the ripple carry adder

     FAbehav s0 (A[0], Bb[0], C[0], S[0], C[1]);          //stage 0

     FAbehav s1 (A[1], Bb[1], C[1], S[1], C[2]);          //stage 1

     FAbehav s2 (A[2], Bb[2], C[2], S[2], C[3]);          //stage 2

     FAbehav s3 (A[3], Bb[3], C[3], S[3], C[4]);          //stage 3

endmodule