#!/bin/sh

newip=$(cat hosts.lst)

echo $newip
sed -i -e 's/[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}/8.8.8.2/g'   tsunami_job.yaml