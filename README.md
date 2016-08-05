## My Research Toolkit ##

  - experiment raw data processing and plotting automation scripts

  - Use
    * put you raw files under raw/DIR, (e.g. raw/test), you may need to create
    the raw/test directory by yourself
    * change "TARGET" -> your raw/DIR, "TYPE" to whatever type of graph you
    want, currently supported:
      - lat-cdf: plot latency cdf graph
      - lat-time: plot latency vs time graph
      - iops-time: plot iops vs time graph
    * follow raw/README.md to modify your raw file names
    * run all.sh
