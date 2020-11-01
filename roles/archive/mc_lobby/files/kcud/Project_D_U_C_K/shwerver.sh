#!/bin/bash
#From RHEL JVM performance tuning

minheap='-Xmn1024M'
maxheap='-Xmx1024M'
uselrgP='-XX:+UseLargePages'
cmsGC='-XX:+UseConcMarkSweepGC'
servmod='-server'
serverJar='spigot-1.14.jar'

/usr/bin/java $minheap $maxheap $cmsGC -jar $serverJar &
