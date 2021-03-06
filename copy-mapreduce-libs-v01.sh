# 
# Distribute MapReduce libraries.
#   
# DESCRIPTION 
# Copy MapReduce libraries from a specified folder in HDFS to the same location on each edge node. 
#
# SYNTAX
# .\copy-mapreduce-libs-v01.sh <source in HDFS> <destination on each node>
#
# EXAMPLE 
# .\copy-mapreduce-libs-v01.sh /upload/jars /usr/lib/java
# 
 

# Check that destination exists, and create if necessary
mkdir -p ${2}

# Copy the libraries from $SourceDir in HDFS to $LibDir 
/usr/bin/hadoop fs -copyToLocal ${1}/* ${2}
