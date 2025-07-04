# Meeting Apr. 1



## Subgraph Extraction

N-hop neighbor => structural entropy based pruning

### Graph Structural Entropy

- one-dimensional graph strctural information

  <img src="../assets/images/image-20240401140732039.png" alt="image-20240401140732039" style="zoom:67%;" />



### Edge Removal

edge removal => minimize entropy => maximize edge centrality

**Edge Centrality**
$$
EC(u,v)=f(d_u-1)-f(d_u)+f(d_v-1)-f(d_v)
$$

- $f(x)=x\log x$

- monotonic property

*strongly correlated with the negative degree centrality on the line graph*

**greedy edge removal**

remove edge with maximum centrality (minimum degree)

**threshold**

- budget $k$
- fraction $k(|\mathcal{E}|)$



### Node Removal

node removal => minimize entropy => maximize node centrality

**node centrality** = variation in graph entropy before and after its removal from the graph

*negatively correlated with the degree centrality of $v$*

**greedy node removal**

remove node with maximum centrality (minimum degree)

**threshold**

- budget $k$
- fraction $k(|\mathcal{V}|)$



<img src="../assets/images/image-20240401135302506.png" alt="image-20240401135302506" style="zoom: 33%;" />



## TODO

- paper draft
- diffusion training
  - subgraph