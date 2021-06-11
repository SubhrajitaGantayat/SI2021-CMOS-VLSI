Testbench for inverter sub-circuit
.GLOBAL vdd gnd
.PARAM vsupply=5.0
**Library model file
.LIB "/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib" nom

**Include the Inverter netlist
.INCLUDE LAB9_inv.sp

**Instantiate inverter
Xinv1 in out LAB9_inv

**Sources
Vsup    vdd   0    DC vsupply
Vin     in    0    PULSE(0 vsupply 0 10p 10p 100p 200p)
Cload   out   0    50f

**Analyses
.TRAN lp 300p

.CONTROL
RUN
PLOT v(out)
.ENDC

.END
