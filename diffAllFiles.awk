# This script outputs the result of the diff command in files marked as different in .txt files inside diffDirectories folder
# The result is exported to a .diff file inside the diffAllFiles folder
BEGIN {
        for(i = 1; i <= ARGC; i++) {
            system("echo " ARGV[i]  " > diffAllFiles/" ARGV[i] ".diff")
        }
}
    {
        FILE_LOC="diffAllFiles/"FILENAME".diff"
        if($1 == "Files"){
            system("echo " $2 " " $3 " >> " FILE_LOC)            
            system("diff " $2 " " $3 " >> " FILE_LOC)
        }
        else{
            system("echo " $0 " >> " FILE_LOC)
        }  
        system("echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" " >> " FILE_LOC)
    }
END {}
