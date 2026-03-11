# Silicon_Sprint_PS9
Design and analysis of a 16-bit integer divider with emphasis on minimizing hardware area and gate count. The project compares a normal combinational divider with an area-optimized sequential divider using synthesis results.



```
divider-area-optimization/
│
├── README.md
│
├── docs/
│   ├── divider_report.pdf
│   ├── images/
│   │   ├── normal_divider_flow.png
│   │   ├── optimized_divider_flow.png
│   │   ├── waveform.png
│   │   └── architecture_diagram.png
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
│   ├── synth.tcl
│   ├── reports/
│   │   ├── normal_area.rpt
│   │   ├── optimized_area.rpt
│   │   ├── timing.rpt
│   │   └── power.rpt
│
└── results/
    ├── area_comparison_table.md
    └── waveform.vcd
```
