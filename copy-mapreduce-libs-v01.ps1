<# 
.SYNOPSIS 
  Distribute MapReduce libraries.
   
.DESCRIPTION 
  Copy MapReduce libraries from a specified folder in HDFS to the same location on each edge node. 
 
.EXAMPLE 
  .\copy-mapreduce-libs-v01.ps1 -LibDir /usr/lib/java -SourceDir wasb://hivecontainer@mystorage.blob.core.windows.net/jars/
#> 
 
param ( 
    # Mandatory destination for for libraries on each node.
    [Parameter(Mandatory=$true)] 
    [String]$LibDir

    [Parameter(Mandatory=$true)] 
    [String]$SourceDir
) 

# Check that /usr/lib/java exists, and create if necessary
if (!((Test-Path -path $LibDir))
{
    $output = New-Item -ItemType directory -Path $LibDir; 
    Write-HDILog $output;
}

# Copy the libraries from $SourceDir in HDFS to $LibDir 
$output = Invoke-HDICmdScript -CmdToExecute "%HADOOP_HOME%\bin\hadoop fs -copyToLocal $SourceDir/* $LbDir";
Write-HDILog $output;

Write-HDILog "Transfer MapReduce libs completed";