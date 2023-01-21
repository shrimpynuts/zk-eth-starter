pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b, and assigns it to d.*/  

template Multiplier2 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;  
   signal input c;  
   signal output d;  

   c === a * b;  

   d <== c;
}

component main {public [c]} = Multiplier2();