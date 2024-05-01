# Interpolation
Interpolate nodes using Lagrange polynomials and natural cubic splines

1. [Theory](#theory)
- [Lagrange Polynomials](#lagrange-polynomials)
- [Natural Cubic Splines](#natural-cubic-splines)
2. [Comparison](#comparison)
- [Lagrange Polynomials](#lagrange-polynomials-1)
- [Natural Cubic Splines](#natural-cubic-splines-1)
3. [Functions' documentation](#functions-documentation)
- [cubicspline](#cubicspline)
- [mylagrange](#mylagrange)
- [mylagrangew](#mylagrangew)

# Theory

## Lagrange Polynomials

Lagrange interpolation is a method for constructing a polynomial that passes through a given set of data points (nodes)

1. **Problem Statement**: Given $n + 1$ data points $(x_i, y_i)$, where $x_i$ are distinct, we want to find a polynomial $P(x)$ of degree at most $n$ that passes through all these points.
2. **Lagrange Basis Polynomials**: The Lagrange basis polynomials $L_i(x)$ are constructed such that $L_i(x_j) = \delta_{ij}$, where $\delta_{ij}$ is the Kronecker delta. They are given by:
   $$L_i(x) = \prod_{j=0, j \neq i}^{n} \frac{x - x_j}{x_i - x_j}$$
3. **Interpolating Polynomial**: The interpolating polynomial is then given by the linear combination of the Lagrange basis polynomials weighted by the corresponding function values:
   $$P(x) = \sum_{i=0}^{n} y_i \cdot L_i(x)$$

## Natural Cubic Splines

Cubic spline interpolation is a method for constructing a piecewise cubic polynomial that passes through a given set of data points. Here's how it works:

1. **Problem Statement**: Given $n + 1$ data points $(x_i, y_i)$, where $x_i$ are distinct, we want to find a piecewise cubic polynomial $S(x)$ such that:
   - $S(x)$ is a cubic polynomial on each subinterval $[x_i, x_{i+1}]$.
   - $S(x)$ passes through all the data points.
   - $S(x)$ is smooth at the interior points (continuous first and second derivatives).
   - Additional boundary conditions, such as natural boundary conditions (zero second derivative at the endpoints), are imposed.
2. **Construction**: 
   - For each interval $[x_i, x_{i+1}]$, construct a cubic polynomial $S_i(x)$.
   - The cubic spline function $S(x)$ is the piecewise combination of these cubic polynomials.
3. **Natural Boundary Conditions**: For a natural cubic spline, we impose $S''(x_0) = S''(x_n) = 0$, where $x_0$ and $x_n$ are the endpoints of the interval.

# Comparison

## Lagrange Polynomials

Lagrange interpolation constructs a polynomial that passes through a given set of data points. While this method is straightforward and easy to implement, it suffers from certain limitations, particularly when dealing with high-degree polynomials:

- **Oscillatory Behavior**: As the degree of the polynomial increases, especially when it exceeds the number of data points, Lagrange polynomials tend to exhibit oscillatory behavior between data points. This oscillation can lead to inaccuracies in representing the underlying data and make the interpolation less reliable, especially in regions with sparse or noisy data.

- **Runge's Phenomenon**: This phenomenon refers to the tendency of high-degree polynomial interpolants to oscillate widely between data points, particularly near the boundaries of the interpolation interval. Even with evenly spaced data points, the resulting polynomial may have significant oscillations, leading to poor approximation quality.

- **Numerical Stability**: Higher-degree polynomials can amplify rounding errors and numerical instability, especially in floating-point arithmetic. This can further exacerbate the oscillatory behavior and lead to significant errors in the interpolated values.

## Natural Cubic Splines

Cubic spline interpolation addresses many of the shortcomings of Lagrange polynomials by providing a smooth and continuous interpolation curve that passes through the data points. Here's why cubic splines are preferred over high-degree polynomials:

- **Smoothness**: Cubic splines consist of piecewise cubic polynomials that are smoothly connected at the data points. This ensures that the resulting interpolation curve is continuous in both the first and second derivatives, leading to a visually pleasing and mathematically stable representation of the data.

- **Local Control**: Unlike high-degree polynomials, which are global interpolants, cubic splines offer local control over the interpolation behavior. Each cubic polynomial only depends on neighboring data points, reducing the risk of oscillatory behavior and providing more stable and accurate interpolation results, especially in regions with sparse or noisy data.

- **Reduction of Oscillation**: By limiting the degree of the interpolating polynomials and enforcing smoothness constraints, cubic splines effectively reduce the tendency for oscillations between data points. This leads to more reliable interpolation results, even when the data exhibits complex or erratic behavior.

- **Natural Boundary Conditions**: Cubic splines typically impose natural boundary conditions, which set the second derivative to zero at the endpoints of the interpolation interval. This constraint further promotes smoothness and reduces the likelihood of oscillatory behavior near the boundaries.

Overall, cubic spline interpolation offers a robust and stable approach to data interpolation, particularly when compared to high-degree polynomial interpolation methods like Lagrange polynomials. By prioritizing smoothness and local control, cubic splines provide more accurate and visually appealing representations of the underlying data, making them a preferred choice for many interpolation tasks.

# Functions' documentation

## cubicspline

### Purpose
Interpolate points `(xdata(i), ydata(i))` (called nodes) with a natural cubic spline.

### Input
- `xdata`: Vector containing the abscissas of the nodes to interpolate. WARNING: the abscissas of the nodes (elements of xdata) must be in ascending order.
- `ydata`: Vector containing the ordinates of the nodes to interpolate.
- `zval`: Vector of abscissas ("intermediate", see example) on which to compute spline values.

### Output
- `spval`: Spline values.

## mylagrange

### Purpose
Interpolate points `(xdata(i), ydata(i))` (called nodes) with a polynomial function.

### Input
- `xdata`: Vector containing the abscissas of the nodes to interpolate. WARNING: the abscissas of the nodes (elements of xdata) must be all distinct.
- `ydata`: Vector containing the ordinates of the nodes to interpolate.
- `z`: Vector of "intermediate" abscissas on which to compute the values of the interpolating polynomial. We know the value of the polynomial at the nodes, we compute it at many points BETWEEN the nodes to reconstruct the behavior of the phenomenon.

### Output
- `f`: Values of the interpolating polynomial at the points in the z vector.

## mylagrangew

### Purpose
Interpolate points `(xdata(i), ydata(i))` (called nodes) with a polynomial function.

### Input
- `xdata`: Vector containing the abscissas of the nodes to interpolate. WARNING: the abscissas of the nodes (elements of xdata) must be all distinct.
- `ydata`: Vector containing the ordinates of the nodes to interpolate.
- `z`: Vector of "intermediate" abscissas on which to compute the values of the interpolating polynomial. We know the value of the polynomial at the nodes, we compute it at many points BETWEEN the nodes to reconstruct the behavior of the phenomenon.

### Output
- `f`: Values of the interpolating polynomial at the points in the z vector.
- `w`: Values of the nodal polynomial at the points in the z vector.
