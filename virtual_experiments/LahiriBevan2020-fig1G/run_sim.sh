echo ""
echo ">>> Running DA simulation"
echo ""

mpirun -n 5 snudda simulate networks/bevan_fig1g_bath_current --time 8 --simulation_config ../../data/JSON/bevan_fig1g_no_DA.json --mechdir /home/hjorth/HBP/BasalGangliaData/data/neurons/mechanisms

echo ""
echo ">>> Running no DA simulation"
echo ""

mpirun -n 5 snudda simulate networks/bevan_fig1g_bath_current --time 8 --simulation_config ../../data/JSON/bevan_fig1g_with_DA.json --mechdir /home/hjorth/HBP/BasalGangliaData/data/neurons/mechanisms --enable_rxd_neuromodulation < input.txt 
