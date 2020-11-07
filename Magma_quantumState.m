%Example for Quantum state:
%http://magma.maths.usyd.edu.au/calc/
%http://magma.maths.usyd.edu.au/magma/handbook/text/1942#21811
%Book example:

%Ex1:
F<i> := ComplexField(4);
H := HilbertSpace(F, 5);
H;
Dimension(H);
IsDenselyRepresented(H);
H1 := HilbertSpace(F, 5 : IsDense := false);
H1;
IsDenselyRepresented(H1);
H eq H1;
-->
A densly represented Hilbert Space on 5 qubits to precision 4
32
true
A sparsly represented Hilbert Space on 5 qubits to precision 4
false
false

%Ex2:
F<i> := ComplexField(4);
H := HilbertSpace(F, 4);
KS := KSpace(F, Dimension(H));
v := KS! [F| i,    1,    0, -i,
             2,    0,    0, 1+i,
             -i-1, -3*i, 7, 0.5,
             2.5*i, 0,   0, 1.2];
e := QuantumState(H, v);
v;
e;
-->
(1.000*i 1.000 0.0000 -1.000*i 2.000 0.0000 0.0000 1.000 + 1.000*i -1.000 -
    1.000*i -3.000*i 7.000 0.5000 2.500*i 0.0000 0.0000 1.200)
1.000*i|0000> + |1000> - 1.000*i|1100> + 2.000|0010> + (1.000 + 1.000*i)|1110> -
(1.000 + 1.000*i)|0001> - 3.000*i|1001> + 7.000|0101> + 0.5000|1101> +
2.500*i|0011> + 1.200|1111>

%Ex3:
F<i> := ComplexField(4);
H := HilbertSpace(F, 12);
Dimension(H);
e1 := H!1 + (1+i)*(H!76) - H!3000;
e1;
e2 := H![1,0,1,1,1,0,0,0,1,1,0,0] - H![1,1,0,1,0,0,0,0,1,1,0,1];
e2;
SetPrintKetsInteger(true);
e1;
e2;
-->
4096
|100000000000> + (1.000 + 1.000*i)|001100100000> - |000111011101>
|101110001100> - |110100001101>
|1> + (1.000 + 1.000*i)|76> - |3000>
|797> - |2827>

%Ex4:
F<i> := ComplexField(8);
H := HilbertSpace(F, 1);
e := H!0 + H!1;
e;
NormalisationCoefficient(e);
e1 := Normalisation(e);
e1;
NormalisationCoefficient(e1);
e eq e1;
-->
|0> + |1>
2.0000000
0.70710678|0> + 0.70710678|1>
0.99999999
true

%Ex5:
F<i> := ComplexField(4);
H := HilbertSpace(F, 3);
e := -0.5*H!0 + 6*i*H!3 + 7*H!4 - (1+i)*H!7;
ProbabilityDistribution(e);
Probability(e, 0);
Probability(e, 1);
PrintProbabilityDistribution(e);
SetPrintKetsInteger(true);
PrintProbabilityDistribution(e);
-->
(0.002865 0.0000 0.0000 0.4126 0.5616 0.0000 0.0000 0.02292)
0.002865
0.0000
Non-zero probabilities:
|000>:  0.2865%
|110>:  41.26%
|001>:  56.16%
|111>:  2.292%

%Ex6:
F<i> := ComplexField(4);
H := HilbertSpace(F, 4);
KS := KSpace(F, 2^4);
v := KS! [F| i,   11,   0, -3*i,
             2,   0,    0, 6+i,
            -i-1, -3*i, 7, -0.5,
            2.5*i, 0,   0, 9.2];
e := QuantumState(H, v);
e;
PrintSortedProbabilityDistribution(e);
PrintSortedProbabilityDistribution(e: MinProbability := 15);
PrintSortedProbabilityDistribution(e: Max := 6);
-->
1.000*i|0000> + 11.00|1000> - 3.000*i|1100> + 2.000|0010> + (6.000 +
1.000*i)|1110> - (1.000 + 1.000*i)|0001> - 3.000*i|1001> + 7.000|0101> -
0.5000|1101> + 2.500*i|0011> + 9.200|1111>
Non-zero probabilities:
|1000>:         37.45%
|1111>:         26.19%
|0101>:         15.16%
|1110>:         11.45%
|1100>:         2.785%
|1001>:         2.785%
|0011>:         1.934%
|0010>:         1.238%
|0001>:         0.6190%
|0000>:         0.3095%
|1101>:         0.07737%
Non-zero probabilities:
|1000>:         37.45%
|1111>:         26.19%
|0101>:         15.16%
Reached Minimum Percentage
Non-zero probabilities:
|1000>:         37.45%
|1111>:         26.19%
|0101>:         15.16%
|1110>:         11.45%
|1100>:         2.785%
|1001>:         2.785%
Reached Maximum count


%Ex7:
F<i> := ComplexField(4);
H := HilbertSpace(F, 4);
e := H!0 + H!3 + H!6 + H!15;
e;
PhaseFlip(~e, 4); 
e;
ControlledNot(~e, {1,2}, 4); 
e;
BitFlip(~e, 2); 
e;
ControlledNot(~e, {2}, 3); 
e;
-->
|0000> + |1100> + |0110> + |1111>
|0000> + |1100> + |0110> - |1111>
|0000> + |0110> - |1110> + |1101>
|0100> + |0010> - |1010> + |1001>
|0010> - |1010> + |0110> + |1001>


%Encoding:

F<i> := ComplexField(4);
H1 := HilbertSpace(F, 3);
e := H1!3; 
e;
f := H1![0,0,0]+H1![1,0,0];
f;
-->
|110>
|000> + |100>
%Checking bit flip
F<i> := ComplexField(4);
H1 := HilbertSpace(F, 3);
f := H1![0,0,0]+H1![1,0,0];
f;
BitFlip(~f, 1);
f;
BitFlip(~f, 2);
f;
BitFlip(~f, 3);
f;
-->
|000> + |100>
|000> + |100>
|010> + |110>
|011> + |111>

%Checking phase flip
F<i> := ComplexField(4);
H1 := HilbertSpace(F, 3);
f := H1![0,0,0]+H1![1,0,0];
f;
PhaseFlip(~f, 1);
f;
PhaseFlip(~f, 2);
f;
PhaseFlip(~f, 3);
f;
-->
|000> + |100>
|000> - |100>
|000> - |100>
|000> - |100>

%
a := 2/SquareRoot(2*2 + 3*3);
b := 3/SquareRoot(2*2 + 3*3);
a*a + b*b;
--> 0.999999999999999999999999999998
%

F<i> := ComplexField(4);
H1 := HilbertSpace(F, 3);
f := H1![0,0,0]+H1![1,0,0];
f;
ControlledNot(~f, {1}, 2);
f;
-->
|000> + |100>
|000> + |110>

F<i> := ComplexField(4);
H1 := HilbertSpace(F, 3);
f := H1![0,0,0]+H1![1,0,0];
f;
ControlledNot(~f, {1}, 3);
f;
-->
|000> + |100>
|000> + |101>

F<i> := ComplexField(4);
H1 := HilbertSpace(F, 3);
f := H1![0,0,0]+H1![1,0,0]+H1![1,1,0];
f;
ControlledNot(~f, {1,2}, 3);
f;
-->
|000> + |100> + |110>
|000> + |100> + |111>

%Hadamard gate: 
F<i> := ComplexField(4);
H1 := HilbertSpace(F, 2);
f := H1![0,0];
f;
%H := 1/sqrt(2)*[X + Z]
f1 := BitFlip(f, 1);
f1;
f2 := PhaseFlip(f, 1);
f2;
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2;  
f;
-->
|00>
|10>
|00>
0.7071|00> + 0.7071|10>

% Repetition code: For bit flip error.

F<i> := ComplexField(4);
H1 := HilbertSpace(F, 3);
f := 3/5 * H1![0,0,0] + 4/5 * H1![1,0,0];
f;
ControlledNot(~f, {1}, 2);
ControlledNot(~f, {1}, 3);
f;
BitFlip(~f, 2);
f;
ControlledNot(~f, {1}, 2);
ControlledNot(~f, {1}, 3);
ControlledNot(~f, {2,3}, 1);
f;
-->
0.6000|000> + 0.8000|100>
0.6000|000> + 0.8000|111>
0.6000|010> + 0.8000|101>
0.6000|010> + 0.8000|110>

% Repetition code: For PhaseFlip error:

F<i> := ComplexField(4);
H1 := HilbertSpace(F, 3);
f := 3/5 * H1![0,0,0] + 4/5 * H1![1,0,0];
f;
ControlledNot(~f, {1}, 2);
ControlledNot(~f, {1}, 3);
f;

f1 := BitFlip(f, 1);
f2 := PhaseFlip(f, 1);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2;  
f1 := BitFlip(f, 2);
f2 := PhaseFlip(f, 2);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2; 
f1 := BitFlip(f, 3);
f2 := PhaseFlip(f, 3);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2; 

PhaseFlip(~f, 3);

f1 := BitFlip(f, 1);
f2 := PhaseFlip(f, 1);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2;  
f1 := BitFlip(f, 2);
f2 := PhaseFlip(f, 2);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2; 
f1 := BitFlip(f, 3);
f2 := PhaseFlip(f, 3);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2;

ControlledNot(~f, {1}, 2);
ControlledNot(~f, {1}, 3);
ControlledNot(~f, {2,3}, 1);
f;
-->
0.6000|000> + 0.8000|100>
0.6000|000> + 0.8000|111>
0.5999|001> + 0.8000|101>

% Shor code:
F<i> := ComplexField(4);
H1 := HilbertSpace(F, 9);
f := 3/5 * H1![0,0,0,0,0,0,0,0,0] + 4/5 * H1![1,0,0,0,0,0,0,0,0];
f;

ControlledNot(~f, {1}, 4);
ControlledNot(~f, {1}, 7);
f;

f1 := BitFlip(f, 1);
f2 := PhaseFlip(f, 1);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2;  
f1 := BitFlip(f, 4);
f2 := PhaseFlip(f, 4);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2;  
f1 := BitFlip(f, 7);
f2 := PhaseFlip(f, 7);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2;  
f;

ControlledNot(~f, {1}, 2);
ControlledNot(~f, {1}, 3);
ControlledNot(~f, {4}, 5);
ControlledNot(~f, {4}, 6);
ControlledNot(~f, {7}, 8);
ControlledNot(~f, {7}, 8);
f;

PhaseFlip(~f, 3);
BitFlip(~f, 3);
f;

ControlledNot(~f, {1}, 2);
ControlledNot(~f, {1}, 3);
ControlledNot(~f, {4}, 5);
ControlledNot(~f, {4}, 6);
ControlledNot(~f, {7}, 8);
ControlledNot(~f, {7}, 8);
ControlledNot(~f, {2,3}, 1);
ControlledNot(~f, {5,6}, 4);
ControlledNot(~f, {8,9}, 7);
f;

f1 := BitFlip(f, 1);
f2 := PhaseFlip(f, 1);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2;  
f1 := BitFlip(f, 4);
f2 := PhaseFlip(f, 4);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2;  
f1 := BitFlip(f, 7);
f2 := PhaseFlip(f, 7);
f := 1/SquareRoot(2)*f1 + 1/SquareRoot(2)*f2;  
f;

ControlledNot(~f, {1}, 4);
ControlledNot(~f, {1}, 7);
ControlledNot(~f, {4,7}, 1);
f;
-->
0.6000|000000000> + 0.8000|100000000>
0.6000|000000000> + 0.8000|100100100>
0.4949|000000000> - 0.07074|100000000> - 0.07074|000100000> + 0.4949|100100000>
- 0.07074|000000100> + 0.4949|100000100> + 0.4949|000100100> -
0.07074|100100100>
0.4949|000000000> - 0.07074|111000000> - 0.07074|000111000> + 0.4949|111111000>
- 0.07074|000000100> + 0.4949|111000100> + 0.4949|000111100> -
0.07074|111111100>
0.07074|110000000> + 0.4949|001000000> - 0.4949|110111000> - 0.07074|001111000>
- 0.4949|110000100> - 0.07074|001000100> + 0.07074|110111100> +
0.4949|001111100>
0.4949|001000000> + 0.07074|101000000> - 0.07074|001100000> - 0.4949|101100000>
- 0.07074|001000100> - 0.4949|101000100> + 0.4949|001100100> +
0.07074|101100100>
0.5999|101000000> + 0.8000|001100100>
0.5999|001100100> + 0.8000|101100100>

