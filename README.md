# Fusion
The purpose of these scripts is to facilitate the process of manually merging source files from two directories.
This is done through running two scripts: `diffDirectories.sh` and `diffAllFiles.awk`.

## Starting
* Set a variable named `FUSION_HOME` in your environment:
    ```
    echo "export FUSION_HOME=/home/usr/fusion" >> ~/.bashrc
    source ~/.bashrc
    ```
* Modify the `.txt` files inside the `directories` foldes like the following:
    ```
    home/user/cirrus/develop/dbPort/src #src of a branch
    home/user/cirrus/cirrus-mvn/dbPort/src #src of other branch
    $FUSION_HOME/dbPort.txt #destination of file (this directory)
    ```
* Run `sh diffDirectories.sh && awk -f diffAllFiles.awk *.txt` on your $FUSION_HOME directory.
* All `.diff` files are exported to the `diffAllFiles` folder. Here, you can open each one and see for yourself the changes between the projects you established in each of the `.txt` files inside the `directories` folder.
* If you only want to see which files changed, you can do so by opening the `.txt` files inside the `diffDirectories` folder.

## Workflow
* The merging process can be facilitated even further by installing `diffuse`, a tool which lets you open two files side by side and transfer changes from a file to another easily.
    ```
    sudo apt-get update
    sudo apt-get install diffuse
    ```
* Check each of the `.diff` files. Each diff between two files (here, it will be called a diff section) is separated by `++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++`. You can see the two files that were diffed at the start of each diff section.
* Run the command
    ```
    diffuse /home/src/file1.java /home/cirrus-mvn/src/file1.java
    ```
* [Compare both files with diffuse](http://diffuse.sourceforge.net/) and then repeat!


