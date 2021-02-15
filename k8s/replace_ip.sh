#!/bin/sh

newip=$(cat hosts.lst)

sed -i -e 's/[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}/'$newip'/g'   tsunami_job.yaml
