
Top Command --> 
the command column is the name of the process
The CPU percentage was 0.03 percent. Meaning only 0.03 percentage of the CPU Processing was in use for that partivular process.


[root@DevOpsEngg logs]# ps -eo pid,comm,%cpu --sort=-%cpu | head
    PID COMMAND         %CPU
     20 kworker/0:1-ata  0.2
    742 kworker/0:5-eve  0.2
   1559 kworker/0:0-eve  0.2
      1 systemd          0.1
    669 firewalld        0.1
      2 kthreadd         0.0
      3 pool_workqueue_  0.0
      4 kworker/R-rcu_g  0.0
      5 kworker/R-rcu_p  0.0


Reference : ps - process status
            -e - every process
            -o - Output format
            pid,comm,%cpu - Column names
            --sort= - sort 
            -%cpu - decreasing cpu percentage
            head - top 10
