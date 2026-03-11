
# **Silicon_Sprint_PS9**

## Objective

Design and analysis of a 16-bit
 integer divider with emphasis on minimizing hardware area and gate 
count. The project compares a normal combinational divider with an 
area-optimized sequential divider using synthesis results.

```
divider-area-optimization/
│
├── README.md
│
├── images/
│   ├── Flow
│   │     └── normal_divider_flow.png
│   │     └── optimized_divider_flow.png
│   ├── Waveforms
│   │     └── normal_divider1_wavewform.png
│   │     └── optimized_divider_wavewform.png
│
├── rtl/
│   ├── divider_normal.v
│   └── divider_optimized.v
│
├── tb/
│   ├── tb_divider_normal.sv
│   └── tb_divider_optimized.sv
│
├── synthesis/
│   └── synth.tcl
│
├── reports/
    ├── normal_area.rpt
    ├── normal_power.rpt
    ├── normal_timing.rpt
    ├── optimized_area.rpt
    ├── optimized_power.rpt
    └── optimized_timing.rpt
```

# Area comparision

## 1. Area Report for Normal Divider

The normal divider was synthesized using Cadence Genus under the **slow operating condition** using the standard cell library. The synthesis report shows that the design contains **382 standard cells** with a total cell area of **4204.579 µm²**.

The higher area is mainly due to the use of the built-in division (`/`) and modulus (`%`) operators in the RTL code. During synthesis, these operators are expanded into a large combinational divider circuit, which significantly increases the hardware utilization.

**Synthesis Result**

| Parameter | Value |
| --- | --- |
| Cell Count | 382 |
| Cell Area | 4204.579 |
| Net Area | 0 |
| Total Area | 4204.579 |

---

## 2 Area Report for Area-Optimized Divider

The optimized divider was designed using an **iterative restoring division algorithm**, which reuses hardware resources across multiple clock cycles instead of computing the entire division in a single combinational block.

The synthesis report shows that the design contains **314 standard cells** with a total cell area of **3196.389 µm²**.

The reduction in hardware is achieved by:

- Using shift operations
- Using a single subtractor
- Reusing registers across multiple clock cycles

This approach significantly reduces the required combinational logic.

**Synthesis Result**

| Parameter | Value |
| --- | --- |
| Cell Count | 314 |
| Cell Area | 3196.389 |
| Net Area | 0 |
| Total Area | 3196.389 |

---

## 3 Area Comparison

| Design | Cell Count | Total Area |
| --- | --- | --- |
| Normal Divider | 382 | 4204.579 |
| Area Optimized Divider | 314 | 3196.389 |

---

## Area Reduction Calculation

Area saved:

```
4204.579 − 3196.389 = 1008.19
```

Percentage reduction:

```
(1008.19 / 4204.579) × 100 ≈ 23.98%
```

---
<p align="center"><img src="./images/area_compar.png" width="700" alt="image 1"/></p>
