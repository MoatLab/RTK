### Format for raw log file names ###

  * the raw log file names should adhere to the following rules:
        **ColorNumber_Legend_TestNumber_Type.log**

    - Overall rule: In total, there should only be 4 fields in the file name,
    namely "ColorNumber", "Legend", "TestNumber", "Type" respecitvely. Each
    field cannot contain "dash" symbol in it

    - ColorNumber: as defined in script/genplot.sh,
      * 0: gray
      * 1: green
      * 2: blue
      * 3: red
      * etc..

    - Legend: whatever you want to use as legend in your graph

    - TestNumber: whatever you want to use to differentiate reptitive
    experiments

    - Type: "lat", or "iops", used only for human-readibility of the type of log
    files we are processing


  * TODOs
    - add new needs here ..
