# Meeting Jul. 11



### Graph-based adversarial attack for malware detection

#### HART[1]

Structural attack against graph-based Android malware detection techniques

Function call graph (FCG) based methods 

<img src="../assets/images/image-20250619170625205.png" alt="image-20250619170625205" style="zoom:50%;" />

Problem-space attack

Heuristic optimization integrated Reinforcement learning ATtack (HRAT) algorithm



***Existing limitations***

1. L1-system-specific attack methods (feature-oriented)
   - structural attack - feature agnostic
2. L2-limited software modification operations (dead code)
   - insert methods, remove methods, add call relations, rewire call relations
3. L3-inconsistent transformation relation (feature-guided no-op code)
   - structural attack action

***Challenge***

1. How to determine a manipulation operation type
   - Determine an action type according to the current graph state
     - RL
2. How to select the most effective objects (node/edge)
   - Select optimal edges or nodes to conduct the modifications on the graph
     - gradient search

***Contribution***

- A novel structural attack
- Adversarial feature inverse mapping
- 90% ASR in feature space & 100% ASR in problem space

******

**Attack Formulation**

$\tilde G = G+\delta$, FCG adj matrix

- constraints $\mathbb{C}=[c_1,\dots, c_{N_n}]$ indicates modifiable
- adding edge $A_a=\{v_{beg},v_{tar}\}$
- rewiring $A_r=\{v_{beg},v_{end}, v_{end}\}$
- inserting node $A_i=\{v_{caller}\} \{v_{nice}\}$
- deleting node $A_a=\{v_{tar}, \hat v_{caller}, \hat v_{callee}\}$

*Heuristic optimized RL*

find the modification sequence with minimum modifications on graph rather than the hidden structure, e.g., the distributions of dataset, in the target graph

RL (Deep Q-learning) - determining an action type according to the current graph state 

- action: adding edges, rewiring, inserting nodes, and deleting nodes

Gradient search - selecting optimal edges or nodes

![image-20250620120028234](../assets/images/image-20250620120028234.png)

==Idea==: diffusion policy for RL

==Challenge==: training diffusion





## Ref.

[1] K. Zhao et al., “Structural Attack against Graph-Based Android Malware Detection,” in CCS ’21.