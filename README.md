# Robust-causal-inference---McNemar-s-Test
First, run the partitioning_code.R to create the matched partitions
Second, to the run the proposed algorithm in the paper "Robust policy evaluation....", run the McNemar_test_alg.R
Third, to find the robust inference with MIP model, keep all the files generated bu partitioning_code.R and all the AMPL files such as mcnamer1.dat, mcnemar2.mod, mcnemar2max.mod, mcnemar1min.run, and mcnemar1max.run files in the same directory.
Then run mcnemar1min.run to solve the minimization problem and mcnemar1max.run to solve the maximization problem.
