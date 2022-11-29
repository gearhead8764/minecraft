{\rtf1\ansi\ansicpg1252\cocoartf2706
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset0 Menlo-Bold;}
{\colortbl;\red255\green255\blue255;\red56\green185\blue199;\red0\green0\blue0;\red57\green192\blue38;
\red202\green51\blue35;\red170\green171\blue37;\red86\green32\blue244;}
{\*\expandedcolortbl;;\cssrgb\c25546\c77007\c82023;\csgray\c0;\cssrgb\c25706\c77963\c19557;
\cssrgb\c83899\c28663\c18026;\cssrgb\c72331\c71682\c18599;\cssrgb\c41681\c25958\c96648;}
\margl1440\margr1440\vieww23480\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs22 \cf2 \CocoaLigature0 #!/bin/sh\cf3 \
\cf2 ##\cf3 \
\cf2 ## Automated Minecraft Bedrock Server Updater for Linux\cf3 \
\cf2 ## Created by Phosix, Feb 5, 2019\cf3 \
\cf2 ##\cf3 \
\
\cf2 # Variables to be set as per end user preferences\cf3 \
\cf2 # The directory holding your Bedrock server files\cf3 \
SERVER\cf4 =
\f1\b \cf5 $\{HOME\}
\f0\b0 \cf3 /server\
\
\cf2 # The directory where you want the server software downloaded to\cf3 \
DOWNLOAD\cf4 =
\f1\b \cf5 $\{HOME\}
\f0\b0 \cf3 /Downloads\
\
\cf2 # The Minecraft Bedrock Server download page\cf3 \
\cf2 # If Minecraft.net ever goes away or changes, this will need to be changed to\cf3 \
\cf2 # the current distribution location.\cf3 \
BASE_URL\cf4 =
\f1\b \cf6 'https://minecraft.net/en-us/download/server/bedrock/'
\f0\b0 \cf3 \
\
\cf2 ################################################################################\cf3 \
\cf2 ################################################################################\cf3 \
\cf2 ## BEGIN CODE - DO NOT MODIFY UNLESS YOU KNOW WHAT YOU ARE DOING\cf3               \cf2 ##\cf3 \
\cf2 ################################################################################\cf3 \
\cf2 ################################################################################\cf3 \
\
URL\cf4 =`\cf3 curl \cf4 -L\cf3  
\f1\b \cf5 $\{BASE_URL\}
\f0\b0 \cf3  2\cf4 >\cf3 /dev/null\cf4 |\cf3  
\f1\b \cf7 grep
\f0\b0 \cf3  bin-linux \cf4 |\cf3  
\f1\b \cf7 sed
\f0\b0 \cf3  \cf4 -e\cf3  
\f1\b \cf6 's/.*<a href=\\"\\(https:.*\\/bin-linux\\/.*\\.zip\\).*/\\1/'
\f0\b0 \cf4 `\cf3 \
\
\cf2 # Verify if the DOWNLOAD and SERVER destinations exist. Create if it doesn't\cf3 \
\cf4 for\cf3  check \cf4 in\cf3  
\f1\b \cf6 "$DOWNLOAD"
\f0\b0 \cf3  
\f1\b \cf6 "$SERVER"
\f0\b0 \cf3  \cf4 ;\cf3  \cf4 do\cf3 \
  \cf4 if\cf3  \cf4 [\cf3  \cf4 !\cf3  \cf4 -d\cf3  
\f1\b \cf5 $\{check\}
\f0\b0 \cf3  \cf4 ]\cf3  \cf4 ;\cf3  \cf4 then\cf3 \
    \cf4 if\cf3  \cf4 [\cf3  \cf4 -e\cf3  
\f1\b \cf5 $\{check\}
\f0\b0 \cf3  \cf4 ]\cf3  \cf4 ;\cf3  \cf4 then\cf3 \
     \cf2  # Error out if it does exist but isn't a directory\cf3 \
      
\f1\b \cf7 printf
\f0\b0 \cf3  
\f1\b \cf6 "\\n%s is not a directory!\\nPlease edit %s and change the line to point %s to the correct directory\\n\\n"
\f0\b0 \cf3  
\f1\b \cf6 "$\{check\}"
\f0\b0 \cf3  
\f1\b \cf6 "$0"
\f0\b0 \cf3  
\f1\b \cf6 "$\{check\}"
\f0\b0 \cf3 \
      \cf4 exit\cf3  1\
    \cf4 fi\cf3 \
    
\f1\b \cf7 mkdir
\f0\b0 \cf3  -p \cf4 $\{
\f1\b \cf5 $check
\f0\b0 \cf4 \}\cf3 \
  \cf4 fi\cf3 \
\cf4 done\cf3 \
\
\cf2 # Check for a backup copy of any existing server properties.\cf3 \
\cf2 # Make a backup copy if none exists.\cf3 \
\cf4 if\cf3  \cf4 [\cf3  \cf4 !\cf3  \cf4 -e\cf3  
\f1\b \cf5 $\{SERVER\}
\f0\b0 \cf3 /server.properties.bak \cf4 ]\cf3  \cf4 ;\cf3  \cf4 then\cf3 \
  
\f1\b \cf7 cp
\f0\b0 \cf3  
\f1\b \cf5 $\{SERVER\}
\f0\b0 \cf3 /server.properties 
\f1\b \cf5 $\{SERVER\}
\f0\b0 \cf3 /server.properties.bak\
\cf4 fi\cf3 \
\
\cf2 # Check if a copy of the latest server exists in the DOWNLOAD directory\cf3 \
\cf4 if\cf3  \cf4 [\cf3  \cf4 !\cf3  \cf4 -e\cf3  
\f1\b \cf5 $\{DOWNLOAD\}
\f0\b0 \cf3 /
\f1\b \cf5 $\{URL##*/\}
\f0\b0 \cf3  \cf4 ]\cf3  \cf4 ;\cf3  \cf4 then\cf3 \
 \cf2  # If it doesn't exist, retrieve the latest zip file and extract it to\cf3 \
 \cf2  # the SERVER directory.\cf3 \
  curl 
\f1\b \cf5 $\{URL\}
\f0\b0 \cf3  --output 
\f1\b \cf5 $\{DOWNLOAD\}
\f0\b0 \cf3 /
\f1\b \cf5 $\{URL##*/\}
\f0\b0 \cf3 \
  
\f1\b \cf7 cd
\f0\b0 \cf3  
\f1\b \cf5 $\{SERVER\}\

\f0\b0 \cf3   unzip -o 
\f1\b \cf5 $\{DOWNLOAD\}
\f0\b0 \cf3 /
\f1\b \cf5 $\{URL##*/\}
\f0\b0 \cf3  2\cf4 >&\cf3 1 \cf4 >\cf3  /dev/null\
 \cf2  # Copy the server properties backup into place\cf3 \
  
\f1\b \cf7 cp
\f0\b0 \cf3  
\f1\b \cf5 $\{SERVER\}
\f0\b0 \cf3 /server.properties.bak 
\f1\b \cf5 $\{SERVER\}
\f0\b0 \cf3 /server.properties\
 \cf2  # Remove older copies of the server\cf3 \
  find 
\f1\b \cf5 $\{DOWNLOAD\}
\f0\b0 \cf3  -maxdepth 1 -type f -name bedrock-server\cf4 \\\cf3 *.zip \cf4 !\cf3  -newer 
\f1\b \cf5 $\{DOWNLOAD\}
\f0\b0 \cf3 /
\f1\b \cf5 $\{URL##*/\}
\f0\b0 \cf3  \cf4 !\cf3  -name 
\f1\b \cf5 $\{URL##*/\}
\f0\b0 \cf3  -delete\
\
\cf2 # If it does, do nothing. Either the software was downloaded manually and\cf3 \
\cf2 # setup should be finished manually or it has already been updated.\cf3 \
\cf4 else\cf3 \
  
\f1\b \cf7 printf
\f0\b0 \cf3  
\f1\b \cf6 "\\nServer is up to date, nothing to do.\\n\\n"
\f0\b0 \cf3 \
\cf4 fi\cf3 \
\
\cf4 exit\cf3  0}