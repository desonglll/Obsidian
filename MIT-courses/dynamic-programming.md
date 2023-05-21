---
title: dynamic-programming
date: 2023/04/01/ 12:11:24
discription: https://www.youtube.com/watch?v=OQ5jsbhAv_M&t=2131s
Lecture: 19
---

## Naive recursive algorithm

```python
fib(n):
  if n<=2: f = 1
	else: f = fib(n-1) + fib(n-2)
	return f
```

Exponential time:

$T(n) = T(n-1) + T(n-2) + \Theta(1)$

$T(n) \ge 2T(n-2) = \Theta(2^{\frac{n}{2}})$

## Memoized DP algorithm

```python
memo = {}
fib(n):
  if n in memo: return memo[n]
	if n <= 2: f = 1
	else:f = fib(n-1)+fib(n-2)
	memo[n]=f
	return f
```

$fib(k)$ only recurses the first time it's callled.

- memoized calls cost $\Theta(1)$

- nonmemoized calls is n:
    fib(1), fib(2)...fib(n)

- nonrecursive work per call: $\Theta(1)$

    time = $\Theta(n)$

## $DP \approx recursion + memoization + guessing$

- memoize (remember)

& reuse solutions to subproblems that help solve the problem.

time = subproblems $\cdot$ time / subproblems

don't count recursions.

## Bottom-up DP algorithm

```python
fib = {}
for k in range(1,n+1):
  if k <= 2: f=1
  else: f = fib[k-1] + fib[k-2]
  fib[k] = f
return fib[n]
```

- Exactly same computation.
- Topological sort of subproblem dependency DAG.

- can often save space.

<img src="/Users/mikeshinoda/Desktop/notes/MIT-courses/assets/image-20230401131958854.png" alt="image-20230401131958854" style="zoom: 25%;" />

## Shortest paths: $\delta(s,v)\forall v$

Guessing: don’t know the answer? guess!

...try all guesses.

(& take best one)

<img src="/Users/mikeshinoda/Desktop/notes/MIT-courses/assets/image-20230401132808473.png" alt="image-20230401132808473" style="zoom:25%;" />

Infinite time or graphs with cycles.

time for subprob $\delta(s,v) = indegree(v)+1$

<img src="/Users/mikeshinoda/Desktop/notes/MIT-courses/assets/image-20230401133748283.png" alt="image-20230401133748283" style="zoom:25%;" />

Subproblem dependencies should be acyclic.

<img src="/Users/mikeshinoda/Desktop/notes/MIT-courses/assets/image-20230401134412734.png" alt="image-20230401134412734" style="zoom:25%;" />
