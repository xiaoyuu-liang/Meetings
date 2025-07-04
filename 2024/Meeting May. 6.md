# Meeting May. 6



![image-20240506143648942](../assets/images/image-20240506143648942.png)

### HiRP

✅ 实现



### GNN (Node Classifier)

dataset: Cora

- GCN
  - acc=0.78075
- GAT
  - acc=0.79813
- APPNP
  - acc=0.81340
- SAGE
  - acc=0.72265



### Randomized Smoothing

sparse smoothing实现

dataset: Cora ML

- GCN
  - acc=0.8169
  - att RS acc=0.8280
  - adj RS acc=0.7442
  - both RS acc=0.6490
- GAT
  - acc=0.7956
  - att RS acc=0.8241
  - adj RS acc=0.1786
  - both RS acc=0.2395
- APPNP
  - acc=0.8363
  - att RS acc=0.8371
  - adj RS acc=0.6901
  - both RS acc=0.6490



### Diffusion Model

- DiGress
  - categorical nodes/edges
  - parallel training
  - graph transformer as noise predictor
- GraphMaker
  - attributed nodes
  - MLP, message passing as noise predictor



参考DiGress实现

✅  数据集准备

提取所有节点的1-hop/2-hop subgraph作为diffusion model的训练数据集

TODO:

1. diffusion steps (categorical nodes => attribute nodes)
2. graph transformer as noise predictor







**Graph Injection budget**

train diffusion model $\Delta_V=0.01N, \Delta_D=\text{avg\_deg}$

1. Single Node Injection Attack

   - single target $\Delta_V=1, \Delta_D=1$
   - multiple target $\Delta_V=1, \Delta_D=\min(n_{\text{target}}\cdot\text{avg\_deg}, 0.5n_{\text{1-hop}})$

2. HAO

   - $\Delta_V=0.025N, \Delta_D=0.22E/\Delta_V$

3. TDGIA

   - $\Delta_V=500, \Delta_D=100$

     nodes = [169,343, 232,965, 659,574], edges = [1,157,799, 2,878,577, 11,606,919]

4. MaxiMal

   - $\Delta_V=0.01/0.02/0.05N, \Delta_D=2\Delta_V\cdot \text{avg\_deg}$

5. AFGSM

   - $\Delta_V=2/4/6/8/10, \Delta_D=(10/20/30/40/50)/\Delta_V$

6. G2A2C

   - $\Delta_V=1/2/3/4/5/6, \Delta_D=1/2/3/4/5/6$

7. IMGIA
   - $\Delta_V=0.01N, \Delta_D=\text{avg\_deg}$



**runs**

- digress
  - 900 epoch, cuda 0,1,2 => 4h
- graphmaker
  - 700 epoch, cuda 0 => 9h
  - 480 epoch, cuda 0 => 6h
  - X不收敛
  - sync: Epoch 482 | best val X nll 0.0150711 | best val E nll 0.0074015 
  - async: Epoch 704 | best val X nll 0.0158240 | best val E nll 0.0000137



## Ref.

[1] Single Node Injection Attack against Graph Neural Networks

[2] Scalable Attack on Graph Data by Injecting Vicious Nodes

[3] TDGIA: Effective Injection Attacks on Graph Neural Networks

[4] Maximizing Malicious Influence in Node Injection Attack

[5] Scalable attack on graph data by injecting vicious nodes

[6] Let Graph Be the Go Board: Gradient-Free Node Injection Attack for Graph Neural Networks via Reinforcement Learning

[7] Imperceptible graph injection attack on graph neural networks



