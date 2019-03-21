## My Research Toolkit ##

``rtk`` processes latency log files and generates a gnuplot template file. It can
be used to plot (1). latency CDF, (2). IOPS v.s. time, and (3). lat v.s. time graphs for
FIO and replayer latency log files

### Log file format
- must be a CSV file
- 2nd column representing latency (which we will plot)

### File Structures

```
.
├── README.md
├── all.sh
├── clear.sh
├── dat
├── eps
├── plot
├── raw
│   └── exptest
│       ├── u7_mongo_def-ro-1_lat.log
│       ├── u7_mongo_def-ro-2_lat.log
│       ├── u7_mongo_def-ro-3_lat.log
│       ├── u7_mongo_def-rw-1_lat.log
│       └── u7_mongo_def-rw-2_lat.log
├── script
│   ├── cdf.awk
│   ├── genplot.sh
│   ├── getstat.sh
│   ├── raw2dat.sh
│   ├── sample-cdf-lat.sh
│   └── stat.awk
└── stat
```

- functions of major dirs

  - ``raw/``: For holding raw experiment latency log files. For each set of log
    files you want to put in the same graph, create an experiment folder (e.g.
    raw/exptest) for it, then put all your log files under expriment folder

  - ``dat/``: For holding percentile data files, generated from raw log files.
    For above ``raw/exptest`` expriment, ``rtk`` will create ``dat/exptest``
    and put all percentile ".dat" files under it, this folder is the data
    source later used by gnuplot file to do plotting.

  - ``stat/``: For holding basic statistics info about the latency log
    file, such as avg, median, etc.

  - ``plot/``: For holding gnuplot template files generated for each
    expriment dataset.

  - ``eps/``: For holding generated eps graphs for each experiment

  - ``script/``: For holding data processing scripts


### How To Use RTK ###

  (1). Create ``raw/$EXPDIR``, e.g. take raw/exptest as an example (raw/exptest
  already create in this repo)

  (2). Put all your ``.log`` files into raw/exptest, PLEASE make sure your log
  file format follows the rules stated above. Under raw/exptest, I already put
  some sample log files there.

  (3). Change all.sh to specify (a) the type of graph you want to have and (b)
  the experiment folder name. Specifically, if you want to plot **CDF** for **raw/exptest**
  experiment folder, make the following changes in ``all.sh`` in line 24 & 25:

    ```
      TARGET="exptest"
      TYPE="lat-cdf"
    ```

  (4). Under rtk/ folder, run "./all.sh". 
  
  It will process log files under ``raw/exptest``, generate percentile files
  under ``dat/exptest``, create statistics file under ``stat/exptest``,
  generate gnuplot template file as ``plot/exptest.plot`` and plot graph as
  ``eps/exptest.eps``. By default, rtk will use ``evince`` to open the newly
  generated eps graph.
  
  In this repo, (1)(2)(3) is already done for you with an example experiment
  named "exptest", you can simply do (4) to see results.
