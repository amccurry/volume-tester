#!/bin/bash
set -e
set -x
yum install -y epel-release
yum update -y
yum install -y pv tee uuid
