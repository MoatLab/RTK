## My Research Toolkit ##

  - one shot experiment data processing and plotting

  - Use

    * create raw/YOURDIR, e.g. raw/bench

    * put all your .log files into raw/bench, please refer to raw/README.md for
    log file name format

    * change all.sh for your needs
      - TARGET: raw/YOURDIR
      - TYPE: the following three types are currently supported
        * lat-cdf: plot latency cdf graph
        * lat-time: plot latency vs time graph
        * iops-time: plot iops vs time graph

    * run all.sh
