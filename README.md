# 🧬 Real Number Encoded Genetic Algorithm (GA)

This repository contains a MATLAB implementation of a **real-number encoded genetic algorithm (GA)** and experimental comparisons with traditional **binary encoded GA** across multiple optimization problems.  

---

## 📖 Introduction

Genetic algorithms (GAs) are evolutionary optimization techniques inspired by natural selection.  
While traditional GAs often use **binary encoding**, real-number encoding can be more efficient for continuous optimization problems.

This project demonstrates:
- Comparison between **real-number encoding** and **binary encoding**  
- Application of real-coded GA to different optimization problems  
- Performance evaluation using **mean**, **standard deviation**, and **convergence** analysis  

---

## ⚙️ GA Parameters

| Parameter       | Problem 1 | Problem 2 | Problem 3 |
| --------------- | --------- | --------- | --------- |
| Mutation rate   | 0.01      | 0.02      | 0.01      |
| Crossover rate  | 0.75      | 0.85      | 0.75      |
| Iterations      | 1000      | 100       | 100       |
| Population size | 10        | 400       | 100       |
| Repeat times    | 50        | 50        | 50        |

---

## 📊 Results

### 🔹 Problem 1
$$\max f(x_1, x_2) = 21.5 + x_1 \sin(4 \pi x_1) + x_2 \sin(20 \pi x_2)$$

$$-3.0 \leq x_1 \leq 12.1, \quad 4.1 \leq x_2 \leq 5.8 $$

Comparison of **real-number vs binary encoding**:

| Encoding | Mean    | Std.   | Corr.   |
| -------- | ------- | ------ | ------- |
| Real     | 23.9288 | 3.6685 | 60.8098 |
| Binary   | 33.1731 | 3.0267 | 84.3020 |

👉 Real-number encoding achieved **lower mean error** and **better stability**.

---

### 🔹 Problem 2
$$\min f(x) = (x_1 - 2)^2 + (x_2 - 1)^2$$

$$\text{s.t. } 
\begin{cases}
g_1(x) = x_1 - 2x_2 + 1 = 0, \\
g_2(x) = \dfrac{x_1^2}{4} - x_2^2 + 1 \geq 0
\end{cases}$$

#### penalty function:
$$P(x) = r_1 g_1(x) + r_2 g_2(x)$$


With penalty function parameters (r1 = 1, r2 = 2):

| Encoding | Mean   | Std.     |
| -------- | ------ | -------- |
| Real     | 0.0198 | 2.92e-04 |

👉 Real-number GA converges to very small error values.

---

### 🔹 Problem 3

$$F(x) = \sum_{i=1}^n x_i^2, \quad \text{where } n = 30, \; -5.12 \leq x_i \leq 5.12 $$

| Encoding | Mean     | Std.    |
| -------- | -------- | ------- |
| Real     | 254.9798 | 51.2087 |

---

## 🧮 Key Equations

### Fitness Function
![fitness](https://latex.codecogs.com/png.latex?f(x)=\frac{1}{1+g(x)})

### Penalty Function (Problem 2)
![penalty](https://latex.codecogs.com/png.latex?g(x)%20=%20f(x)+r_1\cdot\text{violation}_1+r_2\cdot\text{violation}_2)

### GA Update Rule
![ga](https://latex.codecogs.com/png.latex?x^{t+1}_i%20=%20x^t_i%20+%20\alpha\cdot(x^t_{\text{best}}-x^t_i)%20+%20\beta\cdot\epsilon)

---

## 📂 Repository Structure

```
├── GA_1.m   # MATLAB implementation for Problem 1
├── GA_2.m   # MATLAB implementation for Problem 2
├── GA_3.m   # MATLAB implementation for Problem 3
├── Real Number Encoded GA.pdf  # Report slides with results
└── README.md (this file)
```

---

## 🚀 How to Run

1. Open MATLAB or Octave  
2. Run the desired GA implementation:
   ```matlab
   % Example: Run GA for Problem 1
   GA_1
   ```
3. Adjust parameters (mutation, crossover, population size, etc.) directly inside the `.m` files.

---

## 📝 Conclusion

- **Real-number encoding** provides better performance for continuous optimization problems compared to **binary encoding**.  
- The GA framework is flexible and can be adapted to a variety of constrained and unconstrained optimization tasks.  
- Results demonstrate **faster convergence** and **lower solution variance**.  

---

