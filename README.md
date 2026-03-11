# Silicon_Sprint_PS9
Design and analysis of a 16-bit integer divider with emphasis on minimizing hardware area and gate count. The project compares a normal combinational divider with an area-optimized sequential divider using synthesis results.



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
    ├── normal_timing.rpt
    ├── optimized_area.rpt
    ├── optimized_power.rpt
    └── optimized_timing.rpt
```
