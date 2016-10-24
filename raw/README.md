### Format for raw log file names ###

  * the raw log file names should adhere to the following rules:

        **Format**: ColorIndex_TestIdentifier_LineTitle-TestNumber_Type.log
        e.g. 3_3tos_sla20ms-1_lat.log // latency log
        e.g. 1_hack_def-1_iops.log    // iops log 

    - Overall rule: In total, there should only be 4 fields in the file name,
    namely "ColorIndex", "TestIdentifier", "LineTitle/Legend", "Type"
    respecitvely. These fields are separated by "_", so you'd better not use it
    for other purposes.

    - Color Index: as defined in script/genplot.sh,
      * 0: gray
      * 1: green
      * 2: blue
      * 3: orange
      * 4: magenta
      * 5: cyan
      * 6: yellow
      * 7: purple
      * 8: pink
      * 9: red
      * **if you have more dat files than the total # of colors shown above,
      then the colors will be reused**

    - Test Identifier: the name for one set of experiments

    - LineTitle/Legend: whatever you want to use as legend in your graph

    - Type: "lat", or "iops", used only for human-readibility of the type of log
    files we are processing


  * TODOs
    - add new needs here ..
