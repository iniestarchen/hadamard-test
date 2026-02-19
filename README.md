# Hadamard Test

> **Category**: simulation &nbsp;|&nbsp; **Difficulty**: intermediate &nbsp;|&nbsp; **Qubits**: 2 &nbsp;|&nbsp; **Gates**: 4 &nbsp;|&nbsp; **Depth**: 4

The Hadamard test estimates the real part of the expectation value ⟨ψ|U|ψ⟩ using one ancilla qubit. The ancilla is placed in superposition, a controlled-U is applied, and a final Hadamard on the ancilla transforms the relative phase into a probability difference. For U=Z and |ψ⟩=|+⟩, Re(⟨+|Z|+⟩) = 0, so both outcomes are equally likely. The imaginary part uses an S† gate.

## Expected Output

P(0) = P(1) = 0.5 (Re(⟨+|Z|+⟩) = 0)

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
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
```

## Tags

`hadamard-test` `expectation-value` `quantum-simulation` `ancilla`

## References

- [Aharonov et al. (2009). A Polynomial Quantum Algorithm for Approximating the Jones Polynomial. Algorithmica 55(3)](https://doi.org/10.1007/s00453-008-9168-0)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
