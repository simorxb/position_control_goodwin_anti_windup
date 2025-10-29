# PID Anti-Windup Techniques - Back Calculation vs Goodwin-Graebe-Salgado

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=simorxb/position_control_goodwin_anti_windup)

## Summary
This project compares two anti-windup techniques for PID controllers: **Back Calculation** and the **Goodwin-Graebe-Salgado** method. The provided Simulink model and MATLAB scripts allow users to simulate and analyze integral windup behaviors in systems with actuator saturation.

## Project Overview
Integral windup occurs when the actuator in a feedback control system is saturated in amplitude or slew rate, leading to excessive buildup in the integral component of a PID controller. This can cause performance degradation, overshoot, and prolonged settling time.

This repository offers a side-by-side comparison of two anti-windup solutions:
- **Back Calculation**: A classical approach that adds a corrective term to the integrator based on the difference between saturated and unsaturated control commands.
- **Goodwin-Graebe-Salgado Method**: A strategy from the book *Control System Design* that separates the controller into direct feedthrough and strictly proper parts, turning off the integrator when the control signal is limited.

### Problem: Integral Windup
Integral windup is a common problem in PID control when the control signal saturates. The integrator continues accumulating error even when the actuator is at its limit, which can lead to overshoot and instability.

### Solution 1: Back Calculation
Back calculation introduces a feedback path to the integrator:
- Adds a second input proportional to the error between the saturated and unsaturated command.
- Prevents the integrator from growing when the control effort is clamped.

Mathematically:

$u_{\text{int}} = K_{bc}(u_{\text{sat}} - u_{\text{unsat}})$

Where:
- $u_{\text{sat}}$ is the saturated output
- $u_{\text{unsat}}$ is the computed control signal
- $K_{bc}$ is the back-calculation gain

### Solution 2: Goodwin-Graebe-Salgado Method
This method decomposes the controller into direct feedthrough $C_\infty$ and a strictly proper function $\bar{C}(s)$ so that:

$C(s) = C_{\infty} + \bar{C}(s)$

The we can see that the transfer function from \(e(t)\) to \(u(t)\) (if we remove the saturation) is:

$\frac{U(s)}{E(s)} = \frac{C_\infty}{1 + (C(s)^{-1} - C_{\infty}^{-1}) C_\infty} = \frac{C_\infty}{C(s)^{-1} C_\infty} = C(s)$

It disables the integral action when the control output is saturated.

Considering the PID controller, we have:

$C(s) = k_p + \frac{k_i}{s} + k_d \frac{s}{\tau s + 1} = \frac{s^2 (k_p \tau + k_d) + s (k_i \tau + k_p) + k_i}{s^2 \tau + s}$

where the derivative element is implemented using the filtered derivative $\frac{s}{\tau s + 1}$. Also:

$C_\infty = \frac{\tau k_p + k_d}{\tau}$

and finally:

$C(s)^{-1} - C_{\infty}^{-1} = \frac{s (k_d - k_i \tau^2) - k_i \tau}{s^2 (k_d^2 + 2 k_d k_p \tau + k_p^2 \tau^2) + s (k_d k_i \tau + k_d k_p +k_i k_p \tau^2 + k_p^2 \tau) + k_d k_i + k_i k_p \tau}$

### Simulation Setup
- **Plant Model**: A 10 kg mass sliding on a surface with damping $k = 0.5$ N·s/m, driven by force $F$:

  $m \frac{d^2 z}{dt^2} = F - k \frac{dz}{dt}$
  
- **Actuator Saturation**: Control input $F$ is limited to ±50 N.
- **Disturbance**: A -30 N disturbance is injected at $t = 30$ seconds.
- **Tools**: MATLAB & Simulink, including code for initialization, simulation, and plotting.

### Key Features
- Simulink models for:
  - Standard PID (no anti-windup)
  - PID with Back Calculation
  - PID with Goodwin-Graebe-Salgado Anti-Windup
- MATLAB scripts for:
  - Initialization (`init.m`)
  - Running the simulation (`run_simulation.m`)
  - Plotting and analysis (`plot_results.m`)

## Author
This project is developed by Simone Bertoni. Learn more about my work on my personal website - [Simone Bertoni - Control Lab](https://simonebertonilab.com/).

## Contact
For further communication, connect with me on [LinkedIn](https://www.linkedin.com/in/simone-bertoni-control-eng/).
