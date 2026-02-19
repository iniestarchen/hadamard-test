OPENQASM 2.0;
include "qelib1.inc";
// Hadamard test: estimate Re(<psi|U|psi>) for U=Z, |psi>=|+>
// q[0]: ancilla, q[1]: system qubit |psi>
qreg q[2];
creg c[1];
// Prepare |psi> = |+>
h q[1];
// Hadamard test circuit
h q[0];
cz q[0],q[1];
h q[0];
// Measure ancilla: P(0) = (1 + Re(<psi|U|psi>)) / 2 = 0.5
measure q[0] -> c[0];
